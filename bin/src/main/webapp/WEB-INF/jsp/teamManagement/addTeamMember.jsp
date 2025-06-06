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
			<h1>Team Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-person-workspace"></i>
					</a></li>
					<li class="breadcrumb-item action">Add Team Member</li>
=======
			<h1>Employee Section</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Add Employee</li>
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
							<li class="breadcrumb-item action">Team Member Details</li>
=======
							<li class="breadcrumb-item action">Employee Details</li>
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
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
<<<<<<< HEAD
								<label for="">Team Member CODE</label> <input type="text" id="teamMemberCode"
									name="teamMemberCode" required="required"
									placeholder="Enter Team Member Code">
=======
								<label for="">EMP CODE</label> <input type="text" id="empcode"
									name="empcode" required="required"
									placeholder="Enter Employee Code">
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="joiningDate">Sign-Up Date</label> <input type="date"
									name="signUpDate" id="signUpDate" required="required"
									placeholder="Enter Sign-Up Date"
=======
								<label for="joiningDate">Joining Date</label> <input type="date"
									name="joiningDate" id="joiningDate" required="required"
									placeholder="Enter Joining Date"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Branch Name </label> <select id="branchName"
									name="branchName" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Branch Name</option>
									<option value="Blue">Umrer</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Team Member Name </label> <input type="text"
									name="teamMemberName" id="teamMemberName" required="required"
									placeholder="Enter Team Member Name" />
=======
								<label for="">Employee Name </label> <input type="text"
									name="empName" id="empName" required="required"
									placeholder="Enter Employee Name" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
<<<<<<< HEAD
								<label for="dob">Date Of Birth</label> <input type="date" name="dateOfBirth"
									id="dateOfBirth" required="required" placeholder="Enter DateOfBirth"
=======
								<label for="dob">DOB</label> <input type="date" name="dob"
									id="dob" required="required" placeholder="Enter DateOfBirth"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Age</label> <input type="text" name="age" id="age"
									required="required" placeholder="Enter Age" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Family Member Name </label> <input type="text"
									name="familyMemberName" id="familyMemberName" required="required"
									placeholder="Enter Family Member Name" />
=======
								<label for="">Relative Name</label> <input type="text"
									name="relativeName" id="relativeName" required="required"
									placeholder="Enter Relative Name" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Relation to Applicant </label> <select
									id="relationToApplicant" name="relationToApplicant"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Relation to Applicant</option>
=======
								<label for="">Relative Relation </label> <select
									id="relativeRelation" name="relativeRelation"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Relative Relation</option>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									<option value="Blue">Sister</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
<<<<<<< HEAD
								<label for="">Contact No</label> <input type="text"
									name="contactNo" id="contactNo" required="required"
									placeholder="Enter Contact No" />
=======
								<label for="">Mobile No</label> <input type="text"
									name="mobileNo" id="mobileNo" required="required"
									placeholder="Enter Mobile No" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee Name</label> <input type="text"
									name="nomineeName" id="nomineeName" required="required"
									placeholder="Enter Nominee Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Nominee Age</label> <input type="text"
									name="nomineeAge" id="nomineeAge" required="required"
									placeholder="Enter Nominee Age" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Relation with Nominee</label> <select id="relationWithNominee"
									name="relationWithNominee" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Relation</option>
									<option value="Blue">Mother</option>
=======
								<label for="">Relation </label> <select id="relation"
									name="relation" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Relation</option>
									<option value="Blue">Sister</option>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="">Address</label>
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
								<label for="">PAN</label> <input type="text" name="pan" id="pan"
									required="required" placeholder="Enter PAN" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Bank A/C</label> <input type="text" name="bankAC"
									id="bankAC" required="required" placeholder="Enter Bank A/C" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">IFSC Code</label> <input type="text" name="ifscCode"
									id="ifscCode" required="required" placeholder="Enter IFSC Code" />
=======
								<label for="">IFSC Code</label> <input type="text" name="ifsc"
									id="ifsc" required="required" placeholder="Enter IFSC Code" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Exp. Details</label> <input type="text" name="expDetails"
									id="expDetails" required="required" placeholder="Enter Exp. Details" />
=======
								<label for="">Exp. Details</label> <input type="text" name="exp"
									id="exp" required="required" placeholder="Enter Exp. Details" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Educational Background</label> <input type="text"
									name="educationalBackground" id="educationalBackground" required="required"
									placeholder="Enter Educational Background" />
=======
								<label for="">Qualification</label> <input type="text"
									name="qualification" id="qualification" required="required"
									placeholder="Enter Qualification" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>


					</div>
				</div>







				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Designation Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Designation </label> <select id="designation" name="designation"
=======
								<label for="">Designation </label> <select id="desg" name="desg"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select</option>
									<option value="Blue">Developer</option>
								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Department </label> <select id="department" name="department"
=======
								<label for="">Department </label> <select id="dept" name="dept"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select</option>
									<option value="Blue">HR</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Salary </label> <input type="text" name="salary"
									id="salary" required="required" placeholder="Enter Salary" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Saving Account No. </label> <input type="text"
									name="savingAccNo" id="savingAccNo" required="required"
=======
								<label for="">SB Account No. </label> <input type="text"
									name="accNo" id="accNo" required="required"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									placeholder="Enter SB Account No." />
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
								<label for="">Fees(if any) </label> <input type="text"
									name="fees" id="fees" required="required"
									placeholder="Enter Fees" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Mode of Payment  </label> <select id="modeofpayment"
									name="modeofpayment" required="required"
=======
								<label for="">Payment By </label> <select id="paymentBy"
									name="PaymentBy" required="required"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
									<option value="Blue">Cash</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
<<<<<<< HEAD
								<label for="">Comments </label> <input type="text" name="comments"
									id="comments" required="required" placeholder="Enter Remarks" />
=======
								<label for="">Remarks </label> <input type="text" name="remarks"
									id="remarks" required="required" placeholder="Enter Remarks" />
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							</div>
						</div>

						<div class="col-lg-3">
							<div
								class=" h-100 d-flex justify-content-start align-items-center">
								<div
									class="d-flex justify-content-start align-items-center formFields">
<<<<<<< HEAD
									<label style="margin-left: 20px;" class="mb-2">Customer
										Status</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="customerStatus" name="customerStatus"
=======
									<label style="margin-left: 20px;" class="mb-2">Member
										Status</label>
									<div class="cont">
										<div class="toggle">
											<input type="checkbox" id="toggle-member-status"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
												class="toggle__input" data-toggle-type="member-status">
											<label for="toggle-member-status" class="toggle__label"></label>
										</div>
									</div>
								</div>
							</div>
						</div>



					</div>
				</div>


				<div class="row">
					<div class="col-12">
<<<<<<< HEAD
						<button id="TeamMemberSaveBtn" class="btnStyle bg-success">Save</button>
						<button id="newBtn" class="btnStyle"
=======
						<button id="saveBtn" class="btnStyle bg-success">Save</button>
						<button id="saveBtn" class="btnStyle"
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
							style="background-color: #FFA500;">New</button>
					</div>
			</form>
		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>