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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Financial Consultant</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-briefcase text-blue"></i>
					</a></li>
					<li class="breadcrumb-item action">Consultant Promotion Management</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Financial Consultant Promotion</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							
							<div class="d-flex flex-column formFields">
								<label for="">Select Code</label> <select id="agentcode"
									name="agentcode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Code</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<!-- <div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="position">Position</label> <input type="text"
									name="position" id="position" required="required"
									placeholder="Enter Position" style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Branch</label> <input type="text" name="Branch"
									id="Branch" required="required" placeholder="Enter Branch"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Senior Code</label> <input type="text"
									name="seniorcode" id="seniorcode" required="required"
									placeholder="Enter Senior Code"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Position</label> <input type="text" name="Position2"
									id="Position" required="required" placeholder="Enter Senior Position"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Immidiate Sr.</label> <input type="text"
									name="immidiateSr" id="immidiateSr" required="required"
									placeholder="Enter Immidiate Sr" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Sr.Position</label> <input type="text" name="srPosition"
									id="srPosition" required="required" placeholder="Enter Sr. Position" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label for="">Immidiate Jr.</label> <input type="text"
									name="immidiatejr" id="immidiatejr" required="required"
									placeholder="Enter Immidiate Jr." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Jr. Position</label> <input type="text"
									name="jrPosition" id="jrPosition" required="required"
									placeholder="Enter Jr. Position" />
							</div>
						</div>
 -->
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Select Branch</label> <select id="Branch"
									name="Branch" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Branch</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>New Position</label> <select id="newPosition" name="newPosition"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">New Position</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">New Senior Code</label> <input type="text" name="newseniorCode"
									id="newseniorCode" required="required" placeholder="Enter New Senior" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Senior Name</label> <input type="text" name="newseniorname"
									id="newseniorname" required="required" placeholder="Enter Senior Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Senior Position</label> <input type="text"
									name="newseniorposition" id="newseniorposition" required="required"
									placeholder="Enter New Senior Position" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle"
								style="background-color: #FFA500;">Update</button>
						</div>

					</div>

				</div>


				<div class="mt-5">
			</form>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/FinancialConsultant/consultantPromotionManagement.js"></script>
</body>

</html>