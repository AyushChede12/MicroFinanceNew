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
			<h1>Financial Consultant</h1>
			<nav>
				<ol class="breadcrumb">
<<<<<<< HEAD
					<li class="breadcrumb-item"><a href="home"> <i class="bi bi-briefcase text-blue"></i>
=======
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-briefcase"></i>
<<<<<<< HEAD
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
					</a></li>
					<li class="breadcrumb-item action">Add Financial Consultant</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
<<<<<<< HEAD
<<<<<<< HEAD
							<li class="breadcrumb-item action">Financial Details</li>
=======
							<li class="breadcrumb-item action">Financial Consultant Details</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
							<li class="breadcrumb-item action">Financial Consultant Details</li>
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
<<<<<<< HEAD
								<label for="">Date of Joining</label> <input type="date"
									name="JoiningDate" id="JoiningDate" required="required"
									
=======
								<label for="joiningDate">Joining Date</label> <input type="date"
									name="joiningDate" id="joiningDate" required="required"
									placeholder="Enter Joining Date"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
								<label for="joiningDate">Joining Date</label> <input type="date"
									name="joiningDate" id="joiningDate" required="required"
									placeholder="Enter Joining Date"
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
<<<<<<< HEAD
								<label for="vehicalNo">Select Customer</label> <select id="customerCode"
									name="customerCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Member</option>
									<option value="Blue">Joe</option>
=======
								<label for="selectCustomer">Select Customer</label> <select id="selectCustomer"
									name="selectCustomer" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Customer</option>
=======
								<label for="selectCustomer">Select Customer</label> <select id="selectCustomer"
									name="selectCustomer" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Customer</option>
									<option value="Blue">Blue</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Customer Name</label> <input type="text" name="customerName"
									id="customerName" required="required" placeholder="Enter Cutomer Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="dob">Date of Birth</label> <input type="date" name="dob"
									id="dob" required="required"
									placeholder="Enter Date Of Birth"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Age</label> <input type="text" name="age"
									id="age" required="required" placeholder="Enter Age"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Family Customer Name</label> <input type="text"
									name="familyCustomerName" id="familyCustomerName" required="required"
									placeholder="Enter Family Customer Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relation to Applicant</label> <select id="relationtoApplicant"
									name="relationtoApplicant" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Enter Relation to Applicant</option>
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
									<option value="Blue">Blue</option>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
<<<<<<< HEAD
								<label>Customer Name</label> <input type="text" name="customername"
									id="customername" required="required" placeholder="Enter Member"
=======
								<label>Customer Name</label> <input type="text" name="customerName"
									id="customerName" required="required" placeholder="Enter Cutomer Name"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="text-transform: uppercase;" />
=======
								<label for="contactNo">Contact No</label> <input type="text" name="contactNo"
									id="contactNo" required="required" placeholder="Enter Contact No" />
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
<<<<<<< HEAD
								<label for="">DOB</label> <input type="date" name="dob"
									id="dob" required="required"
									
=======
								<label for="dob">Date of Birth</label> <input type="date" name="dob"
									id="dob" required="required"
									placeholder="Enter Date Of Birth"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Age</label> <input type="text" name="age"
									id="age" required="required" placeholder="Enter Age"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Family Member Name</label> <input type="text"
									name="membername" id="membername" required="required"
									placeholder="Enter Relative Name" />
=======
								<label for="">Family Customer Name</label> <input type="text"
									name="familyCustomerName" id="familyCustomerName" required="required"
									placeholder="Enter Family Customer Name" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label>Relation to Applicant</label> <select id="relation"
									name="relation" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Relation</option>
									<option value="Blue">Mother</option>
=======
								<label>Relation to Applicant</label> <select id="relationtoApplicant"
									name="relationtoApplicant" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Enter Relation to Applicant</option>
									<option value="Blue">Blue</option>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
								<label for="">Contact No</label> <input type="text" name="contactno"
									id="contactno" required="required" placeholder="Enter Contact No" />
=======
								<label for="contactNo">Contact No</label> <input type="text" name="contactNo"
									id="contactNo" required="required" placeholder="Enter Contact No" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
=======
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
								<label for="nomineeName">Nominee Name</label> <input type="text"
									name="nomineeName" id="nomineeName" required="required"
									placeholder="Enter Nominee Name" />
							</div>
						</div>

						<!-- <div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Relation</label> <select id="Nrelation" name="Nrelation"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Relation</option>
									<option value="Blue">Mother</option>
								</select>
							</div>
						</div> -->

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
<<<<<<< HEAD
<<<<<<< HEAD
								<label>Branch Name</label> <select id="Branch" name="Branch"
=======
								<label>Branch Name</label> <select id="branchName" name="branchName"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
								<label>Branch Name</label> <select id="branchName" name="branchName"
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Branch</option>
									<option value="Blue">Reshimbaug</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
