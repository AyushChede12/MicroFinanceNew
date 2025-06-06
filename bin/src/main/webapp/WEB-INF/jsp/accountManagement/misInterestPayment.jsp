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
<title>MIS INT. Payment</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
<<<<<<< HEAD
			<h1>Account Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-wallet2"></i>
					</a></li>
					<li class="breadcrumb-item action">MIS Interest Payment</li>
=======
			<h1>Account Section</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">MIS INT. Payment</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div class="row">
					<div class="col-lg-12">
						<nav>
							<ol class="breadcrumb breadcrumb-title">
								<li class="breadcrumb-item action mt-3">MIS Policy Details
								</li>
							</ol>
						</nav>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
<<<<<<< HEAD
							<label for="">Policy ID</label> <input type="text" name="age"
=======
							<label for="">Policy No.</label> <input type="text" name="age"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								id="age" required="required" placeholder="Enter Policy No." />
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
<<<<<<< HEAD
							<label for="">Policy Holder</label> <input type="text" name="age"
								id="age" required="required" placeholder="Enter Applicant Name"
								disabled />
=======
							<label for="">Applicant Name</label> <input type="text"
								name="age" id="age" required="required"
								placeholder="Enter Applicant Name" disabled />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
<<<<<<< HEAD
							<label for=""> Issue Date</label> <input type="date"
=======
							<label for="">Policy Date</label> <input type="date"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								name="registrationDate" id="registrationDate"
								required="required" placeholder="" />
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
<<<<<<< HEAD
							<label for="">Insured Amount</label> <input type="text"
								name="age" id="age" required="required"
								placeholder="Enter policy amt" disabled />
=======
							<label for="">Policy Amount</label> <input type="text" name="age"
								id="age" required="required" placeholder="Enter policy amt"
								disabled />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
<<<<<<< HEAD
							<label for="">Accrued Interest</label> <input type="text"
=======
							<label for="">Interest Amount </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								name="age" id="age" required="required"
								placeholder="Enter Interest Amount" disabled />
						</div>
					</div>


					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
<<<<<<< HEAD
							<label for="">Scheme Title</label> <input type="text" name="age"
=======
							<label for="">Scheme Name</label> <input type="text" name="age"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								id="age" required="required" placeholder="Enter Scheme Name "
								disabled />
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
<<<<<<< HEAD
							<label for="">Branch Name </label> <input type="text" name="age"
=======
							<label for="">Policy Branch</label> <input type="text" name="age"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								id="age" required="required" placeholder="Enter policy branch"
								disabled />
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
<<<<<<< HEAD
							<label for="">Client Code </label> <input type="text" name="age"
=======
							<label for="">Member Code</label> <input type="text" name="age"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								id="age" required="required" placeholder="Enter Member Code"
								disabled />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<nav>
							<ol class="breadcrumb breadcrumb-title">
								<li class="breadcrumb-item action mt-3">MIS Payment Details
								</li>
							</ol>
						</nav>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Pay Amount</label> <input type="text" name="age"
								id="age" required="required" placeholder="Enter pay amt"
								disabled />
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields">
<<<<<<< HEAD
							<label for="">Paying Branch</label> <select id="Branch"
=======
							<label for="">Pay Branch</label> <select id="Branch"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								name="Branch" required="required"
								class="form-control selectField" style="height: 30px;">
								<option value="">Select Pay Branch</option>
								<option value="Blue">Blue</option>
							</select>
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
<<<<<<< HEAD
							<label for="">Date of Payment</label> <input type="date"
=======
							<label for="">Pay Date</label> <input type="date"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								name="registrationDate" id="registrationDate"
								required="required" placeholder="Enter Pay Date" />
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields">
<<<<<<< HEAD
							<label for="">Payment Mode </label> <select id="Branch"
=======
							<label for="">Payment By </label> <select id="Branch"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								name="Branch" required="required"
								class="form-control selectField" style="height: 30px;">
								<option value="">Select</option>
								<option value="Blue">Cash</option>
								<option value="Blue">Online</option>
								<option value="Blue">Cheque</option>
								<option value="Blue">Neft</option>
							</select>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-12 text-right mt-3">
						<button id="saveBtn" class="btnStyle"
							style="background-color: #FFA500;">Pay</button>
					</div>
				</div>
			</form>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>