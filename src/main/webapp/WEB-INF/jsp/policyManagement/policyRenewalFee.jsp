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
			<h1>Policy Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-piggy-bank"></i>
					</a></li>
					<li class="breadcrumb-item action">Policy Renewal Fee</li>
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
								<label for="Agent">Policy Code*</label> <select id="policyCode"
									name="policyCode" required class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Policy Code</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Renewal Date</label> <input type="date"
									name="renewalDate" id="renewalDate" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>


					</div>


					<div class="mt-5">
						<nav>
							<ol class="breadcrumb breadcrumb-title">
								<li class="breadcrumb-item action">Policy Information</li>
							</ol>
						</nav>
						<div class="row">
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Policy Date*</label> <input type="date"
										name="policyDate" id="policyDate" required="required"
										placeholder="Enter Vehicle No"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Maturity Date*</label> <input type="date"
										name="maturityDate" id="maturityDate" required="required"
										style="text-transform: uppercase;" />
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Customer Code* </label> <input type="text"
										name="customerCode" id="customerCode" required="required"
										placeholder="Enter Customer Code" />
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Customer Name </label> <input type="text"
										name="customerName" id="customerName" required="required"
										placeholder="Enter Customer Name" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Branch Name </label> <select id="branchName"
										name="branchName" required class="form-control selectField"
										style="height: 30px;">
									</select>
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Contact No*</label> <input type="text"
										name="contactNo" id="contactNo" required="required"
										placeholder="Enter Contact No." />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Policy Amount*</label> <input type="text"
										name="policyAmount" id="policyAmount" required="required"
										placeholder="Enter Policy Amount" />
								</div>
							</div>




							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Policy Type </label> <input type="text"
										name="policyType" id="policyType" required="required"
										placeholder="Enter Policy Type" />
								</div>
							</div>


							<!-- in this two text fieldds are required -->
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Policy Term </label> <input type="text"
										name="policyTerm" id="policyTerm" required="required"
										placeholder="Enter Policy Term" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Maturity Amt.*</label> <input type="text"
										name="maturityAmount" id="maturityAmount" required="required"
										placeholder="Enter Maturity Amount" />
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Total Deposits*</label> <input type="text"
										name="totalDeposit" id="totalDeposit" required="required"
										placeholder="Enter Total Deposits" />
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Payment Due*</label> <input type="text"
										name="paymentDue" id="paymentDue" required="required"
										placeholder="Enter Payment Due" />
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="">Last Installment Pay *</label> <input type="text"
										name="lastInstPaid" id="lastInstPaid" required="required"
										placeholder="Enter Last Payment Date" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="">Due Date*</label> <input type="date"
										name="dueDate" id="dueDate" required="required"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="">No Of Installment*</label> <input type="text"
										name="noOfInst" id="noOfInst" required="required"
										placeholder="Enter No of Installment" />
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="">Installments Completed*</label> <input
										type="text" name="noOfInstPaid" id="noOfInstPaid"
										required="required" placeholder="Enter Installments Completed" />
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="">Mode Of Payment*</label> <input type="text"
										name="modeOfPayment" id="modeOfPayment" required="required"
										placeholder="Enter Payment Mode" />
								</div>
							</div>




						</div>
					</div>





				</div>

				<div class="row" style="margin-left: 80%;">
					<div class="col-12 text-center">
						<!-- Trigger button -->
						<button id="viewBtn" type="button" class="btn btn-primary"
							data-toggle="modal" data-target="#installmentModal">
							View Installment</button>
						<button id="saveBtn" type="button" class="btn btn-info">Save</button>
					</div>
				</div>

			</form>



		</div>


	</main>

	<!-- MODAL FOR VIEW INSTALLMENT -->
	<div class="modal fade" id="installmentModal" tabindex="-1"
		role="dialog" aria-labelledby="installmentModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered"
			role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title" id="installmentModalLabel">Installment
						Details</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover text-center">
							<thead class="thead-dark">
								<tr>
									<th>Installment No</th>
									<th>Due Date</th>
									<th>Amount</th>
									<th>Status</th>
									<th>Payment Date</th>
								</tr>
							</thead>
							<tbody>
								<!-- Example static data -->
								<tr>
									<td>1</td>
									<td>2025-09-10</td>
									<td>&#8377;5,000</td>
									<!-- Rupee symbol as entity -->
									<td>Paid</td>
									<td>2025-09-11</td>
								</tr>
								<tr>
									<td>2</td>
									<td>2025-10-10</td>
									<td>&#8377;5,000</td>
									<!-- Rupee symbol as entity -->
									<td>Pending</td>
									<td>-</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<script src="./js/PolicyManagment/policyRenwalFee.js"></script>
</body>

</html>