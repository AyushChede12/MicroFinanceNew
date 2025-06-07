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
<title>Incentive Payment</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Account Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-wallet2"></i>
					</a></li>
					<li class="breadcrumb-item action">Incentive Payment</li>
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
								<label for="">Incentive Month</label> <select id="incentiveMonth"
									name="incentiveMonth" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Month Name</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Agent Code</label> <input type="text" name="agentCode"
									id="agentCode" required="required" placeholder="Enter Code" />
							</div>
						</div>

						<div class="col-3 text-left mt-3">
							<button id="searchBtn" class="btnStyle"
								style="background-color: #FFA500;">Search</button>
						</div>
					</div>
				</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<nav>
					<ol class="breadcrumb breadcrumb-title">
						<li class="breadcrumb-item action mt-3">Incentive Details</li>
					</ol>
				</nav>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Full Name</label> <input type="text" name="fullName" id="fullName"
						required="required" placeholder="Enter Name" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Designation</label> <input type="text" name="designation"
						id="designation" required="required" placeholder="Enter position" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Personal Sales</label> <input type="text" name="personalSales"
						id="personalSales" required="required" placeholder="Enter Self Business" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for=""> Group Sales</label> <input type="text" name="groupSales"
						id="groupSales" required="required" placeholder="Enter Team Business" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Overall Sales</label> <input type="text" name="overallSales"
						id="overallSales" required="required" placeholder="Enter Total Business" />
				</div>
			</div>


			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Total Earnings</label> <input type="text" name="totalEarnings"
						id="totalEarnings" required="required" placeholder="Enter Total Incentive" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Tax Deducted</label> <input type="text" name="taxDeducted" id="taxDeducted"
						required="required" placeholder="Enter TDS" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Service Deduction</label> <input type="text"
						name="serviceDeduction" id="serviceDeduction" required="required"
						placeholder="Enter Service Charge" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Extra Allowance</label> <input type="text"
						name="extraAllowance" id="extraAllowance" required="required"
						placeholder="Enter Allowance" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Final Payout</label> <input type="FinalPayout" name="finalPayout"
						id="finalPayout" required="required" placeholder="Enter Net Payable" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<nav>
					<ol class="breadcrumb breadcrumb-title">
						<li class="breadcrumb-item action mt-3">Payment Details</li>
					</ol>
				</nav>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields">
					<label for=""> Branch of Payment</label> <select id="branchOfPayment" name="branchOfPayment"
						required="required" class="form-control selectField"
						style="height: 30px;">
						<option value="">Select Pay Branch</option>
						<option value="Blue">Blue</option>
					</select>
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for=""> Date of Payment</label> <input type="date"
						name="dateOfPayment" id="dateOfPayment" required="required"
						 />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields">
					<label for="">Mode of Payment</label> <select id="modeOfPayment" name="modeOfPayment"
						required="required" class="form-control selectField"
						style="height: 30px;">
						<option value="">Select</option>
						<option value="Blue">Cash</option>
						<option value="Blue">Online</option>
						<option value="Blue">Cheque</option>
						<option value="Blue">Neft</option>
					</select>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-12 text-right mt-3">
				<button id="payBtn" class="btnStyle"
					style="background-color: #FFA500;">Pay</button>
			</div>
		</div>
		</form>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>