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
<style>
    #img-view img {
      width: 100%;
      max-height: 150px;
      object-fit: cover;
      border: 1px dashed #ccc;
      padding: 5px;
    }
    label {
      cursor: pointer;
    }
  </style>

<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Preferences</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-gear"></i>
					</a></li>
					<li class="breadcrumb-item action">Executive/Founder</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Executive/Founder Details</li>
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
								<label for="">Type</label> <select id="type" name="type"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Type</option>
									<option value="Blue">RD</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Branch Name</label> <select
									id="branchName" name="branchName" required="required"
									class="form-control selectField" style="height: 30px;">
								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Full Name </label> <input type="text"
									name="fullName" id="fullName" required="required"
									placeholder="Enter FullName" />
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Date Of Birth</label> <input type="date"
									name="dateOfBirth" id="dateOfBirth" required="required"
									placeholder="Enter Date Of Birth" />
							</div>
						</div>

						<div class="col-lg-3 mt-4">
							<div class="d-flex flex-column formFields">
								<label for="">DIN/Promoter No </label> <input type="text"
									name="promoterNo" id="promoterNo" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						
						<div class="col-lg-3 mt-4">
							<div class="d-flex flex-column formFields">
								<label for="">Appointment Date</label> <input type="date"
									name="appointmentDate" id="appointmentDate" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>


						<div class="col-lg-3 mt-4">
							<div class="d-flex flex-column formFields">
								<label for="">Relation Name</label> <input type="text"
									name="relationName" id="relationName" required="required"
									placeholder="Enter Relation Name" />
							</div>
						</div>


						<div class="col-lg-3 mt-4">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relation to Applicant</label> <select
									id="relationToApplicant" name="relationToApplicant"
									required="required" class="form-control selectField"
									style="height: 30px;">
								</select>
							</div>
						</div>

						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="address" id="address"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">District</label> <input type="text"
									name="district" id="district" required="required"
									placeholder="Enter District" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>State</label> <select id="state" name="state"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select State</option>
									<option value="Blue">MH</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Pin Code</label> <input type="text" name="pinCode"
									id="pinCode" required="required" placeholder="Enter Pincode" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Aadhar No.</label> <input type="text"
									name="aadharNo" id="aadharNo" required="required"
									placeholder="Enter Adhar No" />
							</div>
						</div>

						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields">
								<label for="">PAN No.</label> <input type="text" name="panNo"
									id="panNo" required="required" placeholder="Enter PAN No" />
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No</label> <input type="text"
									name="contactNo" id="contactNo" required="required"
									placeholder="Enter Contact No" />
							</div>
						</div>

						<div class="col-lg-3 ">
							<div class="d-flex flex-column formFields">
								<label for="">Email ID</label> <input type="text" name="emailId"
									id="emailId" required="required" placeholder="Enter Email ID" />
							</div>
						</div>



						<div class="col-lg-3 mt-4">
							<div class="d-flex flex-column formFields">
								<label for="">Base Value</label> <input type="text"
									name="baseValue" id="baseValue" required="required"
									placeholder="Enter Base Value" />
							</div>
						</div>

						<div class="col-lg-3 mt-4">
							<div class="d-flex flex-column formFields">
								<label for="">Shares Count</label> <input type="text"
									name="shareCount" id="shareCount" required="required"
									placeholder="Enter Shares Count" />
							</div>
						</div>

						<div class="col-lg-3 mt-4">
							<div class="d-flex flex-column formFields">
								<label for="">Share Amount</label> <input type="text"
									name="shareAmount" id="shareAmount" required="required"
									placeholder="Enter Email id" />
							</div>
						</div>




					</div>

					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Photo</label> <label for="photoName" id="drop-area"> <input
								type="file" accept="image/*" name="photoName" id="photoName"
								hidden="hidden" onchange="bike1Preview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="photoPreview" />
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
								Signature</label> <label for="signatureName" id="drop-area"> <input
								type="file" accept="image/*" name="signatureName" id="signatureName"
								hidden="hidden" onchange="bike2Preview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="signaturePreview" />
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
							<li class="breadcrumb-item action">Payment Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Deposit Acc</label> <select id="depositAcc"
									name="depositAcc" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Deposit Acc</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row" style="margin-top: 30px;">
						<div class="col-12 text-center">
							<button type="button" id="showBtn" class="btnStyle bg-primary"
								onclick="showTableData()">Show</button>
							<button type="button" id="hideBtn" class="btnStyle bg-success"
								onclick="hideTableData()">Hide</button>
							<button type="button" id="saveBtn" class="btnStyle bg-warning"
								onclick="saveExecutive()">Save</button>
						</div>
					</div>
			</form>


		</div>
		</div>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/preferences/executivePromoter.js"></script>
</body>

</html>