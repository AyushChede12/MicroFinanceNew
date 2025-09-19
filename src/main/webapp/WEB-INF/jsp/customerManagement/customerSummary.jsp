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
<title>Client Summary</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Client Summary</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Client Summary</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<div class="row">
						<div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="">Select by Code</label> <select id="selectMember"
									name="selectByCode" required class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Criteria</option>
								</select>
							</div>
						</div>
						<div class="col-lg-12">
							<nav>
								<ol class="breadcrumb breadcrumb-title">
									<li class="breadcrumb-item action mt-3">Client Details</li>
								</ol>
							</nav>
						</div>




						<div class="col-lg-3">
								<div class="d-flex flex-column formFields mb-4">
									<label for="">Customer Code</label> <input type="text"
										name="customerCode" id="customerCode" required="required"
										placeholder="Enter Customer Code" disabled />
								</div>
							</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Customer Name</label> <input type="text"
									name="customerName" id="customerName" required="required"
									placeholder="Enter Customer Name" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Sign-up Date</label> <input type="date"
									name="singupDate" id="singupDate" required="required"
									placeholder="Enter Sign-up Date" disabled />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Relative Name</label> <input type="text"
									name="guardianName" id="guardianName" required="required"
									placeholder="Enter Relative Name" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Address</label> <input type="text" name="customerAddress"
									id="customerAddress" required="required" placeholder="Enter Address"
									disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for=""> PinCode</label> <input type="text" name="pinCode"
									id="pinCode" required="required" placeholder="Enter pincode"
									disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">State</label> <input type="text" name="state"
									id="state" required="required" placeholder="Enter State"
									disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Mobile No.</label> <input type="text"
									name="contactNo" id="contactNo" required="required"
									placeholder="Enter mobileno" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Aadhar No.</label> <input type="text"
									name="aadharNo" id="aadharNo" required="required"
									placeholder="Enter Aadhar No" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">PAN</label> <input type="text" name="pan" id="pan"
									required="required" placeholder="Enter PAN" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Nominee Name</label> <input type="text"
									name="nomineeName" id="nomineeName" required="required"
									placeholder="Enter Nominee Name" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Email ID</label> <input type="text" name="emailId"
									id="emailId" required="required" placeholder="Enter Email ID"
									disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">DOB</label> <input type="text" name="dob" id="dob"
									required="required" placeholder="Enter DOB" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Age</label> <input type="text" name="customerAge" id="customerAge"
									required="required" placeholder="Enter Age" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Branch Code</label> <input type="text"
									name="branchName" id="branchName" required="required"
									placeholder="Enter Branch Code" disabled />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Gender</label> <input type="text" name="customerGender"
									id="customerGender" required="required" placeholder="Enter gender"
									disabled />
							</div>
						</div>






					</div>

					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Customer Photo <span class="star">*</span>
							</label> <label for="signature" id="drop-area"> <input
								type="file" accept="image/*" name="photo" id="photo"
								hidden="hidden" onchange="photoUpload();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="photoPreview" /><input type="hidden"
										name="photoHidden" id="photoHidden">

								</div>
							</label> <small id="chksignature" style="color: red;"></small>
						</div>

					</div>
				</div>
			</form>



		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="./js/customerManagement/addMemberKyc.js"></script>
</body>

</html>