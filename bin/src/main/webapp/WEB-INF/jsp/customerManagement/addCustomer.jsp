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
			<h1>Customer Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-people-fill"></i>
					</a></li>
					<li class="breadcrumb-item action"> Add Customer</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Customer Details</li>
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
								<label for="">Authenticate for</label> <select id="authenticate"
									name="authenticate" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select </option>
									<option value="aadhar">Aadhar</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Sign-up Date</label> <input
									type="date" name="signupdate" id="signupdate" required="required"
									placeholder="Enter Sign-up Date"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>(Mr/Ms)</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="msgender" id="msgender" style="font-size: 12px;">Select</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
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
							<div class="d-flex flex-column formFields">
								<label for="">Customer Name </label> <input type="text"
									name="custName" id="custName" required="required"
									placeholder="Enter Customer Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Minor</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Yes(Below
											18)</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search City" />
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
								<label for="">Family Member Name</label> <input type="text"
									name="familymemberName" id="familymemberName" required="required"
									placeholder="Enter Family Member Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relation to Applicant</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="relationtoApplicant" id="relationtoApplicant" style="font-size: 12px;">Select
											Relation to Applicant</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentrelationToApplicant"
										style="display: none;">
										<div class="search">
											<input type="text" id="applicant" class="m-0"
												placeholder="Search Relation" />
										</div>
										<ul class="options" id="relation-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Gender</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Gender</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for="">DOB</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter DOB" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Age</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Age" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relationship Status </label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="relationshipstatus" id="relationshipstatus" style="font-size: 12px;">Select
											Relationship Status</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for="">Address</label>
								<textarea name="" id=""
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>State</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											State</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for="">District</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter District" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Aadhar No</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Adhar No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Pin Code</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Pincode" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Branch Name</label>
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
								<label for="">PAN No</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter PAN No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Voter No</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Voter No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Driving Licence No</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Licence No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Referral Code</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="referralcode" id="referralcode" style="font-size: 12px;">Select
											Code</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentreferralcode"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
										</div>
										<ul class="options" id="city-options">

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Referral Name</label> <input type="text"
									name="referralname" id="referralname" required="required"
									placeholder="Enter Referral Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No</label> <input type="text" name="contactno"
									id="coontactno" required="required" placeholder="Enter Contact No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Email id</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Email id" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Profession</label> <input type="text" name="profession"
									id="profession" required="required" placeholder="Enter Profession" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Academic background</label> <input type="text" name="academicBackground"
									id="academicBackground" required="required" placeholder="Enter Academic background" />
							</div>
						</div>
					</div>

					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Photo</label> <label for="bike1image" id="drop-area"> <input
								type="file" accept="image/*" name="bike1image" id="bike1image"
								hidden="hidden" onchange="bike1Preview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
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
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Signature</label> <label for="bike2image" id="drop-area"> <input
								type="file" accept="image/*" name="bike2image" id="bike2image"
								hidden="hidden" onchange="bike2Preview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
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


				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Nominee Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Authenticate for</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search City" />
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
								<label for="vehicalNo">Sign-up Date</label> <input
									type="date" name="signup" id="signup" required="required"
									placeholder="Enter Sign-up Date"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>(Mr/Ms)</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search City" />
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
								<label for="">Customer Name </label> <input type="text"
									name="custName" id="custName" required="required"
									placeholder="Enter Customer Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Minor</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Yes(Below
											18)</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search City" />
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
								<label for="">Family Member Name</label> <input type="text"
									name="familyMemberName" id="familyMemberName" required="required"
									placeholder="Enter Family Member Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relation to Applicant</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="relationtoApplicant" id="relationtoApplicant" style="font-size: 12px;">Select
											 Relation to Applicant</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search elative Relation" />
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
								<label>Gender</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Gender</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for="">Date Of Birth</label> <input type="text" name="dob"
									id="dob" required="required" placeholder="Enter DOB" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Age</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Age" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relationship Status </label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="relationshipStatus" id=""relationshipStatus"" style="font-size: 12px;">Select
											Relationship Status</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for="">Address</label>
								<textarea name="" id=""
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>State</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											State</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for="">District</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter District" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Aadhar No</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Adhar No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Pin Code</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Pincode" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Branch Name</label>
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
								<label for="">PAN No</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter PAN No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Voter No</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Voter No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Driving Licence No</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Licence No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Referral Code</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="referralCode" id="referralCode" style="font-size: 12px;">Select
											Referral Code</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
										</div>
										<ul class="options" id="city-options">

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Referral Name</label> <input type="text"
									name="referralName" id="referralName" required="required"
									placeholder="Enter Referral Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No</label> <input type="text" name="contactNo"
									id="contactNo" required="required" placeholder="Enter Mobile No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Email id</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Email id" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Profession</label> <input type="text" name="profession"
									id="profession" required="required" placeholder="Enter Profession" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Academic background</label> <input type="text" name="adademicBackground"
									id="adademicBackground" required="required" placeholder="Enter Academic background
" />
							</div>
						</div>
					</div>

					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Photo</label> <label for="bike1image" id="drop-area"> <input
								type="file" accept="image/*" name="bike1image" id="bike1image"
								hidden="hidden" onchange="bike1Preview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
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
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Signature</label> <label for="bike2image" id="drop-area"> <input
								type="file" accept="image/*" name="bike2image" id="bike2image"
								hidden="hidden" onchange="bike2Preview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
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
						<button id="saveBtn" class="btnStyle bg-success">Save</button>
						<button id="saveBtn" class="btnStyle"
							style="background-color: #FFA500;">Update</button>
						<button id="saveBtn" class="btnStyle bg-primary">Print</button>
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