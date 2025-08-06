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
			<h1>Joint Liability Loan</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i class="bi bi-person-bounding-box"></i></a></li>
					<li class="breadcrumb-item action">Installment Re-Payment</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Info</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">

							<div class="d-flex flex-column formFields">
								<label for="groupCodeid">Find by Group Code*</label> <select
									id="groupcodeid" name="groupcodeid" required
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Customer Name</option>
								</select>
							</div>

						</div>

					</div>
				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="openingDate">Opening Date</label>
								<input type="date" name="openingDate" id="openingDate" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="communityName">Community Name*</label>
								<input type="text" name="communityName" id="communityName" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="branchName">Branch Name*</label>
								<input type="text" name="branchName" id="branchName" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="loanSchemeName">Loan Scheme Name*</label>
								<input type="text" name="loanSchemeName" id="loanSchemeName" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="communityAddress">Community Address*</label>
								<input type="text" name="communityAddress" id="communityAddress" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="contactNumber">Contact Number*</label>
								<input type="text" name="contactNumber" id="contactNumber" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="paymentMode">Payment Mode*</label>
								<input type="text" name="paymentMode" id="paymentMode" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="loanPurpose">Loan Purpose*</label>
								<input type="text" name="loanPurpose" id="loanPurpose" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="term">Term*</label>
								<input type="text" name="term" id="term" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="rateOfInterest">Rate of Interest(%) *</label>
								<input type="text" name="rateOfInterest" id="rateOfInterest" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="interestType">Interest Type*</label>
								<input type="text" name="interestType" id="interestType" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="loanAmount">Loan Amount*</label>
								<input type="text" name="loanAmount" id="loanAmount" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="emiAmount">EMI Amount*</label>
								<input type="text" name="emiAmount" id="emiAmount" required />
							</div>
						</div>
					</div>
				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Payment Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="processingCharges">Processing Charges*</label>
								<input type="text" name="processingCharges" id="processingCharges" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="gstValue">GST Value*</label>
								<input type="text" name="gstValue" id="gstValue" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="legalCharges">Legal Charges*</label>
								<input type="text" name="legalCharges" id="legalCharges" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="insuranceAmount">Insurance Amount*</label>
								<input type="text" name="insuranceAmount" id="insuranceAmount" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="valuationCharges">Valuation Charges*</label>
								<input type="text" name="valuationCharges" id="valuationCharges" required />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="financialConsultantCode">Financial Consultant Code*</label>
								<select id="financialConsultantCode" name="financialConsultantCode" required class="form-control selectField" style="height: 30px;">
									<option value="">Select Financial Consultant Code</option>
								</select>
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="financialConsultantName">Financial Consultant Name*</label>
								<input type="text" name="financialConsultantName" id="financialConsultantName" required />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="chequeDeductedInCash">Cheque Deducted InCash*</label>
								<select id="chequeDeductedInCash" name="chequeDeductedInCash" required class="form-control selectField" style="height: 30px;">
									<option value="">Select Cheque Deducted InCash*</option>
								</select>
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="paymentRemarks">Payment Remarks*</label>
								<input type="text" name="paymentRemarks" id="paymentRemarks" required />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="transactionDate">Transaction Date</label>
								<input type="date" name="transactionDate" id="transactionDate" required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="paymentStatus">Payment Status*</label>
								<input type="text" name="paymentStatus" id="paymentStatus" required />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="paidBy">Paid By*</label>
								<select id="paidBy" name="paidBy" required class="form-control selectField" style="height: 30px;">
									<option value="">Select Paid By</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-success" style="margin-left: 80%">Save</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</main>
	<script src="./js/adminscript.js"></script>
	<script src="./js/Joinlibiliy/InstallmentRepyment.js"></script>
</body>

</html>
