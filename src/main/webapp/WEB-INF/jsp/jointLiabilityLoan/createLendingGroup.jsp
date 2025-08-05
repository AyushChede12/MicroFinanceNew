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
							class="bi bi-person-bounding-box"></i>

					</a></li>
					<li class="breadcrumb-item action">Create Lending Group</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="LendingIdForm">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Plan Details</li>
						</ol>
					</nav>
					<div class="row">

						<div class="d-none">
							<input type="hidden" name="id" id="id" required="required"
								placeholder="Enter Plan id" style="text-transform: uppercase;" />
						</div>


						<div class="col-lg-3" style="display: none;">
							<div class="d-flex flex-column formFields">
								<label>Plan ID*</label> <input type="hidden" id="planCode"
									name="planCode" value="${memberCodePI}" class="form-control"
									required />
							</div>
						</div>


						<div class="row">
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mb-4">
									<label for="loanSchemeInformation"> Loan Scheme
										Information </label> <input type="text" name="loanSchemeInformation"
										id="loanSchemeInformation" required
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
										type="text" name="term"
										id="term" required placeholder="Enter Term" />
								</div>
							</div>
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mb-4">
									<label for="minLoanDurationMonths">Total Amount* </label> <input
										type="text" name="totalAmount"
										id="totalAmount" required placeholder="Enter totalAmount" />
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
									<label for="minLoanAmount"> Min Loan Amt* </label> <input
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
										name="interestType" id="interestType" required class="form-control selectField" style="height: 30px;">
										
										<option value="">-- Select Interest Type --</option>
										<option value="Flat Interest">Flat Interest</option>
										<option value="Reducing Interest">Reducing Interest</option>
										<option value="Rule 78">Rule 78</option>
										
									</select>
								</div>
							</div>

							

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="securityType">Security Type*</label> <input
										type="text" name="securityType" id="securityType" required
										placeholder="Enter Security Type" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="emiType">EMI mode*</label><select name="emiType"
										id="emiType" required class="form-control selectField" style="height: 30px;">
										<option value="">-- Select EMI Mode --</option>
										<option value="Daily">Daily</option>
										<option value="Weekly">Weekly</option>
										<option value="Monthly">Monthly</option>
										<option value="Fortnightly">Fortnightly</option>
										<option value="Quarterly">Quarterly</option>
									</select>

								</div>
							</div>

							<div class="col-lg-3">
								<div
									class="h-100 d-flex justify-content-start align-items-center">
									<div
										class="d-flex justify-content-start align-items-center  formFields">
										<label style="margin-left: 20px;" class="mb-2"> Plan
											Activation Status*</label>
										<div class="cont">
											<div class="toggle">
												<input type="checkbox" id="planActivationStatus"
													name="planActivationStatus" class="toggle__input"
													data-toggle-type="member-status"> <label
													for="planActivationStatus" class="toggle__label"></label>
											</div>
										</div>
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
										<label for="processingFeePercent"> Processing Fee (%)*
										</label> <input type="text" name="processingFeePercent"
											id="processingFeePercent" required placeholder="Enter Fee" />
									</div>
								</div>

								<div class="col-lg-3">
									<div class="d-flex flex-column formFields">
										<label for="legalChargesPercent"> Legal Charges (%)* </label>
										<input type="text" name="legalChargesPercent"
											id="legalChargesPercent" required placeholder="Enter Charges" />
									</div>
								</div>

								<div class="col-lg-3">
									<div class="d-flex flex-column formFields">
										<label for="gstPercent"> GST(%)* </label> <input type="text"
											name="gstPercent" id="gstPercent" required
											placeholder="Enter GST" />
									</div>
								</div>

								<div class="col-lg-3">
									<div class="d-flex flex-column formFields">
										<label for="insuranceFeePercent"> Insurence.Fee(%)* </label> <input
											type="text" name="insuranceFeePercent"
											id="insuranceFeePercent" required
											placeholder="Enter Insurance Fee" />
									</div>
								</div>

								<div class="col-lg-3">
									<div class="d-flex flex-column formFields">
										<label for="valuationFeePercent"> Valuation Fee (%) *
										</label> <input type="text" name="valuationFeePercent"
											id="valuationFeePercent" required
											placeholder="Enter Valuation Fee" />
									</div>
								</div>
							</div>
						</div>

						<!-- Late Fee Information -->
						<div class="mt-5">
							<nav>
								<ol class="breadcrumb breadcrumb-title">
									<li class="breadcrumb-item action">Late Fee Information</li>
								</ol>
							</nav>

							<div class="row">
								<div class="col-lg-3">
									<div class="d-flex flex-column formFields">
										<label for="lateAllowanceDays">Late Allowance Days*</label> <input
											type="text" name="lateAllowanceDays" id="lateAllowanceDays"
											required placeholder="Enter Days" />
									</div>
								</div>

								<div class="col-lg-3 ">
									<div class="d-flex flex-column formFields ">
										<label for="penaltyMode">Penalty Mode*</label> <input
											type="text" name="penaltyMode" id="penaltyMode" required
											placeholder="Enter Penalty Mode" />
									</div>
								</div>

								<div class="col-lg-3">
									<div class="d-flex flex-column formFields ">
										<label for="monthlyPenalty">Monthly Penalty*</label> <input
											type="text" name="monthlyPenalty" id="monthlyPenalty"
											required placeholder="Enter Penalty" />
									</div>
								</div>
							</div>

							<div class="row">
								<div class="row justify-content-center mt-4">
									<div class="col-lg-4 d-flex justify-content-around">
										<button type="button" id="savelendingBtn"
											class="btnStyle bg-success">Save</button>
										<button type="button" id="updatelendingBtn"
											name="updatelendingBtn" class="btnStyle bg-primary">Update</button>

									</div>
								</div>
							</div>
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
										<th>EMI Type</th>
										<th>EMI Frequency</th>
										<th>Plan Status</th>
										<!-- Payment Deductions -->
										<th>Processing Fee</th>
										<th>Legal Charges</th>
										<th>GST</th>
										<th>Insurance Fee</th>
										<th>Valuation Fee</th>
										<!-- Late Fee Info -->
										<th>Late Days</th>
										<th>Penalty Mode</th>
										<th>Monthly Penalty</th>
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