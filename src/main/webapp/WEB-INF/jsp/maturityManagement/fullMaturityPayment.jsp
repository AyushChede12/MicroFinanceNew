
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
			<h1>Maturity Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-calendar-check"></i>
					</a></li>
					<li class="breadcrumb-item action">Full Maturity Payment</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Serach box</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">

							<div class="d-flex flex-column formFields">
								<label for="">Branch <span id="star"> *</span></label> <select id="branch" name="branch"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">All Branch</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">From Date <span id="star"> *</span> :</label> <input type="date"
									name="fromDate" id="fromDate" required="required"
									placeholder="Enter Member Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4"
								style="margin-bottom: 30px">
								<label>To Date <span id="star"> *</span> :</label> <input type="date" name="toDate"
									id="toDate" required="required" placeholder=""
									style="text-transform: uppercase;" />
							</div>
						</div>


					</div>
					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btn btn-dark">Search</button>

						</div>
					</div>
				</div>






				<div class="row mt-5">
					<div class="col-12">
						<div class="card recent-sales">

							<div class="card-body table-responsive">
								<h5 class="card-title">
									<center>Marurity Payment Report</center>
									<span>|</span>
								</h5>

								<table class="table table-borderless datatable overflow-scroll">
									<thead class="table-light">
										<tr style="font-family: 'Poppins', sans-serif;">
											<th scope="col">slno</th>
											<th scope="col">Policy No.</th>
											<th scope="col">Application name</th>
											<th scope="col">Pay Branch</th>
											<th scope="col">Pay Date</th>
											<th scope="col">Approval Date</th>
											<th scope="col">Amount</th>
											<th scope="col">Principal</th>
											<th scope="col">Interest</th>
											<th scope="col">Paymodel</th>
											<th scope="col">SB Account</th>
											<th scope="col">Pay Remarks</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
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