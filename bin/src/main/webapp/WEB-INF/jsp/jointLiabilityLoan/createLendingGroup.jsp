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
					<li class="breadcrumb-item action">Create Lending Group</li>
=======
			<h1>Group Loan Plan Create</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Group Loan Section</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Plan Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Loan Scheme Information </label> <input type="text"
=======
								<label for=""> lone Name </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Minimum Age* </label> <input type="text"
=======
								<label for=""> Min Age* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Min. Loan Duration(months)* </label> <input type="text"
=======
								<label for=""> Min Term* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Type of Loan*</label>
=======
								<label>Loan Type*</label>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="loanName" id="loanNameId" style="font-size: 12px;">Select
											Branch Name</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for=""> Maximum Age* </label> <input type="text"
=======
								<label for=""> Max Age* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Max.Loan Duration(months)* </label> <input type="text"
=======
								<label for=""> Max Term* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>EMI Frequency*</label>
=======
								<label>EMI Mode*</label>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Branch Name</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for=""> Min Loan Amt* </label> <input type="text"
=======
								<label for=""> Min Amt* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Rate of Interest (% p.a.)* </label> <input type="text"
=======
								<label for=""> ROI(%.p.a)* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Interest Type*</label>
=======
								<label>ROI Type*</label>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="loanName" id="loanNameId" style="font-size: 12px;">Select
											Branch Name</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for=""> Maximum Loan Amount* </label> <input type="text"
=======
								<label for=""> Max Amt* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Security Type*</label>
=======
								<label>Security*</label>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="loanName" id="loanNameId" style="font-size: 12px;">Select
											Branch Name</span> <i class="fa-solid fa-angle-down"></i>
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
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>EMI Type*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="loanName" id="loanNameId" style="font-size: 12px;">Select
											Branch Name</span> <i class="fa-solid fa-angle-down"></i>
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
							<div
								class=" h-100 d-flex justify-content-start align-items-center">
								<div
									class="d-flex justify-content-start align-items-center  formFields">
<<<<<<< HEAD
									<label style="margin-left: 20px;" class="mb-2">	Plan Activation Status*</label>
=======
									<label style="margin-left: 20px;" class="mb-2">Plan
										Status*</label>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-member-status"
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-member-status" class="toggle__label"></label>
										</div>
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
							<li class="breadcrumb-item action">Payment Deductions</li>
=======
							<li class="breadcrumb-item action">Deduction Details</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
<<<<<<< HEAD
								<label for=""> Processing Fee (%)* </label> <input type="text"
=======
								<label for=""> Proc.Fee(%)* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Legal Charges (%)* </label> <input type="text"
=======
								<label for=""> Legal.Fee(%)* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for=""> GST(%)* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Insurence.Fee(%)* </label> <input type="text"
=======
								<label for=""> Insuence.Fee(%)* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Valuation Fee (%) * </label> <input type="text"
=======
								<label for=""> ValueFee(%)* </label> <input type="text"
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
							<li class="breadcrumb-item action">Late Fee Information</li>
=======
							<li class="breadcrumb-item action">Late Fine Details</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for=""> Late Allowance Days* </label> <input type="text"
=======
								<label for=""> Grace Period Days* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Penalty Mode*</label>
=======
								<label>Penalty Type*</label>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="loanName" id="loanNameId" style="font-size: 12px;">Select
											Branch Name</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for=""> Monthly Penalty* </label> <input type="text"
=======
								<label for=""> Penalty(p.m.)* </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="location" id="location" required="required"
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

			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">

						<div class="card-body table-responsive">
							<h5 class="card-title">
								Recent Sales <span>| Today</span>
							</h5>

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
		</div>

	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>