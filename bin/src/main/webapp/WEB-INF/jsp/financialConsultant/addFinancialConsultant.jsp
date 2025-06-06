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
<<<<<<< HEAD
			<h1>Financial Consultant</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-briefcase"></i>
					</a></li>
					<li class="breadcrumb-item action">Add Financial Consultant</li>
=======
			<h1>Advisor Collector Section</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Add Advisor/Collector</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
<<<<<<< HEAD
							<li class="breadcrumb-item action">Financial Consultant Details</li>
=======
							<li class="breadcrumb-item action">Advisor/Collector Details</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
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
<<<<<<< HEAD
								<label for="joiningDate">Joining Date</label> <input type="date"
									name="joiningDate" id="joiningDate" required="required"
									placeholder="Enter Joining Date"
=======
								<label for="">Joining Date</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="selectCustomer">Select Customer</label> <select id="selectCustomer"
									name="selectCustomer" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Customer</option>
=======
								<label for="vehicalNo">Select Member</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Member</option>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Customer Name</label> <input type="text" name="customerName"
									id="customerName" required="required" placeholder="Enter Cutomer Name"
=======
								<label>Member Name</label> <input type="text" name="vehicalNo"
									id="vehicalNo" required="required" placeholder="Enter Member"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="dob">Date of Birth</label> <input type="date" name="dob"
									id="dob" required="required"
									placeholder="Enter Date Of Birth"
=======
								<label for="">DOB</label> <input type="date" name="vehicalNo"
									id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Age</label> <input type="text" name="age"
									id="age" required="required" placeholder="Enter Age"
=======
								<label>Age</label> <input type="text" name="vehicalNo"
									id="vehicalNo" required="required" placeholder="Enter Age"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Family Customer Name</label> <input type="text"
									name="familyCustomerName" id="familyCustomerName" required="required"
									placeholder="Enter Family Customer Name" />
=======
								<label for="">Relative Name</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Relation to Applicant</label> <select id="relationtoApplicant"
									name="relationtoApplicant" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Enter Relation to Applicant</option>
=======
								<label>Relative Relation</label> <select id="colour"
									name="colour" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Relative Relation</option>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label for="contactNo">Contact No</label> <input type="text" name="contactNo"
									id="contactNo" required="required" placeholder="Enter Contact No" />
=======
								<label for="">Mobile No</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Mobile No" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="nomineeName">Nominee Name</label> <input type="text"
									name="nomineeName" id="nomineeName" required="required"
=======
								<label for="">Nominee Name</label> <input type="text"
									name="price" id="price" required="required"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									placeholder="Enter Nominee Name" />
							</div>
						</div>

<<<<<<< HEAD
						<!-- <div class="col-lg-3">
=======
						<div class="col-lg-3">
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							<div class="d-flex flex-column formFields">
								<label for="">Relation</label> <select id="colour" name="colour"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Relative Relation</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
<<<<<<< HEAD
						</div> -->
=======
						</div>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Branch Name</label> <select id="branchName" name="branchName"
=======
								<label>Branch Name</label> <select id="colour" name="colour"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Branch</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="nomineeAge">Nominee Age</label> <input type="text"
									name="nomineeAge" id="nomineeAge" required="required"
=======
								<label for="">Nominee Age</label> <input type="text"
									name="price" id="price" required="required"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									placeholder="Enter Nominee Age" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Address</label>
<<<<<<< HEAD
								<textarea name="address" id="address"
=======
								<textarea name="" id=""
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="district">District</label> <input type="text" name="district"
									id="district" required="required" placeholder="Enter District" />
=======
								<label for="">District</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter District" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="state">State</label> <input type="text" name="state"
									id="state" required="required" placeholder="Enter State" />
=======
								<label for="">State</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter State" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="pinCode">Pin Code</label> <input type="text" name="pinCode"
									id="pinCode" required="required" placeholder="Enter Pincode" />
=======
								<label for="">Pin Code</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Pincode" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Profession</label> <input type="text" name="profession"
									id="profession" required="required" placeholder="Enter Profession" />
=======
								<label>Occupation</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Occupation" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="academicBackground">Academic Background</label> <input type="text" name="academicBackground"
									id="academicBackground" required="required" placeholder="Enter Academic Background" />
=======
								<label for="">Education</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Education" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>
					</div>

					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
<<<<<<< HEAD
								Photo</label> <label for="photo" id="drop-area"> <input
								type="file" accept="image/*" name="photo" id="photo"
=======
								Photo</label> <label for="bike1image" id="drop-area"> <input
								type="file" accept="image/*" name="bike1image" id="bike1image"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
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
<<<<<<< HEAD
								Signature</label> <label for="signature" id="drop-area"> <input
								type="file" accept="image/*" name="signature" id="signature"
=======
								Signature</label> <label for="bike2image" id="drop-area"> <input
								type="file" accept="image/*" name="bike2image" id="bike2image"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
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
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Introducer Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Select Position</label> <input type="text"
<<<<<<< HEAD
									name="selectPosition" id="selectPosition" required="required"
=======
									name="vehicalNo" id="vehicalNo" required="required"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									placeholder="Enter Position" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="referenceCode">Reference Code</label> <input
									type="text" name="referenceCode" id="referenceCode" required="required"
									placeholder="Enter Reference Code"
=======
								<label for="vehicalNo">Introducer Code</label> <input
									type="text" name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Introducer Code"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Reference Name</label> <input type="text"
									name="referenceCode" id="referenceCode" required="required"
									placeholder="Enter Reference Name"
=======
								<label>Introducer Name</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Introducer Name"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="position">Position </label> <input type="text"
									name="position" id="position" required="required"
=======
								<label for="">Position </label> <input type="text"
									name="location" id="location" required="required"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									placeholder="Enter Position" />
							</div>
						</div>

					</div>

					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-success">Save</button>
							<button id="saveBtn" class="btnStyle"
								style="background-color: #FFA500;">Update</button>
							<button id="saveBtn" class="btnStyle bg-primary">Print</button>
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
</body>

</html>