<<<<<<< HEAD
								<label for="">Nominee Age</label> <input type="text"
=======
								<label for="nomineeAge">Nominee Age</label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
								<label for="nomineeAge">Nominee Age</label> <input type="text"
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
									name="nomineeAge" id="nomineeAge" required="required"
									placeholder="Enter Nominee Age" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Address</label>
								<textarea name="address" id="address"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
<<<<<<< HEAD
								<label for="">District</label> <input type="text" name="district"
=======
								<label for="district">District</label> <input type="text" name="district"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
								<label for="district">District</label> <input type="text" name="district"
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
									id="district" required="required" placeholder="Enter District" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
<<<<<<< HEAD
								<label for="">State</label> <input type="text" name="state"
=======
								<label for="state">State</label> <input type="text" name="state"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
								<label for="state">State</label> <input type="text" name="state"
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
									id="state" required="required" placeholder="Enter State" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
<<<<<<< HEAD
								<label for="">Pin Code</label> <input type="text" name="pincode"
									id="pincode" required="required" placeholder="Enter Pincode" />
=======
								<label for="pinCode">Pin Code</label> <input type="text" name="pinCode"
									id="pinCode" required="required" placeholder="Enter Pincode" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
								<label for="pinCode">Pin Code</label> <input type="text" name="pinCode"
									id="pinCode" required="required" placeholder="Enter Pincode" />
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Profession</label> <input type="text" name="profession"
									id="profession" required="required" placeholder="Enter Profession" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
<<<<<<< HEAD
								<label for="">Academic Background</label> <input type="text" name="education"
									id="education" required="required" placeholder="Enter Academic Background" />
=======
								<label for="academicBackground">Academic Background</label> <input type="text" name="academicBackground"
									id="academicBackground" required="required" placeholder="Enter Academic Background" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
								<label for="academicBackground">Academic Background</label> <input type="text" name="academicBackground"
									id="academicBackground" required="required" placeholder="Enter Academic Background" />
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
							</div>
						</div>
					</div>

					<div class="row mt-4">
						<div class="col-lg-3 mb-5">
							<label for=""
<<<<<<< HEAD
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">
								Upload Photo</label> <label for="bike1image" id="drop-area"> <input
								type="file" accept="image/*" name="customerphoto" id="customerphoto"
=======
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
								Photo</label> <label for="photo" id="drop-area"> <input
								type="file" accept="image/*" name="photo" id="photo"
<<<<<<< HEAD
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
								hidden="hidden" onchange="bike1Preview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="bike1imagePreview" />
								</div>
							</label>
						</div>

						<div class="col-lg-3 mb-5">
							<label for=""
								style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
<<<<<<< HEAD
<<<<<<< HEAD
								Signature</label> <label for="bike2image" id="drop-area"> <input
								type="file" accept="image/*" name="customersignature" id="customersignature"
=======
								Signature</label> <label for="signature" id="drop-area"> <input
								type="file" accept="image/*" name="signature" id="signature"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
								Signature</label> <label for="signature" id="drop-area"> <input
								type="file" accept="image/*" name="signature" id="signature"
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
								hidden="hidden" onchange="bike2Preview();"
								style="background-size: cover; background-repeat: no-repeat" />
								<div id="img-view">
									<img src="../images/upload/upload.png" alt="upload_icon"
										id="bike2imagePreview" />

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
<<<<<<< HEAD
								<label>Select Role</label> <select id="role"
									name="role" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Colour</option>
									<option value="Blue">Developer</option>
								</select>

=======
								<label>Select Position</label> <input type="text"
									name="selectPosition" id="selectPosition" required="required"
									placeholder="Enter Position" style="text-transform: uppercase;" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
<<<<<<< HEAD
								<label for="vehicalNo">Reference Code</label> <input
=======
								<label for="referenceCode">Reference Code</label> <input
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
								<label for="referenceCode">Reference Code</label> <input
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
									type="text" name="referenceCode" id="referenceCode" required="required"
									placeholder="Enter Reference Code"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Reference Name</label> <input type="text"
<<<<<<< HEAD
<<<<<<< HEAD
									name="referencename" id="referencename" required="required"
									placeholder="Enter Introducer Name"
=======
									name="referenceCode" id="referenceCode" required="required"
									placeholder="Enter Reference Name"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
									name="referenceCode" id="referenceCode" required="required"
									placeholder="Enter Reference Name"
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
<<<<<<< HEAD
								<label for="">Position </label> <input type="text"
=======
								<label for="position">Position </label> <input type="text"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
=======
								<label for="position">Position </label> <input type="text"
>>>>>>> 0f68f1573cd5c98d83f9b124ae212502906ebbad
									name="position" id="position" required="required"
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

			

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>