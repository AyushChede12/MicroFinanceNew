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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">

<style>
table {
	width: 100%;
	border-collapse: collapse;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	font-size: 14px;
	margin-top: 20px;
}

th, td {
	border: 1px solid #dee2e6;
	padding: 10px 12px;
	text-align: center;
	vertical-align: middle;
}

th {
	background-color: #f8f9fa;
	font-weight: bold;
	color: #343a40;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #e9ecef;
	cursor: pointer;
}

.table-wrapper {
	overflow-x: auto;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	margin-bottom: 30px;
}

table thead {
	position: sticky;
	top: 0;
	z-index: 1;
}
</style>
<style>
.table-wrapper {
	width: 100%;
	overflow-x: auto;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	font-family: 'Segoe UI', sans-serif;
	font-size: 14px;
	min-width: 1200px; /* Force minimum width so columns look even */
}

thead {
	background: linear-gradient(to right, #7b2ff7, #f107a3);
	color: white;
	text-align: center;
}

th, td {
	border: 1px solid #dee2e6;
	padding: 10px 14px;
	text-align: center;
}

tbody tr:nth-child(even) {
	background-color: #f8f9fa;
}

tbody tr:hover {
	background-color: #e2e6ea;
	cursor: default;
}

th {
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

td {
	color: #333;
	white-space: nowrap;
}
</style>




<title>Admin Dashboard</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>

</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Policy Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-piggy-bank"></i>
					</a></li>
					<li class="breadcrumb-item action">Plan Management</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Daily Deposit</li>
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
								<label for="">Plan Code *</label> <input type="text"
									name="planCode" id="planCode" required="required"
									placeholder="Enter Plan Code" value="${memberCodeDD}"
									readonly="readonly" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields  mb-4 ">
								<label for="vehicalNo">Plan Name*</label> <input type="text"
									name="planNameDD" id="planNameDD" required="required"
									placeholder="Enter Plan Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields  mb-4">
								<label for="vehicalNo">Minimum Deposit*</label> <input
									type="text" name="minimumDeposit" id="minimumDeposit"
									required="required" placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields  mb-4">
								<label for="vehicalNo">Rate of Interest (%)*</label> <input
									type="text" name="rateOfInterest" id="rateOfInterest"
									required="required" placeholder="Enter Interest Rate"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Installment Type*</label> <select
									id="installmentType" name="installmentType" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Installment Type</option>
									<option value="Cash">Cash</option>
									<option value="Cheque">Cheque</option>
									<option value="Online">Online</option>
									<option value="UPI">UPI</option>

								</select>
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Duration*</label> <input type="text"
									name="duration" id="duration" required="required"
									placeholder="Enter Duration" />
							</div>
						</div>
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Term Mode</label> <select id="termModeDD"
									name="termModeDD" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Term Mode</option>
									<option value="">Select Term Mode</option>
									<option value="Monthly">Monthly</option>
									<option value="Quarterly">Quarterly</option>
									<option value="Half-Yearly">Half-Yearly</option>
									<option value="Yearly">Yearly</option>

								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Term*</label> <input type="text" name="termDD"
									id="termDD" required="required" placeholder="Enter Term" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Commission on New*</label> <input type="text"
									name="commissionOnNew" id="commissionOnNew" required="required"
									placeholder="Enter Commission on New" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Renewal Commission (%)*</label> <input type="text"
									name="renewalCommission" id="renewalCommission"
									required="required" placeholder="Enter Renewal Commission" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Interest Interval*</label> <select
									id="interestInterval" name="interestInterval"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Interest Interval</option>
									<option value="Monthly">Monthly</option>
									<option value="Quarterly">Quarterly</option>
									<option value="Half-Yearly">Half-Yearly</option>
									<option value="Yearly">Yearly</option>
									<option value="On Maturity">On Maturity</option>

								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Total Paid</label> <input type="text"
									name="totalPaid" id="totalPaid" required="required"
									placeholder="Enter Total Paid" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount*</label> <input type="text"
									name="maturityAmount" id="maturityAmount" required="required"
									placeholder="Enter Maturity Amount" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Is Flexible Plan?</label> <select
									id="flexiblePlan" name="flexiblePlan" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Flexible Plan</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>

								</select>
							</div>
						</div>





						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Grace Days*</label> <input type="text"
									name="graceDays" id="graceDays" required="required"
									placeholder="Enter Grace Days" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Penalty Rate (%)*</label> <input type="text"
									name="penaltyRate" id="penaltyRate" required="required"
									placeholder="Enter Penalty Rate" />
							</div>
						</div>

						<div class="col-lg-3">
							<div
								class=" h-100 d-flex justify-content-start align-items-center">
								<div
									class="d-flex justify-content-start align-items-center  formFields">
									<label style="margin-left: 20px;" class="mb-2">Status
										plan</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="statusOfPlan" name="statusOfPlan"
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-member-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="row" style="margin-left: 80%;">
						<div class="col-12 text-center">
							<button id="genrateBtn" class="btnStyle bg-danger">Generate</button>
							<button id="saveBtn" class="btnStyle bg-warning ">Save</button>
							<button id="updateBtn" class="btnStyle bg-warning style="display:none;">Update</button>

						</div>
					</div>

					<div class="row mt-5">
						<div class="col-12">
							<div class="card recent-sales">

								<div class="card-body table-responsive">
									<h5 class="card-title">
										Recent Sales <span>| Today</span>
									</h5>

									<table class="table table-bordered">
										<thead class="table-light">
											<tr>
												<th>Plan Code</th>
												<th>Plan Name</th>
												<th>Minimum Deposit</th>
												<th>Rate Of Interest</th>
												<th>Installment Type</th>
												<th>Term Mode</th>
												<th>Term</th>

												<th>Duration</th>
												<th>Commission On New</th>
												<th>Renewal Commission</th>
												<th>Interest Interval</th>
												<th>Total Paid</th>
												<th>Maturity Amount</th>
												<th>Flexible Plan</th>
												<th>Grace Days</th>
												<th>Penalty Rate</th>
												<th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody id="depositTableBody">
											<!-- Dynamic rows will be injected here -->
										</tbody>
									</table>


								</div>
							</div>
						</div>
					</div>
			</form>
		</div>


		<div>
			<form id="recurringformid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Recurring Deposit</li>
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
							<div class="d-flex flex-column formFields">
								<label for="">Plan Code*</label> <input type="text"
									name="planCodeRD" id="planCodeRD" required="required"
									placeholder="Enter Plan Code" value="${memberCodeRD}"
									readonly="readonly" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields  mb-4 ">
								<label for="vehicalNo">Plan Name*</label> <input type="text"
									name="planNameRD" id="planNameRD" required="required"
									placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Minimum Amount*</label> <input
									type="text" name="minimumAmountRD" id="minimumAmountRD"
									required="required" placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Interest Rate(%)*</label> <input
									type="text" name="rateOfInterestRD" id="rateOfInterestRD"
									required="required" placeholder="Enter Interest Rate"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Term Mode</label> <select id="termMode"
									name="termMode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Term Mode</option>
									<option value="">Select Term Mode</option>
									<option value="Monthly">Monthly</option>
									<option value="Quarterly">Quarterly</option>
									<option value="Half-Yearly">Half-Yearly</option>
									<option value="Yearly">Yearly</option>

								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Term*</label> <input type="text" name="term"
									id="term" required="required" placeholder="Enter Term" />
							</div>
						</div>
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Installment Type*</label> <select
									id="installmentTypeRD" name="installmentTypeRD"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Installment Type</option>
									<option value="Cash">Cash</option>
									<option value="Cheque">Cheque</option>
									<option value="Online">Online</option>
									<option value="UPI">UPI</option>

								</select>
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Duration*</label> <input type="text"
									name="durationRD" id="durationRD" required="required"
									placeholder="Enter Duration" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">new Commission(%)*</label> <input type="text"
									name="commissionOnNewRD" id="commissionOnNewRD"
									required="required" placeholder="Enter Comm.New(%)" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Renewal Commission(%)*</label> <input type="text"
									name="renewalCommissionRD" id="renewalCommissionRD"
									required="required" placeholder="Enter Comm.Renew(%)" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Interest Interval</label> <select
									id="componentIntervalRD" name="componentIntervalRD"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Compound Interval</option>
									<option value="Monthly">Monthly</option>
									<option value="Quarterly">Quarterly</option>
									<option value="Half-Yearly">Half-Yearly</option>
									<option value="Yearly">Yearly</option>
									<option value="On Maturity">On Maturity</option>
								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Total Deposit</label> <input type="text"
									name="totalPaidRD" id="totalPaidRD" required="required"
									placeholder="Enter Total Deposit" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount*</label> <input type="text"
									name="maturityAmountRD" id="maturityAmountRD"
									required="required" placeholder="Enter Maturity Amount" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Is Flexible Plan?</label> <select
									id="flexiblePlanRD" name="flexiblePlanRD" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Flexible Plan</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>

								</select>
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Grace Period*</label> <input type="text"
									name="graceDaysRD" id="graceDaysRD" required="required"
									placeholder="Enter Grace Period" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Penalty Fine(%)*</label> <input type="text"
									name="penltyfineRD" id="penltyfineRD" required="required"
									placeholder="Enter Penalty Fine" />
							</div>
						</div>

						<div class="col-lg-3">
							<div
								class=" h-100 d-flex justify-content-start align-items-center">
								<div
									class="d-flex justify-content-start align-items-center  formFields">
									<label style="margin-left: 20px;" class="mb-2">Status
										plan</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="statusOfPlanRD"
												name="statusOfPlanRD" class="toggle__input"
												data-toggle-type="member-status"> <label
												for="toggle-member-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>

					<div class="row" style="margin-left: 80%;">
						<div class="col-12 text-center">
							<button id="ReccuringgenrateBtn" class="btnStyle bg-danger">Generate</button>
							<button id="ReccuringsaveBtn" class="btnStyle bg-warning ">Save</button>
							<button id="ReccuringupdateBtn"
								class="btnStyle bg-warning style="display:none;">Update</button>

						</div>
					</div>

					<div class="row mt-5">
						<div class="col-12">
							<div class="card recent-sales">

								<div class="card-body table-responsive">
									<h5 class="card-title">
										Recent Sales <span>| Today</span>
									</h5>

									<table class="table table-bordered">
										<thead class="table-light">
											<tr>
												<th>Plan Code</th>
												<th>Plan Name</th>
												<th>Minimum Deposit</th>
												<th>Rate Of Interest</th>
												<th>Installment Type</th>
												<th>Term Mode</th>
												<th>Term</th>

												<th>Duration</th>
												<th>Commission On New</th>
												<th>Renewal Commission</th>
												<th>Interest Interval</th>
												<th>Total Paid</th>
												<th>Maturity Amount</th>
												<th>Flexible Plan</th>
												<th>Grace Days</th>
												<th>Penalty Rate</th>
												<th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody id="recurringTableBody">
											<!-- Dynamic rows will be injected here -->
										</tbody>
									</table>


								</div>
							</div>
						</div>
					</div>
			</form>
		</div>


		<div>
			<form id="fixedformid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Fixed Deposit</li>
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
							<div class="d-flex flex-column formFields">
								<label for="">Plan Code*</label> <input type="text"
									name="planCodeFD" id="planCodeFD" required="required"
									value="${memberCodeFD}" readonly="readonly"
									placeholder="Enter Plan Code"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields  mb-4 ">
								<label for="vehicalNo">Plan Name*</label> <input type="text"
									name="planNameFD" id="planNameFD" required="required"
									placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Minimum Amount*</label> <input
									type="text" name="minimumAmountFD" id="minimumAmountFD"
									required="required" placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Interest Rate(%)*</label> <input
									type="text" name="rateOfInterestFD" id="rateOfInterestFD"
									required="required" placeholder="Enter Interest Rate"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Installment Type*</label> <select
									id="installmentTypeFD" name="installmentTypeFD"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Installment Type</option>
									<option value="Cash">Cash</option>
									<option value="Cheque">Cheque</option>
									<option value="Online">Online</option>
									<option value="UPI">UPI</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Duration*</label> <input type="text"
									name="durationFD" id="durationFD" required="required"
									placeholder="Enter Duration" />
							</div>
						</div>


						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Term Mode *</label> <select id="termMode1"
									name="termMode1" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Term Mode</option>
									<option value="">Select Term Mode</option>
									<option value="Monthly">Monthly</option>
									<option value="Quarterly">Quarterly</option>
									<option value="Half-Yearly">Half-Yearly</option>
									<option value="Yearly">Yearly</option>

								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Term*</label> <input type="text" name="termFd"
									id="termFd" required="required" placeholder="Enter Term" />
							</div>
						</div>
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Installment Type*</label> <select
									id="installmentTypeFD" name="installmentTypeFD"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Installment Type</option>
									<option value="Cash">Cash</option>
									<option value="Cheque">Cheque</option>
									<option value="Online">Online</option>
									<option value="UPI">UPI</option>

								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Renewal Commission(%)*</label> <input type="text"
									name="renewalCommissionFD" id="renewalCommissionFD"
									required="required" placeholder="Enter Comm.Renew(%)" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Interst Interval*</label> <select
									id="componentIntervalFD" name="componentIntervalFD"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Compound Interval</option>
									<option value="Monthly">Monthly</option>
									<option value="Quarterly">Quarterly</option>
									<option value="Half-Yearly">Half-Yearly</option>
									<option value="Yearly">Yearly</option>
									<option value="On Maturity">On Maturity</option>

								</select>
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Total Deposit</label> <input readonly type="text"
									name=" totalPaidFD" id=" totalPaidFD" required="required"
									placeholder="Enter Total Deposit" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount*</label> <input readonly
									type="text" name="maturityAmountFD" id="maturityAmountFD"
									required="required" placeholder="Enter maturityAmountFD" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">New Commission(%)*</label> <input type="text"
									name="commissionOnNewFD" id="commissionOnNewFD"
									required="required" placeholder="Enter Comm.New(%)" />
							</div>
						</div>
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Is Flexible Plan?</label> <select
									id="flexiblePlanFD" name="flexiblePlanFD" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Flexible Plan</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>

								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Grace Period*</label> <input type="text"
									name="graceDaysFD" id="graceDaysFD" required="required"
									placeholder="Enter Grace Period" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Penalty Fine(%)*</label> <input type="text"
									name="penltyfineFD" id="penltyfineFD" required="required"
									placeholder="Enter Penalty Fine" />
							</div>
						</div>


						<div class="col-lg-3">
							<div
								class=" h-100 d-flex justify-content-start align-items-center">
								<div
									class="d-flex justify-content-start align-items-center  formFields">
									<label style="margin-left: 20px;" class="mb-2">Status
										plan</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="statusOfPlanFD"
												name="statusOfPlanFD" class="toggle__input"
												data-toggle-type="member-status"> <label
												for="toggle-member-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>


				</div>

				<div class="row" style="margin-left: 80%;">
					<div class="col-12 text-center">
						<button id="saveBtn" class="btnStyle bg-warning">Save</button>
					</div>
				</div>

				<div class="row mt-5">
					<div class="col-12">
						<div class="card recent-sales">

							<div class="card-body table-responsive">
								<h5 class="card-title">
									Recent Sales <span>| Today</span>
								</h5>

								<table class="table table-bordered">
									<thead class="table-light">
										<tr>
											<th>Plan Code</th>
											<th>Plan Name</th>
											<th>Minimum Deposit</th>
											<th>Rate Of Interest</th>
											<th>Installment Type</th>
											<th>Term Mode</th>
											<th>Term</th>

											<th>Duration</th>
											<th>Commission On New</th>
											<th>Renewal Commission</th>
											<th>Interest Interval</th>
											<th>Total Paid</th>
											<th>Maturity Amount</th>
											<th>Flexible Plan</th>
											<th>Grace Days</th>
											<th>Penalty Rate</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody id="fixedTableBody">
										<!-- Dynamic rows will be injected here -->
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</form>
		</div>


		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">MIS Deposit</li>
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
							<div class="d-flex flex-column formFields">
								<label for="">Plan Code*</label> <input type="text"
									name="planCodeMD" id="planCodeMD" required="required"
									placeholder="Enter Plan Code" value="${memberCodeMD}"
									readonly="readonly" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields  mb-4 ">
								<label for="vehicalNo">Plan Name*</label> <input type="text"
									name="planNameMD" id="planNameMD" required="required"
									placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Minimum Amount*</label> <input
									type="text" name="minimumAmountMD" id="minimumAmountMD"
									required="required" placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Interest Rate(%)*</label> <input
									type="text" name="rateOfInterestMD" id="rateOfInterestMD"
									required="required" placeholder="Enter Interest Rate"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Installment Type*</label> <select
									id="installmentTypeMD" name="installmentTypeMD"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Installment Type</option>
									<option value="Cash">Cash</option>
									<option value="Cheque">Cheque</option>
									<option value="Online">Online</option>
									<option value="UPI">UPI</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Duration*</label> <input type="text"
									name="durationMD" id="durationMD" required="required"
									placeholder="Enter Duration" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Maturity ROI(%)</label> <input
									type="text" name="maturityROIMD" id="maturityROIMD"
									required="required" placeholder="Enter Interest Rate"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Term Mode*</label> <select id="termModeMD"
									name="termModeMD" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Term Mode</option>
									<option value="">Select Term Mode</option>
									<option value="Monthly">Monthly</option>
									<option value="Quarterly">Quarterly</option>
									<option value="Half-Yearly">Half-Yearly</option>
									<option value="Yearly">Yearly</option>

								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Term*</label> <input type="text" name="termMD"
									id="termMD" required="required" placeholder="Enter Term" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">MIS Int.ROI(%)*</label> <input type="text"
									name="MISIntROIMD" id="MISIntROIMD" required="required"
									placeholder="Enter MIS Int.ROI(%)" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">MIS Interval*</label> <select id="MISIntervalMD"
									name="MISIntervalMD" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select MIS Interval</option>

								</select>
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">MIS Interest</label> <input readonly type="text"
									name="MISInterestMD" id="MISInterestMD" required="required"
									placeholder="Enter MIS Interest" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount*</label> <input readonly
									type="text" name="maturityAmountMD" id="maturityAmountMD"
									required="required" placeholder="Enter Maturity Amount" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">New Commission(%)*</label> <input type="text"
									name="commissionOnNewMD" id="commissionOnNewMD"
									required="required" placeholder="Enter Comm.New(%)" />
							</div>
						</div>
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Is Flexible Plan?</label> <select
									id="flexiblePlanMD" name="flexiblePlanMD" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Flexible Plan</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Plan Status</label> <input type="text"
									name="statusOfPlanMDRD2" id="statusOfPlanMDRD2"
									required="required" placeholder="Enter Plan Status" />
							</div>
						</div>


					</div>

					<div class="row" style="margin-left: 80%;">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-warning">Save</button>
						</div>
					</div>

					<div class="row mt-5">
						<div class="col-12">
							<div class="card recent-sales">

								<div class="card-body table-responsive">
									<h5 class="card-title">
										Recent Sales <span>| Today</span>
									</h5>

									<table class="table table-borderless datatable overflow-scroll">
										<thead class="table-light">
											<tr style="font-family: 'Poppins', sans-serif;">
												<th scope="col">#</th>
												<th scope="col">Customer</th>
												<th scope="col">Product</th>
												<th scope="col">Price</th>
												<th scope="col">Status</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
											<tr style="font-family: 'Poppins', sans-serif;">
												<th scope="row"><a href="#">1</a></th>
												<td>Arun Kumar</td>
												<td><a href="#" className="text-primary">Milk</a></td>
												<td>$29</td>
												<td><span class="badge bg-success text-white">Approved</span>
												</td>
												<td class="d-flex" style="gap: .7rem;">
													<button class="iconbutton">
														<i class="fa-solid fa-pen-to-square text-success"></i>
													</button>
													<button class="iconbutton">
														<i class="fa-solid fa-eye text-primary"></i>
													</button>
													<button class="iconbutton">
														<i class="fa-solid fa-trash text-danger"></i>
													</button>
												</td>
											</tr>

											<tr>
												<th scope="row"><a href="#">2</a></th>
												<td>Deepak Dalwe</td>
												<td><a href="#" className="text-primary">Ghee</a></td>
												<td>$16.5</td>
												<td><span class="badge bg-danger text-white">Rejected</span>
												</td>
												<td class="d-flex" style="gap: .7rem;">
													<button class="iconbutton">
														<i class="fa-solid fa-pen-to-square text-success"></i>
													</button>
													<button class="iconbutton">
														<i class="fa-solid fa-eye text-primary"></i>
													</button>
													<button class="iconbutton">
														<i class="fa-solid fa-trash text-danger"></i>
													</button>
												</td>
											</tr>
											<tr>
												<th scope="row"><a href="#">2</a></th>
												<td>Deepak Dalwe</td>
												<td><a href="#" className="text-primary">Ghee</a></td>
												<td>$16.5</td>
												<td><span class="badge bg-danger text-white">Rejected</span>
												</td>
												<td class="d-flex" style="gap: .7rem;">
													<button class="iconbutton">
														<i class="fa-solid fa-pen-to-square text-success"></i>
													</button>
													<button class="iconbutton">
														<i class="fa-solid fa-eye text-primary"></i>
													</button>
													<button class="iconbutton">
														<i class="fa-solid fa-trash text-danger"></i>
													</button>
												</td>
											</tr>
											<tr>
												<th scope="row"><a href="#">2</a></th>
												<td>Deepak Dalwe</td>
												<td><a href="#" className="text-primary">Ghee</a></td>
												<td>$16.5</td>
												<td><span class="badge bg-danger text-white">Rejected</span>
												</td>
												<td class="d-flex" style="gap: .7rem;">
													<button class="iconbutton">
														<i class="fa-solid fa-pen-to-square text-success"></i>
													</button>
													<button class="iconbutton">
														<i class="fa-solid fa-eye text-primary"></i>
													</button>
													<button class="iconbutton">
														<i class="fa-solid fa-trash text-danger"></i>
													</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
			</form>
		</div>
		<%--  <button class="btn btn-sm btn-primary" onclick="editPlan(${item.id})">
	                    <i class="fa fa-edit"></i>
	                  </button>
 --%>
	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<!--  <script src="./js/adminscript.js"></script>-->
	<script src="./js/PolicyManagment/PlanMangement.js"></script>

</body>

</html>