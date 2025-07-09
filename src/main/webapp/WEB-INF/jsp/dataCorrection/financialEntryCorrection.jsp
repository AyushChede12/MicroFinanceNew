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
			<h1>Data Correction</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bbi bi-pencil-square"></i>
					</a></li>
					<li class="breadcrumb-item action">Finance Entry Correction</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">

				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Search Details</li>
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
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 40px;">
								<label for="">Choose by Code</label> <select id="financialCode"
									name="financialCode" required="required"
									class="form-control selectField" style="height: 30px;">
								</select>
							</div>
						</div>

					</div>


				</div>




				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Financial Details</li>
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
								<label for="">Date of Joining</label> <input type="date"
									name="joiningDate" id="joiningDate" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Customer Code</label> <select
									id="memberCode" name="memberCode" required="required"
									class="form-control selectField" style="height: 30px;">
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Customer Name</label> <input type="text"
									name="customerName" id="customerName" required="required"
									placeholder="Enter Customer Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Date of Birth </label> <input type="date"
									name="dob" id="dob" required="required" placeholder="Enter "
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Age</label> <input type="text" name="customerAge"
									id="customerAge" required="required" placeholder="Enter Age"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Family Member Name</label> <input type="text"
									name="guardianName" id="guardianName" required="required"
									placeholder="Enter Family Member Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relation to Applicant</label> <select
									id="relationToApplicant" name="relationToApplicant"
									required="required" class="form-control selectField"
									style="height: 30px;">

								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label for="">Contact No</label> <input type="text"
									name="contactNo" id="contactNo" required="required"
									placeholder="Enter Contact No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Suggested Nominee</label> <input type="text"
									name="nomineeName" id="nomineeName" required="required"
									placeholder="Enter Nominee Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Branch Name</label> <select id="branchName"
									name="branchName" required="required"
									class="form-control selectField" style="height: 30px;">

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Age Of Nominee </label> <input type="text"
									name="nomineeAge" id="nomineeAge" required="required"
									placeholder="Enter Nominee Age" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Address</label>
								<textarea name="customerAddress" id="customerAddress"
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
							<div class="d-flex flex-column formFields">
								<label for="">State</label> <input type="text" name="state"
									id="state" required="required" placeholder="Enter State" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<labe39l for="">Pin Code</label> <input type="text" name="pinCode"
									id="pinCode" required="required" placeholder="Enter Pincode" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Profession</label> <input type="text" name="profession"
									id="profession" required="required"
									placeholder="Enter profession" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Academic background</label> <input type="text"
									name="academicBackground" id="academicBackground"
									required="required" placeholder="Enter Academic background" />
							</div>
						</div>
					</div>

					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Photo <span id="star">*</span>
							</label> <label for="customerPhoto" id="drop-area"> <input
								type="file" accept="image/*" name="customerPhoto"
								id="customerPhoto" hidden="hidden" onchange="photoUpload();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="financialPhotoPreview" /> <input type="hidden"
										id="financialphotoHidden" name="financialphotoHidden">
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
								Signature <span id="star">*</span>
							</label> <label for="customerSignature" id="drop-area"> <input
								type="file" accept="image/*" name="customerSignature"
								id="customerSignature" hidden="hidden"
								onchange="signatureUpload();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="financialSignaturePreview" /> <input type="hidden"
										id="financialsignatureHidden" name="financialsignatureHidden">
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
							<li class="breadcrumb-item action">Introducer Details</li>
						</ol>
					</nav>
					<div class="row">

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Select Role</label> <input type="text"
									name="selectPosition" id="selectPosition" required="required"
									placeholder="Enter Role" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Reference Code</label> <input type="text"
									name="referralCode" id="referralCode" required="required"
									placeholder="Enter Reference Code"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Reference Name</label> <input type="text"
									name="referralName" id="referralName" required="required"
									placeholder="Enter Reference Name"
									style="text-transform: uppercase;" />
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
									<label>Charges (if any)</label> <input type="text" name="fees"
										id="fees" required="required" placeholder="Enter Fees"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="vehicalNo">Mode of payment</label> <select
										id="modeofPayment" name="modeofPayment" required="required"
										class="form-control selectField" style="height: 30px;">
										<option value="">Select</option>
										<option value="Cash">Cash</option>
										<option value="Online">Online</option>

									</select>
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Comments</label>
									<textarea name="comments" id="comments"
										placeholder="Enter Remarks"
										style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
								</div>
							</div>







						</div>

					</div>

					<div class="mt-5">

						<div class="row">
							<div class="col-lg-3">
								<div
									class=" h-100 d-flex justify-content-start align-items-center">
									<div
										class="d-flex justify-content-start align-items-center  formFields">
										<label style="margin-left: 20px;" class="mb-2">Financial
											Status</label>
										<div class="cont">
											<div class="toggle">
												<input type="checkbox" id="toggle-financial-status"
													name="financialStatus" class="toggle__input"
													data-toggle-type="financial-status"> <label
													for="toggle-financial-status" class="toggle__label"></label>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-3">
							<div
								class=" h-100 d-flex justify-content-start align-items-center"
								style="margin-bottom: 30px;">
								<div
									class="d-flex justify-content-start align-items-center  formFields">
									<label style="margin-left: 20px;" class="mb-2">SMS Send</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-sms-send" name="smsSend"
												class="toggle__input" data-toggle-type="sms-send">
											<label for="toggle-sms-send" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>




						</div>


					</div>

					<div class="row">
						<div class="col-12 text-center" style="margin-top: 30px;">
							<button type="button" id="printBtn" class="btn btn-warning">Print</button>
							<button type="button" id="updateBtn" class="btn btn-success">Update</button>
							<button type="button" id="deleteBtn" class="btn btn-danger">Delete</button>
						</div>
					</div>
			</form>


		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/dataCorrection/financialUpdate.js"></script>
</body>

</html>