<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.46.0/apexcharts.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<title>Admin Dashboard</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
<<<<<<< HEAD
			<h1>Team Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-person-workspace"></i>
					</a></li>
					<li class="breadcrumb-item action">Generate Team ID Card</li>
=======
			<h1>Employee Section</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Employee ID Card</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Search Box</li>
						</ol>
					</nav>
					<div class="row">

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Team Member Code </label> <input type="text"
									name="empCode" id="teamcode" required="required"
									placeholder="Enter Team Member Code" />
=======
								<label for="">Employee Code </label> <input type="text"
									name="empCode" id="empCode" required="required"
									placeholder="Enter Employee Code" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-4 text-start mt-3">
							<button id="searchBtn" class="btnStyle bg-warning">Search</button>
						</div>
					</div>

				</div>

			</form>

			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">

						<div class="card-body table-responsive">
							<h5 class="card-title">Search Result</h5>

							<table class="table table-borderless datatable overflow-scroll">
								<thead class="table-light">
									<tr style="font-family: 'Poppins', sans-serif;">
										<th scope="col">ID</th>
<<<<<<< HEAD
										<th scope="col">Team Member Name</th>
										<th scope="col">Branch Name</th>
										<th scope="col">Sign-Up Date</th>
										<th scope="col">Date Of Birth</th>
										<th scope="col">Contact No.</th>
=======
										<th scope="col">Employee Name</th>
										<th scope="col">Branch Name</th>
										<th scope="col">Date Of Joining</th>
										<th scope="col">Date Of Birth</th>
										<th scope="col">Mobile No.</th>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
										<th scope="col">Address</th>
										<th scope="col">Department</th>
									</tr>
								</thead>
								<tbody>
									<tr style="font-family: 'Poppins', sans-serif;">
										<th scope="row">1</th>
										<td>Poonam</td>
										<td>Umrer</td>
										<td>11-05-2025</td>
										<td>11-02-2001</td>
										<td>9168933105</td>
										<td>Nagpur</td>
										<td>ETC</td>


									</tr>

									<tr>
										<th scope="row">2</th>
										<td>Poonam</td>
										<td>Umrer</td>
										<td>11-05-2025</td>
										<td>11-02-2001</td>
										<td>9168933105</td>
										<td>Nagpur</td>
										<td>ETC</td>


									</tr>
									<tr>
										<th scope="row">3</th>
										<td>Poonam</td>
										<td>Umrer</td>
										<td>11-05-2025</td>
										<td>11-02-2001</td>
										<td>9168933105</td>
										<td>Nagpur</td>
										<td>ETC</td>


									</tr>
									<tr>
										<th scope="row">4</th>
										<td>Poonam</td>
										<td>Umrer</td>
										<td>11-05-2025</td>
										<td>11-02-2001</td>
										<td>9168933105</td>
										<td>Nagpur</td>
										<td>ETC</td>


									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>