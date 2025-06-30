<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
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

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<title>Approve New Client Request</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Request Approvals</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-check-circle"></i>
					</a></li>
					<li class="breadcrumb-item action"> Approve New Client Request</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Find Box</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="">Branch Name</label> <select id="branchName" name="branchName"
									required="required" class="form-control selectField"
									style="height: 30px;">


									<option value="">Select Branch</option>
									

								</select>
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Code</label> <select id="Code" name="Code"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Member Code</option>
								</select>
							</div>
							   
						</div>
						<!-- <div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Date From</label> <input type="date"
									name="dateFrom" id="dateFrom" required="required"
									placeholder="Enter From Date"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Date To</label> <input type="date"
									name="dateTo" id="dateTo" required="required"
									placeholder="Enter To Date" style="text-transform: uppercase;" />
							</div>
						</div> -->
					</div>
				</div>
		</div>

		<div class="row">
			<div class="col-12 text-center mt-3">
				<button id="saveBtn" class="btnStyle"
					style="background-color: #FFA500;">FIND</button>
			</div>
		</div>
		</form>

		<div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">

					<div class="card-body table-responsive">
						<h5 class="card-title">Search result</h5>

						<div style="overflow-x: auto; white-space: nowrap;">
							<table class="table table-borderless datatable">
								<thead class="table-light">
									<tr style="font-family: 'Poppins', sans-serif;">
										<th scope="col">Sr No.</th>
										<th scope="col">Customer Name</th>
										<th scope="col">Date of Birth</th>
										<th scope="col">Age</th>
										<th scope="col">Gender</th>
										<th scope="col">Address</th>
										<th scope="col">Academic background</th>
										<th scope="col">Aadhar No</th>
										<th scope="col">PAN No</th>
										<th scope="col">Contact No</th>
										<th scope="col">Email Id</th>
										<th scope="col">Branch Name</th>
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
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/RequestApproval/ApprovalNewClientRequest.js"></script>
</body>

</html>