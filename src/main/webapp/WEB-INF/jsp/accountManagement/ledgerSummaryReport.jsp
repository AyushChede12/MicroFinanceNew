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
<title>Ledger Report</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
!-- jQuery CDN (latest 3.x version) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
					<li class="breadcrumb-item action">Ledger Summary Report</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="ledgerSummaryForm">

				<nav>
					<ol class="breadcrumb breadcrumb-title">
						<li class="breadcrumb-item action">Search Information</li>
					</ol>
				</nav>
				<div class="row">
					<div class="col-lg-3">
						<label>Branch Name</label> <select id="branchName"
							name="branchName" required class="form-control selectField"
							style="height: 30px;">
							<option value="">Select Branch</option>
						</select>
					</div>

					<div class="col-lg-3">
						<label>Ledger Name</label> <select id="ledgerName"
							name="ledgerName" required class="form-control selectField"
							style="height: 30px;">
							<option value="">Select Ledger</option>
						</select>
					</div>

					<div class="col-lg-3">
						<label>Start Date</label> <input type="date" name="startDate"
							id="startDate" class="form-control"  required />
					</div>

					<div class="col-lg-3">
						<label>End Date</label> <input type="date" name="endDate"
							id="endDate" class="form-control" required />
					</div>
				</div>

				<div class="row mt-3">
					<div class="col text-center">
						<button type="submit" id="viewBtn"
							class="btn btn-warning text-white px-4">View</button>
					</div>
				</div>
			</form>
		</div>
		<!-- Ledger Summary Table -->
		<div class="row mt-5">
			<div class="col-12">
				<div id="summaryInfo" class="mb-3"></div>

				<div class="card recent-sales">
					<div class="card-body table-responsive">
						<table class="table table-borderless datatable">
							<thead class="table-light">
								<tr>
									<th>Date</th>
									<th>Voucher ID</th>
									<th>Remarks</th>
									<th>Account Code</th>
									<th>Debit</th>
									<th>Credit</th>
								</tr>
							</thead>
							<tbody id="ledgerSummaryBody">
								<!-- Data rows will be inserted here -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>



	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/account-management/ledgerSummaryReport.js"></script>
	<script>
		$(document).ready(function() {
			BranchNameDropdown();
			LedgerDropdown()

		});
	</script>
	
</body>

</html>