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
					<li class="breadcrumb-item action">Early Loan Closure</li>
=======
			<h1>Pre Settlement</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Loan Pre Settlement</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Pre Settlement</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Select Name ID & Name*</label>
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
							<li class="breadcrumb-item action">Loan Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="vehicalNo">Loan Start Date*</label> <input type="date"
=======
								<label for="vehicalNo">Loan Date*</label> <input type="date"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Loan Schemes* </label> <input type="text"
=======
								<label for=""> Plan Name* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Interest Rate Type* </label> <input type="text"
=======
								<label for=""> ROI Type* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Agent Code & Name* </label> <input type="text"
=======
								<label for=""> Code & Name* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Loan Tenure* </label> <input type="text" name="location"
=======
								<label for=""> Term* </label> <input type="text" name="location"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									id="location" required="required" placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Monthly Insatllment* </label> <input type="text"
=======
								<label for=""> EMI Amount* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Nominee Details* </label> <input type="text"
=======
								<label for=""> Relative Details* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">  Interest Amount* </label> <input type="text"
=======
								<label for=""> Total Interest* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Contact NO* </label> <input type="text"
=======
								<label for=""> Mobile NO* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Principal Amount* </label> <input type="text"
=======
								<label for=""> Loan Amount* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Total Loan Principal* </label> <input type="text"
=======
								<label for=""> Total Principal* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Loan Branch </label> <input type="text"
=======
								<label for=""> Branch Name* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Rate of Interest* </label> <input type="text"
=======
								<label for=""> Loan Roi* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Total Payable Amount* </label> <input type="text"
=======
								<label for=""> Total Payable* </label> <input type="text"
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
							<li class="breadcrumb-item action">Payment Detalis</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Settled Interest* </label> <input type="text"
=======
								<label for=""> Paid Interest* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Interest Pending* </label> <input type="text"
=======
								<label for=""> Interest Due* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Agent code* </label> <input type="text"
=======
								<label for=""> Advisior code* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Settled Principal* </label> <input type="text"
=======
								<label for=""> Paid Principal* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> OutStanding Principal * </label> <input type="text"
=======
								<label for=""> Principal Due* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Agent Name* </label> <input type="text"
=======
								<label for=""> Advisor Name* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Total Amount Paid* </label> <input type="text"
=======
								<label for=""> Total Paid* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Total OutStanding* </label> <input type="text"
=======
								<label for=""> Total Due Amt* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Loan Remark* </label> <input type="text"
=======
								<label for=""> Remark* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Payment Branch*</label>
=======
								<label>Pay Branch*</label>
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
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="vehicalNo">Date of Payment</label> <input type="date"
=======
								<label for="vehicalNo">Payment Date</label> <input type="date"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Paid By*</label>
=======
								<label>Payment By*</label>
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
						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Loan Closure Fee*</label>
=======
								<label>Clossing charge*</label>
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
					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-success"
								style="margin-left: 80%">Closing Loan</button>

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