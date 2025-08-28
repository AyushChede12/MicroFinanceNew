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
<title>Manual Journal Entry</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
<!-- jQuery CDN (latest 3.x version) -->
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
					<li class="breadcrumb-item action">Manual Journal Entry</li>
				</ol>
			</nav>
		</div>


		<form id="searchForm">
			<nav>
				<ol class="breadcrumb breadcrumb-title">
					<li class="breadcrumb-item action">Search Box</li>
				</ol>
			</nav>
			<div class="row">
				<div class="col-lg-4">
					<div class="d-flex flex-column formFields">
						<label for=""> Branch Name <span class="star">*</span></label> <select id="searchBranchName"
							name="searchBranchName" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Branch</option>
						</select>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="d-flex flex-column formFields">
						<label for="vehicalNo">Start Date <span class="star">*</span></label> <input type="date"
							name="startDate" id="startDate" required="required"
							placeholder="Enter From Date" style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-4">
					<div class="d-flex flex-column formFields">
						<label for="vehicalNo">End Date <span class="star">*</span></label> <input type="date"
							name="endDate" id="endDate" required="required"
							placeholder="Enter To Date" style="text-transform: uppercase;" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12 text-right mt-3">
					<button id="searchBtn" class="btnStyle"
						style="background-color: #FFA500;">Search</button>
				</div>
			</div>
		</form>

		<form id="formid">

			<div class="row">
				<div class="col-lg-12">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action mt-3">Entry Details</li>
						</ol>
					</nav>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="">Branch Name <span class="star">*</span></label> <select id="entryBranchName"
							name="entryBranchName" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Branch</option>
						</select>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields mb-4">
						<label for="">Generated Receipt ID <span class="star">*</span></label> <input type="text"
							name="generatedReceiptID" id="generatedReceiptID"
							required="required" placeholder="Enter receipt no." disabled />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields mb-4">
						<label for="">Date of Entry <span class="star">*</span></label> <input type="date"
							name="dateOfEntry" id="dateOfEntry" required="required"
							placeholder="Enter Registration Date" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="">Choose Credit Ledger <span class="star">*</span></label> <select
							id="creditLedger" name="creditLedger" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Cr. ledger</option>
						</select>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="">Choose Debit Ledger <span class="star">*</span></label> <select id="debitLedger"
							name="debitLedger" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">--Select Dr. Ledger--</option>
						</select>
					</div>
				</div>


				<div class="col-lg-3">
					<div class="d-flex flex-column formFields mb-4">
						<label for="">Transaction Amount <span class="star">*</span></label> <input type="text"
							name="transactionAmount" id="transactionAmount"
							required="required" placeholder="Enter Amount" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="">Remarks</label>
						<textarea name="remarks" id="remarks"
							style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 text-right mt-3">
					<button id="saveBtn" class="btnStyle"
						style="background-color: #FFA500;">Save</button>
				</div>
			</div>
		</form>

		<div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">

					<div class="card-body table-responsive">
						<h5 class="card-title">Search result</h5>

						<table class="table table-borderless datatable overflow-scroll">
							<thead class="table-light">
								<tr style="font-family: 'Poppins', sans-serif;">
									<th scope="col">ID.</th>
									<th scope="col">Branch</th>
									<th scope="col">Date of Entry</th>
									<th scope="col">Cr. Ledger</th>
									<th scope="col">Dr. Ledger</th>
									<th scope="col">Amount</th>
									<th scope="col">Remarks</th>
									<th scope="col">View</th>

								</tr>
							</thead>
							<tbody id="tableBody">
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
	<script src="./js/account-management/manualJournalEntry.js"></script>
	<script>
		$(document).ready(function() {
			BranchNameDropdown();
			LedgerDropdown()
		});
	</script>
</body>

</html>