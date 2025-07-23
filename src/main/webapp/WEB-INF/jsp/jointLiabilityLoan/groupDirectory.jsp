<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.19.5/jquery.validate.min.js"></script>
<style type="text/css">
.upload-container {
	display: flex;
	gap: 40px;
	justify-content: flex-start;
	margin-top: 20px;
}

.upload-box {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 180px;
	font-family: 'Poppins', sans-serif;
}

.upload-box label.title {
	font-size: 14px;
	font-weight: 600;
	margin-bottom: 10px;
}

.upload-preview {
	width: 150px;
	height: 150px;
	border: 2px dashed #ccc;
	border-radius: 12px;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f9f9f9;
	cursor: pointer;
}

.upload-preview img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>

</head>


<body>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Joint Liability Loan</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"><i
							class="bi bi-person-bounding-box"></i></a></li>
					<li class="breadcrumb-item active">Group Directory</li>
				</ol>
			</nav>
		</div>

		<form id="groupdirectordform">
			<div class="row">
				<div class="col-12">
					<h4 style="font-size: 20px;">Group Info</h4>
				</div>
				<div class="col-lg-3" style="display: none;">
					<div class="d-flex flex-column formFields">
						<label>id*</label> <input type="text" id="id" name="id"
							class="form-control" required />
					</div>
				</div>
				<div class="col-lg-3" style="display: none;">
					<div class="d-flex flex-column formFields">
						<label>Group ID*</label> <input type="text" id="groupID" name="groupID" value="${memberCodeGD}"
							class="form-control" required />
					</div>
				</div>

				<div class="col-lg-3 ">	
					<div class="d-flex flex-column formFields">
						<label>Community Name*</label> <input type="text"
							id="communityName" name="communityName" class="form-control"
							required placeholder="Enter Community Name" />
					</div>
				</div>

				<div class="col-lg-3 ">
					<div class="d-flex flex-column formFields">
						<label>Opening Date*</label> <input type="date" id="openingDate"
							name="openingDate" class="form-control" required />
					</div>
				</div>


				<div class="col-lg-3 mb-4 ">
					<div class="d-flex flex-column formFields">
						<label for="">Branch Name*</label> <select id="branchName"
							name="branchName" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Branch</option>
							<option>Branch A</option>
							<option>Branch B</option>
						</select>
					</div>
				</div>

				<div class="col-lg-3 ">
					<div class="d-flex flex-column formFields">
						<label>Community Leader*</label> <input type="text"
							id="communityLeader" name="communityLeader" class="form-control"
							required placeholder="Enter Leader Name" />
					</div>
				</div>

				<div class="col-lg-3 ">
					<div class="d-flex flex-column formFields">
						<label>Contact No.*</label> <input type="text" id="contactNo"
							name="contactNo" class="form-control" required maxlength="10"
							placeholder="Enter Contact No" />
					</div>
				</div>

				<div class="col-lg-3 ">
					<div class="d-flex flex-column formFields">
						<label>Community Address*</label> <input type="text"
							id="communityAddress" name="communityAddress"
							class="form-control" required placeholder="Enter Address" />
					</div>
				</div>


				<div class="col-lg-3 mb-4 ">
					<div class="d-flex flex-column formFields">
						<label for="">Allocated Staff*</label> <select id="allocatedStaff"
							name="allocatedStaff" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Staff</option>
							<option>Staff A</option>
							<option>Staff B</option>

						</select>
					</div>
				</div>

				<div class="col-lg-3 mb-4 ">
					<div class="d-flex flex-column formFields">
						<label for="">Scheduled Collection Days*</label> <select
							id="collectionDay" name="collectionDay" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Day</option>
							<option>Monday</option>
							<option>Wednesday</option>

						</select>
					</div>
				</div>

				<div class="col-lg-3 mb-4 ">
					<div class="d-flex flex-column formFields">
						<label for="">Scheduled Time*</label> <select id="collectionTime"
							name="collectionTime" required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Time</option>
							<option>10:00 AM</option>
							<option>02:00 PM</option>
						</select>
					</div>
				</div>




				<div class="col-12 text-right">
					<button id="savegroupdirectory" type="button"
						class="btn btn-success mt-3">Save</button>
					<button id="updategroupdirectory" type="button"
						class="btn btn-success mt-3">Update</button>
				</div>


			</div>
			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">
						<div class="card-body table-responsive">
							<h5 class="card-title">Details Search List</h5>
							<table class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th>Group ID</th>
										<th>Community Name</th>
										<th>Opening Date</th>
										<th>Assigned Branch</th>
										<th>Community Leader</th>
										<th>Contact No</th>
										<th>Community Address</th>
										<th>Allocated Staff</th>
										<th>Collection Day</th>
										<th>Collection Time</th>


										<th>Active</th>
									</tr>
								</thead>
								<tbody id="groupDirectoryBody">


									<!-- More rows -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<hr class="mt-5" />
			<div class="col-12">
				<h4>Group Member Link</h4>
			</div>

			<div class="row">
				<div class="col-lg-3 mb-4 ">
					<div class="d-flex flex-column formFields">
						<label for="">Select Member*</label> <select id="selectedMember"
							name="selectedMember" onchange="SelectMember()"  required="required"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Member</option>
							<option>Member 1</option>
							<option>Member 2</option>

						</select>
					</div>
				</div>


				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label>Customer Name*</label> <input type="text" id="customerName"
							name="customerName" class="form-control" required
							placeholder="Enter Member Name" />
					</div>
				</div>

				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label>Referral Details*</label> <input type="text"
							id="referralDetails" name="referralDetails" class="form-control"
							required placeholder="Enter Relative Details" />
					</div>
				</div>

				<div class="col-lg-3 ">
					<div class="d-flex flex-column formFields">
						<label>Contact*</label> <input type="text" id="contact"
							name="contact" class="form-control" maxlength="10" required
							placeholder="Enter Mobile Number" />
					</div>
				</div>

				

			</div>

			<div class="col-12 text-right">
				<button type="button"  id="addque"  class="btn btn-success mt-3">Add Que</button>
			</div>
			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">
						<div class="card-body table-responsive">
							<h5 class="card-title">Details Search List</h5>
							<table class="table table-bordered" id="tab1">
								<thead class="thead-light">
									<tr>
										<th>id</th>
										<th>Customer Name</th>
										<th>Referral Details</th>
										<th>Contact</th>
										
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-4">
				<div class="col-lg-3 mb-5">
					<label for=""
						style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
						Photo <span class="star">*</span>
					</label> <label for="uploadPhoto" id="drop-area"> <input
						type="file" accept="image/*" name="uploadPhoto" id="uploadPhoto"
						hidden="hidden" onchange="photoUpload();"
						style="background-size: cover; background-repeat: no-repeat" />
						<div id="img-view">
							<img src="../images/upload/upload.png" alt="upload_icon"
								id="photoPreview" /><input type="hidden" name="photoHidden"
								id="photoHidden">

							<!-- <p id="upload-text"
                    style="font-size: 12px; margin-top: 15px"
                    class="text-muted"
                  >
                    Drag and drop or Choose File to upload the image
                  </p> -->
						</div>
					</label> <small id="chkphoto" style="color: red;"></small>
				</div>

				<div class="col-lg-3 mb-5">
					<label for=""
						style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">Upload
						Signature <span class="star">*</span>
					</label> <label for="uploadSignature" id="drop-area"> <input
						type="file" accept="image/*" name="uploadSignature"
						id="uploadSignature" hidden="hidden" onchange="signatureUpload();"
						style="background-size: cover; background-repeat: no-repeat" />
						<div id="img-view">
							<img src="../images/upload/upload.png" alt="upload_icon"
								id="signaturePreview" /><input type="hidden"
								name="signatureHidden" id="signatureHidden">
							<!-- <p
                    style="font-size: 12px; margin-top: 15px"
                    class="text-muted"
                  >
                    Drag and drop or Choose File to upload the image
                  </p> -->
						</div>
					</label> <small id="chksignature" style="color: red;"></small>
				</div>

			</div>
		</form>
	</main>
	<script src="./js/adminscript.js"></script>
	<script src="./js/Joinlibiliy/GroupDirectory.js"></script>

</body>

</html>
