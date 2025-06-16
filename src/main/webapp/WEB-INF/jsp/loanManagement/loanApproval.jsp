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
			<h1>Loan Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> 
					<i class="bi bi-cash-coin"></i>
					</a></li>
					<li class="breadcrumb-item action">Loan Approval</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div class="">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Search Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-6">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label> Find By Loan ID </label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Loan Id </span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="loanId1" name="loanId1" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

					</div>


				</div>
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Date of Loan</label> <input type="date"
									name="loanDate1" id="loanDate1" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Find Members</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Member</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="member" name="member"class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
										</ul>
									</div>
								</div>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Family Member Name</label> <input
									type="text" name="memmberName" id="memmberName" required="required"
									placeholder="Enter Family Member Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Date Of Birth</label> <input type="date"
									name="dOB" id="dOB" required="required"
									placeholder="" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Age </label> <input type="text" name="age"
									id="age" required="required" placeholder="" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No.</label> <input type="text"
									name="callNo" id="callNo" required="required"
									placeholder="Enter Mobile Number" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">SMS Notification</label> <input type="text"
									name="smsNotification" id="smsNotification" required="required"
									placeholder="SMS Staus" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="address2" id="address2"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">Pin Code</label> <input type="text"
									name="pinCode" id="pinCode" required="required"
									placeholder="Enter Pin Code" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Branch Address</label> <select id="addresBranch2"
									name="addresBranch2" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Branch Address</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Plan Name</label> <select id="planName"
									name="planName" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Loan Plan Name</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Type Of Loan</label> <select id="loanType"
									name="loanType" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Type Of Loan </option>
									<option value="Blue"></option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Plan Duration</label> <input type="text"
									name="durationPlan" id="durationPlan" required="required"
									placeholder="Enter Plan Duration" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Category</label> <input type="text"
									name="categoryLoan" id="categoryLoan" required="required"
									placeholder="Loan Category" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Rate of Interest (%pa.) </label> <input type="text"
									name="roi" id="roi" required="required"
									placeholder="Enter Loan ROI" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Amount Of Loan</label> <input type="text"
									name="loanAmount" id="loanAmount" required="required"
									placeholder="Enter Amount Of Loan"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for=""> Interest Type</label> <input type="text"
									name="intrestType" id="intrestType" required="required"
									placeholder="Enter  Interest Type" style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">EMI Payment</label> <input type="text"
									name="paymentEmi1" id="paymentEmi1" required="required"
									placeholder="Enter EMI Payment"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Purpose of Loan</label> <input type="text"
									name="loanPerpose" id="loanPerpose" required="required"
									placeholder="Enter Purpose of Loan"
									style="text-transform: uppercase;" />
							</div>
						</div>

					</div>
				</div>


				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Gurantor Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label> Member ID</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Member ID</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="memberId" name="memberId" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Gurantor Identity</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Guranntor Identity" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="address" id="address"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Pin Code</label> <input type="number"
									name="pinCode" id="pinCode" required="required"
									placeholder="Enter Pin Code" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Gurantor Contact No.</label> <input type="number" name="guratorPonrNo"
									id="guratorPonrNo" required="required"
									placeholder="Enter  Gurantor Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Security Type</label> <select id="securityType"
									name="securityType" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Loan Type</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>






					</div>


				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Co-Applicant Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label> Member ID</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Member ID</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="memberIDCo-application" name="memberIDCo-application" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Gurantor Identity</label> <input type="text"
									name="gurantorIdentify" id="gurantorIdentify" required="required"
									placeholder="Enter Guranntor Identity" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Address</label>
								<textarea name="addressCo-Appliction" id="addressCo-Appliction"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Pin Code</label> <input type="number"
									name="co-Pincode" id="co-Pincode" required="required"
									placeholder="Enter Pin Code" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Gurantor Contact No.</label> <input type="number" name="co-Grantorphonno"
									id="co-Grantorphonno" required="required"
									placeholder="Enter  Gurantor Contact No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Security Type</label> <select id="co-SecurityType"
									name="co-SecurityType" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Loan Type</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>






					</div>



				</div>

				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Deduction Details</li>
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
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Processing Fee(%) </label> <input type="text"
									name="de-ptocessingFee" id="de-ptocessingFee" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Legal Charges(%)</label> <input type="text"
									name="de-Legalcharges" id="de-Legalcharges" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>





						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="loanName">Insurence Fee</label> <input type="text"
									name="de-InsurenceFee" id="de-InsurenceFee" required="required"
									placeholder="Enter insurence fees"
									style="text-transform: uppercase;" />
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4"
								style="margin-bottom: 30px">
								<label> Advisor Collector ID</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Advisor Code</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="de-AdvisorId" name="de-AdvisorId" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
											<li>A</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Advisor/Collector Full Name</label> <input
									type="text" name="de-Advisorname" id="de-Advisorname"
									required="required" placeholder="Enter Advisor/Collector Name"
									style="text-transform: uppercase;" />
							</div>
						</div>




					</div>
				</div>
				<div class="row mt-4">
					<div class="col-lg-3 mb-5">
						<label for=""
							style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
							Photo</label> <label for="bike1image" id="drop-area"> <input
							type="file" accept="image/*" name="photo" id="photo"
							hidden="hidden" onchange="bike1Preview();"
							style="background-size: cover; background-repeat: no-repeat" />
							<div id="img-view">
								<img src="./upload.png" alt="upload_icon" id="bike1imagePreview" />
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
							type="file" accept="image/*" name="signiture" id="signiture"
							hidden="hidden" onchange="bike2Preview();"
							style="background-size: cover; background-repeat: no-repeat" />
							<div id="img-view">
								<img src="./upload.png" alt="upload_icon" id="bike2imagePreview" />
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
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Approval Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">

							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Date Of Approval </label> <input type="date"
									name="ap-ApprovalDate" id="ap-ApprovalDate" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="loanName">Approval Notification</label> <input type="text"
									name="ap-ApprovalNotification" id="ap-ApprovalNotification" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle"
								style="background-color: #FFA500;">Approve It</button>
							<!-- <button id="saveBtn" class="btnStyle" style="background-color: #FFA500;">Update</button>
                            <button id="saveBtn" class="btnStyle bg-primary">Print</button> -->
						</div>








					</div>
				</div>


			</form>
	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>