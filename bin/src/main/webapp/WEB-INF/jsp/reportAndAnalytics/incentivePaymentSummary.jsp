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
<title>Incentive Payment Report</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
<<<<<<< HEAD
			<h1>Reports & Analytics</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-file-earmark-text"></i>
					</a></li>
					<li class="breadcrumb-item action">Incentive Payment Summary</li>
=======
			<h1>Report Section</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Incentive Payment Report</li>
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
							<li class="breadcrumb-item action">Find Box</li>
=======
							<li class="breadcrumb-item action">Search Box</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</ol>
					</nav>
					<div class="row">


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="">Branch </label> <select id="branch" name="branch"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Branch</option>
									<option value="Blue">Umrer</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">From Date :</label> <input type="date"
									name="fDate" id="fDate" required="required"
									placeholder="Enter fDate" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">TO Date :</label> <input type="date" name="tDate"
									id="tDate" required="required" placeholder="Enter tDate"
									style="text-transform: uppercase;" />
							</div>
						</div>

					</div>

					<div class="row">
						<div class="col-4 text-start mt-3">
<<<<<<< HEAD
							<button id="searchBtn" class="btnStyle bg-warning">Find</button>
=======
							<button id="searchBtn" class="btnStyle bg-warning">Search</button>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</div>
					</div>

				</div>

			</form>

			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">

						<div class="card-body table-responsive">
<<<<<<< HEAD
							<h5 class="card-title">Find Result</h5>

							<h6 class="card-title" style="text-align: center; color: black;">
								Bonus Payment Statement</h6>
=======
							<h5 class="card-title">Search Result</h5>

							<h6 class="card-title" style="text-align: center; color: black;">
								Incentive Payment Report</h6>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55



							<div style="overflow-x: auto; white-space: nowrap;">
								<table class="table table-borderless datatable">
									<thead class="table-light">
										<tr style="font-family: 'Poppins', sans-serif;">
											<th scope="col">Branch</th>
											<th scope="col">Pay Date</th>
											<th scope="col">Advisor Code</th>
											<th scope="col">Advisor Name</th>
											<th scope="col">Month</th>
											<th scope="col">Amount</th>
											<th scope="col">Pay Mode</th>
											<th scope="col">Chq No.</th>
											<th scope="col">SB Account</th>


										</tr>
									</thead>
									<tbody>
										<tr style="font-family: 'Poppins', sans-serif;">
											<td>Umrer</td>
											<td>11-05-2025</td>
											<td>A0001</td>
											<td>poonam</td>
											<td>3</td>
											<td>400</td>
											<td>cash</td>
											<td>ch001</td>
											<td>sb</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>