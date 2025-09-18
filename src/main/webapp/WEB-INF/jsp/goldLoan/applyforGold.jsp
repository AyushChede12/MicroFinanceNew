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
			<h1>Secured Gold Plan</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-coin"></i>
					</a></li>
					<li class="breadcrumb-item action">Apply For Gold</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Details</li>
						</ol>
					</nav>
					<div class="row">
						<input type="hidden" id="loanId" name="loanId" value="${loanCode}">
						<input type="hidden" id="memberName" name="memberName">

						<div class="col-lg-3">

							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Loan Date</label> <input type="date"
									name="loanDate" id="loanDate" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Find Members</label> <select id="memberCode"
									name="memberCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select member Code</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Customer Name</label> <input
									type="text" name="customerName" id="customerName"
									required="required" placeholder="Enter Customer Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Date of Birth </label> <input type="date"
									name="dateOfBirth" id="dateOfBirth" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Age </label> <input type="text" name="age"
									id="age" required="required" placeholder="Age" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Contact No.</label> <input type="text"
									name="contactNo" id="contactNo" required="required"
									placeholder="Enter Contact No." />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Address</label>
								<textarea name="address" id="address"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Pin Code</label> <input type="number"
									name="pinCode" id="pinCode" required="required"
									placeholder="Enter Pin Code" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">branchName Name </label> <input type="text"
									name="branchName" id="branchName" required="required"
									placeholder="Branch Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Loan Plan Name</label> <select id="loanPlanName"
									name="loanPlanName" required="required"
									onchange="calculateCharges()" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Loan Plan</option>

								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Type of Loan</label> <input type="text"
									name="typeOfLoan" id="typeOfLoan" required="required"
									placeholder="Type of Loan" style="text-transform: uppercase;" />

							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Mode</label> <input type="text"
									name="loanMode" id="loanMode" required="required"
									placeholder="Enter Loan Category"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Term</label> <input type="text"
									name="loanTerm" id="loanTerm" required="required"
									placeholder="Plan Duration" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Rate Of Interest(%)</label> <input type="text"
									name="rateOfInterest" id="rateOfInterest" required="required"
									placeholder="Enter Rate Of Interest"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Amount Of Loan </label> <input type="text"
									name="loanAmount" id="loanAmount" required="required"
									placeholder="Enter Amount Of Loan"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Interest Type</label> <input type="text"
									name="interestType" id="interestType" required="required"
									placeholder="Enter Interest Type"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">EMI Payment</label> <input type="text"
									onclick="calculateEMI()" name="emiPayment" id="emiPayment"
									required="required" placeholder="Enter EMI Payment"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Purpose of Loan </label> <input type="text"
									name="purposeOfLoan" id="purposeOfLoan" required="required"
									placeholder="Enter Purpose of Loan"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div
								class="h-100 d-flex justify-content-start align-items-center">
								<div
									class="d-flex justify-content-start align-items-center formFields">
									<label for="messageStatus" style="margin-left: 20px;"
										class="mb-2">Message Status</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-sms-send"
												name="smsSend" class="toggle__input"
												data-toggle-type="smsSend"> <label
												for="toggle-sms-send" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Photo <span id="star">*</span>
							</label> <label for="signature" id="drop-area"> <input
								type="file" accept="image/*" name="photo" id="photo"
								hidden="hidden" onchange="photoUpload();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="photoPreview" /> <input type="hidden"
										id="photoHidden" name="photoHidden">

								</div>
							</label>
						</div>

						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Signature <span id="star">*</span>
							</label> <label for="signature" id="drop-area"> <input
								type="file" accept="image/*" name="signature" id="signature"
								hidden="hidden" onchange="signatureUpload();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="signaturePreview" /> <input type="hidden"
										id="signatureHidden" name="signatureHidden">

								</div>
							</label>
						</div>

					</div>
				</div>



				<!-- Gold/Silver Details -->
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
							<li class="breadcrumb-item action">Guarantor Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label> Customer Code </label>
								<div class="position-relative">
									<select id="customerCode" name="customerCode"
										required="required" class="form-control selectField"
										style="height: 30px;">
										<option value="">Select Customer Code</option>

									</select>
								</div>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Guarantor Identity</label> <input type="text"
									id=gurantorIdentity name="guarantorIdentity"
									required="required" class="form-control selectField"
									style="height: 30px;">

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
								<label for="">Pin Code</label> <input type="text"
									name="guarantorPinCode" id="guarantorPinCode"
									required="required" placeholder="Enter Pin Code" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Guarantor Contact No.</label> <input type="text"
									name="guarantorContactNo" id="guarantorContactNo"
									required="required" placeholder="Enter  Guarantor Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Security Type</label> <select
									id="guarantorSecurityType" name="guarantorSecurityType"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Security</option>
									<option value="Pledge">Pledge</option>
									<option value="Mortgage">Mortgage</option>
									<option value="Property">Property</option>
									<option value="Gold">Gold</option>
								</select>
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
								<label> Customer Code </label>
								<div class="position-relative">
									<select id="coApplicantMemberId" name="coApplicantMemberId"
										required="required" class="form-control selectField"
										style="height: 30px;">
										<option value="">Customer Code</option>

									</select>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Co-Applicant Identity</label> <input type="text"
									id="coApplicantIdentity" name="coApplicantIdentity"
									required="required" class="form-control selectField"
									style="height: 30px;">

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
								<label for="">Co-Applicant Contact No.</label> <input
									type="text" name="coApplicantContactNo"
									id="coApplicantContactNo" required="required"
									placeholder="Enter Gurantor Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Security Details</label> <input type="text"
									id="securityDetails" name="securityDetails" required="required"
									class="form-control selectField" style="height: 30px;">


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
								<label for="loanName">Processing Fee </label> <input type="text"
									name="processingFee" id="processingFee" required="required"
									style="text-transform: uppercase;" placeholder="Enter Processing Fee"/>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Legal Charges </label> <input type="text"
									name="legalCharges" id="legalCharges" required="required"
									style="text-transform: uppercase;" placeholder="Enter Legal Charges" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Stamp Duty</label> <input type="text"
									name="stampDuty" id="stampDuty" required="required"
									placeholder="Enter Stamp Duty Fee"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">SMS Charges</label> <input type="text"
									name="smsCharges" id="smsCharges" required="required"
									placeholder="Enter Sms Charges fees"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="MainCharges">Maintainance Charges</label> <input
									type="text" name="mainCharges" id="mainCharges"
									required="required" placeholder="Enter Maintainance Charge"
									style="text-transform: uppercase;" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Stationary Charges Fee</label> <input type="text"
									name="stationaryFee" id="stationaryFee" required="required"
									placeholder="Enter Stationary Number Fee" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4"
								style="margin-bottom: 30px">
								<label> Financial Consultant Id</label>
								<div class="position-relative">
									<select id="financialConsultantId" name="financialConsultantId"
										required="required" class="form-control selectField"
										style="height: 30px;" placeholder="Enter Financial Code">
										<option value=""></option>

									</select>
								</div>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">GST</label> <input type="text" name="gst" id="gst"
									required="required" placeholder="Enter GST"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Insurance Fees</label> <input type="text"
									name="insuFee" id="insuFee" required="required"
									placeholder="Enter Insurance Fee"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Penalty Charge</label> <input type="text"
									name="penaltyCharge" id="penaltyCharge" required="required"
									placeholder="Enter Penalty Charge"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Valuation Fees</label> <input type="text"
									name="valuationFees" id="valuationFees" required="required"
									placeholder="Enter Valuation Fees"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Overdue Intrest Charge</label> <input type="text"
									name="overCharge" id="overCharge" required="required"
									placeholder="Enter Overdue Charge"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Collection Charge</label> <input type="text"
									name="collectionCharge" id="collectionCharge"
									required="required" placeholder="Enter Collection Charge"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Financial Consultant Name</label> <input
									type="text" name="financialConsultantName"
									id="financialConsultantName" required="required" placeholder="Enter Cosultant Name"
									style="text-transform: uppercase;" />
							</div>
						</div>



					</div>
				</div>

				<div class="row">
					<div class="col-12 text-center">
						<button id="saveBtn" class="btnStyle bg-success">Save</button>
						<!-- <button id="saveBtn" class="btnStyle" style="background-color: #FFA500;">Update</button>
                        <button id="saveBtn" class="btnStyle bg-primary">Print</button> -->
					</div>
				</div>
			</form>
	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/SecuredGoldLoan/ApplyForGold.js"></script>
	
