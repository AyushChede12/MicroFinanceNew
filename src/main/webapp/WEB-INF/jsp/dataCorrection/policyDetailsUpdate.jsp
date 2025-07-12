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

<!-- Select2 CSS and JS -->
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Data Correction </h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-pencil-square"></i>
					</a></li>
					<li class="breadcrumb-item action">Policy Details Update</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Edit Investment</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-5">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 20px;">
								<label for="policyCode">Select By Policy Code</label> <select
									id="policyCode" name="policyCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">-- Search Policy Code --</option>
								</select>
							</div>
						</div>

					</div>
					<hr>
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
                  </div>:Member Selection        
                </div>
              </div> -->
              <input type="hidden" name="id" id="id">
							<div class="d-flex flex-column formFields">
								<label for="policyStartDate">Policy Date</label> <input type="date"
									name="policyStartDate" id="policyStartDate" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="memberSelection">Customer Selection </label> <select id="memberSelection"
									name="memberSelection" required="required"
									class="form-control selectField" style="height: 30px;">
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label for="customerName">Customer Name</label> <input type="text" name="customerName"
									id="customerName" required="required"
									placeholder="Enter Customer Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="dateofBirth">Date of Birth </label> <input type="date" name="dateofBirth"
									id="dateofBirth" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relative Details</label> <input type="text"
									name="relationDetails" id="relationDetails"
									placeholder="Enter Relative Name" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No</label> <input type="text"
									name="contactNo" id="contactNo" required="required"
									placeholder="Enter Contact No"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Suggested Nominee </label> <input type="text" name="suggestedNominee"
									id="suggestedNominee" required="required"
									placeholder="Enter Suggested Nominee            "
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label for="">Relation</label> <select id="relationToApplicant" name="relationToApplicant"
									required="required" class="form-control selectField"
									style="height: 30px;">
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Relationship Status</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Relationship Status</option>
									<option value="Married">Married</option>
									<option value="Unmarried">Unmarried</option>
									<option value="Divorced">Divorced</option>
									<option value="Single">Single</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="address">Address</label>
								<textarea name="address" id="address"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>District</label> <input type="text" name="district"
									id="district" required="required" placeholder="Enter District" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="state">State</label> <input type="text" name="state"
									id="state" required="required" placeholder="Enter State" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Pin Code</label> <input type="text" name="pinCode"
									id="pinCode" required="required" placeholder="Enter Pincode" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="branchName">Branch Name</label><select id="branchName"
									name="branchName" required="required"
									class="form-control selectField" style="height: 30px;">
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="ModeOfOperation">Mode of Operation </label> <select id="ModeOfOperation"
									name="ModeOfOperation" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Mode</option>
									<option value="Single">Single</option>
									<option value="Joint">Joint</option>

								</select>
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="maturityDate">Payoff Date</label> <input type="date"
									name="maturityDate" id="maturityDate" required="required" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>  Policy Type  </label> <select id="schemeType" name="schemeType"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select </option>
									<option value="Blue">RD</option>


								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="schemeTerm" >Policy Term  </label> <input type="text"
									name="schemeTerm" id="schemeTerm" required="required"
									placeholder="Enter Policy Term" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Policy Mode</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Mode</option>
									<option value="Blue">RD</option>


								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="policyAmount">Policy Amount</label> <input type="text"
									name="policyAmount" id="policyAmount" required="required"
									placeholder="Enter Policy Amount" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>Deposit Amount</label> <input type="text" name="depositAmount"
									id="depositAmount" required="required"
									placeholder="Enter Deposit Amount" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>MAturity Amount</label> <input type="text" name="maturityAmount"
									id="maturityAmount" required="required"
									placeholder="Enter Maturity Amount" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>MIS Interest</label> <input type="text" name="MISInterest"
									id="MISInterest" required="required" placeholder="Enter MIS Interest" />
							</div>
						</div>

					</div>

					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Photo <span class="star">*</span>
							</label> <label for="photo" id="drop-area"> <input type="file"
								accept="image/*" name="image1" id="image1" hidden="hidden"
								onchange="photoUpload();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="photoPreview" /><input type="hidden" name="photoHidden"
										id="photoHidden">

									<!-- <p id="upload-text"
                    style="font-size: 12px; margin-top: 15px"
                    class="text-muted"
                  >
                    Drag and drop or Choose File to upload the image
                  </p> -->
								</div>
							</label> <small id="chkphoto" style="color: red;"></small>
						</div>

						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Signature <span class="star">*</span>
							</label> <label for="signature" id="drop-area"> <input
								type="file" accept="image/*" name="image2" id="image2"
								hidden="hidden" onchange="signatureUpload();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="signaturePreview" /><input type="hidden"
										name="signatureHidden" id="signatureHidden">
									<!-- <p
                    style="font-size: 12px; margin-top: 15px"
                    class="text-muted"
                  >
                    Drag and drop or Choose File to upload the image
                  </p> -->
								</div>
							</label> <small id="chksignature" style="color: red;"></small>
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
								<label>Mode Of Payment </label> <select id="paymentBy" name="paymentBy"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select</option>
									<option value="Cash">Cash</option>
									<option value="Online">Online</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="remark">Comments</label>
								<textarea name="remark" id="remark" placeholder="Enter Remarks"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
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
					<div class="row">
						<div class="col-12 text-center" style="margin-top: 30px;">
							<button type="button" id="printBtn" class="btnStyle bg-primary">Print</button>
							<button type="button" id="deleteBtn" class="btnStyle bg-danger"
								style="background-color: #FFA500;">Delete</button>
							<button type="button" id="updateBtn" class="btnStyle bg-warning">Update</button>
						</div>
					</div>

				</div>









			</form>

			

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/dataCorrection/policyDetailsUpdate.js"></script>
	
</body>

</html>