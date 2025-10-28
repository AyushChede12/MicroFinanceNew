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
							class="bi bi-cash-coin"></i>
					</a></li>
					<li class="breadcrumb-item action">Create Lending Group</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Plan Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">


							<input type="hidden" id="planCode" name="planCode"
								value="${memberCodePI}" />

							<div class="d-flex flex-column formFields mb-4">
								<label for="loanSchemeInformation"> Loan Scheme
									Name </label> <input type="text" name="loanSchemeName"
									id="loanSchemeName" required
									placeholder="Enter Loan Scheme" />
							</div>

						</div>
						

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="minimumAge"> Minimum Age* </label> <input
									type="text" name="minimumAge" id="minimumAge" required
									placeholder="Enter Minimum Age" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="maximumAge"> Maximum Age* </label> <input
									type="text" name="maximumAge" id="maximumAge" required
									placeholder="Enter Maximum Age" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="minLoanDurationMonths">Term * </label> <input
									type="text" name="term" id="term" required
									placeholder="Enter Term" />
							</div>
						</div>


						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields">
								<label for="branchName">Branch Name</label> <select
									id="branchName" name="branchName" required
									class="form-control selectField" style="height: 30px;">

								</select>
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="emiFrequency">EMI Frequency*</label> <input
									type="text" name="emiFrequency" id="emiFrequency" required
									placeholder="Enter EMI Frequency" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="minLoanAmount"> Minimum Loan Amount* </label> <input
									type="text" name="minLoanAmt" id="minLoanAmt" required
									placeholder="Enter Amount" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="maximumLoanAmount"> Maximum Loan Amount* </label> <input
									type="text" name="maximumLoanAmount" id="maximumLoanAmount"
									required placeholder="Enter Max Loan" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="rateOfInterest"> Rate of Interest (% p.a.)*
								</label> <input type="text" name="rateOfInterest" id="rateOfInterest"
									required placeholder="Enter ROI" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="interestType">Interest Type*</label> <select
									name="interestType" id="interestType" required
									class="form-control selectField" style="height: 30px;">

									<option value="">-- Select Interest Type --</option>
									<option value="Flat Interest">Flat Interest</option>
									<option value="Reducing Interest">Reducing Interest</option>
									<option value="Rule 78">Rule 78</option>

								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="emiType">EMI mode*</label><select name="emiType"
									id="emiType" required class="form-control selectField"
									style="height: 30px;">
									<option value="">-- Select EMI Mode --</option>
									<option value="Daily">Daily</option>
									<option value="Weekly">Weekly</option>
									<option value="Monthly">Monthly</option>
									<option value="Fortnightly">Fortnightly</option>
									<option value="Quarterly">Quarterly</option>
								</select>

							</div>
						</div>

					</div>
				</div>

				<!-- Payment Deductions Section -->
				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Payment Deductions</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Processing Fee(%) </label> <input type="text"
									name="processingFeePercent" id="processingFeePercent" required="required"
									placeholder="Enter Processing Fee" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for=""> Legal Charges(%)</label> <input type="text"
									name="legalChargesPercent" id="legalChargesPercent" required="required"
									placeholder="Enter Legal Charges" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">GST(%)</label> <input type="text" name="gstPercent"
									id="gstPercent" required="required" placeholder="Enter GST" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Insurence Fee(%)</label> <input type="text"
									name="insuranceFeePercent" id="insuranceFeePercent" required="required"
									placeholder="Enter Insurance Fee" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Valuation Fee(%) </label> <input type="text"
									name="valuationFeePercent" id="valuationFeePercent" required="required"
									placeholder="Enter Valuation Fee" />
							</div>
						</div>

					</div>
				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Late Fine Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Late Allowance Days</label> <input type="text"
									name="lateAllowanceday" id="lateAllowanceDays"
									required="required" placeholder="Enter Late Allowance Days" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">penalty mode</label> <select id="penaltyMode"
									name="penaltyMode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Penalty Type</option>
									<option value="Percentage">Percentage</option>
									<option value="Amount">Amount</option>
								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for=""> Monthly Penalty </label> <input type="text"
									name="monthlyPenalty" id="monthlyPenalty" required="required"
									placeholder="" />
							</div>
						</div>
					</div>


				</div>
				<input type="hidden" id="loanId" value="" />
				<div class="row">
					<div class="col-12 text-center">
						<button id="saveBtn" class="btnStyle bg-success">Save</button>


						<button id="updatelendingBtn" class="updatelendingBtn"
							style="background-color: #FFA500;">Update</button>

					</div>
				</div>
			</form>


			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">

						<div class="card-body table-responsive">
							<h5 class="card-title">
								Recent Sales <span>| Today</span>
							</h5>

							<table class="table table-borderless datatable overflow-scroll">

								<h5>Lending Group List</h5>

								<thead>
									<tr>
										<th>Plan ID</th>
										<th>Loan Scheme</th>
										<th>Branch</th>
										<th>ROI (%)</th>
										<th>ROI Type</th>
										<th>Processing Fee</th>
										<th>Legal Charges</th>
										<th>GST</th>
										<th>Insurance Fee</th>
										<th>Valuation Fee</th>
										<th>Actions</th>
									</tr>
								</thead>

								<tbody id="LendingBody">
									<!-- Rows will be populated dynamically using JSTL or JavaScript -->
								</tbody>

							</table>
						</div>
					</div>
				</div>
			</div>

		</div>


	</main>
	<script src="./js/adminscript.js"></script>
	<script src="./js/Joinlibiliy/CreateLendingGroup.js"></script>

</body>
</html>