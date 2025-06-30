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
			<h1>Data Correction </h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-pencil-square"></i>
					</a></li>
					<li class="breadcrumb-item action">Customer Data Update</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Edit Member</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-5">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 20px;">
								<label for="memberCode">Customer Selection </label> <select id="memberCode "
									name="memberCode" required="required"
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
								<label for="">Sign-up Date</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Select</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
									<option value="Blue">Mr.</option>
									<option value="Blue">Ms.</option>
									<option value="Blue">Other</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Customer Name</label> <input type="text" name="vehicalNo"
									id="CustomerN" required="required"
									placeholder="Enter Customer Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Family Member Name</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Family Name"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relation to Applicant</label> <select id="Relation"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Relation</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Gender</label> <select id="colour" name="colour"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Gender</option>
									<option value="Blue">Male</option>
									<option value="Blue">Female</option>
									<option value="Blue">Other</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Date of Birth  </label> <input type="date" name="vehicalNo"
									id="DOB" required="required"
									placeholder="Enter Relative Name"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label for="">Age</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Age" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Relationship Status</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Marital Status</option>
									<option value="Blue">Married</option>
									<option value="Blue">Unmarried</option>
									<option value="Blue">Devorced</option>
									<option value="Blue">Single</option>
								</select>
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
								<label>District</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter District" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">State</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter State" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Address</label>
								<textarea name="" id=""
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">District</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter District" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">State</label> <select id="colour" name="colour"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select States</option>
									<option value="Blue">Maharashtra</option>
									<option value="Blue">Rajasthan</option>

								</select>
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
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Pin Code</label> <input type="text" name="pin"
									id="price" required="required" placeholder="Enter Pincode" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Aadhar No</label> <input type="text" name="Aadhar"
									id="price" required="required" placeholder="Enter Aadhar No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Pan No</label> <input type="text" name="panNumber"
									id="price" required="required" placeholder="Enter Pan No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Voter No</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Voter No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No</label> <input type="text" name="Number"
									id="price" required="required" placeholder="Enter Contact No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Email ID</label> <input type="text" name="email"
									id="price" required="required" placeholder="Enter Email ID" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Profession</label> <input type="text" name="price"
									id="Profession" required="required" placeholder="Enter Profession" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="">Academic background</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Academic background" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>Referral Code</label> <input type="text" name="price"
									id="price" required="required"
									placeholder="Enter Intro Referral Code" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>Referral Name</label> <input type="text" name="price"
									id="Referral" required="required"
									placeholder="Enter Intro Referral Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label>Is Minor</label> <select id="colour" name="colour"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Minor</option>
									<option value="Blue">Yes</option>
									<option value="Blue">No</option>

								</select>
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


				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Nominee Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Suggested Nominee  </label> <input type="text" name="vehicalNo"
									id="vehicalNo" required="required"
									placeholder="Enter Nominee Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Nominee Relation</label> <select
									id="colour" name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
									<option value="Blue">Brother</option>
									<option value="Blue">Mother</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Nominee Address</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Nominee Address"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee KYC ID </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Nominee KYC" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee Contact No. </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Nominee No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Age Of Nominee  </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Nominee Age" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee Pan No. </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Pan No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee KYC Type </label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
									<option value="Blue">Saving</option>
									<option value="Blue">Current</option>

								</select>
							</div>
						</div>

					</div>

				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Fees/Setting Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Customer Charges(if any)</label> <input type="text"
									name="vehicalNo" id="Charges" required="required"
									placeholder="Enter Charges" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Shares Issued From</label> <select
									id="form" name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Number of Shares</label> <input type="text" name="vehicalNo"
									id="vehicalNo" required="required" placeholder="Enter Share"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Share Value </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Nominee KYC" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Mode of payment </label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
									<option value="Cash">Cash</option>
									<option value="Online">Online</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Comments </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Comments" />
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
									<label style="margin-left: 20px;" class="mb-2">
										Membership Status</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-member-status"
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-member-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div
								class=" h-100 d-flex justify-content-start align-items-center">
								<div
									class="d-flex justify-content-start align-items-center  formFields">
									<label style="margin-left: 20px;" class="mb-2">Mobile Bank Access</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-mobile-banking"
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-member-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div
								class=" h-100 d-flex justify-content-start align-items-center">
								<div
									class="d-flex justify-content-start align-items-center  formFields">
									<label style="margin-left: 20px;" class="mb-2">Net
										Banking</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-net-banking"
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-member-status" class="toggle__label"></label>
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
											<input type="checkbox" id="toggle-sms-send"
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-member-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12 text-center" style="margin-top: 30px;">
							<button id="printBtn" class="btn btn-warning">Print</button>
							<button id="updateBtn" class="btn btn-success"
								>Update</button>
							<button id="deleteBtn" class="btn btn-danger">Delete</button>
						</div>
					</div>
				</div>





			</form>

			<!-- <div class="row mt-5">
        <div class="col-12">
          <div class="card recent-sales">

            <div class="card-body table-responsive">
              <h5 class="card-title">
                Recent Sales <span>| Today</span>
              </h5>

              <table class="table table-borderless datatable overflow-scroll">
                <thead class="table-light">
                  <tr style="font-family: 'Poppins', sans-serif;">
                    <th scope="col">#</th>
                    <th scope="col">Customer</th>
                    <th scope="col">Product</th>
                    <th scope="col">Price</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr style="font-family: 'Poppins', sans-serif;">
                    <th scope="row">
                      <a href="#">1</a>
                    </th>
                    <td>Arun Kumar</td>
                    <td>
                      <a href="#" className="text-primary">Milk</a>
                    </td>
                    <td>$29</td>
                    <td>
                      <span class="badge bg-success text-white">Approved</span>
                    </td>
                    <td class="d-flex" style="gap: .7rem;">
                      <button class="iconbutton"><i class="fa-solid fa-pen-to-square text-success"></i></button>
                      <button class="iconbutton"><i class="fa-solid fa-eye text-primary"></i></button>
                      <button class="iconbutton"><i class="fa-solid fa-trash text-danger"></i></button>
                    </td>
                  </tr>

                  <tr>
                    <th scope="row">
                      <a href="#">2</a>
                    </th>
                    <td>Deepak Dalwe</td>
                    <td>
                      <a href="#" className="text-primary">Ghee</a>
                    </td>
                    <td>$16.5</td>
                    <td>
                      <span class="badge bg-danger text-white">Rejected</span>
                    </td>
                    <td class="d-flex" style="gap: .7rem;">
                      <button class="iconbutton"><i class="fa-solid fa-pen-to-square text-success"></i></button>
                      <button class="iconbutton"><i class="fa-solid fa-eye text-primary"></i></button>
                      <button class="iconbutton"><i class="fa-solid fa-trash text-danger"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">
                      <a href="#">2</a>
                    </th>
                    <td>Deepak Dalwe</td>
                    <td>
                      <a href="#" className="text-primary">Ghee</a>
                    </td>
                    <td>$16.5</td>
                    <td>
                      <span class="badge bg-danger text-white">Rejected</span>
                    </td>
                    <td class="d-flex" style="gap: .7rem;">
                      <button class="iconbutton"><i class="fa-solid fa-pen-to-square text-success"></i></button>
                      <button class="iconbutton"><i class="fa-solid fa-eye text-primary"></i></button>
                      <button class="iconbutton"><i class="fa-solid fa-trash text-danger"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">
                      <a href="#">2</a>
                    </th>
                    <td>Deepak Dalwe</td>
                    <td>
                      <a href="#" className="text-primary">Ghee</a>
                    </td>
                    <td>$16.5</td>
                    <td>
                      <span class="badge bg-danger text-white">Rejected</span>
                    </td>
                    <td class="d-flex" style="gap: .7rem;">
                      <button class="iconbutton"><i class="fa-solid fa-pen-to-square text-success"></i></button>
                      <button class="iconbutton"><i class="fa-solid fa-eye text-primary"></i></button>
                      <button class="iconbutton"><i class="fa-solid fa-trash text-danger"></i></button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div> -->

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/dataCorrection/customerDataUpdate.js"></script>
</body>

</html>