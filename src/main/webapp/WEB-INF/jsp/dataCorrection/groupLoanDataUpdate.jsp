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
			<h1>Data Correction</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-pencil-square"></i>
					</a></li>
					<li class="breadcrumb-item action">Group Loan Data Update</li>
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
						<div class="col-lg-5">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 20px;">
								<label for="groupCode">Group Code </label> <select
									id="groupCode" name="groupCode"
									class="form-control selectField" style="width: 100%;">
									<option value="">-- Search Group Code --</option>
								</select>
							</div>
						</div>

					</div>
					<hr>
					<div>
						<nav>
							<ol class="breadcrumb breadcrumb-title">
								<li class="breadcrumb-item action">Loan Details</li>
							</ol>
						</nav>
						<div class="row">
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 20px;">
									<label for="vehicalNo">Loan Date</label> <input type="date"
										name="vehicalNo" id="vehicalNo" required="required"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Select Customer</label> <select id="colour"
										name="colour" required="required"
										class="form-control selectField" style="height: 30px;">
										<option value="">Select Customer</option>

									</select>
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Relative Details</label> <input type="text"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="Enter Relative Name & Relation"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px;">
									<label>Date of Birth</label> <input type="date"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="Enter Relative Name"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px;">
									<label for="">Age</label> <input type="text" name="vehicalNo"
										id="vehicalNo" required="required" placeholder="Enter Age"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Contact No</label> <input type="text"
										name="price" id="price" required="required"
										placeholder="Enter Contact No" />
								</div>
							</div>

							<div class="col-lg-3">

								<div class="d-flex flex-column formFields">
									<label for="">Group ID</label> <input type="text"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="Enter Group ID"
										style="text-transform: uppercase;" />
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
									<label>Pin Code</label> <input type="text" name="price"
										id="price" required="required" placeholder="Enter Pincode" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Branch Name</label> <select id="colour"
										name="colour" required="required"
										class="form-control selectField" style="height: 30px;">
										<option value="">Select Branch</option>
										<option value="Blue">Umrer</option>
										<option value="Blue">Reshimbaag</option>

									</select>
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Loan Policy Name</label> <select id="colour"
										name="colour" required="required"
										class="form-control selectField" style="height: 30px;">
										<option value="">Select Loan Policy Name</option>
										<option value="Blue">Home Loan</option>
										<option value="Blue">Vehicle Loan</option>

									</select>
								</div>
							</div>

							<div class="col-lg-3">

								<div class="d-flex flex-column formFields">
									<label for="">Type of Loan</label> <input type="text"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="Enter Type of Loan"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px;">
									<label for="">Plan Duration</label> <select id="colour"
										name="colour" required="required"
										class="form-control selectField" style="height: 30px;">
										<option value="">Select Loan Plan Duration</option>
										<option value="Blue">124500</option>
										<option value="Blue">12450</option>

									</select>
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Payment Method</label> <input type="text"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="Enter Payment Method"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Loan Amount</label> <input type="text"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="Enter Loan Amount"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Interest Type</label> <input type="text"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="Enter Interest Type"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px;">
									<label for="">EMI Amount</label> <input type="text"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="Enter EMI Amount"
										style="text-transform: uppercase;" />
								</div>
							</div>

							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Purpose of Loan</label> <input type="text"
										name="vehicalNo" id="vehicalNo" required="required"
										placeholder="Enter Purpose of Loan"
										style="text-transform: uppercase;" />
								</div>
							</div>





						</div>


						<div class="row mt-4">
							<div class="col-lg-3 mb-5">
								<label for=""
									style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">
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
									style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">
									Signature</label> <label for="bike1image" id="drop-area"> <input
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



						</div>

					</div>



				</div>


				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Deduction Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Processing Charges</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Processing Charges"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Legal Amount</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Legal Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Financial Consultant Code</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Financial Consultant Code"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">GST </label> <input type="text" name="location"
									id="location" required="required" placeholder="Enter GST" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Insurance Amount </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Insurance Amount" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for=""> Financial Consultant Name </label> <input
									type="text" name="location" id="location" required="required"
									placeholder="Enter  Financial Consultant Name" />
							</div>
						</div>

					</div>
				</div>

				<div class="mt-5">
					<div class="row">
						<div class="col-12 text-center" style="margin-top: 30px;">
							<button id="updateBtn" class="btnStyle bg-warning">Update</button>
							<button id="newBtn" class="btnStyle bg-primary"
								style="background-color: #FFA500;">New</button>
							<button id="deleteBtn" class="btnStyle bg-danger">Delete</button>
						</div>
					</div>
				</div>
			</form>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/dataCorrection/JointLiabilityUpdate.js"></script>
</body>

</html>