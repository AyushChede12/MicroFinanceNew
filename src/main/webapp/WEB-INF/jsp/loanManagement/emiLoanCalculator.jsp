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
					<li class="breadcrumb-item"><a href="openDashboard"> 
						<i class="bi bi-cash-coin"></i>
					</a></li>
					<li class="breadcrumb-item action">Emi & Loan Calculator</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Emi & Loan Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Interest Type</label> <select name="intrestType" id="intrestType" onchange="calculateEMI()" class="form-control selectField" style="height: 30px;">
									<option value="">Select Interest Type</option>
									<option value="FlatInterest">Flat Interest</option>
									<option value=reducinginterest>Redused Interest</option>
									<option value="Rule78">Rule 78</option>
									
								</select>
							</div>
						</div>


	                          
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Loan Amount</label> <input
									type="text" name="loanAmount" id="loanAmount"
									required="required" placeholder="Loan Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Yearly Interest</label> <input
									type="text" name="yearlyIntrest" id="yearlyIntrest"
									required="required" placeholder="Yearly Interest"
									style="text-transform: uppercase;" />
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Interest Mode</label> <select id="interestModeCalculater" name="interestModeCalculater" onchange="calculateEMI()"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Interest Mode</option>
									<option value="Daily">Daily </option>
									<option value="Weekly">Weekly</option>
									<option value="Fortnightly">Fortnightly</option>
									<option value="Monthly">Monthly</option>
									<option value="Quarterly"> Quarterly</option>
									
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Monthly Term</label> <input
									type="text" name="monthlyTerm" id="monthlyTerm"
									required="required" placeholder="Enter Term in Month"
									style="text-transform: uppercase;" />
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">EMI</label> <input
									type="text" name="emi" id="emi"
									readonly="readonly" placeholder="Enter Term in Month"
									style="text-transform: uppercase;" />
							</div>
						</div>
						


					</div>

					<div class="row">
						<div class="col-12 text-center">
							<button type="button" id="saveBtn" class="btnStyle" onclick="calculateEMI()"
								style="background-color: #FFA500;">Calculate</button>
							<button id="" class="btnStyle bg-danger">View
								Amortization</button>
						</div>
					</div>
			</form>

			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">

						<div class="card-body table-responsive">
							<h5 class="card-title">
								Loan Calculator <span>| Today</span>
							</h5>

							<table class="table table-borderless datatable overflow-scroll" >
								<thead class="table-light">
									<tr style="font-family: 'Poppins', sans-serif;">
										<th scope="col">EMI No.</th>
										<th scope="col">Due Date</th>
										<th scope="col">EMI</th>
										<th scope="col">Principle</th>
										<th scope="col">Interest</th>
										<th scope="col">Current Balance</th>

									</tr>
								</thead>
								<tbody id="tbody">
									

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
	<script src="./js/LoanManagment/emiLoanCalculator.js"></script>
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