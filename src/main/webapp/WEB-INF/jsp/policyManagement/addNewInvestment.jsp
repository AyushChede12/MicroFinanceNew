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
			<h1>Policy Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-piggy-bank"></i>
					</a></li>
					<li class="breadcrumb-item action">Add New Investment</li>
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
							<div class="d-flex flex-column formFields">
								<label for="">Policy start date*</label> <input type="date"
									name="policyStartDate" id="policyStartDate" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3 mb-4">
							<div class="d-flex flex-column formFields">
								<label for="branchName">Customer Selection*</label> <select
									id="selectCustomer" name="selectCustomer" required
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Customer Name</option>
									<!-- Add options here -->
								</select>
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Customer Name*</label> <input type="text"
									name="customerName" id="customerName" required="required"
									placeholder="Enter Location" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Date of Birth*</label> <input type="date"
									name="dateofBirth" id="dateofBirth" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Relation Details*</label> <input type="text"
									name="relationDetails" id="relationDetails" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No*</label> <input type="text"
									name="contactNo" id="contactNo" required="required"
									placeholder="Enter Mobile No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Suggested Nominee *</label> <input type="text"
									name="suggestedNominee" id="suggestedNominee"
									required="required" placeholder="Enter Nominee Name" />
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Age of Nominee</label> <input type="text"
									name="ageOfNominee" id="ageOfNominee" required="ageOfNominee"
									placeholder="Enter Nominee Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relation</label> <input type="text" name="relation"
									id="relation" required="relation"
									placeholder="Enter Nominee Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address*</label>
								<textarea name="address" id="address"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">District*</label> <input type="text"
									name="district" id="district" required="required"
									placeholder="Enter District" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">State*</label> <input type="text" name="state"
									id="state" required="required" placeholder="Enter State" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Pin Code*</label> <input type="text"
									name="pinCode" id="pinCode" required="required"
									placeholder="Enter Pin Code" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Branch Name*</label> <input type="text"
									name="branch" id="branch" required="required"
									placeholder="Enter Pin Code" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">TDS*</label> <input type="text" name="tds"
									id="tds" required="required" placeholder="Enter TDS" />
							</div>
						</div>


						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Mode of Operation*</label> <select
									id="ModeOfOperation" name="ModeOfOperation" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="joint">Joint</option>
									<option value="single">Single</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Policy Nominee Name*</label> <input type="text"
									name="jointName" id="jointName" required="required"
									placeholder="Enter Adhar No" />
							</div>
						</div>


						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Scheme Type*</label> <select id="schemeType"
									name="schemeType" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Scheme Type</option>
									<option value="DRD">DRD</option>
									<option value="RD">RD</option>
									<option value="FD">FD</option>
									<option value="MIS">MIS</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Scheme Name*</label> <select id="schemeName"
									name="schemeName" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Branch Name</option>

								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Scheme Term*</label> <input type="text"
									name="schemeTerm" id="schemeTerm" required="required"
									placeholder="Enter PAN No" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Scheme Mode*</label> <select id="schemeMode"
									name="schemeMode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Branch Name</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Date*</label> <input type="date"
									name="maturityDate" id="maturityDate" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Policy Amount*</label> <input type="text"
									name="policyAmount" id="policyAmount" required="required"
									placeholder="Enter Voter No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Deposit Amount*</label> <input type="text"
									name="depositAmount" id="depositAmount" required="required"
									placeholder="Enter Licence No" />
							</div>
						</div>

						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Intro.M Code*</label> <select id="introMCode"
									name="introMCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Branch Name</option>

								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount*</label> <input type="text"
									name="maturityAmount" id="maturityAmount" required="required"
									placeholder="Enter Intro Member Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">MIS Interest*</label> <input type="text"
									name="MISInterest" id="MISInterest" required="required"
									placeholder="Enter Mobile No" />
							</div>
						</div>




					</div>

					<div class="mt-5">
						<nav>
							<ol class="breadcrumb breadcrumb-title">
								<li class="breadcrumb-item active">Payment Information</li>
							</ol>
						</nav>

						<div class="row">
							<!-- Payment By -->
							<div class="col-lg-3 mb-4">
								<div class="d-flex flex-column formFields">
									<label for="branchName">Payment By*</label> <select
										id="paymentBy" name="paymentBy" required
										class="form-control selectField" style="height: 30px;">
										<option value="">Select Branch Name</option>
										<!-- Add options here -->
									</select>
								</div>
							</div>

							<!-- Remark -->
							<div class="col-lg-3 mb-4">
								<div class="d-flex flex-column formFields">
									<label for="remark">Remark*</label>
									<textarea id="remark" name="remark" required
										style="border: 1px solid #e0e0e0; border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
								</div>
							</div>

							<!-- Advisor/Collector -->
							<div class="col-lg-3 mb-4">
								<div class="d-flex flex-column formFields">
									<label for="location">Agent/Collector*</label> <input
										type="text" id="Agent" name="Agent" required
										placeholder="Enter Advisor/Collector Code"
										class="form-control" />
								</div>
							</div>

							<!-- SMS Send -->
							<div class="col-lg-3 mb-4">
								<div class="d-flex flex-column formFields">
									<label for="smsSend">SMS Send</label> <input type="text"
										id="smsSend" name="smsSend" placeholder="Enter Education"
										class="form-control" />
								</div>
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
									<img src="./upload.png" alt="upload_icon"
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
									<img src="./upload.png" alt="upload_icon"
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
						<button id="saveBtn" class="btn btn-info"
							style="margin-left: 80%;">Save</button>

					</div>
				</div>
			</form>



		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="./js/PolicyManagment/addInvestment.js"></script>
</body>

</html>