<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
    <h1>Calculator</h1>
    <form method="post" action="calculator">
<input type="text" name="num1" pattern="[0-9]+(\.[0-9]+)?" required>        <select name="operator">
            <option value="add">+</option>
            <option value="subtract">-</option>
            <option value="multiply">*</option>
            <option value="divide">/</option>
        </select>
       <input type="text" name="num2" pattern="[0-9]+(\.[0-9]+)?" required>
        <input type="submit" value="Calculate">
    </form>
    
    <%-- Display the result if available --%>
    <% if (request.getAttribute("result") != null) { %>
        <h2>Result: <%= request.getAttribute("result") %></h2>
    <% } %>
    <a href='calchistory.jsp'>calculation history</a>
</body>
</html>