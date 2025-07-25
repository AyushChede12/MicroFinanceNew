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
			<h1>Joint Liability Loan</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-person-bounding-box"></i>
					</a></li>
					<li class="breadcrumb-item action">Installment Re-Payment</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Info</li>
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
							<li class="breadcrumb-item action">Loan Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Loan Issue Date*</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Scheme Name* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Interest Type* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for=""> Customer Id & Name* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for=""> Loan Tenure* </label> <input type="text" name="location"
									id="location" required="required" placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for=""> EMI Value* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Nominee Info* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Interest Amount* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Contact NO* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Principal Amount* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Total Calulated Principal* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Loan Branch* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Rate Of Interest* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Full Payable Amount* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>



					</div>
				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Payment Detalis</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Pending Interest* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Payment Date* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Agent Code* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Due Principal Amount* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="groupCode">Select deduction*</label> <select
									id="groupCode" name="groupCode" required
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Customer Name</option>
								</select>
							</div>
						</div>
				
						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields">
								<label for=""> Agent Name* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  ">
							<div class="d-flex flex-column formFields">
								<label for=""> Total OutStanding Amount* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  ">
							<div class="d-flex flex-column formFields">
								<label for=""> Amount Paid* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Payment Remark* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Insatllment Due Date*</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Net Payable*</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Payment Branch*</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>







						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields ">
								<label for="groupCode">Paid BY*</label> <select
									id="groupCode" name="groupCode" required
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Customer Name</option>
								</select>
							</div>
						</div>
				

						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Prepaid Amount*</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>






					</div>
					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-success"
								style="margin-left: 80%">Save</button>

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