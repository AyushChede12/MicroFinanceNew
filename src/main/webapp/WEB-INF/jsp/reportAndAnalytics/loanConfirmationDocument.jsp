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
<title>Loan Sheet Print</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Reports & Analytics</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-file-earmark-text"></i>
					</a></li>
					<li class="breadcrumb-item action">Loan Confirmation Document</li>
				</ol>
			</nav>
		</div>
		<div>
			<nav>
				<ol class="breadcrumb breadcrumb-title">
					<li class="breadcrumb-item action">Find Box</li>
				</ol>
			</nav>
			<div class="row">
				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="loanPlanName">Plan Name</label> <select
							id="loanPlanName" name="loanPlanName" required="required"
							class="form-control selectField mb-4" style="height: 30px;">
						</select>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="financialCode">Financial Code</label> <input
							type="text" name="financialCode" id="financialCode"
							required="required" placeholder="Enter Financial Code" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for="toDate">To Date</label> <input type="date"
							name="toDate" id="toDate" required="required"
							style="text-transform: uppercase;" />
					</div>
				</div>

			</div>
		</div>
		<div class="row">
			<div class="col-4 text-start mt-3">
				<button id="findBtn" class="btn btn-dark">Find</button>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">
					<div class="card-body table-responsive">
						<div class="">
							<h5 class="card-title">
								Find Result <span></span>
							</h5>
							<div class="text-center col-lg-12">
								<label class="font-weight-bold">Collection Record</label>
							</div>

							<div>
								<label class="col-lg-3">Collector Code :</label> <label
									class="col-lg-6">Collector Name :</label>
							</div>
						</div>
						<div style="overflow-x: auto; white-space: nowrap;">
							<table class="table table-borderless datatable">
								<thead class="table-light">
									<tr style="font-family: 'Poppins', sans-serif;">
										<th scope="col">SR. NO</th>
										<th scope="col">LOAN ID</th>
										<th scope="col">APPLICANT NAME</th>
										<th scope="col">LOAN TYPE</th>
										<th scope="col">LOAN AMOUNT</th>
										<th scope="col">DISBURSED AMOUNT</th>
										<th scope="col">INTEREST RATE</th>
										<th scope="col">DURATION</th>
										<th scope="col">LOAN START DATE</th>
										<th scope="col">LOAN END DATE</th>
										<th scope="col">TOTAL PAID AMOUNT</th>
										<th scope="col">OUTSTANDING BALANCE</th>
										<th scope="col">CONFIRMATION STATUS</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

	</main>
	<script src="./js/adminscript.js"></script>
	<script src="./js/ReportsAndAnalytics/loanConfirmationDocument.js"></script>
</body>

</html>