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
<title>Investment Report</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- In <head> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Before </body> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

</head>
<style>
.bank-report table th, .bank-report table td {
	vertical-align: middle;
}

.bank-report table thead th {
	background-color: #0d6efd !important;
	color: white;
}
</style>

<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Reports & Analytics</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-file-earmark-text"></i>
					</a></li>
					<li class="breadcrumb-item action">Investment Transaction
						Report</li>
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
								<label for="">Branch Name </label> <select id="branchName1"
									name="branchName" required="required"
									class="form-control selectField">
									<option value="">Select</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="fromDate">From Date :</label> <input type="date"
									name="fromDate" id="fromDate" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="toDate">To Date :</label> <input type="date"
									name="toDate" id="toDate" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>





					</div>

					<div class="row">
						<div class="col-4 text-start mt-3">
							<button id="findBtn" class="btn btn-dark">Find</button>
						</div>
					</div>

				</div>

			</form>

			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">

						<div class="card-body table-responsive">
							<h5 class="card-title">Search Result</h5>

							<h6 class="card-title" style="text-align: center; color: black;">
								Investment Report</h6>


							<div style="overflow-x: auto; white-space: nowrap;">
								<table class="table table-borderless datatable">
									<thead class="table-light">
										<tr style="font-family: 'Poppins', sans-serif;">
											<th scope="col">Sr No.</th>
											<th scope="col">Policy Code</th>
											<th scope="col">Customer Name</th>
											<th scope="col">Policy Name</th>
											<th scope="col">Policy Date</th>
											<th scope="col">Policy Amount</th>
											<th scope="col">Contact Number</th>
											<th scope="col">Branch</th>
											<th scope="col">Approved</th>
											<th scope="col">Print</th>

										</tr>
									</thead>
									<tbody>
									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- Bank Report Modal -->
		<div class="modal fade" id="bankReportModal" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog modal-xl modal-dialog-scrollable">
				<div class="modal-content">
					<!-- Header -->
					<div class="modal-header bg-primary text-white">
						<h5 class="modal-title">Microfinance Transaction Report</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<!-- Body -->
					<div class="modal-body" id="bankReportContent">
						<div class="bank-report p-4"
							style="font-family: Arial, sans-serif; background-color: #f8f9fa;">

							<!-- Bank Header -->
							<div
								class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
								<div class="d-flex align-items-center">
									<img id="bankLogo" src="" alt="Logo"
										style="height: 50px; margin-right: 10px;">
									<div>
										<h4 id="bankName" class="mb-0 fw-bold text-primary"></h4>
										<small id="reportTitle" class="text-secondary"></small>
									</div>
								</div>
								<div>
									<p class="mb-0">
										<strong>Customer Code:</strong> <span id="accountNumber"></span>
									</p>
									<p class="mb-0">
										<strong>PERIOD COVERED:</strong> <span id="periodCovered"></span>
									</p>
								</div>
							</div>

							<!-- Customer & Summary -->
							<div class="row mb-3">
								<div class="col-md-6">
									<div class="border p-3 bg-white rounded shadow-sm">
										<h6 class="fw-bold mb-2 text-primary">CUSTOMER</h6>
										<p id="customerName" class="mb-0 fw-bold"></p>
										<p id="customerAddress1" class="mb-0"></p>
										<p id="customerAddress2" class="mb-0"></p>
									</div>
								</div>
								<div class="col-md-6">
									<div class="border p-3 bg-white rounded shadow-sm">
										<h6 class="fw-bold mb-2 text-primary">SUMMARY</h6>
										<table class="w-100">
											<tr>
												<td>Starting Balance:</td>
												<td id="startingBalance" class="text-end fw-bold"></td>
											</tr>
											<tr>
												<td>Income:</td>
												<td id="incomeAmount" class="text-end fw-bold text-success"></td>
											</tr>
											<tr>
												<td>Expenses:</td>
												<td id="expensesAmount" class="text-end fw-bold text-danger"></td>
											</tr>
											<tr class="border-top">
												<td><strong>Closing Balance:</strong></td>
												<td id="closingBalance"
													class="text-end fw-bold text-primary"></td>
											</tr>
										</table>
									</div>
								</div>
							</div>

							<!-- Transactions Table -->
							<div class="mt-4">
								<h6 class="fw-bold text-primary mb-3">TRANSACTIONS:</h6>
								<table
									class="table table-bordered table-striped align-middle text-center">
									<thead class="table-primary">
										<tr>
											<th>Policy Code</th>
											<th>Policy Date</th>
											<th>Policy Amount</th>
											<th>Policy Type</th>
											<th>Policy Mode</th>
										</tr>
									</thead>
									<tbody id="transactionTableBody">
										<!-- Dynamic rows will be appended here via JavaScript -->
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- Footer -->
					<div class="modal-footer">
						<button id="printBankReportBtn" class="btn btn-success">
							<i class="bi bi-printer"></i> Print
						</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>








	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/ReportsAndAnalytics/InvestmentTransactionReport.js"></script>
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