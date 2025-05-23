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

.upload-form {
    max-width: 500px;
    margin: auto;
    padding: 30px;
    border-radius: 15px;
    background: linear-gradient(to right, #ffffff, #f1f8e9);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    gap: 20px;
    align-items: center;
}


.file-input {
    padding: 10px;
    border: 2px solid #81c784;
    border-radius: 8px;
    background-color: #ffffff;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05);
    width: 100%;
    font-size: 16px;
}


.btn-upload {
    background: linear-gradient(to right, #43cea2, #185a9d);
    color: white;
    padding: 12px 24px;
    font-size: 16px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    font-weight: bold;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    transition: background 0.3s ease-in-out;
}

.btn-upload:hover {
    background: linear-gradient(to right, #185a9d, #43cea2);
}


.upload-message {
    text-align: center;
    margin-top: 20px;
    font-weight: bold;
    color: #388e3c;
}
</style>
</head>
<body>
 <h2 class="form-heading">Upload Employee Excel File</h2>
    <form method="post" action="/upload" enctype="multipart/form-data"   class="upload-form">
        <input type="file" name="file" accept=".xlsx" required class="file-input" />
        <button type="submit"   class="btn-upload">Upload</button>
    </form>
    <c:if test="${not empty message}">
        <p class="upload-message">${message}</p>
    </c:if>
</body>
</html>