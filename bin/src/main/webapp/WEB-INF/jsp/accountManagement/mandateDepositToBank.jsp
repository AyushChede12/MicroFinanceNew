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
<title>Mandate Deposit To Bank</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Account Section</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Unencumbered Team Deposit</li>
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

						<div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">From Date</label> <input type="date"
									name="fromDate" id="fromDate" required="required"
									placeholder="Enter From Date"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">To Date</label> <input type="date"
									name="toDate" id="toDate" required="required"
									placeholder="Enter To Date" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-4 text-left mt-3">
							<button id="saveBtn" class="btnStyle"
								style="background-color: #FFA500;">Search</button>
						</div>
					</div>
				</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<nav>
					<ol class="breadcrumb breadcrumb-title">
						<li class="breadcrumb-item action mt-3">Entry Details</li>
					</ol>
				</nav>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">FD Deposit</label> <input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">MIS Deposit</label> <input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">RD/DRD Deposit</label> <input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Savings Deposit</label> <input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Savings Withdrawal</label> <input type="text"
						name="age" id="age" required="required" placeholder="" />
				</div>
			</div>


			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Flexi Deposit</label> <input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Flexi Withdrawal</label> <input type="text"
						name="age" id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Maturity Principal</label> <input type="text"
						name="age" id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Total Deposit</label> <input type="text" name="age"
						id="age" required="required" placeholder="Total Deposit" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for=""></label>Total Withdrawal <input type="text"
						name="age" id="age" required="required"
						placeholder="Total Withdrawal" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for=""></label>Total Balance<input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for=""></label>Previous FD Deposited<input type="text"
						name="age" id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Unencumbered(10%)</label> <input type="text"
						name="age" id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Unencumbered Amount(10%)</label> <input type="text"
						name="age" id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Bank Name</label> <input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Bank Address</label> <input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">FD No.</label> <input type="text" name="age" id="age"
						required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">FD Amount</label> <input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Maturity Amount</label> <input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields">
					<label for="vehicalNo">FD Date</label> <input type="date"
						name="fromDate" id="fromDate" required="required"
						placeholder="Enter From Date" style="text-transform: uppercase;" />
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields">
					<label for="vehicalNo">Maturity Date</label> <input type="date"
						name="fromDate" id="fromDate" required="required"
						placeholder="Enter From Date" style="text-transform: uppercase;" />
				</div>
			</div>


			<div class="col-lg-3">
				<div class="d-flex flex-column formFields">
					<label for="">Payment By </label> <select id="Branch" name="Branch"
						required="required" class="form-control selectField"
						style="height: 30px;">
						<option value="">Select</option>
						<option value="Blue">Cash</option>
						<option value="Blue">Online</option>
						<option value="Blue">Cheque</option>
						<option value="Blue">Neft</option>
					</select>
				</div>
			</div>

			<div class="col-lg-3">
				<div class="d-flex flex-column formFields mb-4">
					<label for="">Remarks</label> <input type="text" name="age"
						id="age" required="required" placeholder="" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 text-right mt-3">
				<button id="saveBtn" class="btnStyle"
					style="background-color: #FFA500;">Save</button>
			</div>
		</div>
		</form>

		<div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">

					<div class="card-body table-responsive">
						<h5 class="card-title">Search result</h5>

						<table class="table table-borderless datatable overflow-scroll">
							<thead class="table-light">
								<tr style="font-family: 'Poppins', sans-serif;">
									<th scope="col">FD Deposit</th>
									<th scope="col">MIS Deposit</th>
									<th scope="col">RD/DRD Deposite</th>
									<th scope="col">Savings Deposit</th>
									<th scope="col">Savings Withdrawal</th>
									<th scope="col">Flexi Deposit</th>
									<th scope="col">Flexi Withdrawal</th>
									<th scope="col">Maturity Principal</th>
									<th scope="col">Total Deposit</th>
									<th scope="col">Total Withdrawal</th>
									<th scope="col">Total Balance</th>
									<th scope="col">Previous FDDeposited</th>
									<th scope="col">Unencumbered(10%)</th>
									<th scope="col">Unencumbered Amount(10%)</th>
									<th scope="col">Bank Name</th>
									<th scope="col">Bank Address</th>
									<th scope="col">FD No.</th>
									<th scope="col">FD Amount</th>
									<th scope="col">Maturity Amount</th>
									<th scope="col">FD Date</th>
									<th scope="col">Maturity Date</th>
									<th scope="col">Payment By</th>
									<th scope="col">Remarks</th>
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


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>