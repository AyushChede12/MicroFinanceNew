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

<!-- jQuery CDN (latest 3.x version) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Preferences</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-gear"></i>
					</a></li>
					<li class="breadcrumb-item action">Bank Module</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Bank Details</li>
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
							<input type="hidden" name="id" id="id">
							<div class="d-flex flex-column formFields">
								<label for="">Bank Name <span class="star">*</span></label> <input
									type="text" name="bankName" id="bankName" required="required"
									placeholder="Enter Bank Name"
									style="text-transform: uppercase;" /> <small id="chkbankname"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Account No <span class="star">*</span></label> <input
									type="text" name="accountNo" id="accountNo" required="required"
									placeholder="Enter Account No"
									style="text-transform: uppercase;" /> <small id="chkaccountno"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Contact No <span class="star">*</span></label> <input
									type="text" name="contactNo" id="contactNo" required="required"
									placeholder="Enter Contact No"
									style="text-transform: uppercase;" /> <small id="chkcontactno"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Address <span class="star">*</span></label>
								<textarea name="address" id="address"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
								<small id="chkaddress" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Opening Date <span class="star">*</span></label> <input
									type="date" name="openingDate" id="openingDate"
									required="required" style="text-transform: uppercase;" /> <small
									id="chkopeningdate" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Opening Balance <span class="star">*</span></label> <input
									type="text" name="openingBalance" id="openingBalance"
									required="required" placeholder="Enter Opening Balance"
									style="text-transform: uppercase;" /> <small
									id="chkopeningbalance" style="color: red;"></small>
							</div>
						</div>


					</div>

					<div class="row" style="margin-top: 30px;">
						<div class="col-12 text-center">
							<button type="button" id="showBtn" class="btnStyle bg-primary"
								onclick="showTableData()">Show</button>
								<button type="button" id="saveBtn" class="btnStyle bg-warning">Save</button>
							<button type="button" id="hideBtn" class="btnStyle bg-success"
								onclick="hideTableData()">Hide</button>
							<button type="button" id="updateBtn" class="btnStyle bg-success"
								onclick="updateBank()">Update</button>
						</div>
					</div>
				</div>
			</form>

			<div class="mt-5">
				<div class="row mt-5">
					<div class="col-12">
						<div class="card recent-sales">

							<div class="card-body table-responsive">
								<h5 class="card-title">
									Bank Data <span>| Table View</span>
								</h5>

								<table class="table table-borderless datatable overflow-scroll"
									id="tableBody">
									<thead class="table-light">
										<tr style="font-family: 'Poppins', sans-serif;">
											<th scope="col">Sr No</th>
											<th scope="col">Bank Name</th>
											<th scope="col">Account No</th>
											<th scope="col">Contact No</th>
											<th scope="col">Address</th>
											<th scope="col">Opening Date</th>
											<th scope="col">Opening Balance</th>
											<th scope="col">Edit</th>
											<th scope="col">Delete</th>
										</tr>
									</thead>
									<tbody id="tableBody">

									</tbody>
								</table>
								<div class="mt-2 text-center">
									<button id="prevBtn" class="btn btn-sm btn-primary"><i class="bi bi-chevron-double-left"></i></button>
									<span id="pageInfo" class="mx-2"></span>
									<button id="nextBtn" class="btn btn-sm btn-primary"><i class="bi bi-chevron-double-right"></i></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>



		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/preferences/bank.js"></script>

</body>

</html>