<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> -->
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

<!-- Then Select2 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>CUSTOMER MANAGEMENT</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-people-fill"></i>
					</a></li>
					<li class="breadcrumb-item action">CUSTOMER SUMMARY</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<div class="row">
						<div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="selectMember" id="customerSelection">Customer
									Selection </label> <select id="selectMember" name="selectMember"
									class="form-control selectField" style="width: 100%;">
									<option value="">-- Search Customer Code --</option>
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
								<label for="">Address</label> <input type="text"
									name="customerAddress" id="customerAddress" required="required"
									placeholder="Enter Address" disabled />
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
								<label for="">Age</label> <input type="text" name="customerAge"
									id="customerAge" required="required" placeholder="Enter Age"
									disabled />
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
								<label for="">Gender</label> <input type="text"
									name="customerGender" id="customerGender" required="required"
									placeholder="Enter gender" disabled />
							</div>
						</div>






					</div>

					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">UPLOAD
								CUSTOMER PHOTO <span class="star">*</span>
							</label> <label for="signature" id="drop-area"> <input
								type="file" accept="image/*" name="photo" id="photo"
								hidden="hidden" onchange="photoUpload();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="photoPreview" /><input type="hidden" name="photoHidden"
										id="photoHidden">

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


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="./js/customerManagement/customerSummary.js"></script>
	<script>
		$(document).ready(function() {

			// -------------------------------
			// 1️⃣ LABELS UPPERCASE
			// -------------------------------
			$("#formid label").each(function() {
				// Only proceed if label has no child elements (pure text)
				if ($(this).children().length === 0) {
					$(this).text($(this).text().toUpperCase());
				}
			});

			// -------------------------------
			// 2️⃣ PLACEHOLDERS UPPERCASE
			// -------------------------------
			$("#formid input[type='text'], #formid textarea").each(function() {
				let ph = $(this).attr("placeholder");
				if (ph)
					$(this).attr("placeholder", ph.toUpperCase());
			});

			// -------------------------------
			// 3️⃣ FUNCTION → Convert ALL dropdown options to UPPERCASE
			// -------------------------------
			function convertDropdownOptions() {
				$("#formid select option").each(function() {
					let text = $(this).text();
					let value = $(this).val();

					if (text)
						$(this).text(text.toUpperCase());
					if (value)
						$(this).val(value.toUpperCase());
				});
			}

			// Run once on page load
			convertDropdownOptions();

			// -------------------------------
			// 4️⃣ ON EVERY AJAX SUCCESS → convert again (backend loaded data)
			// -------------------------------
			$(document).ajaxSuccess(function() {
				convertDropdownOptions();
			});

		});
	</script>
</body>

</html>