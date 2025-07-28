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

<!-- jQuery CDN (latest 3.x version) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
			<h1>Data Correction</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-pencil-square"></i>
					</a></li>
					<li class="breadcrumb-item action">Loan Account Correction</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<nav>
					<ol class="breadcrumb breadcrumb-title">
						<li class="breadcrumb-item action">Search Details</li>
					</ol>
				</nav>
				<div class="row">
					<div class="col-lg-5">
					<input type="hidden" name="id" id="id">
						<div class="d-flex flex-column formFields"
							style="margin-bottom: 20px;">
							<label for="loanId">Select Loan ID</label> <select id="loanId"
								name="loanId" required="required"
								class="form-control selectField" style="height: 30px;">
							</select>
						</div>
					</div>

				</div>
				<hr>
		</div>




		<div>
			<nav>
				<ol class="breadcrumb breadcrumb-title">
					<li class="breadcrumb-item action">Loan Details</li>
				</ol>
			</nav>
			<div class="row">
				<div class="col-lg-3">
					<div class="d-flex flex-column formFields"
						style="margin-bottom: 20px;">
						<label for="loanDate">Loan Date</label> <input type="date"
							name="loanDate" id="loanDate" required="required"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="memberId">Search Customer</label> <select id="memberId"
							name="memberId" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Customer Name</option>

						</select>
					</div>
				</div>

				<div class="col-lg-3">

					<div class="d-flex flex-column formFields">
						<label for="relativeDetails">Relative Details</label> <input type="text"
							name="relativeDetails" id="relativeDetails" required="required"
							placeholder="Enter Relative Name & Relation"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields"
						style="margin-bottom: 30px">
						<label>Date of Birth </label> <input type="date" name="dateOfBirth"
							id="dateOfBirth" required="required"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields"
						style="margin-bottom: 30px">
						<label>Age</label> <input type="text" name="age"
							id="age" required="required" placeholder="Enter Age"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="contactNo">Contact No</label> <input type="text" name="contactNo"
							id="contactNo" required="required" placeholder="Enter Contact No" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="address">Address</label>
						<textarea name="address" id="address"
							style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields"
						style="margin-bottom: 30px">
						<label>Pin Code</label> <input type="text" name="pinCode" id="pinCode"
							required="required" placeholder="Enter Pincode" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="branchName">Branch Name</label> <select id="branchName"
							name="branchName" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Branch</option>
							<option value="Blue">Umrer</option>
							<option value="Blue">Reshimbaag</option>

						</select>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="loanPlanName">Loan Policy Name</label> <select id="loanPlanName"
							name="loanPlanName" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Loan Policy Name</option>
							<option value="Home Loan">Home Loan</option>
							<option value="Vehicle Loan">Vehicle Loan</option>
							<option value="Bharti">Bharti</option>

						</select>
					</div>
				</div>

				<div class="col-lg-3">

					<div class="d-flex flex-column formFields">
						<label for="typeOfLoan">Type of Loan</label> <input type="text"
							name="typeOfLoan" id="typeOfLoan" required="required"
							placeholder="Enter Type of Loan"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields"
						style="margin-bottom: 30px;">
						<label for="loanMode">Loan Mode</label> <input type="text"
							name="loanMode" id="loanMode" required="required"
							placeholder="Enter Loan Mode" style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="loanTerm">Loan Term</label> <input type="text"
							name="loanTerm" id="loanTerm" required="required"
							placeholder="Enter Loan term" style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="rateOfInterest">Interest Rate</label> <input type="text"
							name="rateOfInterest" id="rateOfInterest" required="required"
							placeholder="Enter Interest Rate"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="loanAmount">Loan Amount</label> <input type="text"
							name="loanAmount" id="loanAmount" required="required"
							placeholder="Enter Loan Amount"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields"
						style="margin-bottom: 30px;">
						<label for="interestType">Type Of Interest</label> <input type="text"
							name="interestType" id="interestType" required="required"
							placeholder="Enter Interest Type"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="emiPayment">EMI Payment</label> <input type="text"
							name="emiPayment" id="emiPayment" required="required"
							placeholder="Enter EMI Payment"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="purposeOfLoan">Purpose Of Loan</label> <input type="text"
							name="purposeOfLoan" id="purposeOfLoan" required="required"
							placeholder="Enter Purpose Of Loan"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class=" h-100 d-flex justify-content-start align-items-center"
						style="margin-bottom: 30px;">
						<div
							class="d-flex justify-content-start align-items-center  formFields">
							<label style="margin-left: 20px;" class="mb-2">SMS Send</label>
							<div class="cont">
								<div class="toggle">
									<input type="checkbox" id="toggle-sms-send" name="smsSend"
										class="toggle__input" data-toggle-type="sms-send"> <label
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
						style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">
						Photo</label> <label for="bike1image" id="drop-area"> <input
						type="file" accept="image/*" name="bike1image" id="bike1image"
						hidden="hidden" onchange="bike1Preview();"
						style="background-size: cover; background-repeat: no-repeat" />
						<div id="img-view">
							<img src="../images/upload/upload.png" alt="upload_icon"
								id="bike1imagePreview" />
							<!-- <p id="upload-text"
                                style="font-size: 12px; margin-top: 15px"
                                class="text-muted"
                              >
                                Drag and drop or Choose File to upload the image
                              </p> -->
						</div>
					</label>
				</div>

				<div class="col-lg-3 mb-5">
					<label for=""
						style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">
						Signature</label> <label for="bike1image" id="drop-area"> <input
						type="file" accept="image/*" name="bike1image" id="bike1image"
						hidden="hidden" onchange="bike1Preview();"
						style="background-size: cover; background-repeat: no-repeat" />
						<div id="img-view">
							<img src="../images/upload/upload.png" alt="upload_icon"
								id="bike1imagePreview" />
							<!-- <p id="upload-text"
                                style="font-size: 12px; margin-top: 15px"
                                class="text-muted"
                              >
                                Drag and drop or Choose File to upload the image
                              </p> -->
						</div>
					</label>
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
						<label>Customer Code</label> <select id="guarantorMemberId" name="guarantorMemberId"
							required="required" class="form-control selectField"
							style="height: 30px;">

						</select>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="guarantorIdentity">Loan Guarantor</label> <input type="text"
							name="guarantorIdentity" id="guarantorIdentity" required="required"
							placeholder="Enter Name" style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields"
						style="margin-bottom: 30px">
						<label>Guarantor Address</label> <input type="text" name="guarantorAddress"
							id="guarantorAddress" required="required" placeholder="Enter Address"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="guarantorPinCode">Pin Code </label> <input type="text" name="guarantorPinCode"
							id="guarantorPinCode" required="required" placeholder="Enter Pin Code" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="guarantorContactNo">Contact No. </label> <input type="text"
							name="guarantorContactNo" id="guarantorContactNo" required="required"
							placeholder="Enter Contact No." />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="guarantorSecurityType">Authentication Type </label> <select id="guarantorSecurityType"
							name="guarantorSecurityType" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select</option>
							<option value="Blue">124500</option>
							<option value="Blue">12450</option>

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
						<label>Customer Code</label> <select id="coApplicantMemberId" name="coApplicantMemberId"
							required="required" class="form-control selectField"
							style="height: 30px;">

						</select>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="coApplicantIdentity">Name</label> <input type="text"
							name="coApplicantIdentity" id="coApplicantIdentity" required="required"
							placeholder="Enter Name" style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields"
						style="margin-bottom: 30px">
						<label>Co-Applicant Address</label> <input type="text" name="coApplicantAddress"
							id="coApplicantAddress" required="required" placeholder="Enter Address"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="coApplicantPinCode">Pin Code </label> <input type="text" name="coApplicantPinCode"
							id="coApplicantPinCode" required="required" placeholder="Enter Pin Code" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="coApplicantContactNo">Phone </label> <input type="text" name="coApplicantContactNo"
							id="coApplicantContactNo" required="required" placeholder="Enter Phone" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="coApplicantSecurityType">Authentication Details </label> <input type="text"
							name="coApplicantSecurityType" id="coApplicantSecurityType" required="required"
							placeholder="Enter Authentication Details " />
					</div>
				</div>
			</div>

		</div>

		<div class="mt-5">
			<nav>
				<ol class="breadcrumb breadcrumb-title">
					<li class="breadcrumb-item action">Deduction Details</li>
				</ol>
			</nav>
			<div class="row">
				<div class="col-lg-3">
					<div class="d-flex flex-column formFields"
						style="margin-bottom: 30px">
						<label>Processing Charge</label> <input type="text"
							name="processingFee" id="processingFee" required="required"
							placeholder="Enter Charges" style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="legalCharges">Legal Amount</label> <input type="text"
							name="legalCharges" id="legalCharges" required="required"
							placeholder="Enter Legal Amount"
							style="text-transform: uppercase;" />
					</div>
				</div>
				
				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="gst">GST </label> <input type="text" name="gst"
							id="gst" required="required" placeholder="Enter GST" />
					</div>
				</div>
				
				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="insuranceFee">Insurance Amount </label> <input type="text"
							name="insuranceFee" id="insuranceFee" required="required"
							placeholder="Enter Insurance Amount" />
					</div>
				</div>
				
				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="valuationFees">Valuation Fee </label> <input type="text"
							name="valuationFees" id="valuationFees" required="required"
							placeholder="Enter Valuation Fee" />
					</div>
				</div>
				
				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="stationaryFee">Stationary Charge </label> <input type="text"
							name="stationaryFee" id="stationaryFee" required="required"
							placeholder="Enter Insurance Amount" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields"
						style="margin-bottom: 30px">
						<label>Financial Consultant Code</label> <input type="text"
							name="financialConsultantId" id="financialConsultantId" required="required"
							placeholder="Enter Financial Consultant Code"
							style="text-transform: uppercase;" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="financialConsultantName">Financial Consultant Name </label> <input
							type="text" name="financialConsultantName" id="financialConsultantName" required="required"
							placeholder="Enter Financial Consultant Name" />
					</div>
				</div>

			</div>

		</div>

		<div class="mt-5">
			<div class="row">
				<div class="col-12 text-center" style="margin-top: 30px;">
					<button type="button" id="updateBtn" class="btnStyle bg-warning">Update</button>
					<button type="button" id="newBtn" class="btnStyle bg-primary"
						style="background-color: #FFA500;">New</button>
					<button type="button" id="deleteBtn" class="btnStyle bg-danger">Delete</button>
				</div>
			</div>
		</div>
		</form>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/dataCorrection/loanAccount.js"></script>

</body>

</html>