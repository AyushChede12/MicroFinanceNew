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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<title>Admin Dashboard</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>

<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Secured Gold Loan</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-coin"></i></a></li>
					<li class="breadcrumb-item action">Gold Directory</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
			<!-- ================= Customer Details ================= -->
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Customer Details</li>
						</ol>
					</nav>
					<div class="row">
						

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">CustomerCode</label> <select id="customerCode" name="customerCode"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Customer Code</option>
									
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="customerName">Customer Name</label> <input
									type="text" name="customerName" id="customerName"
									required="required" placeholder="Enter Customer Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						
					</div>	

				</div>
			
				<!-- ================= Today's Rate ================= -->
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Today's Rate</li>
						</ol>
					</nav>
					<div class="row">
						<input type="hidden" id="goldDirectoryId" name="id" value="">

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Karat</label> <select id="karat" name="karat"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Karat</option>
									<option value="24K">24K</option>
									<option value="22K">22K</option>
									<option value="20K">20K</option>
									<option value="18K">18K</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="silverrate">Today's Rate / gm</label> <input
									type="text" name="todayRate" id="todayRate"
									required="required" placeholder="Enter Today's Rate"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-6">
							<div class="d-flex flex-column formFields mb-4">
								<label for="goldrate">Customer Gold Rate / gm</label>
								<div class="d-flex">
									<input type="text" name="custgoldRate" id="custgoldRate"
										required="required" placeholder="Enter Rate"
										style="text-transform: uppercase; margin-right: 10px;" />
									<!-- <button id="saveTodaysRateBtn" class="btnStyle bg-success">Save</button> -->
								</div>
							</div>
						</div>
					</div>


					

				</div>

				<!-- ================= Item Master ================= -->
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Item Master</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Item Master Type</label> <select
									id="itemMasterType" name="itemMasterType" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Item Type</option>
									<option value="Gold">Gold</option>
								</select>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="d-flex flex-column formFields mb-4">
								<label for="itemName">Item Name</label>
								<div class="d-flex">
									<input type="text" name="itemName" id="ItemName"
										required="required" placeholder="Enter Item Name"
										style="text-transform: uppercase; margin-right: 10px;" />
									<!-- <button id="saveItemMasterBtn" class="btnStyle bg-success">Save</button> -->
								</div>
							</div>
						</div>
					</div>



					<!-- <div class="row mt-5" id="policyDataRow">
						<div class="col-12">
							<div class="card recent-sales">
								<div class="card-body table-responsive">
									<h5 class="card-title">
										Item Master Details <span>| Data</span>
									</h5>

									<table class="table table-bordered">
										<thead class="table-light">
											<tr>
												<th style="white-space: nowrap;">ID</th>
												<th style="white-space: nowrap;">Item Type</th>
												<th style="white-space: nowrap;">Item Name</th>
												
											</tr>
										</thead>
										<tbody id="itemMasterTable">
											Dynamic rows will be injected here
										</tbody>
									</table>

								</div>
							</div>
							
						</div>
					</div> -->
				</div>

				<!-- ================= Locker Master ================= -->
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Locker Master</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Locker Branch</label> <select
									id="lockerBranch" name="lockerBranch" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Branch</option>
									
								</select>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="d-flex flex-column formFields mb-4">
								<label for="lockerAddress">Locker Number</label>
								<div class="d-flex">
									<input type="text" name="lockerNumber" id="lockerNumber"
										required="required" placeholder="Enter Locker Number"
										style="text-transform: uppercase; margin-right: 10px;" />
									<!-- <button id="saveLockerMasterBtn" class="btnStyle bg-success">Save</button> -->
								</div>
							</div>
						</div>
					</div>



					<!-- <div class="row mt-5" id="policyDataRow">
						<div class="col-12">
							<div class="card recent-sales">
								<div class="card-body table-responsive">
									<h5 class="card-title">
										Locker Master Details <span>| Data</span>
									</h5>

									<table class="table table-bordered">
										<thead class="table-light">
											<tr>
												<th style="white-space: nowrap;">ID</th>
												<th style="white-space: nowrap;">Locker Location</th>
												<th style="white-space: nowrap;">Locker Address</th>
												
											</tr>
										</thead>
										<tbody id="lockerMasterTable">
											Dynamic rows will be injected here
										</tbody>
									</table>

								</div>
							</div>
							
						</div>
					</div> -->
				</div>

				<!-- ================= Purity Master ================= -->
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Purity Master</li>
						</ol>
					</nav>

					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="purityName">Purity Name</label> <input type="text"
									name="purityName" id="purityName" required="required"
									placeholder="Enter Purity Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="purity">Purity (%)</label> <input type="text"
									name="purity" id="purity" required="required"
									placeholder="Enter Purity" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="itemType">Item Purity Type</label>
								<div class="d-flex">
									<select id="itemPurityType" name="itemPurityType"
										required="required" class="form-control selectField"
										style="height: 30px; margin-right: 10px;">
										<option value="">Item Type</option>
										<option value="Gold">Gold</option>
									</select>
									<!-- <button id="saveButtonforGoldDirectory" class="btnStyle bg-success">Save</button> -->
								</div>
							</div>
						</div>




						<!-- <div class="row mt-5" id="policyDataRow">
						<div class="col-12">
							<div class="card recent-sales">
								<div class="card-body table-responsive">
									<h5 class="card-title">
										Purity Master Details <span>| Data</span>
									</h5>

									<table class="table table-bordered">
										<thead class="table-light">
											<tr>
												<th style="white-space: nowrap;">ID</th>
												<th style="white-space: nowrap;">Purity Name</th>
												<th style="white-space: nowrap;">Type</th>
												
											</tr>
										</thead>
										<tbody id="purityMasterTable">
											Dynamic rows will be injected here
										</tbody>
									</table>

								</div>
							</div>
							
						</div>
					</div> -->
					</div>
					</div>
					<!-- ================= Loan Details ================= -->
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Loan Details</li>
						</ol>
					</nav>
					<div class="row">
						

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Plan Name</label> <input type="text"
									name="loanPlanName" id="loanPlanName" required="required"
									placeholder="Loan Plan Name" style="text-transform: uppercase;" />

							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Type of Loan</label> <select
									id="typeOfLoan" name="typeOfLoan" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Type of Loan</option>
									<option value="Gold">Gold Loan</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Mode</label> <select
									id="loanMode" name="loanMode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select Loan Mode</option>
									<option value="Monthly">Monthly</option>
								</select>
							</div>
						</div>


						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Loan Term</label> <input type="text"
									name="loanTerm" id="loanTerm" required="required"
									placeholder="Enter Loan Term" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Rate Of Interest(%)</label> <input type="text"
									name="rateOfInterest" id="rateOfInterest" required="required"
									placeholder="Enter Rate Of Interest"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Amount Of Loan </label> <input type="text"
									name="loanAmount" id="loanAmount" required="required"
									placeholder="Enter Amount Of Loan"
									style="text-transform: uppercase;" />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for=""> Interest Type</label> <select id="typeIntrest"
									name="typeIntrest" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">Select ROI Type</option>
									<option value="Flat Interest">Flat Interest</option>
									<option value="Reducing Interest">Reducing Interest</option>
									<option value="Rule 78">Rule 78</option>

								</select>
							</div>
						</div>
						<!-- EMI Payment -->
