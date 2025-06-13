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
			<h1>Customer Saving</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-bank text-blue"></i>
					</a></li>
					<li class="breadcrumb-item action"> Account Closer</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Saving Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Select Account Number</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Colour</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Customer Code </label> <input type="text"
									name="price" id="price" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Contact Number</label> <input type="text"
									name="price" id="price" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Opening Branch</label> <input type="text"
									name="price" id="price" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Opening Date</label> <input type="text"
									name="price" id="price" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Current Balace</label> <input type="text"
									name="price" id="price" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Interest Disbursement</label> <input type="text"
									name="price" id="price" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Outstanding Interest</label> <input type="text"
									name="price" id="price" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Net Balance</label> <input type="text" name="price"
									id="price" required="required" placeholder="" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">From Date</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
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
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Closing Branch</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Colour</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Closing Date</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Pay By</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Colour</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Comments</label> <input type="text" name="location"
									id="location" required="required" placeholder="Enter Location" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle"
								style="background-color: #FFA500; margin-left: 80%;">Close
								Account</button>
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
			</form>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>