package com.itsc;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addEmployee")
public class AddEmployee extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String designation = request.getParameter("designation");
        double salary = Double.parseDouble(request.getParameter("salary"));

        try {
            String driver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/employeemanagment";
            String username = "root";
            String password = "Ed#123#456";

            Class.forName(driver);
            try (Connection connection = DriverManager.getConnection(url, username, password)) {
                final String query = "INSERT INTO employees (name, designation, salary) VALUES (?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(query)) {
                    statement.setString(1, name);
                    statement.setString(2, designation);
                    statement.setDouble(3, salary);
                    statement.executeUpdate();
                }
            }
            response.sendRedirect("/EmployeeServlet"); // Assuming you want to redirect to a page listing employees

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html"); // Handle errors appropriately
        }
    }
}
