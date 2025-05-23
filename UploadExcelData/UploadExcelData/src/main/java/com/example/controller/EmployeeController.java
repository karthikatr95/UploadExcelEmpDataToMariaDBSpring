package com.example.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.model.Employee;
import com.example.repository.EmployeeRepository;


@Controller
public class EmployeeController {
	@Autowired
    private EmployeeRepository employeeRepository;
	
	private List<Employee>employeeList=new ArrayList<>();
	
	 @GetMapping("/")
	 public String home() {
	        return "upload";
	    }
	
	 
	  @PostMapping("/upload")
	  public String uploadExcel(@RequestParam("file") MultipartFile file, Model model) {
		  employeeList.clear();
	        try (InputStream is = file.getInputStream()) {
	        	XSSFWorkbook workbook = new XSSFWorkbook(is);
	        	 XSSFSheet sheet = workbook.getSheetAt(0);
	                for (Row row : sheet) {
	                if (row.getRowNum() == 0) continue; // skip header
	                Employee emp = new Employee();
	                emp.setName(row.getCell(0).getStringCellValue());
	                emp.setEmail(row.getCell(1).getStringCellValue());
	                emp.setDepartment(row.getCell(2).getStringCellValue());
	                emp.setJoiningDate(row.getCell(3).getDateCellValue());
	                employeeList.add(emp);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        model.addAttribute("employees", employeeList);
	        return "display";
	    }
	  
	  
	  @PostMapping("/save")
	    public String saveToDB(Model model) {
	        employeeRepository.saveAll(employeeList);
	        model.addAttribute("message", "Employees details  saved successfully!");
	        return "success";
	    }

}
