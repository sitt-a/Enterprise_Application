package com.itsc;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;


import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/calculator")
public class CalculatorServlet extends HttpServlet {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	double num1 = Double.parseDouble(request.getParameter("num1"));
    	double num2 = Double.parseDouble(request.getParameter("num2"));
        String operator = request.getParameter("operator");
        double result = 0;

        switch (operator) {
            case "add":
                result = num1 + num2;
                break;
            case "subtract":
                result = num1 - num2;
                break;
            case "multiply":
                result = num1 * num2;
                break;
            case "divide":
                result = num1 / num2;
                break;
        }
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	} catch (ClassNotFoundException cnf) {
        	cnf.printStackTrace();
        	}
        // Store the data in the database
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/calc", "root", "Sitra");
            PreparedStatement statement = connection.prepareStatement("INSERT num (num1, num2, operator, result) VALUES (?, ?, ?, ?)");
            statement.setDouble(1, num1);
            statement.setDouble(2, num2);
            statement.setString(3, operator);
            statement.setDouble(4, result);
            statement.executeUpdate();

            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("result", result);
        request.getRequestDispatcher("calculator.jsp").forward(request, response);
    }
}