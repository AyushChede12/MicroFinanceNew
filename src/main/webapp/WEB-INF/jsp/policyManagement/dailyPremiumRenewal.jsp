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
					<li class="breadcrumb-item action">Daily Premium Renewal</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Find Box</li>
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
								<label>Update Date</label> <input type="date" name="vehicalNo"
									id="vehicalNo" required="required"
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
										placeholder="Enter Policy Date"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Maturity Date*</label> <input type="date"
										name="maturityDate" id="maturityDate" required="required"
										placeholder="Enter Maturity Date"
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
									<label for="">Client Name*</label> <input type="text"
										name="clientName" id="clientName" required="required"
										placeholder="Enter Client Name" />
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Contact Number*</label> <input type="text"
										name="contactNumber" id="contactNumber" required="required"
										placeholder="Enter Contact Number" />
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
									<label>Policy Type</label> <input type="text" name="policyType"
										id="policyType" required="required"
										placeholder="Enter Policy Type" />
								</div>
							</div>



							<!-- in this two text fieldds are required -->
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="policyTerm">Policy Term</label> <input type="text"
										name="policyTerm" id="policyTerm" required
										placeholder="Enter Education" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="maturityAmt">Maturity Amt.*</label> <input
										type="text" name="maturityAmt" id="maturityAmt" required
										placeholder="Enter Education" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="totalDeposits">Total Deposits*</label> <input
										type="text" name="totalDeposits" id="totalDeposits" required
										placeholder="Enter Education" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="paymentDue">Payment Due*</label> <input type="text"
										name="paymentDue" id="paymentDue" required
										placeholder="Enter Education" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="notificationStatus">Notification Status*</label> <input
										type="text" name="notificationStatus" id="notificationStatus"
										required placeholder="Enter Education" />
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="financialCode">Financial Code *</label> <input
										type="text" name="financialCode" id="financialCode" required
										placeholder="Enter Education" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="lastPaymentDate">Last Payment Date*</label> <input
										type="text" name="lastPaymentDate" id="lastPaymentDate"
										required placeholder="Enter Education" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="dueDate">Due Date*</label> <input type="date"
										name="dueDate" id="dueDate" required
										placeholder="Enter Vehicle No"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="penaltyFee">Penalty Fee*</label> <input type="text"
										name="penaltyFee" id="penaltyFee" required
										placeholder="Enter Education" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="installmentsCompleted">Installments
										Completed*</label> <input type="text" name="installmentsCompleted"
										id="installmentsCompleted" required
										placeholder="Enter Education" />
								</div>
							</div>


							<div class="col-lg-3 mt-4">
								<div class="d-flex flex-column formFields">
									<label for="modeOfPayment">Mode of Payment</label> <select
										id="modeOfPayment" name="modeOfPayment" required
										class="form-control selectField" style="height: 30px;">
										<option value="">Select Branch Name</option>
									</select>
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="agentCollectorName">Agent/Collector Name*</label> <input
										type="text" name="agentCollectorName" id="agentCollectorName"
										required placeholder="Enter Education" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="name">Name*</label> <input type="text" name="name"
										id="name" required placeholder="Enter Education" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields mt-4">
									<label for="comments">Comments*</label>
									<textarea name="comments" id="comments"
										style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
								</div>
							</div>
						</div>
					</div>




				
				</div>

				<div class="row" style="margin-left: 80%;">
					<div class="col-12 text-center">
						<button id="saveBtn" class="btn btn-primary">View
							Installment</button>
						<button id="saveBtn" class="btn btn-info">Save</button>
					</div>
				</div>
			</form>



		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>