<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>

<>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
	rel="stylesheet">
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

<!-- Select2 CSS and JS -->
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Secured Gold Loan</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-cash-coin"></i>
					</a></li>
					<li class="breadcrumb-item action">EMI Installment Payment</li>
				</ol>
			</nav>
		</div>

		<div class="row">
			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="findByGoldLoanId" id="goldSelection">Customer
						Selection </label> <select id="findByGoldLoanId" name="findByGoldLoanId"
						class="form-control selectField" style="width: 100%;">
						<option value="">-- Search Gold ID --</option>
					</select>
				</div>
			</div>
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
								<label for="loanDate">DATE OF LOAN</label> <input type="date"
									name="loanDate" id="loanDate" required="required"
									readonly="readonly" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="customerCode">CUSTOMER CODE</label> <input
									type="text" name="customerCode" id="customerCode"
									readonly="readonly" required="required"
									placeholder="ENTER CUSTOMER CODE" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="customerName">CUSTOMER NAME</label> <input
									type="text" name="customerName" id="customerName"
									readonly="readonly" required="required"
									placeholder="ENTER CUSTOMER NAME" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">LOAN PLAN NAME </label> <input type="text"
									readonly="readonly" name="loanPlanName" id="loanPlanName"
									required="required" placeholder="ENTER LOAN PLAN" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">INTEREST TYPE</label> <input type="text"
									readonly="readonly" name="interestType" id="interestType"
									required="required" placeholder="ENTER INTEREST TYPE" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">LOAN MODE</label> <input type="text"
									readonly="readonly" name="loanMode" id="loanMode"
									required="required" placeholder="ENTER LOAN MODE" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Term</label> <input type="text" name="loanTerm"
									readonly="readonly" id="loanTerm" required="required"
									placeholder="ENTER TERM" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">EMI PAYMENT</label> <input type="text"
									readonly="readonly" name="emiPayment" id="emiPayment"
									required="required" placeholder="ENTER EMI PAYMENT" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">TYPE OF LOAN</label> <input type="text"
									readonly="readonly" name="typeOfLoan" id="typeOfLoan"
									required="required" placeholder="ENTER TYPE OF LOAN" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">RATE OF INTEREST(%)</label> <input type="text"
									readonly="readonly" name="rateOfInterest" id="rateOfInterest"
									required="required" placeholder="ENTER RATE OF INTEREST" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">CONTACT NO.</label> <input type="text"
									readonly="readonly" name="contactNo" id="contactNo"
									required="required" placeholder="ENTER CONTACT NO" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">AMOUNT OF LOAN</label> <input type="text"
									readonly="readonly" name="loanAmount" id="loanAmount"
									required="required" placeholder="ENTER AMOUNT OF LOAN." />
							</div>
						</div>

						<!-- <div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Total Principle Of Loan</label> <input type="text"
									name="totalPrincipalloan" id="totalPrincipalloan"
									required="required" placeholder="Enter Total Principle Of Loan" />
							</div>
						</div> -->

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="branchName">BRANCH NAME</label> <input type="text"
									readonly="readonly" name="branchName" id="branchName"
									required="required" placeholder="ENTER BRANCH NAME" />
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

						<div class="col-lg-3">

							<div class="d-flex flex-column formFields mb-4">
								<label for="">INSTALLMENT</label> <select id="installment"
									name="installment" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">-SELECT INSTALLMENT-</option>

								</select>
							</div>
						</div>

						<!-- <div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Interest Due </label> <input type="text"
									name="dueInterest" id="dueInterest" required="required"
									placeholder="Enter Location" />
							</div>
						</div> -->


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="vehicalNo">REGISTRATION DATE</label> <input
									type="date" name="registrationDate" id="registrationDate"
									required="required" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">DUE AMOUNT</label> <input type="text"
									name="dueAmount" id="dueAmount" required="required"
									placeholder="ENTER AMOUNT DUE" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">PENDING INTEREST</label> <input type="text"
									name="pendingInterest" id="pendingInterest" required="required"
									placeholder="ENTER PENDING INTEREST" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">PENDING PRINCIPAL</label> <input type="text"
									name="pendingPrincipal" id="pendingPrincipal"
									required="required" placeholder="ENTER PENDING PRINCIPAL" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">TOTAL DUE</label> <input type="text"
									name="totalDue" id="totalDue" required="required"
									placeholder="ENTER TOTAL DUE" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">PAYMENT AMOUNT</label> <input type="text"
									name="paymentAmount" id="paymentAmount" required="required"
									placeholder="ENTER PAYMENT AMOUNT" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="vehicalNo">PAYMENT DATE</label> <input type="date"
									name="PaymentDate" id="PaymentDate" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">NET AMOUNT</label> <input type="text"
									name="netAmount" id="netAmount" required="required"
									placeholder="ENTER NET AMOUNT" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="referenceCode">MODE OF PAYMENT <span
									id="star">*</span></label> <select id="modeofPayment"
									name="modeofPayment" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">ENTER MODE OF PAYMENT</option>
									<option value="Cash">CASH</option>
									<option value="Online">ONLINE</option>
									<option value="Cheque">CHEQUE</option>
									<option value="NEFT">NEFT</option>


								</select>
							</div>
						</div>


						<!-- <div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Down Payment</label>
								<textarea name="downPayment" id="downPayment"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div> -->

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">FINANCIAL CONSULTANT ID</label> <input type="text"
									name="financialConsultantId" id="financialConsultantId"
									required="required" placeholder="ENTER FINANCIAL ID" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="financialConsultantName">FINANCIAL
									CONSULTANT NAME</label> <input type="text"
									name="financialConsultantName" id="financialConsultantName"
									required="required" placeholder="ENTER FINANCIAL NAMEE" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="remarks">REMARKS</label> <input type="text"
									name="remarks" id="remarks" required="required"
									placeholder="ENTER REMARKS" />
							</div>
						</div>
					</div>
				</div>

				<div class="row mt-4">
					<div class="col-12 text-center">
						<button type="button" id="saveBtn" class="btnStyle bg-success">Save</button>
					</div>
				</div>
			</form>



		</div>


	</main>
	<script src="./js/adminscript.js"></script>
	<script src="./js/SecuredGoldLoan/EMIInsatllmentPayment.js"></script>

</body>

</html>