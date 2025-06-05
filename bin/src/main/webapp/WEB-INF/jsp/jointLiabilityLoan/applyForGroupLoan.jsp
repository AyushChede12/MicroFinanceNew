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
<<<<<<< HEAD
			<h1>Joint Liability Loan</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-person-bounding-box"></i>
					</a></li>
					<li class="breadcrumb-item action">Apply For Group Loan</li>
=======
			<h1>Group Loan Application</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Group Loan Application</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
<<<<<<< HEAD
							<li class="breadcrumb-item action">Data Search Panel</li>
=======
							<li class="breadcrumb-item action">Search Details</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Find by Group Code*</label>
=======
								<label>Serach BY GroupID*</label>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="loanName" id="loanNameId" style="font-size: 12px;">Select
											GroupID</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>



					</div>


				</div>


				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
<<<<<<< HEAD
							<li class="breadcrumb-item action">Group Profile</li>
=======
							<li class="breadcrumb-item action">Group Details</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="vehicalNo">Loan Application Date*</label> <input type="date"
=======
								<label for="vehicalNo">Loan Date*</label> <input type="date"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Name of Group* </label> <input type="text"
=======
								<label for=""> Group Name* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Assigned Loan Officer* </label> <input type="text"
=======
								<label for=""> Assign Employee* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Branch Name*</label>
=======
								<label>Loan Branch*</label>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="loanName" id="loanNameId" style="font-size: 12px;">Select
											GroupID</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Weekly Collection Day* </label> <input type="text"
=======
								<label for=""> Collection Day* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">	Group Leader* </label> <input type="text"
=======
								<label for=""> Group Leader Name* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Mode of Collection* </label> <input type="text"
=======
								<label for=""> Collection Type* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">	Contact Number* </label> <input type="text"
=======
								<label for=""> Mobile No.* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Purpose of Loan* </label> <input type="text"
=======
								<label for=""> Loan Purpose.* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>



					</div>
				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
<<<<<<< HEAD
							<li class="breadcrumb-item action">Financial Deductions</li>
=======
							<li class="breadcrumb-item action">Deduction Details</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Loan Processing Fee* </label> <input type="text"
=======
								<label for=""> Processing Fees* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> 	GST Amount* </label> <input type="text" name="location"
=======
								<label for=""> GST* </label> <input type="text" name="location"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									id="location" required="required" placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> 	Legal Charges* </label> <input type="text"
=======
								<label for=""> Legal Amt* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Insurence Fee* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>


						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Legal Charges* </label> <input type="text"
=======
								<label for=""> Stamp Duty* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Penalty Charge* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> EMI SMS Service Charge * </label> <input type="text"
=======
								<label for=""> SMS Charge/EMI * </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> 	Transportation Cost per EMI* </label> <input type="text"
=======
								<label for=""> Fuel Charge/EMI* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Loan Maintenance Fee* </label> <input type="text"
=======
								<label for=""> Maintenance Charge* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Overdue Interest (Total)* </label> <input
=======
								<label for=""> Overdue Interest Charge* </label> <input
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									type="text" name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Additional Overdue Interest* </label> <input
=======
								<label for=""> Overdue Interest Charge* </label> <input
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									type="text" name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Stationery Fee per EMI* </label> <input
=======
								<label for=""> Stationary Charge/EMI* </label> <input
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									type="text" name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">	Collection Handling Fee per EMI* </label> <input
=======
								<label for=""> Collection Charge/EMI* </label> <input
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									type="text" name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Advisor/Collector ID* </label> <input
=======
								<label for=""> Advisor Collector Code* </label> <input
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									type="text" name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Advisor/Collector Full Name* </label> <input
=======
								<label for=""> Advisor/Collector Name* </label> <input
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									type="text" name="location" id="location" required="required"
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