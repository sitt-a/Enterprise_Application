<%@ page import="java.util.List"%>
<%@ page import="com.itsc.Employee"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Employees</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>

	<div class="container mt-5">
		<div class="card">
			<div class="card-header">
				<h2>View Employees</h2>
			</div>
			<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Designation</th>
							<th>Salary</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<Employee> employees = (List<Employee>) request.getAttribute("employees");
						for (Employee employee : employees) {
						%>
						<tr>
							<td><%=employee.getId()%></td>
							<td><%=employee.getName()%></td>
							<td><%=employee.getDesignation()%></td>
							<td><%=employee.getSalary()%></td>
							<td><a class='btn btn-sm btn-primary'
								href="editEmployee?id=<%=employee.getId()%>">Edit</a>
							<a class='btn btn-sm btn-danger'
								href="deleteEmployee?id=<%=employee.getId()%>">Delete</a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<a class='btn btn-primary' href="add_employee.jsp">Add Employee</a>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and Popper.js (optional) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>