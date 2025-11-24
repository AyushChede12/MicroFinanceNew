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
							class="bi bi-cash-coin"></i>
					</a></li>
					<li class="breadcrumb-item action">Settle Loan Records</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div class="">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Search Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Find By Loan Id</label> <select id="closedLoanIds"
									name="closedLoanIds" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Loan Id</option>

								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 text-center">
						<button id="searchBtn" class="btnStyle"
							style="background-color: #FFA500;">Search</button>
					</div>
				</div>

			</form>
			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">
						<div class="table-responsive">
							<table class="table table-borderless datatable">
								<thead class="table-light">
									<tr
										style="font-family: 'Poppins', sans-serif; white-space: nowrap;">
										<th scope="col">Sr No.</th>
										<th scope="col">Loan ID</th>
										<th scope="col">Loan Date</th>
										<th scope="col">Member ID</th>
										<th scope="col">Member Name</th>
										<th scope="col">Contact No.</th>
										<th scope="col">Address</th>
										<th scope="col">Branch Name</th>
										<th scope="col">Loan Plan Name</th>
										<th scope="col">Type of Loan</th>
										<th scope="col">Loan Mode</th>
										<th scope="col">Loan Term</th>
										<th scope="col">Rate of Interest</th>
										<th scope="col">Loan Amount</th>
										<th scope="col">Interest Type</th>
										<th scope="col">EMI Payment</th>
										<th scope="col">Total Interest of Loan</th>
										<th scope="col">Sanctioned Amount</th>
										<th scope="col">Total Payable of Loan</th>
										<th scope="col">Interest Due</th>
										<th scope="col">Principal Due</th>
										<th scope="col">Amount Paid</th>
										<th scope="col">Balance Loan Amount</th>
										<th scope="col">No of Installments</th>
										<th scope="col">Payment Date</th>
										<th scope="col">Financial Consultant Name</th>
										<th scope="col">Loan Status</th>
									</tr>
								</thead>
								<tbody id="loanClosureTableBody">
									<!-- Data rows will be dynamically inserted here -->
								</tbody>
							</table>
						</div>




					</div>
				</div>
			</div>
	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/LoanManagment/SettledLoanRecord.js"></script>
</body>

</html>