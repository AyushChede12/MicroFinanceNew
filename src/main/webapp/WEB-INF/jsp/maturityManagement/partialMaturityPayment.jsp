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
					<li class="breadcrumb-item action">Partial Maturity Payment</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Search Box</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							
							<div class="d-flex flex-column formFields">
								<label for="">Policy Id. <span id="star"> *</span></label> <select id="policyID"
									name="policyID" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>

								</select>
							</div>

						</div>


					</div>
					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btn btn-success">Update</button>
						</div>
					</div>
				</div>











				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Policy Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							
							<div class="d-flex flex-column formFields">
								<label for="">Policy Id :</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Client Name :</label> <input
									type="text" name="clientName" id="clientName" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Policy Name:</label> <input type="text" name="policyName"
									id="policyName" required="required" placeholder=""
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Policy code:</label> <input type="text"
									name="policyCode" id="policyCode" required="required"
									placeholder="" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Duration:</label> <input type="text" name="duration" id="duration"
									required="required" placeholder="" />

							</div>

						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Policy Amount:</label> <input type="text" name="policyAmount"
									id="policyAmount" required="required" placeholder="" />

							</div>

						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Actual Maturity:</label> <input type="text" name="actualMaturity"
									id="actualMaturity" required="required" placeholder="" />

							</div>

						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Maturity Date:</label> <input type="text" name="maturityDate"
									id="maturityDate" required="required" placeholder="" />

							</div>

						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Sys.Payable:</label> <input type="text" name="sysPayable"
									id="sysPayable" required="required" placeholder="" />

							</div>

						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deduction(-):</label> <input type="text" name="deduction"
									id="deduction" required="required" placeholder="" />

							</div>

						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Adjeustment(+):</label> <input type="text" name="adjeustment"
									id="adjeustment" required="required" placeholder="" />

							</div>

						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Net Payable:</label> <input type="text" name="netPayable"
									id="netPayable" required="required" placeholder="" />

							</div>

						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Approval Branch Name:</label> <input type="text" name="approvalBranchName"
									id="approvalBranchName" required="required" placeholder="" />

							</div>

						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Approval Date:</label> <input type="date" name="approvalDate"
									id="approvalDate" required="required" placeholder="" />

							</div>

						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Approve Comment:</label> <input type="text" name="approveComment"
									id="approveComment" required="required" placeholder="" />

							</div>

						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Approve User:</label> <input type="text" name="approveUser"
									id="approveUser" required="required" placeholder="" />

							</div>

						</div>

					</div>
				</div>


				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Payable Detail</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							
							<div class="d-flex flex-column formFields">
								<label for="">Amount: <span id="star"> *</span></label> <input type="text"
									name="amount" id="amount" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Paid Amount: <span id="star"> *</span></label> <input type="text"
									name="paidAmount" id="paidAmount" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Due Amount:</label> <input type="text" name="dueAmount"
									id="dueAmount" required="required" placeholder=""
									style="text-transform: uppercase;" />
							</div>
						</div>
					</div>
				</div>








				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Payment Detail</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							
							<div class="d-flex flex-column formFields">
								<label for="">Payment Date <span id="star"> *</span>:</label> <input type="date"
									name="paymentDate" id="paymentDate" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Pay Branch <span id="star"> *</span> :</label> <select id="payBranch"
									name="payBranch" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Pay Comment:</label> <input type="text" name="payComment"
									id="payComment" required="required" placeholder=""
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Mode of Payment <span id="star"> *</span></label> <select id="modeofPayment"
									name="modeofPayment" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>

								</select>
							</div>
						</div>




					</div>

					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" style="color: white; background-color: #B33791 ; border: none;" class="btn btn-warning">Approve</button>
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