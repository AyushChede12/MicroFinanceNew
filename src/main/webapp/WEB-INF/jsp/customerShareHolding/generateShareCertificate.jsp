<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
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

<!-- JQuery link -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>Share Certificate</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>
<<!-- div class="container mt-5">
    <h2 class="text-center">Share Certificates</h2>
    <div id="certificateContainer" class="mt-4"></div>
</div> -->

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Customer Shareholding</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-building-fill-down"></i>
					</a></li>
					<li class="breadcrumb-item action">Generate Share Certificate</li>
				</ol>
			</nav>
		</div>
		<div>
			<nav>
				<ol class="breadcrumb breadcrumb-title">
					<li class="breadcrumb-item action">Customer Details</li>
				</ol>
			</nav>
			<div class="row">
				<div class="col-lg-6">
					<div class="d-flex flex-column formFields">
						<label for="">Referral Code Entry :</label> <select
							id="referralCodeEntry" name="referralCodeEntry" required="required" 
							class="form-control selectField mb-4" style="height: 30px;">
							<option value="">Select</option>
						</select>
					</div>
				</div>
			</div>
			
			<!-- <div class="row">
				<div class="col-lg-3">
					<div class="d-flex flex-column formFields">
						<label for=""></label> <select
							id="referralCodeEntry" name="referralCodeEntry"
							required="required" onchange="fetchShareDataByCode()"
							class="form-control selectField" style="height: 30px;">
							<option value="">Select</option>
						</select>
					</div>
				</div>
			</div> -->


			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">
						<div class="card-body table-responsive">
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="card-title">
									Search Result <span>|share data List</span>
								</h5>
							</div>
							<table class="table table-borderless datatable overflow-scroll">
								<thead class="table-light">
									<tr style="font-family: 'Poppins', sans-serif;">
										<th scope="col"></th>
										<th scope="col">Sr.No</th>
										<th scope="col">Customer Code</th>
										<th scope="col">Customer Name</th>
										<th scope="col">Share Amount</th>
										<th scope="col">No. Of Share</th>
										<th scope="col">Certificate NO.</th>
									</tr>
								</thead>
								<tbody id="shareholdingTableBody">
								</tbody>
							</table>
						</div>



					</div>
					<button type="button" class="btn btn-warning" id="printCertificateBtn"
						style="float: right;">Print</button>

				</div>
			</div>

			<div class="row mt-5" id="certificateContainer">
	<div class="col-12">
		<div class="card recent-sales">
			<div class="card-body table-responsive">
				<!-- Certificate Form Starts Here -->
				<div class="p-3">
					<h5 class="text-center mb-3" style="font-size: 20px;">
						<strong>Microfinance Pvt. Ltd</strong>
					</h5>

					<!-- Applicant Information -->
					<p style="font-size: 14px;">
						<strong>customer ID of customer Name:</strong> <span id = "customeridandName"></span> 
					</p>
					<p style="font-size: 14px;">
						<strong>Certificate No.:</strong> <span id = "certificateno"></span> 
					</p>

					<!-- Policy Details Section -->
					<h6 class="mt-4" style="font-size: 16px;">
						<strong>Share Details :- </strong> <span></span>
					</h6>
					<div class="row border">
						<div class="col-md-6" style="padding-top: 15px;">
							<p style="font-size: 13px;">
								<strong>Number Of Share :</strong>  <span id = "numberofshare"></span>
							</p>
							<p style="font-size: 13px;">
								<strong>Amount Transferred :</strong> <span id="amounttransferred"></span>
							</p>
							<p style="font-size: 13px;">
								<strong>Branch :</strong> <span id="branchname"></span>
							</p>
							<p style="font-size: 13px;">
								<strong>Start Date :</strong> <span id="startdate"></span>
							</p>
						</div>
						<div class="col-md-6" style="padding-top: 15px;">
							<p style="font-size: 13px;">
								<strong>Balance Shares :</strong> <span id="balanceshare"></span>
							</p>
							<p style="font-size: 13px;">
								<strong>Share Issued By :</strong> <span id="shareissuedby"></span>
							</p>
							<p style="font-size: 13px;">
								<strong>Date of Transfer :</strong> <span id="dataoftransfer"></span>
							</p>
						</div>
					</div>

					<!-- Maturity Payment Instructions -->
					<h6 class="mt-3" style="font-size: 16px;">
						<strong>Mode Of Payment :</strong> <span id="modeofpayement"></span>
					</h6>
					<p style="font-size: 13px;">(Content can be added here if needed)</p>
				</div>
				<!-- Certificate Form Ends Here -->

			</div>
		</div>
	</div>
</div>


		</div>

	</main>

	<script src="./js/adminscript.js"></script>
	<!-- JS Links -->
	<script src="./js/CustomerShareHolding/generateShareCertificate.js"></script>

	
	
</body>

</html>