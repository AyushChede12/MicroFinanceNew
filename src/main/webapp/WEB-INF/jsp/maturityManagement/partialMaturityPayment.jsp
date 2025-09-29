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

<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	
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
								<label for="">Plan type :<span id="star"> *</span></label> 
								<select id="plantype"
									name="plantype" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="Select">Select</option>
									<option value="RD">RD</option>
									<option value="FD">FD</option>
									<option value="MIS">MIS</option>
								</select>
							</div>
						</div>
				
						<div class="col-lg-3">
							<input type="hidden" name="id" id="id">
							<div class="d-flex flex-column formFields">
								<label for="policyCode">Policy Code</label> <select id="policyCode"
									name="policyCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">-- Policy Code --</option>

								</select>
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
								<label for="vehicalNo">Plan Code :</label> <input
									type="text" name="planCode" id="planCode" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Customer Name :</label> <input
									type="text" name="customerName" id="customerName" required="required"
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
								<label>Actual Maturity:</label> <input type="text" name="maturityAmount"
									id="maturityAmount" required="required" placeholder="" />

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
									id="sysPayable" required="required" placeholder="" value="sysPayable" />

							</div>

						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deduction(-):</label> <input type="text" name="deduction"
									id="deduction" required="required" placeholder="" value="deduction "/>

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
								<label>Approval Branch Name:</label> <input type="text" name="Approvebranch"
									id="Approvebranch" required="required" />

							</div>

						</div>

						

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Approve Status:</label> <input type="text" name="approveStatus"
									id="approveStatus" required="required" value="NotApproved" readonly="readonly" />

							</div>

						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								 <input type="hidden" name="id" id="id">
							<div class="d-flex flex-column formFields">
								<label> User Approver:</label> <select id="userApprover"
									name="userApprover" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Team Member</option>

								</select>
							</div>

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
								<label for="">Closing Date: <span id="star"> *</span></label> <input type="date"
									name="closingDate" id="closingDate" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Paid Amount: <span id="star"> *</span></label> <input type="text"
									name="depositAmount" id="depositAmount" required="required"
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
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Remark :</label> <input type="text" name="remark"
									id="remark" required="required" placeholder=""
									style="text-transform: uppercase;" />
							</div>
						</div>
					</div>
					
				</div>



					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btn btn-danger">Break</button>
						</div>
					</div>
				</div>
		</form>


		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/MaturityManagement/partialmaturity.js"></script>
	
</body>

</html>