<div class="col-lg-3">
    <div class="d-flex flex-column formFields mb-4">
        <label for="">EMI Payment</label> 
        <input type="text"
            name="emiPayment" id="emiPayment"
            required="required" placeholder="Auto Calculated"
            readonly style="text-transform: uppercase; background:#f5f5f5;" />
    </div>
</div>


						
					</div>	

				</div>

					<div class="row">
						<div class="col-12 text-center">
							<button id="saveButtonforGoldDirectory"
								class="btnStyle bg-success">Save</button>
						</div>
					</div>

					<input type="hidden" id="loanId" value="" />
			</form>


		</div>
	</main>

	<script src="./js/adminscript.js"></script>
	<script src="./js/SecuredGoldLoan/GoldDirectory.js"></script>
</body>

<script>
document.addEventListener('DOMContentLoaded', function () {
	const toggles = document.querySelectorAll('.toggle__input');
	toggles.forEach((toggle) => {
		updateToggleColor(toggle);
		toggle.addEventListener('change', () => {
			updateToggleColor(toggle);
			console.log(`${toggle.dataset.toggleType} is now ${toggle.checked}`);
		});
	});
	function updateToggleColor(input) {
		const label = input.nextElementSibling;
		if (label) {
			label.style.backgroundColor = input.checked ? '#28a745' : '#ccc';
		}
	}
});
</script>


<script type="text/javascript">
function calculateEMI() {
    var loanMode = document.getElementById("loanMode").value;
    var loanTerm = parseInt(document.getElementById("loanTerm").value, 10);
    var rateOfInterest = parseFloat(document.getElementById("rateOfInterest").value);
    var loanAmount = parseFloat(document.getElementById("loanAmount").value);
    var interestType = document.getElementById("typeIntrest").value;

    if (!loanMode || isNaN(loanTerm) || isNaN(rateOfInterest) || isNaN(loanAmount) || !interestType) {
        document.getElementById("emiPayment").value = "";
        return;
    }

    // Monthly default
    var n = loanTerm;  
    if (loanMode === "Quarterly") { n = loanTerm * 3; }
    else if (loanMode === "Yearly") { n = loanTerm * 12; }

    var monthlyRate = rateOfInterest / 100 / 12;
    var emi = 0;

    if (interestType === "Flat Interest") {
        var total = loanAmount + (loanAmount * rateOfInterest * loanTerm / 100);
        emi = total / n;
    } else if (interestType === "Reducing Interest") {
        emi = (loanAmount * monthlyRate * Math.pow(1 + monthlyRate, n)) /
              (Math.pow(1 + monthlyRate, n) - 1);
    } else if (interestType === "Rule 78") {
        var totalInterest = loanAmount * rateOfInterest * loanTerm / 100;
        emi = (loanAmount + totalInterest) / n;
    }

    document.getElementById("emiPayment").value = emi.toFixed(2);
}

// Auto trigger on change/input
document.addEventListener("DOMContentLoaded", function() {
    var fields = ["loanMode", "loanTerm", "rateOfInterest", "loanAmount", "typeIntrest"];
    for (var i = 0; i < fields.length; i++) {
        var el = document.getElementById(fields[i]);
        if (el) {
            el.addEventListener("input", calculateEMI);
            el.addEventListener("change", calculateEMI);
        }
    }
});
</script>





</html>
