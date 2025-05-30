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
<title>Approve Maturity Applications</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Request Approval</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-check-circle"></i>
					</a></li>
					<li class="breadcrumb-item action">Approve Maturity Applications</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<div class="row">
						<div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="">Policy ID</label> <select id="memberSelection"
									name="memberSelection" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<div class="col-2 text-left mt-3">
							<button id="saveBtn" class="btnStyle"
								style="background-color: #FFA500;">FIND</button>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12">
							<nav>
								<ol class="breadcrumb breadcrumb-title">
									<li class="breadcrumb-item action mt-3">Policy Information</li>
								</ol>
							</nav>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Policy ID</label> <input type="text"
									name="policyId" id="policyId" required="required"
									placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Client Name</label> <input type="text"
									name="clientName" id="clientName" required="required"
									placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Policy Type</label> <input type="text"
									name="policyType" id="policyType" required="required"
									placeholder="" disabled />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Policy Code</label> <input type="text"
									name="policyCode" id="policyCode" required="required"
									placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Mode Of Operation</label> <input type="text" name="modeOfOperation"
									id="modeOfOperation" required="required" placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Scheme Term</label> <input type="text" name="schemeTerm"
									id="schemeTerm" required="required" placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Policy Date</label> <input type="text"
									name="policyDate" id="policyDate" required="required" placeholder=""
									disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Payoff Date</label> <input type="text"
									name="payoffDate" id="payoffDate" required="required"
									placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Plan Amount</label> <input type="text"
									name="planAmount" id="planAmount" required="required"
									placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Maturity Amount</label> <input type="text" name="maturityAmount"
									id="maturityAmount" required="required" placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Inst paid</label> <input type="text"
									name="InstPaid" id="InstPaid" required="required"
									placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Total Deposits</label> <input type="text"
									name="totalDeposits" id="totalDeposits" required="required" placeholder=""
									disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Rate Of Interest(%)</label> <input type="text" name="rateOfInterest"
									id="rateOfInterest" required="required" placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Fine</label> <input type="text" name="fine"
									id="fine" required="required" placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Req. User</label> <input type="text"
									name="reqUser" id="reqUser" required="required"
									placeholder="" disabled />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12">
							<nav>
								<ol class="breadcrumb breadcrumb-title">
									<li class="breadcrumb-item action mt-3">Payment Information</li>
								</ol>
							</nav>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Sys. Payable</label> <input type="text" name="SysPayable"
									id="SysPayable" required="required" placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">deduction(-)</label> <input type="text" name="deduction"
									id="deduction" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Adjustment(+)</label> <input type="text"
									name="Adjustment" id="Adjustment" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Net Payable</label> <input type="text" name="netPayable"
									id="netPayable" required="required" placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Application Branch</label> <input type="text"
									name="applicationBranch" id="applicationBranch" required="required" placeholder="" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Approve Date</label> <input type="date"
									name="ApproveDate" id="ApproveDate"
									required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Approve Branch Name</label> <select id="Branch"
									name="Branch" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value=""></option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Approve Comments</label> <input type="text"
									name="ApproveComments" id="ApproveComments" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Approve Status</label> <select id="ApproveStatus"
									name="ApproveStatus" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Status</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12 text-right mt-3">
							<button id="saveBtn" class="btnStyle"
								style="background-color: #FFA500;">Approve Maturity</button>
						</div>
					</div>

				</div>
			</form>



		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>