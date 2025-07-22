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
			<h1>Policy Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"><i
							class="bi bi-piggy-bank"></i></a></li>
					<li class="breadcrumb-item active">Installment Record Book</li>
				</ol>
			</nav>
		</div>

		<!-- Main Form -->
		<form id="formid">
			<div>
				<nav>
					<ol class="breadcrumb breadcrumb-title">
						<li class="breadcrumb-item active">Print Search Results</li>
					</ol>
				</nav>

				<!-- Combined Row with Dropdown and Buttons -->
				<div class="row align-items-center mb-4">
					<!-- Dropdown -->
					<div class="col-md-6 d-flex align-items-center">
						<label class="mr-2 mb-0">Find by Policy Number*</label> <select
							id="findByPolicyNumber" name="findByPolicyNumber"
							class="form-control w-50">
							<option value="">Select Branch Name</option>
						</select>
					</div>

					<!-- Buttons -->
					<!-- <div class="col-md-6 text-right"> -->
					<div class="col-md-6 d-flex justify-content-center">

						<button type="button" class="btn btn-dark mr-2">Find</button>
						<button type="button" class="btn btn-dark mr-2"
							onclick="toggleTransaction()">Front Page</button>
						<button type="button" class="btn btn-dark mr-2">Transaction</button>
						<button type="button" class="btn btn-dark mr-2">Heading</button>
						<button type="button" class="btn btn-dark"
							onclick="printTransactionSection()">
							<i class="bi bi-download"></i>
						</button>

					</div>
				</div>
			</div>
		</form>

		<!-- Transaction Section (Initially Hidden) -->
		<div id="transactionSection" class="transaction-section"
			style="display: none;">
			<div style="width: 70%; margin: auto">
				<h1>Microfinance Services</h1>
				<p>Address : Nagpur(440024) - Maharashtra</p>
				<hr />
				<div class="d-flex justify-content-between">
					<p>
						Branch and Code: <span id="branchCodeSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
					<p>
						DOC: <span id="docSpan"
							style="width: 15vw; display: inline-block;"></span>
					</p>
				</div>
				<div class="d-flex justify-content-between">
					<p>
						Policy No.: <span id="policyNoSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
					<p>
						Member Code: <span id="memberCodeSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
				</div>
				<p>
					Applicant Name: <span id="applicantNameSpan"
						style="width: 12vw; display: inline-block;"></span>
				</p>
				<p>
					Father/Husband Name: <span id="fatherNameSpan"
						style="width: 12vw; display: inline-block;"></span>
				</p>
				<p>
					Nominee Name: <span id="nomineeNameSpan"
						style="width: 12vw; display: inline-block;"></span>
				</p>
				<p>
					Address: <span id="addressSpan"
						style="width: 12vw; display: inline-block;"></span>
				</p>

				<div class="d-flex justify-content-between">
					<p>
						Scheme: <span id="schemeSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
					<p>
						Plan: <span id="planSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
					<p>
						Relationship: <span id="relationshipSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
				</div>

				<div class="d-flex justify-content-between">
					<p>
						ROI: <span id="roiSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
					<p>
						Mode: <span id="modeSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
					<p>
						Maturity: <span id="maturitySpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
				</div>

				<div class="d-flex justify-content-between">
					<p>
						Renewal Amount: <span id="renewalAmountSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
					<p>
						Total Value: <span id="totalValueSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
					<p>
						Term: <span id="termSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
				</div>

				<div class="d-flex justify-content-between">
					<p>
						Maturity Date: <span id="maturityDateSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
					<p>
						Mobile No: <span id="mobileSpan"
							style="width: 12vw; display: inline-block;"></span>
					</p>
				</div>

				<p>
					Collector Name: <span id="collectorSpan"
						style="width: 12vw; display: inline-block;"></span>
				</p>

				<div class="d-flex justify-content-end">
					<hr style="border-color: black; width: 20vw;">
					<p style="position: relative; top: 23px; right: 17rem">Authorized
						Signature</p>
				</div>
			</div>
		</div>

	</main>

	<!-- Toggle Script -->


	<script>
		function onFrontPageClick() {
			const selectedPolicyCode = $("#policyCodeDropdown").val();
			fetchPolicyData(selectedPolicyCode);
		}
	</script>


	<!-- External Scripts -->
	<script src="./js/adminscript.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="./js/PolicyManagment/policyRenwalFee.js"></script>
</body>
</html>