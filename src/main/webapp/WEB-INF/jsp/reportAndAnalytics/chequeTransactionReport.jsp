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
<title>Cheque Clearance Report</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>

<!-- jQuery CDN (latest 3.x version) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Reports & Analytics</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-file-earmark-text"></i>
					</a></li>
					<li class="breadcrumb-item action">Cheque Transaction Report</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Find Box</li>
						</ol>
					</nav>
					<div class="row">

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="">Type </label> <select id="type" name="type"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">All Type</option>
									<option value="RD">Cheque Issued</option>
									<option value="RD">Cheque Received</option>
									<option value="RD">Cleared Cheque</option>
									<option value="RD">Bounced Cheque</option>
									<option value="RD">Pending Cheque</option>
									<option value="RD">Cancelled Cheque</option>
									<option value="RD">Transferred Cheque</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="branchName">Branch </label> <select id="branchName" name="branchName"
									required="required" class="form-control selectField"
									style="height: 30px;">
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">From Date :</label> <input type="date"
									name="fDate" id="fDate" required="required"
									placeholder="Enter fDate" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">TO Date :</label> <input type="date" name="tDate"
									id="tDate" required="required" placeholder="Enter tDate"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="">Check Number.</label> <input type="text"
									id="chequeNo" name="chequeNo" required="required"
									style="height: 30px;" placeholder="Enter Cheque No.">

							</div>
						</div>



					</div>

					<div class="row">
						<div class="col-4 text-start mt-3">
							<button type="button" id="findBtn" class="btn btn-dark">Find</button>
						</div>
					</div>

				</div>

			</form>

			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">

						<div class="card-body table-responsive">
							<h5 class="card-title">Cheque Details</h5>

							<div style="overflow-x: auto; white-space: nowrap;">
								<table class="table table-borderless datatable" style="text-align: center;">
									<thead class="table-light">
										<tr style="font-family: 'Poppins', sans-serif;">
											<th scope="col">Sr. No</th>
											<th scope="col">Account Holder Name</th>
											<th scope="col">Txn Date</th>
											<th scope="col">Cheque No.</th>
											<th scope="col">Payment Status</th>
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


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/ReportsAndAnalytics/ChequeTransactionReport.js"></script>
</body>

</html>