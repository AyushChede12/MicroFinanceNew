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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.table tbody td {
	white-space: nowrap;
	font-size: 14px;
	padding: 8px;
}
</style>
<title>Admin Dashboard</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Loan Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Search Loan Accounts</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div class="row">


					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Find By Loan Id</label> <select id="loanId"
								name="loanId" required="required"
								class="form-control selectField" style="height: 30px;">
								<option value="">Select Loan Id</option>

							</select>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="loanName"> Beginning Date</label> <input type="date"
								name="DateofLoan" id="DateofLoan" required="required"
								placeholder="" style="text-transform: uppercase;" />
						</div>
					</div>
					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="loanName">Final Date</label> <input type="date"
								name="finaldate" id="finaldate" required="required"
								placeholder="" style="text-transform: uppercase;" />
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Member Name: </label> <input type="text"
								name="memberName" id="memberName" required="required"
								placeholder="Enter Application Name" />
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Member ID: </label> <input type="text"
								name="memberId" id="memberId" required="required"
								placeholder="Enter Member Code" />
						</div>
					</div>
					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Loan Plan Name: </label> <input type="text"
								name="loanPlanName" id="loanPlanName" required="required"
								placeholder="Enter Plan Name" />
						</div>
					</div>
					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4"
							style="margin-bottom: 30px">
							<label> Financial Consultant Id</label>
							<div class="d-flex flex-column formFields mb-4">
								<input type="text" name="financialConsultantId"
									id="financialConsultantId" required="required"
									placeholder="Enter Member ID" />
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Financial Consultant Name</label> <input
								type="text" name="financialConsultantName"
								id="financialConsultantName" required="required"
								placeholder="Enter Advisor/Collector Name"
								style="text-transform: uppercase;" />
						</div>
					</div>
				</div>
			</form>
			<div class="row">
				<div class="col-12 text-center">

					<button id="searchButton" class="btnStyle"
						style="background-color: #FFA500;">Search</button>
				</div>
			</div>
		</div>


		<div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">

					<div class="card-body table-responsive">
						<h5 class="card-title">Loan Records</h5>

						<div class="table-responsive">
							<table class="table table-borderless datatable">
								<thead class="table-light">
									<tr
										style="font-family: 'Poppins', sans-serif; white-space: nowrap;">
										<th scope="col">Sr No.</th>
										<th scope="col">Member Id</th>
										<th scope="col">Member Name</th>
										<th scope="col">DOB</th>
										<th scope="col">Age</th>
										<th scope="col">Phone no.</th>
										<th scope="col">Address</th>
										<th scope="col">Loan Plan Name</th>
										<th scope="col">Loan Date</th>
										<th scope="col">Loan Amount</th>
										<th scope="col">Loan Purpose</th>
									</tr>
								</thead>
								<tbody>
									<!-- rows go here -->
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
	<script src="./js/LoanManagment/SearchLoans.js"></script>
	<script>
		$(document).ready(
				function() {

					// Convert all labels inside #formid to uppercase
					$("#formid label").each(function() {
						$(this).text($(this).text().toUpperCase());
					});

					// Convert all placeholders inside #formid to uppercase
					$("#formid input, #formid textarea, #formid select").each(
							function() {
								let ph = $(this).attr("placeholder");
								if (ph) {
									$(this).attr("placeholder",
											ph.toUpperCase());
								}
							});

				});
	</script>
</body>

</html>