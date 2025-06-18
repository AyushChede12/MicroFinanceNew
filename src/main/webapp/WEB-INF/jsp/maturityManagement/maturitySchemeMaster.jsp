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
			<h1>Maturity Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-calendar-check"></i>
					</a></li>
					<li class="breadcrumb-item action">Maturity Scheme Master</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formdd">
				<div >
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Daily Deposit</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							
							<div class="d-flex flex-column formFields">
								<label for="">Policy Code <span id="star"> *</span></label>
								<select id="ddPolicyCode"
									name="ddPolicyCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Policy Code</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Inst.From <span id="star"> *</span></label> <input type="text"
									name="ddInstFrom" id="ddInstFrom" required="required"
									placeholder="Enter Inst.From"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Inst. To <span id="star"> *</span></label> <input type="text" name="ddInstTo"
									id="ddInstTo" required="required" placeholder="Enter Inst.To"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Interest Rate <span id="star"> *</span></label> <input type="text" name="ddInterestRate"
									id="ddInterestRate" required="required" placeholder="Enter ROI" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deduction </label> <input type="text" name="ddDeduction"
									id="ddDeduction" required="required" placeholder="Enter Deduction" />

							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-info">Save</button>
						</div>
					</div>
				</div>

</form>









<form id="formrd">
				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Recurring Deposite</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							
							<div class="d-flex flex-column formFields">
								<label for="">Policy Code <span id="star"> *</span></label> <select id="rdPolicyCode"
									name="rdPolicyCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">GROW</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Inst.From <span id="star"> *</span></label> <input type="text"
									name="rdInstFrom" id="rdInstFrom" required="required"
									placeholder="Enter Inst.From"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Inst. To <span id="star"> *</span></label> <input type="text" name="rdInstTo"
									id="rdInstTo" required="required" placeholder="Enter Inst.To"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Interest Rate <span id="star"> *</span></label> <input type="text" name="rdInterestRate"
									id="rdInterestRate" required="required" placeholder="Enter ROI" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deduction</label> <input type="text" name="rdDeduction"
									id="rdDeduction" required="required" placeholder="Enter Deduction" />

							</div>

						</div>

					</div>

					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-info">Save</button>
						</div>
					</div>
				</div>
		</form>

		<form id="formfd">
				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Fixed Deposit</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							
							<div class="d-flex flex-column formFields">
								<label for="">Policy Code <span id="star"> *</span></label> <select id="fdPolicyCode"
									name="fdPolicyCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Policy Code</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Months From <span id="star"> *</span></label> <input type="text"
									name="fdMonthsFrom" id="fdMonthsFrom" required="required"
									placeholder="Enter Months.From"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Months To <span id="star"> *</span></label> <input type="text" name="fdMonthsTo"
									id="fdMonthsTo" required="required"
									placeholder="Enter Months.To"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Interest Rate <span id="star"> *</span></label> <input type="text" name="fdInterestRate"
									id="fdInterestRate" required="required" placeholder="Enter ROI" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deduction</label> <input type="text" name="fdDeduction"
									id="fdDeduction" required="required" placeholder="Enter Deduction" />

							</div>

						</div>

					</div>

					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-info">Save</button>
						</div>
					</div>
				</div>
			</form>



			<form id="formmis">
				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">MIS Deposit</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							
							<div class="d-flex flex-column formFields">
								<label for="">Policy Code <span id="star"> *</span></label> <select id="misPolicyCode"
									name="misPolicyCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">ALL</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Months From <span id="star"> *</span></label> <input type="text"
									name="misMonthsFrom" id="misMonthsFrom" required="required"
									placeholder="Enter Months.From"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Months To <span id="star"> *</span></label> <input type="text" name="misMonthsTo"
									id="misMonthsTo" required="required"
									placeholder="Enter Months.To"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Interest Rate <span id="star"> *</span></label> <input type="text" name="misInterestRate"
									id="misInterestRate" required="required" placeholder="Enter ROI" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deduction</label> <input type="text" name="misDeduction"
									id="misDeduction" required="required" placeholder="Enter Deduction" />

							</div>

						</div>

					</div>

					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-info">Save</button>
						</div>
					</div>
				</div>


			</form>


		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<!-- Your HTML dropdown -->
<!-- jQuery script -->

<script src="./js/MaturityManagement/maturityscheme.js"></script>	

	
</body>

</html>