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

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Select2 CSS and JS -->
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

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
					<li class="breadcrumb-item action">Investment Data Search</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Print Search Results</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-5">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 20px;">
								<label for="policyCode" id="policySelection">Policy
									Number </label> <select id="policyCode" name="policyCode"
									class="form-control selectField" style="width: 100%;">
									<option value="">-- Search Policy Number --</option>
								</select>
							</div>
						</div>

						<div class="row" style="margin-top: 20px;">
							<div class="col-12 text-center">
								<button id="saveBtn" class="btn btn-dark">Find</button>
							</div>
						</div>

					</div>

					<div class="mt-5">

						<div class="row">


							<div class="col-12">
								<div class="card recent-sales">

									<div class="card-body table-responsive">
										<h5 class="card-title">
											Recent Sales <span>| Today</span>
										</h5>

										<table
											class="table table-borderless datatable overflow-scroll">
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
												</tr>
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
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/PolicyManagment/investmentSearch.js"></script>
</body>

</html>