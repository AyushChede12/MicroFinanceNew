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
<title>Approve Finance Onboarding</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
<!-- jQuery CDN (latest 3.x version) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Request Approval</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home"> <i
							class="bi bi-check-circle"></i>
					</a></li>
					<li class="breadcrumb-item action">Approve Finance Onboarding</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Find Box</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="">Branch Name</label> <select id="branchName" name="branchName"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Branch Name</option>									
								</select>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="fromDate">Date From</label> <input type="date"
									name="fromDate" id="fromDate" required="required"
									placeholder="Enter From Date"
									style="text-transform: uppercase;" />
							</div>
						</div>

						<div class="col-lg-4">
							<div class="d-flex flex-column formFields">
								<label for="toDate">Date To</label> <input type="date"
									name="toDate" id="toDate" required="required"
									placeholder="Enter To Date" style="text-transform: uppercase;" />
							</div>
						</div>
					</div>
				</div>
		</div>

		<div class="row">
			<div class="col-12 text-center mt-3">
				<button id="findfinanceConsultantBtn" class="btnStyle"
					style="background-color: #FFA500;">FIND</button>
			</div>
		</div>
		</form>

		<div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">

					<div class="card-body table-responsive">
						<h5 class="card-title">Search result</h5>

						<div style="overflow-x: auto; white-space: nowrap;">
						<table class="table table-borderless datatable">
							<thead class="table-light">
								<tr style="font-family: 'Poppins', sans-serif;">
								<th></th>
									<th scope="col">Sr No.</th>
									<th scope="col">Financial Name</th>
									<th scope="col">Financial Code </th>									
									<th scope="col">Date of Birth</th>
									<th scope="col">Academic background</th>
									<th scope="col">Contact No.</th>
									<th scope="col">Profession</th>
									<th scope="col">start Date</th>
									<th scope="col">Payment Mode</th>
									<th scope="col">Branch Name</th>
								</tr>
							</thead>
							<tbody id="searchFinanceOnboarding">
							</tbody>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 text-center mt-3" style="justify-content: end">
				<button id="approveFinanceConsultantBtn" class="btnStyle"
					style="background-color: #FFA500; ">Approve</button>
			</div>
		</div>

		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/RequestApproval/ApproveFinanceOnboarding.js"></script>
	<script>
	$(document).ready(function(){
		searchInTheFinanceOnboarding();
		branchNameDropdown();		
		
		// Button click filter
		$('#findfinanceConsultantBtn').on('click', function(e) {
			e.preventDefault(); // Prevent form submission
			filterBranchNameData();
		});
		
		
		// Button click Approve
		$('#approveFinanceConsultantBtn').on('click', function(e) {
		    e.preventDefault(); // Prevent form submission
		    
		    // Get all checked checkboxes
		    $('.member-checkbox:checked').each(function() {
		        const id = $(this).val();
		        updateMemberApprovalStatus(id, true);
		    });
		});


	});
	</script>
</body>

</html>