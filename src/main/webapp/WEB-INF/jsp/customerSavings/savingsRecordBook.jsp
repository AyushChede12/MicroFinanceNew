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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Customer Saving</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-bank text-blue"></i>
					</a></li>
					<li class="breadcrumb-item action">Savings PassBook</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Search Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Select Account Type</label> <select id="accountType"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Account</option>
									<option value="savingaccount">Saving Account</option>
									<option value="currentaccount">Current Account</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Select Account Number</label> <select
									id=accountNumber class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Account</option>

								</select>
							</div>
						</div>
					</div>
					<div class="row" style="padding-left: 800px;">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle"
								style="background-color: #FFA500;">Front Page</button>
							<button id="saveBtn" class="btn btn-primary">Transacton</button>
							<button id="saveBtn" class="btn btn-danger">Heading</button>
						</div>
					</div>
				</div>

				 <div class="row mt-5">
					<div class="col-12">
						<div class="card recent-sales">
							<div class="card-body table-responsive">
								<h5 class="card-title">Account Holder Details</h5>

								<table class="table table-bordered">
									<thead class="table-light">
										<tr>
											<th>ID</th>
											<th>Bank Name</th>
											<th>Account No</th>
											<th>Mobile No</th>
											<th>Address</th>
											<th>Opening Date</th>
											<th>Opening Balance</th>
											<th>Mapped Branch</th>
										</tr>
									</thead>
									<tbody id="customerDetails">
										<!-- Rows will be appended dynamically or statically here
 -->									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div> 

			</form>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./adminscript.js"></script>
	<script src="./js/customerSavings/passbook.js"></script>
</body>

</html>