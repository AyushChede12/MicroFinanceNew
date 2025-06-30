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
					<li class="breadcrumb-item"><a href="home"> 
						<i class="bi bi-cash-coin"></i>
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
							<!-- <div class="d-flex flex-column formFields" style="margin-bottom: 30px">
                <label>Verify With</label>
                <div class="position-relative">
                  <div class="select-btn1" style="cursor: pointer;">
                    <span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span> <i
                      class="fa-solid fa-angle-down"></i>
                  </div>
                  <div class="content" id="contentCityName" style="display: none;">
                    <div class="search">
                      <input type="text" id="city-search" class="m-0" placeholder="Search City" />
                    </div>
                    <ul class="options" id="city-options">
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                    </ul>
                  </div>
                </div>
              </div> -->
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Loan Date</label> <input type="date"
									name="dateloan" id="dateloan" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Find Members</label>
								<select id="findMember"
									name="findMember" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select member name</option>
									
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Relative Details</label> <input
									type="text" name="relativeDetail" id="relativeDetail" required="required"
									placeholder="Enter Relative Deatils"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Date of Birth </label> <input type="date"
									name="newloanApplicationDOB" id="newloanApplicationDOB" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Age </label> <input type="text" name="newApplictionAge"
									id="newApplictionAge" required="required" placeholder="Age" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No.</label> <input type="text"
									name="phoneNo" id="phoneNo" required="required"
									placeholder="Enter Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Notification Status</label> <input type="text"
									name="noficationStatus" id="noficationStatus" required="required"
									placeholder="Notification Status" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="newAplicationAddress" id="newAplicationAddress"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">Pin Code</label> <input type="number"
									name="newAppicationPinCode" id="newAppicationPinCode" required="required"
									placeholder="Enter Pin Code" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Branch Name</label> <select id="newApplicationBranchName"
									name="newApplicationBranchName" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Branch Name</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Code</label> <select id="newApplicationLoanCode"
									name="newApplicationLoanCode" required="required" onchange="getLoanByCode()"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Loan Plan Code</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Plan Name</label><input type="text" readonly="readonly"
									name="newApplicationLoanPlaneName" id="newApplicationLoanPlaneName" required="required"
									placeholder="Plan Duration" style="text-transform: uppercase;" /> 
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Type of Loan</label> <input type="text"
									name="newLoanTypeofloan" id="newLoanTypeofloan" required="required"
									placeholder="Type of Loan" style="text-transform: uppercase;" /> 
									
							</div>
						</div>


						

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Plan Duration</label> <input type="text"
									name="newApplicationDurationPlan" id="newApplicationDurationPlan" required="required"
									placeholder="Plan Duration" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Category</label> <input type="text"
									name="newLoanApplicationCategoryLoan" id="newLoanApplicationCategoryLoan" required="required"
									placeholder="Enter Loan Category" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Rate Of Interest(%)</label> <input type="text"
									name="newApplicationROI" id="newApplicationROI" required="required"
									placeholder="Enter Rate Of Interest" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Amount Of Loan </label> <input type="text"
									name="newApplicationLoanAmount" id="newApplicationLoanAmount" required="required"
									placeholder="Enter Amount Of Loan"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Interest Type</label> <input type="text"
									name="newApplicationTypeIntrest" id="newApplicationTypeIntrest" required="required"
									placeholder="Enter Interest Type" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">EMI Payment</label> <input type="text"
									name="newLoanApplicationPaymnetEMI" id="paymnetEMI5" required="required"
									placeholder="Enter EMI Payment"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Purpose of Loan </label> <input type="text"
									name="newApplicationLoanPurpose" id="newApplicationLoanPurpose" required="required"
									placeholder="Enter Purpose of Loan"
									style="text-transform: uppercase;" />
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
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Member ID</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="memberID5" name="memberID5" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Guarantor Identity</label> <input type="text"
									name="identifyGurantor5" id="identifyGurantor5" required="required"
									placeholder="Enter Guarantor Identity" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="gu-addres5" id="gu-addres5"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Pin Code</label> <input type="number"
									name="gupincode5" id="gupincode5" required="required"
									placeholder="Enter Pin Code" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Guarantor Contact No.</label> <input type="number" name="guarantorContactno5"
									id="guarantorContactno5" required="required"
									placeholder="Enter  Guarantor Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Security Type</label> <select id="guarantorSecurityType"
									name="guarantorSecurityType" required="required"
									class="form-control selectField" style="height: 30px;">
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
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Members ID</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Members ID</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="memberID5" name="memberID5" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Guarantor Identity</label> <input type="text"
									name="GuarantorIdentity5" id="GuarantorIdentity5" required="required"
									placeholder="Enter Guarantor Identity" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="adreesco-appliction" id="adreesco-appliction"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Pin Code</label> <input type="number"
									name="co-appicationPIncode" id="co-appicationPIncode" required="required"
									placeholder="Enter Pin Code" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Gurantor Contact No.</label> <input type="number" name="guarantorContactNo."
									id="guarantorContactNo." required="required"
									placeholder="Enter Gurantor Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Security Type</label> <select id="co-appictionSecurityType"
									name="co-appictionSecurityType" required="required"
									class="form-control selectField" style="height: 30px;">
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
							<!-- <div class="d-flex flex-column formFields" style="margin-bottom: 30px">
                <label>Verify With</label>
                <div class="position-relative">
                  <div class="select-btn1" style="cursor: pointer;">
                    <span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span> <i
                      class="fa-solid fa-angle-down"></i>
                  </div>
                  <div class="content" id="contentCityName" style="display: none;">
                    <div class="search">
                      <input type="text" id="city-search" class="m-0" placeholder="Search City" />
                    </div>
                    <ul class="options" id="city-options">
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                    </ul>
                  </div>
                </div>
              </div> -->
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Processing Fee(%) </label> <input type="text"
									name="deductionProcessingfee5" id="deductionProcessingfee5" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Legal Charges(%) </label> <input type="text"
									name="legakChargesDeduction" id="legakChargesDeduction" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Stamp Duty Fee(%)</label> <input type="text"
									name="stamDutyfee" id="stamDutyfee" required="required"
									placeholder="Enter Stamp Duty Fee"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">SMS Notification Fee(%)</label> <input type="date"
									name="smsNotificationfee" id="smsNotificationfee" required="required"
									placeholder="Enter SMS Notification Fee"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Service Charge </label> <input type="text"
									name="servicesCharges5" id=""servicesCharges5"" required="required"
									placeholder="Enter Service Charge" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Stationary Charger Fee(%)</label> <input type="text"
									name="stationaryChargesFree" id="stationaryChargesFree" required="required"
									placeholder="Enter Stationary Number Fee" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">SMS Notification</label> <input type="text"
									name="smsNotificationDeduction" id="smsNotificationDeduction" required="required"
									placeholder="SMS Notification" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">GST(%)</label> <input type="text" name="gst"
									id="gst" required="required" placeholder="Enter GST" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">Insurence Fee(%)</label> <input type="text"
									name="feeInsuranace" id="feeInsuranace" required="required"
									placeholder="Enter insurence fees"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Penalty Charge</label> <input type="text"
									name="panaltyCharges" id="panaltyCharges" required="required"
									placeholder="Enter Penalty Charge"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Fuel Charge/EMI</label> <input type="text"
									name="fuelChargesEmi" id="fuelChargesEmi" required="required"
									placeholder="Enter Fuel Charge"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Overdue Interest Charge</label> <input
									type="text" name="overdueIntrestCharge" id="overdueIntrestCharge" required="required"
									placeholder="Enter Interest Charge"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Collection Charge/EMI</label> <input
									type="number" name="collectionCharges" id="collectionCharges"
									required="required" placeholder="Enter Collection Charge"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4"
								style="margin-bottom: 30px">
								<label> Advisor Collector ID</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Member ID</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="advisorCollectorId" name="advisorCollectorId" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Advisor/Collector Full Name</label> <input
									type="text" name="collectorname" id="collectorname"
									required="required" placeholder="Enter Loan ROI"
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
	<script src="./js/LoanManagment/NewLoanApplicationjs.js"></script>
</body>

</html>

