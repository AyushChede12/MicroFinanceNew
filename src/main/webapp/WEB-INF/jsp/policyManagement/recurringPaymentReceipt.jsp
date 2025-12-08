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

</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Policy Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-piggy-bank"></i>
					</a></li>
					<li class="breadcrumb-item action">Recurring Payment Receipt</li>
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


							<div class="col-lg-12 mb-4 ">
								<div class="d-flex flex-column formFields">
									<label for="">Find by Policy Code <span class="star">*</span></label>
									<select id="policyCode" name="policyCode" required="required"
										class="form-control selectField" style="height: 30px;">
										<option value="">Select Policy Code</option>

									</select>
								</div>
							</div>






						</div>

						<div class="row" style="margin-top: 20px; margin-left: 750px;">
							<div class="col-12 text-center">
								<button type="button" id="findBtn" class="btn btn-dark">Find</button>
							</div>
						</div>

					</div>

					<div class="row mt-5" id="policyDataRow">
						<div class="col-12">
							<div class="card recent-sales">
								<div class="card-body table-responsive">
									<h5 class="card-title">
										Recurring Policy Details <span>| Table View</span>
									</h5>

									<table class="table table-bordered" style="text-align: center;">
										<thead class="table-light">
											<tr>
												<th style="white-space: nowrap;">Sr. No</th>
												<th style="white-space: nowrap;">Policy Code</th>
												<th style="white-space: nowrap;">Customer Name</th>
												<th style="white-space: nowrap;">Payment Date</th>
												<th style="white-space: nowrap;">Policy Amount</th>
												<th style="white-space: nowrap;">Plan Code</th>
												<th style="white-space: nowrap;">Maturity Date</th>
												<th style="white-space: nowrap;">Maturity Amount</th>
												<th style="white-space: nowrap;">Time Duration</th>
												<th style="white-space: nowrap;">Branch</th>
												<th style="white-space: nowrap;">Payment Mode</th>
												<th style="white-space: nowrap;">Print Receipt</th>
											</tr>
										</thead>
										<tbody id="policyTableBody">
											<!-- Dynamic rows will be injected here -->
										</tbody>
									</table>

								</div>
							</div>

						</div>
					</div>

					<!-- RD Receipt Template -->
					<div id="receiptTemplate"
						style="display: none; font-family: 'Poppins', sans-serif;">
						<div
							style="width: 650px; margin: auto; padding: 20px; border: 2px solid #000; border-radius: 8px;">
							<h2 style="text-align: center; margin-bottom: 10px;">Recurring
								Deposit (RD) Receipt</h2>
							<hr>
							<p>
								<b>Policy Code:</b> <span id="rPolicyCode"></span>
							</p>
							<p>
								<b>Customer Name:</b> <span id="rCustomerName"></span>
							</p>
							<p>
								<b>Payment Date:</b> <span id="rPaymentDate"></span>
							</p>
							<p>
								<b>Policy Amount:</b> &#8377; <span id="rPolicyAmount"></span>
							</p>
							<p>
								<b>Plan Code:</b> <span id="rPlanCode"></span>
							</p>
							<p>
								<b>Maturity Date:</b> <span id="rMaturityDate"></span>
							</p>
							<p>
								<b>Maturity Amount:</b> &#8377; <span id="rMaturityAmount"></span>
							</p>
							<p>
								<b>Duration:</b> <span id="rDuration"></span>
							</p>
							<p>
								<b>Branch:</b> <span id="rBranchName"></span>
							</p>
							<p>
								<b>Mode of Payment:</b> <span id="rModeOfPayment"></span>
							</p>
							<br> <br>
							<p style="text-align: right; margin-top: 40px;">
								<b>Authorized Signature</b>
							</p>
						</div>
					</div>




				</div>


			</form>



		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/PolicyManagment/recurringPaymentReceipt.js"></script>
	<script>
		$(document).ready(
				function() {

					// Convert all labels inside #formid to uppercase
					$("#formid label").each(function() {
						$(this).text($(this).text().toUpperCase());
					});

					// Convert all placeholders inside #formid to uppercase
					$("#formid input, #formid textarea, #formid select").each(
							function() {
								let ph = $(this).attr("placeholder");
								if (ph) {
									$(this).attr("placeholder",
											ph.toUpperCase());
								}
							});

				});
	</script>
</body>

</html>