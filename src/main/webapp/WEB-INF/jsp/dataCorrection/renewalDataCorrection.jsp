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
					<li class="breadcrumb-item action"> Renewal Data Correction</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Search Box</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 20px;">
								<label for="policyCode">Policy Code</label> <select id="policyCode"
									name="policyCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">-- Search Policy Code --</option>
									
								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="applicationDate">Update Date </label> <input type="date"
									name="applicationDate" id="applicationDate" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Branch Name</label> <select id="branchName"
									name="branchName" required="required"
									class="form-control selectField" style="height: 30px;">
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
                  </div>
                </div>
              </div> -->
							<div class="d-flex flex-column formFields">
								<label for="">Policy Date</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Payoff Date </label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Member Code</label> <input type="text" name="vehicalNo"
									id="vehicalNo" required="required"
									placeholder="Enter Member Code"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Client Name  </label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Client Name"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Contact No</label> <input type="text" name="vehicalNo"
									id="vehicalNo" placeholder="Enter Contact No"
									required="required" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Policy Amount</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Policy Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>  Policy Type </label> <input type="text" name="vehicalNo"
									id="vehicalNo" required="required"
									placeholder="Enter Policy Type               "
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label for="">Policy Trem</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Policy Term"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Scheme Mode</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Scheme Mode"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Maturity Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label> Total Deposits </label> <input type="text" name="price"
									id="price" required="required"
									placeholder="Enter Total Deposited" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for=""> Payment Due </label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Amount Due" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>SMS Status</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter SMS Status" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for=""> Finicial Code</label><input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Advisor Code" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Last Payment Date  </label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Last Inst. Paid" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Deadline</label> <input type="date" name="price"
									id="price" required="required" placeholder="Enter Mem Code" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Late Fine</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Joint Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Installments Completed   </label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Installments Completed   " />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Mode Of Payment </label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Paymode</option>
									<option value="Blue">Cash</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Financial Consultant</label> <input type="text" name="price"
									id="price" required="required"
									placeholder="Enter Financial Consultant Code" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Name</label> <input type="text" name="price"
									id="price" required="required"
									placeholder="Enter Financial Consultant Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Comments</label>
								<textarea name="" id="" placeholder="Enter Remarks"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
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


					<div class="row">
						<div class="col-12 text-center" style="margin-top: 30px;">
							<button id="printBtn" class="btnStyle bg-primary">View
								Installment</button>
							<button id="deleteBtn" class="btnStyle bg-danger"
								style="background-color: #FFA500;">Delete Last Entry</button>
						</div>
					</div>

				</div>









			</form>

		

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/dataCorrection/renewalDataCorrection.js"></script>
	
</body>

</html>