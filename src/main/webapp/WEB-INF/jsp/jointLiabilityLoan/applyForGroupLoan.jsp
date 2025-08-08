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
					<li class="breadcrumb-item"><a href="home"><i
							class="bi bi-person-bounding-box"></i></a></li>
					<li class="breadcrumb-item action">Apply For Group Loan</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Data Search Panel</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="groupCode">Find by Group Code*</label> <select
									id="groupCode" name="groupCode" required
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
							<li class="breadcrumb-item action">Group Profile</li>
						</ol>
					</nav>
					<div class="col-lg-3" style="display: none;">
						<div class="d-flex flex-column formFields">
							<label>Selected Member*</label> <input type="hidden"
								id="selectedMember" name="selectedMember" class="form-control"
								required />
						</div>
					</div>

					<div class="col-lg-3" style="display: none;">
						<div class="d-flex flex-column formFields">
							<label>Customer Name*</label> <input type="hidden"
								id="customerName" name="customerName" class="form-control"
								required />
						</div>
					</div>

					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="openingDate">Opening Date*</label> <input
									type="date" name="openingDate" id="openingDate" required
									placeholder="Enter Opening Date"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="communityName">Community Name*</label> <input
									type="text" name="communityName" id="communityName" required
									placeholder="Enter Community Name" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="communityName">Community Address*</label> <input
									type="text" name="communityaddress" id="communityaddress" required
									placeholder="Enter Community Name" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="allocatedStaff">Allocated Staff*</label> <input
									type="text" name="allocatedStaff" id="allocatedStaff" required
									placeholder="Enter Allocated Staff" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="branchName">Branch Name*</label> <select
									id="branchName" name="branchName" required
									class="form-control selectField" style="height: 30px;"></select>
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="collectionDays">Scheduled Collection Days*</label> <input
									type="text" name="collectionDays" id="collectionDays" required
									placeholder="Enter Collection Days" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="communityLeader">Community Leader*</label> <input
									type="text" name="communityLeader" id="communityLeader"
									required placeholder="Enter Community Leader" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="contactNumber">Contact Number*</label> <input
									type="text" name="contactNumber" id="contactNumber" required
									placeholder="Enter Contact Number" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="loanPurpose">Purpose of Loan*</label> <input
									type="text" name="loanPurpose" id="loanPurpose" required
									placeholder="Enter Loan Purpose" />
							</div>
						</div>
					</div>
				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Financial Deductions</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields">
								<label for="planCode">Fetch by Plan Code*</label> <select
									id="planCode" name="planCode" required
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Plan Code</option>
								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="communityLeader">loan Scheme Name*</label> <input
									type="text" name="loanSchemeName" id="loanSchemeName"
									required placeholder="Enter Community Leader" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="processingFee">Processing Fee (%)*</label> <input
									type="text" name="processingFee" id="processingFee" required
									placeholder="Enter Processing Fee" />
							</div>
						</div>
						<div class="col-lg-3" style="display: none;">
							<div class="d-flex flex-column formFields">
								<label>Plan ID*</label> <input type="hidden" id="planCode"
									name="planCode" value="${memberCodePI}" class="form-control"
									required />
							</div>
						</div>


						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="legalCharges">Legal Charges (%)*</label> <input
									type="text" name="legalCharges" id="legalCharges" required
									placeholder="Enter Legal Charges" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="gstPercentage">GST(%)*</label> <input type="text"
									name="gstPercentage" id="gstPercentage" required
									placeholder="Enter GST" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="insuranceFee">Insurence.Fee(%)*</label> <input
									type="text" name="insuranceFee" id="insuranceFee" required
									placeholder="Enter Insurance Fee" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="valuationFee">Valuation Fee (%)*</label> <input
									type="text" name="valuationFee" id="valuationFee" required
									placeholder="Enter Valuation Fee" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="penaltyMode">Penalty Mode*</label> <input
									type="text" name="penaltyMode" id="penaltyMode" required
									placeholder="Enter Penalty Mode" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="monthlyPenalty">Monthly Penalty*</label> <input
									type="text" name="monthlyPenalty" id="monthlyPenalty" required
									placeholder="Enter Monthly Penalty" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="emiFrequency">EMI Frequency*</label> <input
									type="text" name="emiFrequency" id="emiFrequency" required
									placeholder="Enter EMI Frequency" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="rateOfInterest">Rate of Interest (% p.a.)*</label> <input
									type="text" name="rateOfInterest" id="rateOfInterest" required
									placeholder="Enter Rate of Interest" />
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
									id="totalAmount" required placeholder="Enter Term" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="interestType">Interest Type*</label> <select
									name="interestType" id="interestType" required
									class="form-control selectField" style="height: 30px;">

									<option value="">-- Select Interest Type --</option>
									<option value="flatInterest">Flat Interest</option>
									<option value="reducingInterest">Reducing Interest</option>
									<option value="Rule78">Rule 78</option>

								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="emiType">EMI mode*</label><select name="emiType"
									id="emiType" required class="form-control selectField">
									<option value="">-- Select EMI Mode --</option>
									<option value="daily">Daily</option>
									<option value="weekly">Weekly</option>
									<option value="monthly">Monthly</option>
									<option value="fortnightly">Fortnightly</option>
									<option value="quarterly">Quarterly</option>
								</select>

							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Date of Approval*</label> <input
									type="date" name="approvalDate" id="approvalDate"
									required="required" placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="approvalStatus">Approval Status</label> <input
									type="text" id="approvalStatus" name="approvalStatus"
									value="Not Approved" class="form-control" readonly />
							</div>
						</div>

					</div>

					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" name="saveBtn" class="btnStyle bg-success"
								style="margin-left: 80%">Save</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">
					<div class="card-body table-responsive">
						<h5 class="card-title">Details Search List</h5>
						<table class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>Group ID</th>
									<th>Plan Name</th>
									<th>Customer Name</th>
									<th>Selected Member</th>
									<th>Emi Type</th>
									<th>Contact No</th>
									<th>Allocated Staff</th>





								</tr>
							</thead>
							<tbody id="groupLoanBody">


								<!-- More rows -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="./js/adminscript.js"></script>
	<script src="./js/Joinlibiliy/ApplyForGroupLoan.js"></script>
</body>

</html>
