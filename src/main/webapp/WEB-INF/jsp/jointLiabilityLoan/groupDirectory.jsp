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
<style>
.form-group {
	font-size: 15px;
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

		<form id="formid">
			<div class="row">
				<!-- Group Info -->
				<div class="col-12">
					<h4 style="font-size: 20px;">Group Info</h4>
				</div>



				<div class="col-lg-3 ">
					<div class="d-flex flex-column formFields">
						<label>Community Name*</label> <input type="text"
							name="communityName" class="form-control" required
							placeholder="Enter Community Name" />
					</div>
				</div>

				<div class="col-lg-3 ">
					<div class="d-flex flex-column formFields">
						<label>Opening Date*</label> <input type="date" name="openingDate"
							class="form-control" required />
					</div>
				</div>
				<div class="col-lg-3 mb-4">
					<div class="d-flex flex-column formFields">
						<label for="branchName">Assigned Branch*</label> <select
							id="branchName" name="branchName" required
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Branch</option>
							<option>Branch A</option>
							<option>Branch B</option>
							<!-- Add options here -->
						</select>
					</div>
				</div>





				<div class="col-lg-3 ">
					<div class="d-flex flex-column formFields">
						<label>Community Leader*</label> <input type="text"
							name="communityLeader" class="form-control" required
							placeholder="Enter Leader Name" />
					</div>
				</div>

				<div class="col-lg-3 ">
					<div class="d-flex flex-column formFields">
						<label>Contact No.*</label> <input type="text" name="contactNo"
							class="form-control" required maxlength="10"
							placeholder="Enter Contact No" />
					</div>
				</div>

				<div class="col-lg-3 ">
					<div class="d-flex flex-column formFields">
						<label>Community Address*</label> <input type="text"
							name="communityAddress" class="form-control" required
							placeholder="Enter Address" />
					</div>
				</div>
				<div class="col-lg-3 mb-4">
					<div class="d-flex flex-column formFields">
						<label for="branchName">Allocated Staff*</label> <select
							id="branchName" name="branchName" required
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Staff</option>
							<option>Staff A</option>
							<option>Staff B</option>
							<!-- Add options here -->
						</select>
					</div>
				</div>

				<div class="col-lg-3 mb-4">
					<div class="d-flex flex-column formFields">
						<label for="branchName">Scheduled Collection Days*</label> <select
							id="branchName" name="branchName" required
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Day</option>
							<option>Monday</option>
							<option>Wednesday</option>
							<!-- Add options here -->
						</select>
					</div>
				</div>
				<div class="col-lg-3 mb-4">
					<div class="d-flex flex-column formFields">
						<label for="branchName">Scheduled Time*</label> <select
							id="branchName" name="branchName" required
							class="form-control selectField" style="height: 30px;">
							<option value="">Select Time</option>
							<option>10:00 AM</option>
							<option>02:00 PM</option>
							<!-- Add options here -->
						</select>
					</div>
				</div>





				<!-- Save Button -->
				<div class="col-12 text-right">
					<button type="submit" class="btn btn-success mt-3">Save</button>
				</div>
			</div>

			<!-- Table Section -->
			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">
						<div class="card-body table-responsive">
							<h5 class="card-title">Details Search List</h5>
							<table class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th>#</th>
										<th>Customer</th>
										<th>Product</th>
										<th>Price</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Arun Kumar</td>
										<td>Milk</td>
										<td>$29</td>
										<td><span class="badge badge-success">Approved</span></td>
										<td><i class="fa fa-pen text-success"></i> <i
											class="fa fa-eye text-primary ml-2"></i> <i
											class="fa fa-trash text-danger ml-2"></i></td>
									</tr>
									<!-- More rows -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>





			<!-- Group Member Link Section -->
			<hr class="mt-5" />
			<div class="col-12">
				<h4>Group Member Link</h4>
			</div>
			<div class="row">
				<div class="col-lg-3 ">
					<label>Select Member*</label> <select name="selectedMember"
						class="form-control" required>
						<option value="">Select Member</option>
						<option>Member 1</option>
						<option>Member 2</option>
					</select>
				</div>

				<div class="col-lg-3">
				<div class="d-flex flex-column formFields">
					<label>Member Name*</label> <input type="text" name="memberName"
						class="form-control" required placeholder="Enter Member Name" />
				</div>
				</div>
				

				<div class="col-lg-3">
				<div class="d-flex flex-column formFields">
					<label>Relative Details*</label> <input type="text"
						name="relativeDetails" class="form-control" required
						placeholder="Enter Relative Details" />
				</div>
				</div>

				<div class="col-lg-3 ">
				<div class="d-flex flex-column formFields">
					<label>Mobile*</label> <input type="text" name="mobile"
						class="form-control" maxlength="10" required
						placeholder="Enter Mobile Number" />
						</div>
				</div>

				<div class="col-lg-3 ">
				<div class="d-flex flex-column formFields">
					<label>Previous Loan</label> <input type="text" name="previousLoan"
						class="form-control" placeholder="Enter Previous Loan" />
				</div>
				</div>
				<!-- Upload Photo -->
				<div class="col-lg-3 mb-3">
					<label
						style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">
						Upload Photo </label> <label for="bike1image" id="drop-area"> <input
						type="file" accept="image/*" name="bike1image" id="bike1image"
						hidden="hidden" onchange="bike1Preview();" />
						<div id="img-view">
							<img src="./upload.png" alt="upload_icon" id="bike1imagePreview"
								style="width: 100px; height: auto;" />
						</div>
					</label>
				</div>

				<!-- Upload Signature -->
				<div class="col-lg-3 mb-3">
					<label
						style="font-size: 12px; font-family: 'Poppins', sans-serif; font-weight: 700; margin-bottom: 5px;">
						Upload Signature </label> <label for="bike2image" id="drop-area">
						<input type="file" accept="image/*" name="bike2image"
						id="bike2image" hidden="hidden" onchange="bike2Preview();" />
						<div id="img-view">
							<img src="./upload.png" alt="upload_icon" id="bike2imagePreview"
								style="width: 100px; height: auto;" />
						</div>
					</label>
				</div>
			</div>
			<div class="col-12 text-right">
				<button type="add" class="btn btn-success mt-3">Add Que</button>
			</div>
			</div>
			<!-- Table Section -->
			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">
						<div class="card-body table-responsive">
							<h5 class="card-title">Details Search List</h5>
							<table class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th>#</th>
										<th>Customer</th>
										<th>Product</th>
										<th>Price</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Arun Kumar</td>
										<td>Milk</td>
										<td>$29</td>
										<td><span class="badge badge-success">Approved</span></td>
										<td><i class="fa fa-pen text-success"></i> <i
											class="fa fa-eye text-primary ml-2"></i> <i
											class="fa fa-trash text-danger ml-2"></i></td>
									</tr>
									<!-- More rows -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</form>



	</main>

	<script src="./js/adminscript.js"></script>
</body>

</html>
