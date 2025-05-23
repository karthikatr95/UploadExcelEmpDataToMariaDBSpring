<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(to right, #e0f7fa, #e8f5e9);
    padding: 30px;
}

.form-heading {
    text-align: center;
    color: #2e7d32;
    margin-bottom: 20px;
}
.form-box {
    width: 90%;
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    border: 3px solid #88d498;
    border-radius: 15px;
    background: linear-gradient(to right, #e0f7fa, #ffffff);
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}


.styled-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #ffffff, #e8f5e9);
}

.styled-table th, .styled-table td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: left;
}

.styled-table th {
    background: linear-gradient(to right, #66bb6a, #43a047);
    color: white;
}

.styled-table tr:nth-child(even) {
    background-color: #f1f8e9;
}

.styled-table tr:hover {
    background-color: #dcedc8;
}
.btn-gradient-blue {
  background: linear-gradient(to right, #4facfe, #00f2fe);
  border: none;
  color: white;
  padding: 10px 20px;
  border-radius: 8px;
  font-size: 16px;
  cursor: pointer;
  transition: 0.3s ease;
}

.btn-gradient-blue:hover {
   background: linear-gradient(to right, #00f2fe, #4facfe);
}
</style>
</head>
<body>
  <h2 class="form-heading">Uploaded Employee Data</h2>
    <form action="/save" method="post" class="form-box">
        <table class="styled-table">
            <tr>
                <th>Name</th><th>Email</th><th>Department</th><th>Joining Date</th>
            </tr>
            <c:forEach var="emp" items="${employees}">
                <tr>
                    <td>${emp.name}</td>
                    <td>${emp.email}</td>
                    <td>${emp.department}</td>
                    <td>${emp.joiningDate}</td>
                </tr>
            </c:forEach>
        </table>
        <button  class="btn-gradient-blue" type="submit">Save to Database</button>
    </form>
</body>
</html>