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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>
				Joint Liability Loan/h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="home"> <i
								class="bi bi-person-bounding-box"></i>
						</a></li>
						<li class="breadcrumb-item action">Loan Approval</li>
					</ol>
				</nav>
		</div>
		

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Data Search Panel</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">

							<div class="d-flex flex-column formFields">
								<label for="groupCode">Find by Group Code*</label> <select
									id="groupcode" name="groupcode" required
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Customer Name</option>
								</select>
							</div>

						</div>



					</div>


				</div>


				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="openingDate">Opening Date*</label> <input
									type="date" name="openingDate" id="openingDate" required
									placeholder="Enter Opening Date"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="communityName">Community Name*</label> <input
									type="text" name="communityName" id="communityName" required
									placeholder="Enter Community Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="allocatedStaff">Allocated Staff*</label> <input
									type="text" name="allocatedStaff" id="allocatedStaff" required
									placeholder="Enter Allocated Staff" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="branchName">Branch Name*</label> <select
									id="branchName" name="branchName" required
									class="form-control selectField" style="height: 30px;"></select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for=""> Collection Schedule* </label> <input type="text"
									name="collectionDays" id="collectionDays" required="required"
									placeholder="Enter Location" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for=""> Payment Mode* </label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> ContactNumber* </label> <input type="text"
									name="contactNumber" id="contactNumber" required="required"
									placeholder="Enter Location" />
							</div>
						</div>
						<div class="col-lg-3  mb-4">
							<div class="d-flex flex-column formFields">
								<label for=""> Purpose of Loan* </label> <input type="text"
									name="purposeOfLoan" id="purposeOfLoan" required="required"
									placeholder="Enter Location" />
							</div>
						</div>



					</div>
				</div>

				<div class="mt-5">
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Approval Info</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Date of Approval*</label> <input
									type="date" name="dateOfApproval" id="dateOfApproval" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>
<div class="col-lg-3">

							<div class="d-flex flex-column formFields">
								<label for="groupCode">Approval Status:*</label> <select
									id="approvalStatus" name="approvalStatus" required
									class="form-control selectField" style="height: 30px;">
									<option value="approved">Approved</option>
									<option value="not_approved">Not Approved</option>
								</select>
							</div>

						</div>

						

					</div>
					<div class="row">
						<div class="col-12 text-center">
							<button  type="button"  id="approved" class="btnStyle bg-success"
								style="margin-left: 80%">Approved</button>

						</div>
					</div>
				</div>


			</form>



		</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        let today = new Date();
        let formattedDate = today.toISOString().split('T')[0]; // YYYY-MM-DD
        document.getElementById("dateOfApproval").value = formattedDate;
    });
</script>




	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/Joinlibiliy/LoanApproval.js"></script>
</body>

</html>