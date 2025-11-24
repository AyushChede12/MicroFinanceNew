
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
<title>Admin Dashboard</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>

<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Customer Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-people-fill"></i>
					</a></li>
					<li class="breadcrumb-item action">Add Customer</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Customer Details</li>
						</ol>
					</nav>
					<div class="row">

						<div class="col-lg-0">
							<div class="d-none flex-column formFields">
								<label for="">Customer Code </label> <input name="memberCode"
									id="memberCode" value="${memberCode}" required="required"
									placeholder="Enter Customer Name" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Authenticate for</label> <select
									id="authenticateFor" name="authenticateFor" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
									<option value="aadhar">Aadhar</option>
									<option value="withoutAadhar">Without Aadhar</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Aadhar No</label> <input type="text"
									name="aadharNo" id="aadharNo" required="required"
									placeholder="Enter Adhar No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Sign-up Date</label> <input type="date"
									name="signupDate" id="signupDate" required="required"
									placeholder="Enter Sign-up Date"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">(Mr/Ms)</label> <select id="major" name="major"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Mr</option>
									<option value="">Mrs</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="firstName">First Name</label> <input type="text"
									name="firstName" id="firstName" placeholder="Enter First Name"
									required />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="middleName">Middle Name</label> <input type="text"
									name="middleName" id="middleName"
									placeholder="Enter Middle Name" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="lastName">Last Name</label> <input type="text"
									name="lastName" id="lastName" placeholder="Enter Last Name"
									required />
							</div>
						</div>


						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">DOB</label> <input type="date" name="dob" id="dob"
									required="required" placeholder="Enter DOB" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Minor</label> <select id="minor" name="minor"
									onchange="ifMinor()" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
									<option value="Yes">Yes(Below 18)</option>
									<option value="No">No(Above 18)</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3 mb-4" id="guardianDetails">
							<div class="d-flex flex-column formFields">
								<label for="guardianName">Guardian Name(if Minor)</label> <select
									id="guardianName" name="guardianName" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="No"></option>
								</select>

							</div>
						</div>

						<div class="col-lg-3 mb-4" id="guardianAccount">
							<div class="d-flex flex-column formFields">
								<label for="guardianAccNo">Guardian Account No</label> <input
									type="text" name="guardianAccNo" id="guardianAccNo"
									required="required" placeholder="Enter Account No" />
							</div>
						</div>

						<!-- Relation to Applicant -->
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Relation to Applicant</label> <select
									id="relationToApplicant" name="relationToApplicant"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Relation to Applicant</option>
								</select>
							</div>
						</div>





						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Gender</label> <select id="customerGender"
									name="customerGender" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Gender</option>
									<option value="">Male</option>
									<option value="">Female</option>

								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Age</label> <input type="text" name="customerAge"
									id="customerAge" required="required" placeholder="Enter Age" />
							</div>
						</div>



						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Relationship Status</label> <select
									id="relationshipStatus" name="relationshipStatus"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Single</option>
									<option value="">Married</option>
									<option value="">Divorced</option>

								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="customerAddress" id="customerAddress"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3 mb-3">
							<div class="d-flex flex-column formFields">
								<label for="">State</label> <select id="state" name="state"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select State</option>

								</select>
							</div>
						</div>


						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields">
								<label for="">District</label> <select id="district"
									name="district" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select District</option>

								</select>
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Pin Code</label> <input type="text" name="pinCode"
									id="pinCode" required="required" placeholder="Enter Pincode" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Branch Name</label> <select id="branchName"
									name="branchName" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Branch Name</option>

								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">PAN No</label> <input type="text" name="panNo"
									id="panNo" required="required" placeholder="Enter PAN No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Voter No</label> <input type="text" name="voterNo"
									id="voterNo" required="required" placeholder="Enter Voter No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Driving Licence No</label> <input type="text"
									name="drivingLicenceNo" id="drivingLicenceNo"
									required="required" placeholder="Enter Licence No" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Referral Code</label> <select id="referralCode"
									name="referralCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Code</option>
									<option value="">A</option>
									<option value="">B</option>

								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Referral Name</label> <input type="text"
									name="referralName" id="referralName" required="required"
									placeholder="Enter Referral Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No</label> <input type="text"
									name="contactNo" id="contactNo" required="required"
									placeholder="Enter Contact No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Email id</label> <input type="text" name="emailId"
									id="emailId" required="required" placeholder="Enter Email id" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Profession</label> <input type="text"
									name="profession" id="profession" required="required"
									placeholder="Enter Profession" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Academic background</label> <input type="text"
									name="academicBackground" id="academicBackground"
									required="required" placeholder="Enter Academic background" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="shareValue">Share Value</label> <input type="text"
									name="shareValue" id="shareValue" value="10"
									required="required" placeholder="Share Value" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="noOfShare">No Of Share</label> <input type="text"
									name="noOfShare" id="noOfShare" required="required"
									placeholder="No Of Share" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="shareAmount">Share Amount</label> <input type="text"
									name="shareAmount" id="shareAmount" required="required"
									placeholder="Share Amount" readonly />
							</div>
						</div>




						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="lightBill">Light Bill</label> <input type="text"
									name="lightBill" id="lightBill" required="required"
									placeholder="Enter Light Bill No" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="taxBill">Tax Bill</label> <input type="text"
									name="taxBill" id="taxBill" required="required"
									placeholder="Enter Tax Bill No" />
							</div>
						</div>
					</div>

					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Aadhar
								Card </label> <label for="customerPhoto" id="drop-area"> <input
								type="file" accept="image/*" name="customerPhoto"
								id="customerPhoto" hidden="hidden" onchange="photopreview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="bike1imagePreview" />

								</div>
							</label>
						</div>

						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Pan
								Card </label> <label for="customerSignature" id="drop-area"> <input
								type="file" accept="image/*" name="customerSignature"
								id="customerSignature" hidden="hidden" onchange="signpreview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="bike2imagePreview" />

								</div>
							</label>
						</div>

						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Voter
								ID </label> <label for="customerVoter" id="drop-area"> <input
								type="file" accept="image/*" name="customerVoter"
								id="customerVoter" hidden="hidden" onchange="voterpreview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="bike3imagePreview" />

								</div>
							</label>
						</div>

						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Driving
								Licence </label> <label for="customerDriving" id="drop-area"> <input
								type="file" accept="image/*" name="customerDriving"
								id="customerDriving" hidden="hidden"
								onchange="drivingpreview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="bike4imagePreview" />

								</div>
							</label>
						</div>

					</div>




				</div>


				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Nominee Details</li>
						</ol>
					</nav>
					<div class="row">



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee Name </label> <input type="text"
									name="nomineeName" id="nomineeName" required="required"
									placeholder="Enter Customer Name" />
							</div>
						</div>

						<!-- Nominee Relation to Applicant -->
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee Relation to Applicant</label> <select
									id="nomineeRelationToApplicant"
									name="nomineeRelationToApplicant" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Relation to Applicant</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for=""> Nominee Age</label> <input type="text"
									name="nomineeAge" id="nomineeAge" required="required"
									placeholder="Enter Age" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="nomineeDOB"> Nominee DOB</label> <input type="date"
									name="nomineeDOB" id="nomineeDOB" required="required"
									placeholder="Enter DOB" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee Mobile No</label> <input type="text"
									name="nomineeMobileNo" id="nomineeMobileNo" required="required"
									placeholder="Enter Age" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="nomineeAddress" id="nomineeAddress"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">PAN No</label> <input type="text"
									name="nomineePanNo" id="nomineePanNo" required="required"
									placeholder="Enter PAN No" />
							</div>
						</div>


						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee Kyc No</label> <input type="text"
									name="nomineeKycNo" id="nomineeKycNo" required="required"
									placeholder="Enter PAN No" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee Kyc Type</label> <select type="text"
									class="form-control selectField" name="nomineeKycType"
									id="nomineeKycType" required="required" style="height: 30px;">
									<option>Select Type</option>
									<option>Aadhar Based eKYC</option>
									<option>Offline Aadhar KYC</option>
									<option>CKYC(Central KYC)</option>
									<option>Full KYC / Physical KYC</option>
									<option>Video KYC</option>
									<option>Digital KYC</option>
								</select>
							</div>
						</div>


					</div>

					<!-- Nominee Signature Upload -->
					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">
								Nominee Signature </label> <label for="nomineSignature" id="drop-area">
								<input type="file" accept="image/*" name="nomineSignature"
								id="nomineSignature" hidden="hidden"
								onchange="nomineeSignaturePreview();" />

								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="nomineeSignatureImg" />
								</div>
							</label>
						</div>


						<!-- Nominee Aadhar Upload -->
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">
								Nominee Aadhar </label> <label for="nomineAadhar" id="drop-area">
								<input type="file" accept="image/*" name="nomineAadhar"
								id="nomineAadhar" hidden="hidden"
								onchange="nomineeAadharPreview();" />

								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="nomineeAadharImg" />
								</div>
							</label>
						</div>
						
					</div>



				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Fees Details</li>
						</ol>
					</nav>
					<!-- Always Visible Fields -->
					<!-- Always Visible Fields -->
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>Member Fees</label> <input type="text" id="memberFees"
									name="memberFees" placeholder="Enter Fees" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>Building Fund</label> <input type="text"
									id="buildingFund" name="buildingFund"
									placeholder="Enter Building Fund" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>Admin Charge</label> <input type="text" id="adminCharge"
									name="adminCharge" placeholder="Enter Admin Charge" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label>Document Charge</label> <input type="text"
									id="documentCharge" name="documentCharge"
									placeholder="Enter Document Charge" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>Entry Fee</label> <input type="text" id="entryFee"
									name="entryFee" placeholder="Enter Entry Fee" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>Other Charge</label> <input type="text" id="otherCharge"
									name="otherCharge" placeholder="Enter Other Charge" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>Payment By</label> <select id="paymentBy"
									name="paymentBy" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select</option>
									<option value="cash">Cash</option>
									<option value="cheque">Cheque</option>
									<option value="neft">NEFT</option>
									<option value="online">Online</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label>Remarks</label> <input type="text" id="remarks"
									name="remarks" placeholder="Enter Remarks" />
							</div>
						</div>
					</div>

					<!-- Conditionally Displayed Fields -->
					<div class="row">
						<!-- Cheque No -->
						<div class="col-lg-3" id="chequeNoDiv" style="display: none;">
							<div class="d-flex flex-column formFields">
								<label>Cheque No</label> <input type="text" id="chequeNo"
									name="chequeNo" placeholder="Enter Cheque No" />
							</div>
						</div>

						<!-- Cheque Date -->
						<div class="col-lg-3" id="chequeDateDiv" style="display: none;">
							<div class="d-flex flex-column formFields">
								<label>Cheque Date</label> <input type="date" id="chequeDate"
									name="chequeDate" />
							</div>
						</div>

						<!-- Deposit A/C -->
						<div class="col-lg-3" id="depositAccountDiv"
							style="display: none;">
							<div class="d-flex flex-column formFields">
								<label>Deposit A/C</label> <select id="depositAccount"
									name="depositAccount" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select</option>
									<!-- options will be filled dynamically -->
								</select>
							</div>
						</div>

						<!-- Reference No -->
						<div class="col-lg-3 mb-4" id="refNoDiv" style="display: none;">
							<div class="d-flex flex-column formFields">
								<label>Reference No</label> <input type="text" id="referenceNo"
									name="referenceNo" placeholder="Enter Reference No" />
							</div>
						</div>
					</div>


					<div class="row">



						<div class="col-lg-3">
							<div class=" h-100">
								<div class="formFields d-flex flex-column">
									<label>Member Status</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-member-status"
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-member-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class=" h-100">
								<div class="formFields d-flex flex-column">
									<label>SMS Send</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-sms-status"
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-sms-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class=" h-100">
								<div class="formFields d-flex flex-column">
									<label>Mobile Banking</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-banking-status"
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-banking-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class=" h-100">
								<div class="formFields d-flex flex-column">
									<label>Net Banking</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-netbanking-status"
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-netbanking-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>


				</div>

				<div class="row">
					<div class="col-12 text-center">
						<button id="saveBtn" name="saveBtn" class="btnStyle bg-success">Save</button>
						<button id="" class="btnStyle" style="background-color: #FFA500;">Update</button>
						<button id="saveBtn" class="btnStyle bg-primary">Print</button>
					</div>
				</div>
			</form>

			<!-- SAVE & UPDATE BUTTONS END -->

			<!-- ================== TABLE START ================== -->
			<div class="mt-5">
				<nav>
					<ol class="breadcrumb breadcrumb-title">
						<li class="breadcrumb-item action">Customer List</li>
					</ol>
				</nav>

				<table class="table table-bordered table-striped">
					<thead style="background: #f0f0f0;">
						<tr>
							<th>#</th>
							<th>Customer Code</th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Aadhar</th>
							<th>District</th>
							<th>Branch Name</th>
							<th>DOB</th>
						</tr>
					</thead>
					<tbody id="customerTableBody">
						<!-- Dynamic rows will be added here -->
					</tbody>
				</table>
			</div>
			<!-- ================== TABLE END ================== -->




		</div>


	</main>
	<script src="./js/adminscript.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<script src="./js/customerManagement/addCustomer.js"></script>
	<script>
    document.getElementById("noOfShare").addEventListener("input", function () {
        let shareValue = parseFloat(document.getElementById("shareValue").value) || 0;
        let noOfShare = parseFloat(this.value) || 0;
        let shareAmount = shareValue * noOfShare;

        document.getElementById("shareAmount").value = shareAmount.toFixed(2); // show 2 decimals
    });
</script>
	<script>
	document.addEventListener('DOMContentLoaded', () => {
		const toggles = document.querySelectorAll('.toggle__input');

		toggles.forEach((toggle) => {
			// Initialize colors
			updateToggleColor(toggle);

			// console.log("updated toggle" , toggle)

			// Add change event listener
			toggle.addEventListener('change', () => {
				updateToggleColor(toggle);
				// console.log(${ toggle.dataset.toggleType } is now ${ toggle.checked });
			});
		});

		function updateToggleColor(input) {
			const label = input.nextElementSibling;
			if (input.checked) {
				label.style.backgroundColor = '#28a745'; // Green ON
			} else {
				label.style.backgroundColor = '#ccc'; // Gray OFF
			}
		}
	}); 
	
	</script>
	
	
	

</body>

</html>