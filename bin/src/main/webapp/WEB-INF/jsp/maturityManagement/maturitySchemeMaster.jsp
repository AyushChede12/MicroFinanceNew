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
					<li class="breadcrumb-item action">Maturity Scheme Master</li>
=======
			<h1>Maturity Section</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Maturity configure</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Daily Deposit</li>
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
<<<<<<< HEAD
								<label for="">Policy Code*</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Policy Code</option>
=======
								<label for="">Plan Code*</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">DRD ADVANTEGE</option>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Inst.From*</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Inst.From"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Inst. To*</label> <input type="text" name="vehicalNo"
									id="vehicalNo" required="required" placeholder="Enter Inst.To"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Interest Rate*</label> <input type="text" name="location"
=======
								<label for="">ROI*</label> <input type="text" name="location"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									id="location" required="required" placeholder="Enter ROI" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Deduction </label> <input type="text" name="price"
=======
								<label>Deduction</label> <input type="text" name="price"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									id="price" required="required" placeholder="Enter Deduction" />

							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-12 text-left">
							<button id="saveBtn" class="btnStyle bg-success">Save</button>
						</div>
					</div>
				</div>












				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Recurring Deposite</li>
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
<<<<<<< HEAD
								<label for="">Policy Code*</label> <select id="colour"
=======
								<label for="">Plan Code*</label> <select id="colour"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">GROW</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Inst.From*</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Inst.From"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Inst. To*</label> <input type="text" name="vehicalNo"
									id="vehicalNo" required="required" placeholder="Enter Inst.To"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Interest Rate *</label> <input type="text" name="location"
=======
								<label for="">ROI*</label> <input type="text" name="location"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									id="location" required="required" placeholder="Enter ROI" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deduction</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Deduction" />

							</div>

						</div>

					</div>

					<div class="row">
						<div class="col-12 text-left">
							<button id="saveBtn" class="btnStyle bg-success">Save</button>
						</div>
					</div>
				</div>



				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Fixed Deposit</li>
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
<<<<<<< HEAD
								<label for="">Policy Code*</label> <select id="colour"
=======
								<label for="">Plan Code*</label> <select id="colour"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">ROYAL FI</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Months From*</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Months.From"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Months To*</label> <input type="text" name="vehicalNo"
									id="vehicalNo" required="required"
									placeholder="Enter Months.To"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Interest Rate*</label> <input type="text" name="location"
=======
								<label for="">ROI*</label> <input type="text" name="location"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									id="location" required="required" placeholder="Enter ROI" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deduction</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Deduction" />

							</div>

						</div>

					</div>

					<div class="row">
						<div class="col-12 text-left">
							<button id="saveBtn" class="btnStyle bg-success">Save</button>
						</div>
					</div>
				</div>





				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">MIS Deposit</li>
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
<<<<<<< HEAD
								<label for="">Policy Code*</label> <select id="colour"
=======
								<label for="">Plan Code*</label> <select id="colour"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">ALL</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Months From*</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Months.From"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Months To*</label> <input type="text" name="vehicalNo"
									id="vehicalNo" required="required"
									placeholder="Enter Months.To"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Interest Rate*</label> <input type="text" name="location"
=======
								<label for="">ROI*</label> <input type="text" name="location"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									id="location" required="required" placeholder="Enter ROI" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deduction</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Deduction" />

							</div>

						</div>

					</div>

					<div class="row">
						<div class="col-12 text-left">
							<button id="saveBtn" class="btnStyle bg-success">Save</button>
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