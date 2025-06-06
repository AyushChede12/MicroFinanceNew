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
			<h1>Policy Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-piggy-bank"></i>
					</a></li>
					<li class="breadcrumb-item action">Add New Investment</li>
=======
			<h1>Add Investment</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-house-door"></i>
					</a></li>
					<li class="breadcrumb-item action">Investment Section</li>
>>>>>>> 3fd3afd3695257db684c438722ac0a343f53ce55
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Customer Details</li>
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
								<label for="">Policy start date*</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Member Selection</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Yes(Below
											18)</span> <i class="fa-solid fa-angle-down"></i>
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
								<label for="">Customer Name*</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Location" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Date of Birth*</label> <input type="date" name="vehicalNo"
									id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Relation Details*</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Relative Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Mobile No*</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Mobile No." />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Suggested Nominee *</label> <input type="text"
									name="location" id="location" required="required"
									placeholder="Enter Nominee Name" />
							</div>
						</div>




						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Age of Nominee</label> <input type="text" name="location"
									id="location" required="required"
									placeholder="Enter Nominee Name" />
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Relation*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Gender</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
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
								<label for="">Address*</label>
								<textarea name="" id=""
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">District*</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter District" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">State*</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter State" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Pin Code*</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter Pin Code" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">TDS*</label> <input type="text" name="price"
									id="price" required="required" placeholder="Enter TDS" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Branch Name*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
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
								<label>Mode of Operation*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
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
								<label for="">Joint Mem.Code*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter District" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Joint Name*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Adhar No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Date*</label> <input type="date"
									name="vehicalNo" id="vehicalNo" required="required"
									placeholder="Enter Vehicle No"
									style="text-transform: uppercase;" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Scheme Type*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
										</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
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
								<label>Scheme Name*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
										</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
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
								<label for="">Scheme Term*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter PAN No" />
							</div>
						</div>



						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Scheme Mode*</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Mly</span>
										<i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
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
								<label for="">Policy Amount*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Voter No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Deposit Amount*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Licence No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Intro.M Code</label>
								<div class="position-relative">
									<div class="select-btn1" style="cursor: pointer;">
										<span name="cityName" id="cityNameId" style="font-size: 12px;">Select
											Code</span> <i class="fa-solid fa-angle-down"></i>
									</div>
									<div class="content" id="contentCityName"
										style="display: none;">
										<div class="search">
											<input type="text" id="city-search" class="m-0"
												placeholder="Search" />
										</div>
										<ul class="options" id="city-options">

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Intro Member Name" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">MIS Interest*</label> <input type="text"
									name="price" id="price" required="required"
									placeholder="Enter Mobile No" />
							</div>
						</div>




					</div>


					<div class="mt-5">
						<nav>
							<ol class="breadcrumb breadcrumb-title">
								<li class="breadcrumb-item action">Payment Information</li>
							</ol>
						</nav>
						<div class="row">
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields"
									style="margin-bottom: 30px">
									<label>Payment By*</label>
									<div class="position-relative">
										<div class="select-btn1" style="cursor: pointer;">
											<span name="cityName" id="cityNameId"
												style="font-size: 12px;">Select</span> <i
												class="fa-solid fa-angle-down"></i>
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
									<label for="">Remark*</label>
									<textarea name="" id=""
										style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
								</div>
							</div>


							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Advisor/Collector* </label> <input type="text"
										name="location" id="location" required="required"
										placeholder="Enter Advisor/Collector Code" />
								</div>
							</div>





							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">SMS Send</label> <input type="text" name="price"
										id="price" required="required" placeholder="Enter Education" />
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
										<img src="./upload.png" alt="upload_icon"
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
									Signature</label> <label for="bike2image" id="drop-area"> <input
									type="file" accept="image/*" name="bike2image" id="bike2image"
									hidden="hidden" onchange="bike2Preview();"
									style="background-size: cover; background-repeat: no-repeat" />
									<div id="img-view">
										<img src="./upload.png" alt="upload_icon"
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

					<div class="row">
						<div class="col-12 text-center">
							<button id="saveBtn" class="btnStyle bg-warning"
								style="margin-left: 80%;">Save</button>

						</div>
					</div>
			</form>



		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>