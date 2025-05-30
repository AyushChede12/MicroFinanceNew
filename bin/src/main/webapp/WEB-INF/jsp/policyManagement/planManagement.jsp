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
			<h1>Plan Master</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Member Section</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Daily Deposit</li>
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
								<label for="">Plan Code *</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Plan Code"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Minimum Deposit*</label> <input
									type="text" name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Rate of Interest (%)*</label> <input
									type="text" name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Interest Rate"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Installment Type*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Daily</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Select" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Duration*</label> <input type="text" name="location"
									id="location" required="required" placeholder="Enter Term" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Commission on New*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Renewal Commission (%)*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Interest Interval*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Daily</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Total Paid</label> <input readonly type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount*</label> <input readonly
									type="text" name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Is Flexible Plan?</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">No</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search elative Relation" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Grace Days*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Mobile No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Penalty Rate (%)*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Email id" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Status of Plan</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Occupation" />
							</div>
						</div>


					</div>

					<div class="row" style="margin-left: 80%;">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-danger">Generate</button>
							<button id="saveBtn" class="btnStyle bg-warning">Save</button>
						</div>
					</div>

					<div class="row mt-5">
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
			</form>
		</div>


		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Recurring Deposit</li>
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
								<label for="">Plan Code*</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Plan Code"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Minimum Amount*</label> <input
									type="text" name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Interest Rate(%)*</label> <input
									type="text" name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Interest Rate"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Term Mode*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Daily</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Select" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Term*</label> <input type="text" name="location"
									id="location" required="required" placeholder="Enter Term" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Comm.New(%)*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Comm.Renew(%)*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Compound Interval*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Daily</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Total Deposit</label> <input readonly type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount*</label> <input readonly
									type="text" name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Grace Period*</label> <input readonly type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Late Fine(%)*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Email id" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Plan Status</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Occupation" />
							</div>
						</div>


					</div>

					<div class="row" style="margin-left: 80%;">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-danger">Generate</button>
							<button id="saveBtn" class="btnStyle bg-warning">Save</button>
						</div>
					</div>

					<div class="row mt-5">
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
			</form>
		</div>


		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Fixed Deposit</li>
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
								<label for="">Plan Code*</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Plan Code"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Minimum Amount*</label> <input
									type="text" name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Interest Rate(%)*</label> <input
									type="text" name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Interest Rate"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Term Mode*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Daily</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Select" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Term*</label> <input type="text" name="location"
									id="location" required="required" placeholder="Enter Term" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Interest Type*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Simple</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Compound Interval*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Daily</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Total Deposit</label> <input readonly type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount*</label> <input readonly
									type="text" name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Comm.New(%)*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Plan Status</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Occupation" />
							</div>
						</div>


					</div>

					<div class="row" style="margin-left: 80%;">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-warning">Save</button>
						</div>
					</div>

					<div class="row mt-5">
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
			</form>
		</div>


		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">MIS Deposit</li>
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
								<label for="">Plan Code*</label> <input type="text"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Plan Code"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Minimum Amount*</label> <input
									type="text" name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Minimum Amount"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Maturity ROI(%)</label> <input
									type="text" name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Interest Rate"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Term Mode*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Daily</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Select" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Term*</label> <input type="text" name="location"
									id="location" required="required" placeholder="Enter Term" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">MIS Int.ROI(%)*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>MIS Interval*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Daily</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search City" />
										</div>
										<ul class="options" id="city-options">
											<!-- Options will be dynamically added here -->

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">MIS Interest</label> <input readonly type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount*</label> <input readonly
									type="text" name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Comm.New(%)*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Plan Status</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Occupation" />
							</div>
						</div>


					</div>

					<div class="row" style="margin-left: 80%;">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-warning">Save</button>
						</div>
					</div>

					<div class="row mt-5">
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
			</form>
		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>