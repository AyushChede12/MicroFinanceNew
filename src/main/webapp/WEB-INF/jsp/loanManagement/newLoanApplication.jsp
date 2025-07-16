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
			<h1>Loan Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-cash-coin"></i>
					</a></li>
					<li class="breadcrumb-item action">New Loan Application</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">New Loan Details</li>
						</ol>
					</nav>
					<div class="row">
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
								<label>Find Members</label> <select id="memberId"
									name="memberId" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select member name</option>

								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Relative Details</label> <input
									type="text" name="relativeDetails" id="relativeDetails"
									required="required" placeholder="Enter Relative Deatils"
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
								<label for="">Branch Name</label> <select id="branchName"
									name="branchName" required="required"
									class="form-control selectField" style="height: 30px;">

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Loan Plan Name</label> <select id="loanPlanName"
									name="loanPlanName" required="required"
									class="form-control selectField" style="height: 30px;">
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
								<label for="">Loan Category</label> <input type="text"
									name="loanCategory" id="loanCategory" required="required"
									placeholder="Enter Loan Category"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Plan Duration</label> <input type="text"
									name="planDuration" id="planDuration" required="required"
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
									<label style="margin-left: 20px;" class="mb-2">Message
										Status</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="messageStatus"
												name="messageStatus" class="toggle__input"
												data-toggle-type="member-status"> <label
												for="toggle-member-status1" class="toggle__label"></label>
										</div>
									</div>
								</div>
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
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label> Member ID </label>
								<div class="position-relative">
									<select id="guarantorMemberId" name="guarantorMemberId"
										required="required" class="form-control selectField"
										style="height: 30px;">
										<option value="">Select member Code</option>

									</select>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Guarantor Identity</label> <input type="text"
									name="guarantorIdentity" id="guarantorIdentity"
									required="required" placeholder="Enter Guarantor Identity" />
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
								<label for="">Guarantor Contact No.</label> <input type="number"
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
									<option value="">Select Loan Type</option>
									<option value="Blue">Blue</option>
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
							<div class="d-flex flex-column formFields">
								<label for="">Member Id</label> <input type="number"
									name="coApplicantMemberId" id="coApplicantMemberId"
									required="required" placeholder="Enter  Guarantor Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Guarantor Identity</label> <input type="text"
									name="coApplicantIdentity" id="coApplicantIdentity"
									required="required" placeholder="Enter Guarantor Identity" />
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
								<label for="">Pin Code</label> <input type="number"
									name="coApplicantPinCode" id="coApplicantPinCode"
									required="required" placeholder="Enter Pin Code" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Gurantor Contact No.</label> <input type="number"
									name="coApplicantContactNo" id="coApplicantContactNo"
									required="required" placeholder="Enter Gurantor Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Security Type</label> <select
									id="coApplicantSecurityType" name="coApplicantSecurityType"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Loan Type</option>
									<option value="Blue">Blue</option>
								</select>
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
								<label for="loanName">Legal Charges(%) </label> <input
									type="text" name="legalCharges" id="legalCharges"
									required="required" style="text-transform: uppercase;" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Building Fund</label> <input type="text"
									name="buildingFund" id="buildingFund" required="required"
									placeholder="Enter Stamp Duty Fee"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">Insurence Fee(%)</label> <input
									type="text" name="insuranceFee" id="insuranceFee"
									required="required" placeholder="Enter insurence fees"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Overdue Interest Charge</label> <input
									type="text" name="overdueInterestCharge"
									id="overdueInterestCharge" required="required"
									placeholder="Enter Interest Charge"
									style="text-transform: uppercase;" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Stationary Charger Fee(%)</label> <input
									type="text" name="stationaryFee" id="stationaryFee"
									required="required" placeholder="Enter Stationary Number Fee" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4"
								style="margin-bottom: 30px">
								<label> Advisor Collector ID</label>
								<div class="position-relative">
									<select id="advisorCollectorId" name="advisorCollectorId"
										required="required" class="form-control selectField"
										style="height: 30px;">
										<option value="">Select Advisor ID</option>

									</select>



								</div>
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Advisor/Collector Full Name</label> <input
									type="text" name="advisorCollectorName"
									id="advisorCollectorName" required="required"
									placeholder="Enter Loan ROI" style="text-transform: uppercase;" />
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
	<script src="./js/LoanManagment/NewLoanApplicationjs.js"></script>
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

</html>

