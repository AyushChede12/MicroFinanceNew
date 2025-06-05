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
			<h1>Joint Liability Loan/h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-person-bounding-box"></i>
					</a></li>
					<li class="breadcrumb-item action">Loan Approval</li>
=======
			<h1>Group Loan Approval</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Group Loan Approval</li>
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
								<label>Serach BY LoanID*</label>
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
							<li class="breadcrumb-item action">Loan Details</li>
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
								<label for=""> Customer Group Name* </label> <input type="text"
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
								<label for=""> Assign Officer* </label> <input type="text"
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
								<label>Branch Office*</label>
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
								<label for=""> Collection Schedule* </label> <input type="text"
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
								<label for=""> Group Head* </label> <input type="text"
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
								<label for=""> Payment Mode* </label> <input type="text"
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
								<label for=""> Contact Number* </label> <input type="text"
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
							<li class="breadcrumb-item action">Loan Approval Info</li>
=======
							<li class="breadcrumb-item action">Approval Detalis</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="vehicalNo">Date of Approval*</label> <input type="date"
=======
								<label for="vehicalNo">Approval Date*</label> <input type="date"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Approval Branch*</label>
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