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
			<h1>Secured Gold Loan</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-coin"></i>
					</a></li>
					<li class="breadcrumb-item action">Gold Loan Approval</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div class="">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Search Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-5">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Find Loan By ID</label> <select id="findByLoanId"
									name="findByLoanId" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Loan ID</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Date of Loan</label> <input type="date"
									name="loanDate" id="loanDate" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Customer Search</label> <input type="text"
									name="cutomerSearch" id="cutomerSearch" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Family Member Name</label> <input
									type="text" name="relativeDetails" id="relativeDetails"
									required="required" placeholder="Enter Family Member Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Date Of Birth</label> <input type="date"
									name="dateOfBirth" id="dateOfBirth" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No.</label> <input type="text"
									name="contactNo" id="contactNo" required="required"
									placeholder="Enter Mobile Number" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Message Status</label> <input type="text"
									name="messageStatus" id="messageStatus" required="required"
									placeholder=" messageStatus" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="address" id="address"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="pin">Pin Code</label> <input type="text"
									name="pinCode" id="pinCode" required="required"
									placeholder="Enter Pin Code" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Branch Name</label> <input type="text"
									name="branchName" id="branchName" required="required"
									placeholder="Enter Branch Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Plan Name</label> <input type="text"
									name="loanPlanName" id="loanPlanName" required="required"
									placeholder="Enter Loan Plan Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Type Of Loan</label> <input type="text"
									name="typeOfLoan" id="typeOfLoan" required="required"
									placeholder="Enter Type of Loan "
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Term</label> <input type="text"
									name="loanTerm" id="loanTerm" required="required"
									placeholder="Enter Plan Duration"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Mode</label> <input type="text"
									name="loanMode" id="loanMode" required="required"
									placeholder="Loan Category" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Rate of Interest (%pa.) </label> <input
									type="text" name="rateOfInterest" id="rateOfInterest"
									required="required" placeholder="Enter Loan ROI"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Amount Of Loan</label> <input type="text"
									name="loanAmount" id="loanAmount" required="required"
									placeholder="Enter Amount Of Loan"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">EMI Payment</label> <input type="text"
									name="emiPayment" id="emiPayment" required="required"
									placeholder="Enter EMI Payment"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Purpose of Loan</label> <input type="text"
									name="purposeOfLoan" id="purposeOfLoan" required="required"
									placeholder="Enter Purpose of Loan"
									style="text-transform: uppercase;" />
							</div>
						</div>

					</div>
				</div>


				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Gold/Silver Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label> Karat </label>
								<div class="position-relative">
									<select id="karat" name="karat" required="required"
										class="form-control selectField" style="height: 30px;">
										<option value="">Select Karat</option>
										<option value="24K">24K</option>
										<option value="22K">22K</option>
										<option value="20K">20K</option>
										<option value="18K">18K</option>


									</select>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Item Type</label> <select id="itemType"
									name="itemType" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">-Select-</option>
									<option value="Gold">Gold</option>
									<option value="Silver">Silver</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Karat Rate</label> <input type="text"
									name="karatRate" id="karatRate" required="required"
									placeholder="Enter Karat Rate" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Item Name</label> <select id="itemName"
									name="itemName" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">-Select-</option>
									<option value="Gold">Gold</option>
									<option value="Silver">Silver</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Locker Location</label> <select
									id="lockerLocation" name="lockerLocation" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">-Select-</option>
									<option value="Gold">Sadar</option>
									<option value="Silver">Reshimbagh</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Purity</label> <select id="purity" name="purity"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Purity</option>
									<option value="Pledge">Test12</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Item Quantity</label> <input type="text"
									name="itemQty" id="itemQty" required="required"
									placeholder="Enter Quantity" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Item Weight</label> <input type="text"
									name="itemWt" id="itemWt" required="required"
									placeholder="Enter Item Weight" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Gross Weight</label> <input type="text"
									name="grosswt" id="grossWt" required="required"
									placeholder="Enter Gross Weight" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Stone Weight</label> <input type="text"
									name="stoneWt" id="stoneWt" required="required"
									placeholder="Enter Stone Weight" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Net Weight</label> <input type="text" name="netWt"
									id="netWr" required="required" placeholder="Enter Net Weight" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Market Valuation</label> <input type="text"
									name="marketValuatiion" id="marketValuation"
									required="required" placeholder="Enter Market Valuation" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Eligible Loan</label> <input type="text"
									name="eligibleLoan" id="eligibleLoan" required="required"
									placeholder="Enter Eligible Loan" />
							</div>
						</div>

					</div>
				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Gurantor Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Member Id</label> <input type="text"
									name="memberId" id="memberId" required="required"
									placeholder="Enter Member ID" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Gurantor Identity</label> <input type="text"
									name="guarantorIdentity" id="guarantorIdentity"
									required="required" placeholder="Enter Guranntor Identity" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="guarantorAddress" id="guarantorAddress"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Pin Code</label> <input type="number"
									name="guarantorPinCode" id="guarantorPinCode"
									required="required" placeholder="Enter Pin Code" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Gurantor Contact No.</label> <input type="text"
									name="guarantorContactNo" id="guarantorContactNo"
									required="required" placeholder="Enter  Gurantor Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Security Type</label> <input type="text"
									name="guarantorSecurityType" id="guarantorSecurityType"
									required="required" placeholder="Enter  Security Type" />
							</div>
						</div>






					</div>


				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Co-Applicant Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">

								<div class="position-relative">
									<div class="d-flex flex-column formFields mb-4">
										<label for="">Customer Code</label> <input type="text"
											name="custCode" id="custCode" required="required"
											placeholder="Enter Customer Code" />
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Gurantor Identity</label> <input type="text"
									name="coApplicantIdentity" id="coApplicantIdentity"
									required="required" placeholder="Enter Guranntor Identity" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="coApplicantAddress" id="coApplicantAddress"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Pin Code</label> <input type="text"
									name="coApplicantPinCode" id="coApplicantPinCode"
									required="required" placeholder="Enter Pin Code" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Gurantor Contact No.</label> <input type="text"
									name="coApplicantContactNo" id="coApplicantContactNo"
									required="required" placeholder="Enter  Gurantor Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Security Type</label> <input type="text"
									name="coApplicantSecurityType" id="coApplicantSecurityType"
									required="required" placeholder="Enter  Security Type" />
							</div>
						</div>

					</div>



				</div>

				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Deduction Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">

							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Processing Fee(%) </label> <input
									type="text" name="processingFee" id="processingFee"
									required="required" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Legal Charges(%)</label> <input
									type="text" name="legalCharges" id="legalCharges"
									required="required" style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">GST</label> <input type="text" name="gst"
									id="gst" required="required" placeholder="Enter GST"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">Insurance Fee</label> <input type="text"
									name="insuranceFee" id="insuranceFee" required="required"
									placeholder="Enter insurence fees"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">Valuation Fee</label> <input type="text"
									name="valuationFee" id="valuationFee" required="required"
									placeholder="Enter Valuation fees"
									style="text-transform: uppercase;" />
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4"
								style="margin-bottom: 30px">
								<label> Financial Consultant Id</label>
								<div class="d-flex flex-column formFields mb-4">
									<input type="text" name="financialConsultantId"
										id="financialConsultantId" required="required"
										placeholder="Enter Member ID" />
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Financial Consultant Name</label> <input
									type="text" name="financialConsultantName"
									id="financialConsultantName" required="required"
									placeholder="Enter Advisor/Collector Name"
									style="text-transform: uppercase;" />
							</div>
						</div>




					</div>
				</div>

				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Approval Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">

							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Date Of Approval </label> <input
									type="date" name="approvalDate" id="approvalDate"
									required="required" style="text-transform: uppercase;" />
							</div>
						</div>



						<div class="col-lg-5">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Approval Status</label> <select id="approvalStatus"
									name="approvalStatus" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select </option>
									<option value="">Approved</option>
									<option value="">Not Approved</option>
									
								</select>
							</div>
						</div>

						<div class="col-12 text-center">
							<button id="approveBtn" class="btnStyle" name="approveBtn"
								style="background-color: #FFA500;">Approve It</button>
							<!-- <button id="saveBtn" class="btnStyle" style="background-color: #FFA500;">Update</button>
                            <button id="saveBtn" class="btnStyle bg-primary">Print</button> -->
						</div>

					</div>
				</div>


			</form>
	</main>
	<script src="./js/adminscript.js"></script>
	<script src="./js/LoanManagment/LoanApproval.js"></script>
</body>

</html>