<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/ae73087723.js" crossorigin="anonymous"></script>
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.46.0/apexcharts.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
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
					<li class="breadcrumb-item"><a href="home"> <i class="bi bi-coin"></i></a></li>
					<li class="breadcrumb-item action">Gold Directory</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<!-- ================= Today's Rate ================= -->
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Today's Rate</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Karat</label>
								<select id="karat" name="karat" required="required" class="form-control selectField" style="height: 30px;">
									<option value="">Select Karat</option>
									<option value="Business Loan">24K</option>
									<option value="Vehicle Loan">22K</option>
									<option value="Home Loan">20K</option>
									<option value="personal Loan">18K</option>
								</select>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="silverrate">Silver Rate/1 gm</label>
								<input type="text" name="silverRate" id="silverRate" required="required"
									placeholder="Enter Rate" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-6">
							<div class="d-flex flex-column formFields mb-4">
								<label for="goldrate">Gold Rate/1 gm</label>
								<div class="d-flex">
									<input type="text" name="goldRate" id="goldRate" required="required"
										placeholder="Enter Rate" style="text-transform: uppercase; margin-right: 10px;" />
									<button id="saveBtn" class="btnStyle bg-success">Save</button>
								</div>
							</div>
						</div>
					</div>

					<table class="table table-borderless datatable overflow-scroll" id="loanTableWrapper">
						<thead class="table-light">
							<tr style="font-family: 'Poppins', sans-serif;">
								<th>Karat</th>
								<th>Silver Rate</th>
								<th>Gold Rate</th>
							</tr>
						</thead>
						<tbody id=""></tbody>
					</table>
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
								<label for="">Item Type</label>
								<select id="itemType" name="itemType" required="required" class="form-control selectField" style="height: 30px;">
									<option value="">Select Item Type</option>
									<option value="Gold">Gold</option>
									<option value="Silver">Silver</option>
								</select>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="d-flex flex-column formFields mb-4">
								<label for="itemName">Item Name</label>
								<div class="d-flex">
									<input type="text" name="itemName" id="ItemName" required="required"
										placeholder="Enter Item Name" style="text-transform: uppercase; margin-right: 10px;" />
									<button id="saveBtn" class="btnStyle bg-success">Save</button>
								</div>
							</div>
						</div>
					</div>

					<table class="table table-borderless datatable overflow-scroll" id="loanTableWrapper">
						<thead class="table-light">
							<tr style="font-family: 'Poppins', sans-serif;">
								<th>ID</th>
								<th>Item Type</th>
								<th>Item Name</th>
							</tr>
						</thead>
						<tbody id=""></tbody>
					</table>
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
								<label for="lockerLocation">Locker Location</label>
								<input type="text" name="lockerLocation" id="lockerLocation"
									required="required" placeholder="Enter Location" style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-6">
							<div class="d-flex flex-column formFields mb-4">
								<label for="lockerAddress">Locker Address</label>
								<div class="d-flex">
									<input type="text" name="lockerAddress" id="lockerAddress"
										required="required" placeholder="Enter Address"
										style="text-transform: uppercase; margin-right: 10px;" />
									<button id="saveBtn" class="btnStyle bg-success">Save</button>
								</div>
							</div>
						</div>
					</div>

					<table class="table table-borderless datatable overflow-scroll" id="loanTableWrapper">
						<thead class="table-light">
							<tr style="font-family: 'Poppins', sans-serif;">
								<th>ID</th>
								<th>Locker Location</th>
								<th>Locker Address</th>
							</tr>
						</thead>
						<tbody id=""></tbody>
					</table>
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
								<label for="purityName">Purity Name</label>
								<input type="text" name="purityName" id="purityName"
									required="required" placeholder="Enter Purity Name"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="purity">Purity (%)</label>
								<input type="text" name="purity" id="purity"
									required="required" placeholder="Enter Purity"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-6">
							<div class="d-flex flex-column formFields mb-4">
								<label for="itemType">Item Type</label>
								<div class="d-flex">
									<select id="itemType" name="itemType" required="required"
										class="form-control selectField"
										style="height: 30px; margin-right: 10px;">
										<option value="">Item Type</option>
										<option value="Gold">Gold</option>
										<option value="Silver">Silver</option>
									</select>
									<button id="saveBtn" class="btnStyle bg-success">Save</button>
								</div>
							</div>
						</div>
					</div>

					<table class="table table-borderless datatable overflow-scroll" id="loanTableWrapper">
						<thead class="table-light">
							<tr style="font-family: 'Poppins', sans-serif;">
								<th>ID</th>
								<th>Purity Name</th>
								<th>Type</th>
							</tr>
						</thead>
						<tbody id=""></tbody>
					</table>
				</div>

				<input type="hidden" id="loanId" value="" />
				
			</form>

			
		</div>
	</main>

	<script src="./js/adminscript.js"></script>
	<script src="./js/LoanManagment/LoanSchemCatalog.js"></script>
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

</html>
