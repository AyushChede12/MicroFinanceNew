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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

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
					<li class="breadcrumb-item action">Company Administration</li>
				</ol>
			</nav>

		</div>

		<div class="row">
			<div class="col-12 d-flex justify-content-end">
				<button type="button" id="editBtn" class="btn btn-outline-secondary"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Edit">
					<i class="bi bi-pen-fill"></i>
				</button>
			</div>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Company Details</li>
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
								<label for="">Company Name <span class="star">*</span></label> <input type="text"
									readonly="readonly" name="companyName" id="companyName"
									required="required" placeholder="Enter Company Name"
									style="text-transform: uppercase;" />
									<small id="chkcompanyname" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Short Name <span class="star">*</span></label> <input type="Text" name="shortName"
									readonly="readonly" id="shortName" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
									<small id="chkshortname" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Sign-Up Date <span class="star">*</span></label> <input type="Date"
									readonly="readonly" name="signUpDate" id="signUpDate"
									required="required" placeholder="Enter Sign-Up Date"
									style="text-transform: uppercase;" />
									<small id="chksignupdate" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>CIN No <span class="star">*</span></label> <input type="Text" name="cinNo"
									readonly="readonly" id="cinNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
									<small id="chkcinno" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>PAN <span class="star">*</span></label> <input type="Text" name="pan" id="pan"
									readonly="readonly" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
									<small id="chkpan" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>TAN <span class="star">*</span></label> <input type="Text" name="tan" id="tan"
									readonly="readonly" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
									<small id="chktan" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>GSTIN <span class="star">*</span></label> <input type="Text" name="gstin" id="gstin"
									readonly="readonly" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
									<small id="chkgstin" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Declared Value <span class="star">*</span></label> <input type="Text"
									name="declaredValue" id="declaredValue" required="required"
									readonly="readonly" placeholder="Enter Declared Value "
									style="text-transform: uppercase;" />
									<small id="chkdeclaredvalue" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Address <span class="star">*</span></label>
								<textarea name="address" id="address" readonly="readonly"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
									<small id="chkaddress" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">State <span class="star">*</span></label> <input type="text"
									readonly="readonly" name="state" id="state" required="required"
									placeholder="Enter State " style="text-transform: uppercase;" />
									<small id="chkstate" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Pin Code <span class="star">*</span></label> <input type="text" name="pinCode"
									readonly="readonly" id="pinCode" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
									<small id="chkpincode" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Email ID <span class="star">*</span></label> <input type="text" name="emailId"
									readonly="readonly" id="emailId" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
									<small id="chkemailid" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Authorized Share Capital <span class="star">*</span></label> <input type="text"
									readonly="readonly" name="authorizedShareCapital"
									id="authorizedShareCapital" required="required"
									placeholder="Authorized Share Capital"
									style="text-transform: uppercase;" />
									<small id="chkauthorizedsharecapital" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Paid Up Capital <span class="star">*</span></label> <input type="text"
									readonly="readonly" name="paidUpCapital" id="paidUpCapital"
									required="required" placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
									<small id="chkpaidupcapital" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>NOF <span class="star">*</span></label> <input type="text" name="nof" id="nof"
									readonly="readonly" required="required"
									placeholder="Enter NOF " style="text-transform: uppercase;" />
									<small id="chknof" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Contact No <span class="star">*</span></label> <input type="Terxt" name="contactNo"
									readonly="readonly" id="contactNo" required="required"
									placeholder="Enter Contact No"
									style="text-transform: uppercase;" />
									<small id="chkcontactno" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>TDS (With PAN) <span class="star">*</span></label> <input type="text"
									readonly="readonly" name="tdsWithPan" id="tdsWithPan"
									required="required" placeholder="Enter TDS"
									style="text-transform: uppercase;" />
									<small id="chktdswithpan" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>TDS (Without PAN) <span class="star">*</span></label> <input type="text"
									readonly="readonly" name="tdsWithoutPan" id="tdsWithoutPan"
									required="required" placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
									<small id="chktdswithoutpan" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Tax Deduction <span class="star">*</span></label> <input type="text"
									readonly="readonly" name="taxDeduction" id="taxDeduction"
									required="required" placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
									<small id="chktaxdeduction" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Senior Citizen Tax Deduction <span class="star">*</span></label> <input type="text"
									readonly="readonly" name="seniorCitizenTaxDeduction"
									id="seniorCitizenTaxDeduction" required="required"
									placeholder="Enter Senior Citizen Tax Deduction"
									style="text-transform: uppercase;" />
									<small id="chkseniorcitizentaxdeduction" style="color: red;"></small>
							</div>
						</div>


					</div>


					<div class="mt-5">

						<div class="row mt-4">
							<div class="col-lg-3 mb-5">
								<label for=""
									style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
									Photo <span class="star">*</span></label> <label for="bike1image" id="drop-area"> <input
									type="file" accept="image/*" name="photo" id="photo"
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
								</label><small id="chkphoto" style="color: red;"></small>
							</div>

							<div class="col-lg-3 mb-5">
								<label for=""
									style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
									Signature <span class="star">*</span></label> <label for="bike2image" id="drop-area"> <input
									type="file" accept="image/*" name="signature" id="signature"
									hidden="hidden" onchange="bike2Preview();"
									style="background-size: cover; background-repeat: no-repeat" />
									<div id="img-view">
										<img src="../images/upload/upload.png	" alt="upload_icon"
											id="bike2imagePreview" />
										<!-- <p
                    style="font-size: 12px; margin-top: 15px"
                    class="text-muted"
                  >
                    Drag and drop or Choose File to upload the image
                  </p> -->
									</div>
								</label><small id="chksignature" style="color: red;"></small>
							</div>



						</div>
					</div>

					<div class="row" style="margin-top: 30px;">
						<div class="col-12 text-center">
							<button type="button" id="updateBtn" class="btn btn-success" disabled>Update</button>
						</div>
					</div>
			</form>



		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/preferences/companyAdministration.js"></script>


</body>

</html>