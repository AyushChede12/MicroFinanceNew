<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<%@page import="java.util.List"%>
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
<!-- jQuery ajax cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>Admin Dashboard</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body onload="loadSidebar(sessionUser);">

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Preferences</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-gear text-blue"></i>
					</a></li>
					<li class="breadcrumb-item action">User Creation</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">User Information</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">User ID</label> <input type="text" name="UserId"
									id="UserId" required="required" placeholder="Enter User ID" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Password</label> <input type="password"
									name="password" id="password" required="required"
									placeholder="Enter password" style="text-transform: uppercase;" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Full Name</label> <input type="text" name="fullName"
									id="fullName" required="required"
									placeholder="Enter customer Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Email ID </label> <input type="email"
									name="emailId" id="emailId" required="required"
									placeholder="Enter email" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Contact No.</label> <input type="text"
									name="contactNumber" id="contactNumber" required="required"
									placeholder="Enter Contact no" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Sign In Branch</label> <select id=branchName1
									name="branchName" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Branch</option>

								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="pastDate">Past Date</label> <select id="pastDate"
									name="pastDate" required class="form-control selectField"
									style="height: 30px;">
									<option value="Yes">Select</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>
								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Re Print</label> <select id="rePrint" name="rePrint"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>
								</select>
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Delete Access</label> <select id="deleteAccess"
									name="deleteAccess" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div
								class=" h-100 d-flex justify-content-start align-items-center">
								<div
									class="d-flex justify-content-start align-items-center  formFields">
									<label style="margin-left: 20px;" class="mb-2"
										id="toggleStatus">User Status</label>
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


						<div class="row">
							<div class="col-12 text-center mt-4" style="margin-left: 300px;">
								<button id="saveBtn" class="btnStyle bg-warning" type="button">Save</button>
								<button id="updateBtn" type="button" class="btnStyle" style="background-color: #FFA500; display:none;">Update</button>


							</div>
						</div>



					</div>


					<div class="mt-5">
						<nav>
							<ol class="breadcrumb breadcrumb-title">
								<li class="breadcrumb-item action">User Access</li>
							</ol>
						</nav>

						<div class="row mt-5">
							<div class="col-12">
								<div class="card recent-sales">

									<div class="card-body table-responsive">
										<h5 class="card-title">
											User Access View 
										</h5>

										<table
											class="table table-borderless datatable overflow-scroll" id="userTable">
											<thead class="table-light">
												<tr>
													<th>#</th>
													<th>User ID</th>
													<th>Full Name</th>
													<th>Email ID</th>
													<th>Contact Number</th>
													<th>Sign In Branch</th>
													<th>Past Date</th>
													<th>Re Print</th>
													<th>Delete Access</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
											
									<!-- 	<tr style="font-family: 'Poppins', sans-serif;">
											<th scope="row"><a href="#">1</a></th>
											<td>Arun Kumar</td>
											<td><a href="#" className="text-primary">Milk</a></td>
											<td>$29</td>
											<td><span class="badge bg-success text-white">Approved</span>
											</td>
											<td class="d-flex" style="gap: .7rem;">
												<button class="iconbutton">
													<i class="fa-solid fa-pen-to-square text-success"></i>
												</button>
												<button class="iconbutton">
													<i class="fa-solid fa-eye text-primary"></i>
												</button>
												<button class="iconbutton">
													<i class="fa-solid fa-trash text-danger"></i>
												</button>
											</td>
										</tr>

										<tr>
											<th scope="row"><a href="#">2</a></th>
											<td>Deepak Dalwe</td>
											<td><a href="#" className="text-primary">Ghee</a></td>
											<td>$16.5</td>
											<td><span class="badge bg-danger text-white">Rejected</span>
											</td>
											<td class="d-flex" style="gap: .7rem;">
												<button class="iconbutton">
													<i class="fa-solid fa-pen-to-square text-success"></i>
												</button>
												<button class="iconbutton">
													<i class="fa-solid fa-eye text-primary"></i>
												</button>
												<button class="iconbutton">
													<i class="fa-solid fa-trash text-danger"></i>
												</button>
											</td>
										</tr>
										<tr>
											<th scope="row"><a href="#">2</a></th>
											<td>Deepak Dalwe</td>
											<td><a href="#" className="text-primary">Ghee</a></td>
											<td>$16.5</td>
											<td><span class="badge bg-danger text-white">Rejected</span>
											</td>
											<td class="d-flex" style="gap: .7rem;">
												<button class="iconbutton">
													<i class="fa-solid fa-pen-to-square text-success"></i>
												</button>
												<button class="iconbutton">
													<i class="fa-solid fa-eye text-primary"></i>
												</button>
												<button class="iconbutton">
													<i class="fa-solid fa-trash text-danger"></i>
												</button>
											</td>
										</tr>
										<tr>
											<th scope="row"><a href="#">2</a></th>
											<td>Deepak Dalwe</td>
											<td><a href="#" className="text-primary">Ghee</a></td>
											<td>$16.5</td>
											<td><span class="badge bg-danger text-white">Rejected</span>
											</td>
											<td class="d-flex" style="gap: .7rem;">
												<button class="iconbutton">
													<i class="fa-solid fa-pen-to-square text-success"></i>
												</button>
												<button class="iconbutton">
													<i class="fa-solid fa-eye text-primary"></i>
												</button>
												<button class="iconbutton">
													<i class="fa-solid fa-trash text-danger"></i>
												</button>
											</td>
										</tr> -->
									
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>


		</div>


	</main>

	<script type="text/javascript">
        // Fetch session data from JSP and pass it to JavaScript
        var sessionUser = [];

        <%List<String> userList = (List<String>) session.getAttribute("user");
if (userList != null) {
	for (String user : userList) {%>
                    sessionUser.push("<%=user%>
		");
	<%}
}%>
		
	</script>

	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/preferences/userCreation.js"></script>
	<script src="./js/access.js"></script>
	<script src="./js/loadSidebar.js"></script>

</body>

</html>