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
<!-- jQuery CDN (latest 3.x version) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Reports & Analytics</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-file-earmark-text"></i>
					</a></li>
					<li class="breadcrumb-item action">Finicial Collection Report</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Find Information</li>
						</ol>
					</nav>
					<div class="row">

						<!-- <div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="">Business Type </label> <select id="businessType"
									name="businessType" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
									<option value="Blue">AAA</option>
								</select>
							</div>
						</div> -->

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="">Branch Name </label> <select id="branchName"
									name="branchName" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select</option>
								</select>
							</div>
						</div>





						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">From Date :</label> <input type="date"
									name="fromDate" id="fromDate" required="required"
									placeholder="Enter From Date" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">TO Date :</label> <input type="date" name="toDate"
									id="toDate" required="required" placeholder="Enter To Date"
									style="text-transform: uppercase;" />
							</div>
						</div>





					</div>

					<div class="row">
						<div class="col-4 text-start mt-3">
							<button id="findFinancialAdvisorBtn" class="btnStyle"
					style="background-color: #FFA500;">Find</button>
						</div>
					</div>

				</div>

			</form>

			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">

						<div class="card-body table-responsive">
							<h5 class="card-title">Find Result</h5>

							<h6 class="card-title" style="text-align: center; color: black;">
								Agent/Collector Report</h6>


							<table class="table table-borderless datatable overflow-scroll">
								<thead class="table-light">
									<tr style="font-family: 'Poppins', sans-serif;">
										<th scope="col">ID</th>
										<th scope="col">Branch Type</th>
										<th scope="col">Advisor Code</th>
										<th scope="col">Joining Date</th>
										<th scope="col">Customer Name</th>
										<th scope="col">DOB</th>
										<th scope="col">Contact Number</th>						
										<th>Print</th>
										
									</tr>
								</thead>
								<tbody class='tablebody' id="fetchFinancialConsultants">									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="card recent-sales">

				<div class="card-body table-responsive">
					<h5 class="card-title">Financial Consultant Report</h5>
					<div id="bodycontentfrontPage">
						<div style="height: 700px; overflow: scroll;">
							<div class="blnk-div"></div>

							<div class="form-div">
								<!-- <div class="form-header">
											<h2 style="color: red; margin-top: 0px;">BHOYARNATH
												URBAN</h2>
											<p style="margin-top: -10px">Kolkata - WEST BENGAL 700107</p>
										</div> -->
								<div class="form-div-main" style="padding: 5px;">
									<div
										style="display: flex; text-align: center; justify-item: center; width: 100%;">
										<h4 style="margin: auto;">NEW RECEIPT</h4>
									</div>
									<div style="width: 55%; float: left; padding-top: 20px;">
										<p style="font-weight: 600;">
											Member No. : <span id="memberName"></span>
										</p>
										<p style="font-weight: 600;">
											Account No. : <span id="accountNo"></span>
										</p>
										<p style="font-weight: 600;">
											Account Holder Name : <span id="accountHolderName"></span>
										</p>
										<p style="font-weight: 600;">
											S/D/W/H/O : <span id="relativeName"></span>
										</p>
										<p style="font-weight: 600;">
											Date Of Birth :<span id="dob"></span>
										</p>
										<p style="font-weight: 600;">
											Mobile No. : <span id="mobileNo"></span>
										</p>
										<p style="font-weight: 600;">
											Email ID : <span id="emailid"></span>
										</p>
										<p style="font-weight: 600;">
											MOP : <span id="modeOfOp"></span>
										</p>
										<p style="font-weight: 600;">
											Aadhaar No. : <span id="aadharNo"></span>
										</p>
										<p style="font-weight: 600;">
											Address : <span id="address"></span>
										</p>
									</div>
									<div style="width: 43%; float: right; padding-top: 20px;">
										<!-- <p style="font-weight: 600;">Print Date : <span></span></p> -->

										<p style="font-weight: 600;">
											Opening Date : <span id="opDate"></span>
										</p>
										<p style="font-weight: 600;">
											Account type : <span id="accountType"></span>
										</p>
										<p style="font-weight: 600;">
											IFSC Code : <span id="IFSCcode"></span>
										</p>
										<p style="font-weight: 600;">
											Date Of Issue : <span id="dateOfIssue"></span>
										</p>
										<p style="font-weight: 600;">
											Nomination Registered : <span id="nominationStatus"></span>
										</p>
										<p style="font-weight: 600;">
											Nomination Name : <span id="nominationName"></span>
										</p>
										<p style="font-weight: 600;">
											Branch and Code : <span id="branch"></span>
										</p>
										<p style="font-weight: 600;">
											UPI : <span id="upi"></span>
										</p>
									</div>
                                    
								</div>								
							</div>							
						</div>
					</div>
				</div>
				<button class="print-btn" onclick="window.print()">Print</button>
			</div>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/ReportsAndAnalytics/FinancialAdvisorReport.js"></script>
	<script>
		$(document).ready(function() {
			searchFinancialConsultants();
			
			// Button click filter
			$('#findFinancialAdvisorBtn').on('click', function(e) {
				e.preventDefault(); // Prevent form submission
				filterDataByBranchName();
			});

		});
	</script>

</body>

</html>