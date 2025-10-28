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
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-person-bounding-box"></i></a></li>
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
									id=groupid name="groupid" required
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
								<label for="openingDate">Loan Opening Date</label> <input
									type="text" name="" id="loanDate" required
									placeholder="Enter Loan Opening Date" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="communityName">Community Name*</label> <input
									type="text" name="communityName" id="communityName" required
									placeholder="Enter Community Name" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="paymentMode">Group Leader*</label> <input
									type="text" name="communityLeader" id="communityLeader"
									 placeholder="Enter Group Leader Name" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="branchName">Branch Name*</label> <input type="text"
									name="branchName" id="branchName" required
									placeholder="Enter Branch Name" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="loanSchemeName">Loan Scheme Name*</label> <input
									type="text" name="loanSchemeName" id="loanSchemeName" required
									placeholder="Enter Loan Scheme Name" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="communityAddress">Community Address*</label> <input
									type="text" name="communityAddress" id="communityAddress"
									required placeholder="Enter Community Address" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="contactNumber">Contact Number*</label> <input
									type="text" name="contactNumber" id="contactNumber" required
									placeholder="Enter Contact Number" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="term">Term*</label> <input type="text" name="term"
									id="term" required placeholder="Enter Loan Term" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="rateOfInterest">Rate of Interest(%) *</label> <input
									type="text" name="rateOfInterest" id="rateOfInterest" required
									placeholder="Enter Rate of Interest (%)" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="interestType">Interest Type*</label> <input
									type="text" name="interestType" id="interestType" required
									placeholder="Enter Interest Type" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="loanAmount">Loan Amount*</label> <input type="text"
									name="loanAmount" id="loanAmount" required
									placeholder="Enter Loan Amount" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="emiAmount">EMI Amount*</label> <input type="text"
									name="loanEmi" id="loanEmi" required
									placeholder="Enter EMI Amount" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="emiAmount">Total Interest*</label> <input
									type="text" name="loanEmi" id="" required
									placeholder="Enter Total Interest" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="emiAmount">Total payable*</label> <input type="text"
									name="totalPayable" id="totalPayable" required
									placeholder="Enter Total Payable Amount" />
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
								<label for="valuationCharges">Amount Due*</label> <input
									type="text" name="valuationCharges" id="valuationCharges"
									required />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="valuationCharges">No of Installment*</label> <input
									type="text" name="valuationCharges" id="valuationCharges"
									required />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="paymentRemarks">Payment Remarks*</label> <input
									type="text" name="paymentRemarks" id="paymentRemarks" required />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="transactionDate">Transaction Date</label> <input
									type="date" name="transactionDate" id="transactionDate"
									required />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="paymentStatus">Payment Status*</label> <input
									type="text" name="paymentStatus" id="paymentStatus" required />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="referenceCode">Mode of Payment <span
									id="star">*</span></label> <select id="paymentMode" name="paymentMode"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Enter Mode of Payment</option>
									<option value="Cash">CASH</option>
									<option value="Online">Online</option>
									<option value="Cheque">Cheque</option>
									<option value="NEFT">NEFT</option>


								</select>
							</div>
						</div>


						<div class="col-lg-3" id="displayCheque">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Cheque Number <span id="star">*</span></label> <input
									type="text" name="chequeNo" id="chequeNo" required="required"
									placeholder="Enter Cheque No"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3" id="displaycheqdate">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Cheque Date <span id="star">*</span></label> <input
									type="date" name="chequeDate" id="chequeDate"
									required="required" placeholder="Enter Cheque Date"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3" id="displaydeposit">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deposit Account <span id="star">*</span></label> <input
									type="text" name="accountNo" id="accountNo" required="required"
									placeholder="Enter Deposit Account"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<input type="hidden" id="noOfInst" name="noOfInst">

						<div class="col-lg-3" id="displayRef">
							<div class="d-flex flex-column formFields">
								<label for="">Ref Number/UPI ID</label> <input type="text"
									name="ref_UpiId" id="ref_UpiId" required="required"
									placeholder="Enter Deposit Account"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Chrg. Deduct Cash</label> <select id="charges"
									name=charges required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Yes/No</option>
									<option value="YES">Yes</option>
									<option value="NO">No</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="financialConsultantCode">Financial
									Consultant Code*</label> <input id="financialConsultantId"
									name="financialConsultantId" required
									class="form-control selectField" style="height: 30px;" placeholder="Financial Consultant Id"/>
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="financialConsultantName">Financial
									Consultant Name*</label> <input type="text"
									name="financialConsultantName" id="financialConsultantName"
									required placeholder="Financial Consultant Name" />
							</div>
						</div>


					</div>
					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-success"
								style="margin-left: 80%">Save</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</main>
	<script src="./js/adminscript.js"></script>
	<script src="./js/Joinlibiliy/LoanRepayment.js"></script>
</body>

</html>
