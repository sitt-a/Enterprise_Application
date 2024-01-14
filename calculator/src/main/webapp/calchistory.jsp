<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculation History</title>
</head>
<body>
    <h1>Calculation History</h1>
    <table>
    
        <tbody>
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/calc", "root", "Sitra");
                    PreparedStatement statement = connection.prepareStatement("SELECT * FROM num");
                    ResultSet resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                    	double historyNum1 = resultSet.getDouble("num1");
                    	double historyNum2 = resultSet.getDouble("num2");
                    	String historyOperator = resultSet.getString("operator");
                    	double historyResult = resultSet.getDouble("result");

                        out.println("<tr>");
                       
                        
                        out.println("<td>" + historyNum1 + " " + historyOperator + " " + historyNum2 + " = " + historyResult + "</td>");
                        out.println("</tr>");
                    }

                    resultSet.close();
                    statement.close();
                    connection.close();
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
     <a href='calculator.jsp'>back</a>
</body>
</html>