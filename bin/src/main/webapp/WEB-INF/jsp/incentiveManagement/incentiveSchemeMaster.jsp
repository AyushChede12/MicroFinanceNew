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
			<h1>Incentive Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-award"></i>
					</a></li>
					<li class="breadcrumb-item action">Incentive Scheme Master</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Incentive Master</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Incentive Month </label> <input type="text"
									name="incentiveMonth" id="incentiveMonth" required="required"
									placeholder="Enter Incentive Month " />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="vehicalNo">Date From</label> <input type="date"
									name="dateFrom" id="dateFrom" required="required"
									placeholder="Enter Date From"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="vehicalNo">Date To</label> <input type="date"
									name="dateTo" id="dateTo" required="required"
									placeholder="Enter Date To"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<!-- <div class="col-lg-3">
              <div class="d-flex flex-column formFields" style="margin-bottom: 30px">
                <label for="vehicalNo">To Date</label>
                <div class="position-relative">
                  <input type="date" name="vehicalNo" id="vehicalNo" required="required" placeholder="Enter Vehicle No"
                  style="text-transform: uppercase;" />
                </div>
              </div>
            </div> -->

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Comments </label> <input type="text"
									name="comments" id="comments" required="required"
									placeholder="Enter Comments" />
							</div>
							          
						</div>
						
						
				
						<div class="row" style="margin-left: 45%;">
							<div class="col-12 text-center">
								<button id="saveBtn" class="btnStyle bg-primary">Save
								</button>
							</div>
						</div>
						


						<table class="table table-borderless datatable overflow-scroll" style="margin-top: 30px;">
							<thead class="table-light">
								<tr style="font-family: 'Poppins', sans-serif;">
									<th scope="col">S/N</th>
									<th scope="col">Incentive Month</th>
									<th scope="col">Date From</th>
									<th scope="col">Date To</th>
									<th scope="col">Comments</th>

								</tr>
							</thead>
							<tbody>
							
						   </tbody>
						</table>
					</div>
				</div>
		</div>
		</div>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
</body>

</html>