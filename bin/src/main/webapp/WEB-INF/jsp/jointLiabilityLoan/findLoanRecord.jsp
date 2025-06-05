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
					<li class="breadcrumb-item action">Find Loan Record</li>
=======
			<h1>Loan Search</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Search Box</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
<<<<<<< HEAD
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Search for Print</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Loan Branch*</label>
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
								<label for="vehicalNo">Start Date:</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">End Date

:</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Customer Name:</label> <input
									type="date" name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Loan Reference No.*</label>
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
								<label for="vehicalNo">Customer code:</label> <input type="text"
									name="membercode" id="vehicalNo" required="required"
									placeholder="Enter membercode"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Scheme Name:</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter plan name"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Agent Code:</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Advisor code"
									style="text-transform: uppercase;" />
							</div>
						</div>



					</div>
					<div class="row">
						<div class="col-12 text-center">

							<button id="saveBtn" class="btnStyle"
								style="background-color: #FFA500;">
								<i class="bi bi-search"></i>Serach
							</button>

=======
				<div class="row">

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Branch</label> <select id="colour" name="colour"
								required="required" class="form-control selectField"
								style="height: 30px;">
								<option value="">Select Branch</option>
								<option value="Blue">Branch1</option>
								<option value="Blue">Branch2</option>
								<option value="Blue">Branch3</option>
							</select>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="loanName">From Date:</label> <input type="date"
								name="vehicalNo" id="vehicalNo" required="required"
								placeholder="" style="text-transform: uppercase;" />
						</div>
					</div>
					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="loanName">To Date:</label> <input type="date"
								name="vehicalNo" id="vehicalNo" required="required"
								placeholder="" style="text-transform: uppercase;" />
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Applicant Name: </label> <input type="text"
								name="location" id="location" required="required"
								placeholder="Enter Application Name" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</div>
					</div>


<<<<<<< HEAD
				</div>




			</form>
			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">

						<div class="card-body table-responsive">
							<h5 class="card-title">Serach Result</h5>

							<table class="table table-borderless datatable overflow-scroll">
								<thead class="table-light">
									<tr style="font-family: 'Poppins', sans-serif;">
										<th scope="col">#</th>
										<th scope="col">Customer</th>
										<th scope="col">Product</th>
										<th scope="col">Price</th>
										<th scope="col">Status</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
									<tr style="font-family: 'Poppins', sans-serif;">
										<th scope="row"><a href="#">1</a></th>
										<td>Arun Kumar</td>
										<td><a href="#" className="text-primary">Milk</a></td>
										<td>$29</td>
										<td><span class="badge bg-success text-white">Approved</span>
										</td>
										<td class="d-flex" style="gap: .7rem;">
											<button class="iconbutton">
												<i class="fa-solid fa-pen-to-square text-success"></i>
											</button>
											<button class="iconbutton">
												<i class="fa-solid fa-eye text-primary"></i>
											</button>
											<button class="iconbutton">
												<i class="fa-solid fa-trash text-danger"></i>
											</button>
										</td>
									</tr>

									<tr>
										<th scope="row"><a href="#">2</a></th>
										<td>Deepak Dalwe</td>
										<td><a href="#" className="text-primary">Ghee</a></td>
										<td>$16.5</td>
										<td><span class="badge bg-danger text-white">Rejected</span>
										</td>
										<td class="d-flex" style="gap: .7rem;">
											<button class="iconbutton">
												<i class="fa-solid fa-pen-to-square text-success"></i>
											</button>
											<button class="iconbutton">
												<i class="fa-solid fa-eye text-primary"></i>
											</button>
											<button class="iconbutton">
												<i class="fa-solid fa-trash text-danger"></i>
											</button>
										</td>
									</tr>
									<tr>
										<th scope="row"><a href="#">2</a></th>
										<td>Deepak Dalwe</td>
										<td><a href="#" className="text-primary">Ghee</a></td>
										<td>$16.5</td>
										<td><span class="badge bg-danger text-white">Rejected</span>
										</td>
										<td class="d-flex" style="gap: .7rem;">
											<button class="iconbutton">
												<i class="fa-solid fa-pen-to-square text-success"></i>
											</button>
											<button class="iconbutton">
												<i class="fa-solid fa-eye text-primary"></i>
											</button>
											<button class="iconbutton">
												<i class="fa-solid fa-trash text-danger"></i>
											</button>
										</td>
									</tr>
									<tr>
										<th scope="row"><a href="#">2</a></th>
										<td>Deepak Dalwe</td>
										<td><a href="#" className="text-primary">Ghee</a></td>
										<td>$16.5</td>
										<td><span class="badge bg-danger text-white">Rejected</span>
										</td>
										<td class="d-flex" style="gap: .7rem;">
											<button class="iconbutton">
												<i class="fa-solid fa-pen-to-square text-success"></i>
											</button>
											<button class="iconbutton">
												<i class="fa-solid fa-eye text-primary"></i>
											</button>
											<button class="iconbutton">
												<i class="fa-solid fa-trash text-danger"></i>
											</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>




=======
					<div class="col-lg-3">

						<div class="d-flex flex-column formFields"
							style="margin-bottom: 30px">
							<label> Loan Id: </label>
							<div class="position-relative">
								<div class="select-btn1" style="cursor: pointer;">
									<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
										Loan Id </span> <i class="fa-solid fa-angle-down"></i>
								</div>
								<div class="content" id="contentCityName" style="display: none;">
									<div class="search">
										<input type="text" id="city-search" class="m-0"
											placeholder="Search City" />
									</div>
									<ul class="options" id="city-options">
										<li>A</li>
										<li>A</li>
										<li>A</li>
										<li>A</li>
										<li>A</li>
									</ul>
								</div>

							</div>
						</div>
					</div>

					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Member Code: </label> <input type="text"
								name="location" id="location" required="required"
								placeholder="Enter Member Code" />
						</div>
					</div>
					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Plan Name: </label> <input type="text"
								name="location" id="location" required="required"
								placeholder="Enter Plan Name" />
						</div>
					</div>
					<div class="col-lg-3">
						<div class="d-flex flex-column formFields mb-4">
							<label for="">Advisor Code: </label> <input type="text"
								name="location" id="location" required="required"
								placeholder="Enter Advisor Code" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 text-center">

						<button id="saveBtn" class="btnStyle"
							style="background-color: #FFA500;">Search</button>
						<button id="saveBtn" class="btnStyle bg-primary">Print</button>

					</div>
				</div>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
		</div>






<<<<<<< HEAD
=======

		</form>
		<div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">

					<div class="card-body table-responsive">
						<h5 class="card-title">
							Search Results <span>| Today</span>
						</h5>

						<table class="table table-borderless datatable overflow-scroll">
							<thead class="table-light">
								<tr style="font-family: 'Poppins', sans-serif;">
									<th scope="col">Member Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Age</th>
									<th scope="col">Phone no.</th>
									<th scope="col">Address</th>
									<th scope="col">Loan Plan Name</th>
									<th scope="col">Loan Date</th>
									<th scope="col">Loan Amount</th>
									<th scope="col">Loan Purpose</th>


								</tr>
							</thead>
							<tbody>




							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>



>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>