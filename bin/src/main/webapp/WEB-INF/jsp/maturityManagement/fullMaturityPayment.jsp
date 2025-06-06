<<<<<<< HEAD

=======
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
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
			<h1>Maturity Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-calendar-check"></i>
					</a></li>
					<li class="breadcrumb-item action">Full Maturity Payment</li>
=======
			<h1>Maturity Section</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Maturity Payment</li>
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
							<li class="breadcrumb-item action">Serach box</li>
=======
							<li class="breadcrumb-item action">Search Box</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
<<<<<<< HEAD

							<div class="d-flex flex-column formFields">
								<label for="">Branch</label> <select id="colour" name="colour"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">All Branch</option>
=======
							<!-- <div class="d-flex flex-column formFields" style="margin-bottom: 30px">
                <label>Verify With</label>
                <div class="position-relative">
                  <div class="select-btn1" style="cursor: pointer;">
                    <span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span> <i
                      class="fa-solid fa-angle-down"></i>
                  </div>
                  <div class="content" id="contentCityName" style="display: none;">
                    <div class="search">
                      <input type="text" id="city-search" class="m-0" placeholder="Search City" />
                    </div>
                    <ul class="options" id="city-options">
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                    </ul>
                  </div>
                </div>
              </div> -->
							<div class="d-flex flex-column formFields">
								<label for="">Policy No.</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55

								</select>
							</div>
						</div>

<<<<<<< HEAD
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">From Date :</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Member Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4"
								style="margin-bottom: 30px">
								<label>To Date :</label> <input type="date" name="vehicalNo"
									id="vehicalNo" required="required" placeholder=""
									style="text-transform: uppercase;" />
							</div>
						</div>


					</div>
					<div class="row">
						<div class="col-12 text-left">
							<button id="saveBtn" class="btn btn-warning">Search</button>

						</div>
					</div>
				</div>
=======

					</div>











					<div class="mt-5">
						<nav>
							<ol class="breadcrumb breadcrumb-title">
								<li class="breadcrumb-item action">Policy Details</li>
							</ol>
						</nav>
						<div class="row">
							<div class="col-lg-3">
								<!-- <div class="d-flex flex-column formFields" style="margin-bottom: 30px">
                <label>Verify With</label>
                <div class="position-relative">
                  <div class="select-btn1" style="cursor: pointer;">
                    <span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span> <i
                      class="fa-solid fa-angle-down"></i>
                  </div>
                  <div class="content" id="contentCityName" style="display: none;">
                    <div class="search">
                      <input type="text" id="city-search" class="m-0" placeholder="Search City" />
                    </div>
                    <ul class="options" id="city-options">
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                    </ul>
                  </div>
                </div>
              </div> -->
								<div class="d-flex flex-column formFields">
									<label for="">Policy No:</label> <input type="text"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="" style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="vehicalNo">Applicant Name:</label> <input
										type="text" name="vehicalNo" id="vehicalNo"
										required="required" placeholder=""
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Plan Name:</label> <input type="text" name="vehicalNo"
										id="vehicalNo" required="required" placeholder=""
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">plan code:</label> <input type="text"
										name="location" id="location" required="required"
										placeholder="" />
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Term:</label> <input type="text" name="price" id="price"
										required="required" placeholder="" />

								</div>

							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Policy Amount:</label> <input type="text" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Actual Maturity:</label> <input type="text" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Maturity Date:</label> <input type="text" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Sys.Payable:</label> <input type="text" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Deduction(-):</label> <input type="text" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Adjeustment(+):</label> <input type="text" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Net Payable:</label> <input type="text" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Approval Branch:</label> <input type="text" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Approval Date:</label> <input type="date" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Approve Remarks:</label> <input type="text" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Approve User:</label> <input type="text" name="price"
										id="price" required="required" placeholder="" />

								</div>

							</div>

						</div>
					</div>



					<div class="mt-5">
						<nav>
							<ol class="breadcrumb breadcrumb-title">
								<li class="breadcrumb-item action">Payment Deatil</li>
							</ol>
						</nav>
						<div class="row">
							<div class="col-lg-3">
								<!-- <div class="d-flex flex-column formFields" style="margin-bottom: 30px">
                <label>Verify With</label>
                <div class="position-relative">
                  <div class="select-btn1" style="cursor: pointer;">
                    <span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span> <i
                      class="fa-solid fa-angle-down"></i>
                  </div>
                  <div class="content" id="contentCityName" style="display: none;">
                    <div class="search">
                      <input type="text" id="city-search" class="m-0" placeholder="Search City" />
                    </div>
                    <ul class="options" id="city-options">
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                    </ul>
                  </div>
                </div>
              </div> -->
								<div class="d-flex flex-column formFields">
									<label for="">Payment Date:</label> <input type="date"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="" style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="vehicalNo">Pay Branch:</label> <select id="colour"
										name="colour" required="required"
										class="form-control selectField" style="height: 30px;">
										<option value="">Select</option>

									</select>
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Pay Remark:</label> <input type="text" name="vehicalNo"
										id="vehicalNo" required="required" placeholder=""
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Payment By*</label> <select id="colour"
										name="colour" required="required"
										class="form-control selectField" style="height: 30px;">
										<option value="">Select</option>

									</select>
								</div>
							</div>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55




<<<<<<< HEAD


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












=======
						</div>

						<div class="row">
							<div class="col-12 text-right">
								<button id="saveBtn" class="btn btn-warning" sty>Update</button>
							</div>
						</div>
					</div>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
			</form>


		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>