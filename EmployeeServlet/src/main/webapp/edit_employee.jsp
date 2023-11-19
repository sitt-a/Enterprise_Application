<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Employee</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container mt-5">
		<div class="card">
			<div class="card-header">
				<h2>Edit Employee</h2>
			</div>
			<div class="card-body">
				<form action=editEmployee method="post">
					<input type="hidden" name="id" value="${id}">
					<div class="mb-3">
						<label for="name" class="form-label">Name:</label>
						 <input
							type="text" id="name" name="name" class="form-control" required  value="${name}">
					</div>

					<div class="mb-3">
						<label for="designation" class="form-label">Designation:</label> <input
							type="text" id="designation" name="designation"
							class="form-control" required value="${designation}">
					</div>

					<div class="mb-3">
						<label for="salary" class="form-label">Salary:</label> <input
							value="${salary}" type="number" id="salary" name="salary" class="form-control"
							required>
					</div>

					<button type="submit" class="btn btn-primary">Edit Employee</button>
				</form>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
