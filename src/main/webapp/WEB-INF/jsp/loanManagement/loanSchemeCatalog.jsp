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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


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
					<li class="breadcrumb-item action">Loan Scheme Catalog</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Management Details</li>
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
              
              <input type="hidden" id="loanSchemeId" name="loanSchemeId" value="1" />
              
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Loan Plan Name</label> <input type="text"
									name="loanPlaneName" id="loanPlaneName" required="required"
									placeholder="Enter Loan Plan Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for=""> Type Of Loan</label> <select id="typeloan"
									name="typeloan" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Type Of Loan</option>
									<option value="Blue">Business Loan</option>
									<option value="Blue">Vehicle Loan</option>
									<option value="Blue">Home Loan</option>
									<option value="Blue">personal Loan</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Minimum Age</label> <input type="text"
									name="minimumAge" id="minimumAge" required="required"
									placeholder="Enter Minimum Age"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Maximum Age</label> <input type="text"
									name="maximumAge" id="maximumAge" required="required"
									placeholder="Enter Maximum Age"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Min Loan Duration(months) </label> <input
									type="text" name="minloanDuration" id="minloanDuration"
									required="required" placeholder="Enter Min Loan Duration" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Max. Loan Duration(months) </label> <input
									type="text" name="mixloanDuration" id="mixloanDuration"
									required="required" placeholder="Enter Max. Loan Duration" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Emi Frequency</label> <select id="emiFrequency"
									name="emiFrequency" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Emi Frequency</option>
									<option value="Blue">50Hz</option>
									<option value="Blue">100Hz</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Emi Type</label> <select id="emiType"
									name="emiType" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Emi Type</option>
									<option value="Blue">Online</option>
									<option value="Blue">Cash</option>
									<option value="Blue">cheque</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">Minimum Loan Amount</label> <input
									type="text" name="minimumloanAmount" id="minimumloanAmount"
									required="required" placeholder="Enter Minimum Loan Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">Maximum Loan Amount</label> <input
									type="text" name="maximumloanAmount" id="maximumloanAmount"
									required="required" placeholder="Enter Maximum Loan Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Rate Interest Type(%p.a.)</label> <input
									type="text" name="rateIntrestType" id="rateIntrestType"
									required="required" placeholder="Enter Rate Interest Type" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for=""> Interest Type</label> <select id="typeIntrest"
									name="typeIntrest" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select ROI Type</option>
									<option value="Blue">Simple</option>
									<option value="Blue">Compound</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Security Type</label> <select id="typesecurity"
									name="typesecurity" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Security</option>
									<option value="Blue">Blue</option>
								</select>
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
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Processing Fee(%) </label> <input type="text"
									name="feeProcessing" id="feeProcessing" required="required"
									placeholder="Enter Processing Fee" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for=""> Legal Charges(%)</label> <input type="text"
									name="chargesLegal" id="chargesLegal" required="required"
									placeholder="Enter Legal Charges" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">GST(%)</label> <input type="text" name="gst"
									id="gst" required="required" placeholder="Enter GST" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Insurence Fee(%)</label> <input type="text"
									name="feeInsurence" id="feeInsurence" required="required"
									placeholder="Enter Insurance Fee" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Valuation Fee(%) </label> <input type="text"
									name="feeValuation" id="feeValuation" required="required"
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
								<label for="">Late Allowance Days</label> <input type="number"
									name="lateAllowanceday" id="lateAllowanceday"
									required="required" placeholder="Enter Late Allowance Days" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">penalty mode</label> <select id="modePanalty"
									name="modePanalty" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Penalty Type</option>
									<option value="Blue">Percentage</option>
									<option value="Blue">Amount</option>
								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for=""> Monthly Penalty </label> <input type="number"
									name="pennaltyMonthly" id="pennaltyMonthly" required="required"
									placeholder="" />
							</div>
						</div>
					</div>


				</div>

				<div class="row">
					<div class="col-12 text-center">
						<button id="saveBtn" class="btnStyle bg-success">Save</button>
						

						<button id="updateBtn" class="btnStyle"
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

							<table class="table table-borderless datatable overflow-scroll"
								onclick="loadLoanTable()" id="loanTableWrapper">
								<thead class="table-light">
									<tr style="font-family: 'Poppins', sans-serif;">
										<th scope="col">ID</th>
										<th>Loan Plan Name</th>
										<th>Type Of Loan</th>
										<th>Minimum Age</th>
										<th>Maximum Age</th>
										<th>Min Duration</th>
										<th>Max Duration</th>
										<th>Minimum Loan</th>
										<th>Maximum Loan</th>

										<th>Edit</th>
										<th>Delete</th>
										<td>
									</tr>
								</thead>
								<tbody id="loanTableBody">

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/LoanManagment/LoanSchemCatalog.js"></script>
</body>

</html>