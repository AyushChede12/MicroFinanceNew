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
			<h1>Joint Liability Loan</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-person-bounding-box"></i>
					</a></li>
					<li class="breadcrumb-item action">Loan Re-Payment Portal</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Search Details</li>
						</ol>
					</nav>
					<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="groupCode">Select BY GroupID*</label> <select
									id="groupcode" name="groupcode" required
									class="form-control selectField" style="height: 30px;">
									<option value="">Select GroupID</option>
								</select>
							</div>

						</div>
					<!-- <div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Select BY GroupID*</label>
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
											Options will be dynamically added here

										</ul>
									</div>
								</div>
							</div>
						</div> </div> -->
				</div>


				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Info</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo"> Opening Date</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Community Name*</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Branch Name*</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
					
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Loan Scheme Name*</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Community Address* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for="">Contact Number,* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Payment Mode* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Loan Purpose* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Term* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Rate of Interest(%)* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Interest Type* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Loan Amount* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						
						
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> EMI Amount* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						





					</div>
				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Payment Detalis</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Processing Charges* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> GST Value* </label> <input type="text" name="location"
									id="location" required="required" placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Legal Charges* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Insurence Amount* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>



						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields">
								<label for=""> Advisor/Collector Code* </label> <input
									type="text" name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  ">
							<div class="d-flex flex-column formFields">
								<label for=""> Valuation Charges* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  ">
							<div class="d-flex flex-column formFields">
								<label for=""> Agent Name* </label> <input
									type="text" name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

					</div>

					<div class="mt-5">
						<nav>
							<ol class="breadcrumb breadcrumb-title">
								<li class="breadcrumb-item action">Payment Detalis</li>
							</ol>
						</nav>
						<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="groupCode">Cheque Deducted InCash*</label> <select
									id="groupcode" name="groupcode" required
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Cheque Deducted InCash*</option>
								</select>
							</div>

						</div>
							<!-- <div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Cheque Deducted InCash*</label>
									<div class="position-relative">
										<div class="select-btn1" style="cursor: pointer;">
											<span name="loanName" id="loanNameId"
												style="font-size: 12px;">Select GroupID</span> <i
												class="fa-solid fa-angle-down"></i>
										</div>
										<div class="content" id="contentCityName"
											style="display: none;">
											<div class="search">
												<input type="text" id="city-search" class="m-0"
													placeholder="Search" />
											</div>
											<ul class="options" id="city-options">
												Options will be dynamically added here

											</ul>
										</div>
									</div>
								</div>
							</div> -->
							<div class="col-lg-3  mb-4">
								<div class="d-flex flex-column formFields">
									<label for=""> Payment Remarks* </label> <input type="text"
										name="location" id="location" required="required"
										placeholder="Enter Location" />
								</div>
							</div>
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="vehicalNo">Transaction Date</label> <input type="date"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="Enter Vehicle No"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3  mb-4">
								<div class="d-flex flex-column formFields">
									<label for=""> Payment Status* </label> <input type="text"
										name="location" id="location" required="required"
										placeholder="Enter Location" />
								</div>
							</div>
							<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="groupCode">Paid By*</label> <select
									id="groupcode" name="groupcode" required
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Paid By</option>
								</select>
							</div>

						</div>
							<!-- <div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Paid By*</label>
									<div class="position-relative">
										<div class="select-btn1" style="cursor: pointer;">
											<span name="loanName" id="loanNameId"
												style="font-size: 12px;">Select GroupID</span> <i
												class="fa-solid fa-angle-down"></i>
										</div>
										<div class="content" id="contentCityName"
											style="display: none;">
											<div class="search">
												<input type="text" id="city-search" class="m-0"
													placeholder="Search" />
											</div>
											<ul class="options" id="city-options">
												Options will be dynamically added here

											</ul>
										</div>
									</div>
								</div>
							</div> -->







						</div>
						<div class="row mt-4">
							<div class="col-lg-3 mb-5">
								<label for=""
									style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Customer Photo
									</label> <label for="bike1image" id="drop-area"> <input
									type="file" accept="image/*" name="bike1image" id="bike1image"
									hidden="hidden" onchange="bike1Preview();"
									style="background-size: cover; background-repeat: no-repeat" />
									<div id="img-view">
										<img src="./upload.png" alt="upload_icon"
											id="bike1imagePreview" />
										<!-- <p id="upload-text"
                            style="font-size: 12px; margin-top: 15px"
                            class="text-muted"
                          >
                            Drag and drop or Choose File to upload the image
                          </p> -->
									</div>
								</label>
							</div>

							<div class="col-lg-3 mb-5">
								<label for=""
									style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Customer
									Signature</label> <label for="bike2image" id="drop-area"> <input
									type="file" accept="image/*" name="bike2image" id="bike2image"
									hidden="hidden" onchange="bike2Preview();"
									style="background-size: cover; background-repeat: no-repeat" />
									<div id="img-view">
										<img src="./upload.png" alt="upload_icon"
											id="bike2imagePreview" />
										<!-- <p
                            style="font-size: 12px; margin-top: 15px"
                            class="text-muted"
                          >
                            Drag and drop or Choose File to upload the image
                          </p> -->
									</div>
								</label>
							</div>

						</div>
					</div>

					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-success"
								style="margin-left: 80%">Payment</button>

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