</body>
<script>
document.addEventListener('DOMContentLoaded', function () {
	const toggles = document.querySelectorAll('.toggle__input');
	
	toggles.forEach((toggle) => {
		updateToggleColor(toggle);

		toggle.addEventListener('change', () => {
			updateToggleColor(toggle);
			console.log(`${toggle.dataset.toggleType} is now ${toggle.checked}`);
		});
	});

	function updateToggleColor(input) {
		const label = input.nextElementSibling;
		if (label) {
			label.style.backgroundColor = input.checked ? '#28a745' : '#ccc';
		}
	}
});
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const LOAN_PERCENTAGE = 0.75; // 75%

        const karatRate = document.getElementById("karatRate");
        const grossWt = document.getElementById("grossWt");
        const stoneWt = document.getElementById("stoneWt");
        const netWt = document.getElementById("netWr");
        const marketValuation = document.getElementById("marketValuation");
        const eligibleLoan = document.getElementById("eligibleLoan");

        function calculateValues() {
            let gross = parseFloat(grossWt.value) || 0;
            let stone = parseFloat(stoneWt.value) || 0;
            let rate = parseFloat(karatRate.value) || 0;

            let net = gross - stone;
            if (net < 0) net = 0;

            let valuation = net * rate;
            let loan = valuation * LOAN_PERCENTAGE;

            netWt.value = net.toFixed(2);
            marketValuation.value = valuation.toFixed(2);
            eligibleLoan.value = loan.toFixed(2);
        }

        [karatRate, grossWt, stoneWt].forEach(input => {
            input.addEventListener("input", calculateValues);
        });
    });
  </script>

</html>

