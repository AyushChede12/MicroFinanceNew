
<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
<title>Admin Dashboard</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
<style>
	.pagination {
            display: flex;
			position: relative;
			justify-content: space-between;
			align-items: center;
			margin: 20px 0;
			padding: 10px 20px;
			background-color: #f7f7f7;
			border-radius: 8px;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

        }

        .pagination h6 {
            margin: 0;
            font-size: 16px;
        }

        .pagination-controls {
            display: flex;
            gap: 8px;
        }

        .page-btn {
            background-color: #1976d2;
            color: #fff;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
        }

        .page-btn:hover:not(.current-page) {
            background-color: #125ea2;
        }

        .page-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .current-page {
            background-color: #e0e0e0;
            color: #333;
            padding: 6px 12px;
            border-radius: 4px;
            font-weight: bold;
        }

        .loading-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(255, 255, 255, 0.8);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .table-responsive {
            position: relative;
        }
</style>
</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Maturity Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-calendar-check"></i>
					</a></li>
					<li class="breadcrumb-item action">Apply For Maturity</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Serach box</li>
						</ol>
					</nav>
					<div class="row">
					
					<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Branch <span id="star"> *</span></label> <select id="branchName" name="branchName"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Branch</option>
								</select>
								<small id="chkbranch" style="color: red;"></small>
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Policy Code<span id="star"> *</span></label> <select id="policyCode"
									name="policyCode" required="required"
									class="form-control selectField" style="height: 30px;">
									<option value="">select Policy ID</option>
								</select>
								<small id="chkpolicycode" style="color: red;"></small>
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Maturity Date </label> <input type="date" name="maturityDate"
									id="maturityDate" required="required" placeholder=""
									style="text-transform: uppercase;" />
							</div>
						</div>
						

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="vehicalNo">Customer Name ></label> <input type="text"
									name="customerName" id="customerName" required="required"
									style="text-transform: uppercase;" />
							</div>
						</div>
						
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Scheme Type</label> <input type="text"
									name="schemeType" id="schemeType" required="required"	
									style="text-transform: uppercase;" />
							</div>
						</div>
						
						<div class="col-lg-3 mb-4 ">
							<div class="d-flex flex-column formFields">
								<label for="">Scheme Mode</label> <input type="text"
									name="schemeMode" id="schemeMode" required="required"	
									style="text-transform: uppercase;" />
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Policy Amount</label> <input type="text"
									name="policyAmount" id="policyAmount" required="required"
									placeholder="Enter Voter No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Deposit Amount </label> <input type="text"
									name="depositAmount" id="depositAmount" required="required"
									placeholder="Enter Licence No" />
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Maturity Amount </label> <input type="text"
									name="maturityAmount" id="maturityAmount" required="required"
									placeholder="Enter Intro Member Name" />
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Remark <span id="star"> *</span></label> <input type="text"
									name="remark" id="remark" required="required"
									placeholder="Enter Voter No" />
									<small id="chkremark" style="color: red;"></small>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-12 text-center">
							<button id="viewBtn" class="btn btn-primary" color:black"> View Policy Detail</button>
							<button id="Add" class="btn btn-info" color:black">Save</button>
						</div>
					</div>
				</div>
		</div>


		<div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">

					<div class="card-body table-responsive">
						<h5 class="card-title">
							Marurity Application<span>|</span>
						</h5>

						<table class="table table-borderless datatable overflow-scroll" id="table">
							<thead class="table-light">
								<tr style="font-family: 'Poppins', sans-serif;">
									
									<th scope="col">Policy No.</th>
            						<th scope="col">Branch Name</th>
            						<th scope="col">Maturity Date</th>
           						  	<th scope="col">Customer Name</th>
            						<th scope="col">Scheme Name</th>
            						<th scope="col">Scheme Type</th>
            						<th scope="col">Policy Amount</th>
            						<th scope="col">Maturity Amount</th>
            						<th scope="col">Remark</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
						<div class="pagination">
		                    <h6>Page <span id="page-info">1</span></h6>
		                    <div class="pagination-controls"></div>
		                </div>
					</div>
				</div>
			</div>
		</div>


		</form>


		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/MaturityManagement/applymaturity.js"></script>
	
	<script>
	$(document).ready(function () {
	    function loadTableData(page, size) {
	        $('.table').append('<div class="loading-overlay">Loading...</div>');

	        $.ajax({
	            url: 'api/Maturitymanagement/getApplymaturitydetailswithPage',
	            type: 'GET',
	            data: {
	                page: page,
	                size: size
	            },
	            success: function (response) {
	                if (response.status === "OK" && response.data && response.data.content.length > 0) {
	                    var tableBody = $("#table tbody");
	                    tableBody.empty();

	                    $.each(response.data.content, function (index, item) {
	                        var row = "<tr>" +
	                            "<td>" + item.policyCode + "</td>" +
	                            "<td>" + item.branchName + "</td>" +
	                            "<td>" + item.maturityDate + "</td>" +
	                            "<td>" + item.customerName + "</td>" +
	                            "<td>" + item.schemeName + "</td>" +
	                            "<td>" + item.schemeType + "</td>" +
	                            "<td>" + item.policyAmount + "</td>" +
	                            "<td>" + item.maturityAmount + "</td>" +
	                            "<td>" + item.remark + "</td>" +
	                            "</tr>";
	                        tableBody.append(row);
	                    });

	                    updatePagination(response.data.currentPage, response.data.totalPages);

	                } else {
	                    alert("No maturity details found.");
	                }
	            },
	            error: function (xhr, status, error) {
	                console.error("Error fetching maturity details:", error);
	                alert("Failed to load maturity details.");
	            },
	            complete: function () {
	                $('.loading-overlay').remove();
	            }
	        });
	    }

	    function updatePagination(currentPage, totalPages) {
	        var pagination = $(".pagination-controls");
	        pagination.empty();

	        if (currentPage > 0) {
	            pagination.append('<button class="page-btn" value="' + (currentPage - 1) + '">Previous</button>');
	        }

	        var start = Math.max(currentPage - 2, 0);
	        var end = Math.min(currentPage + 3, totalPages);

	        for (var i = start; i < end; i++) {
	            if (i === currentPage) {
	                pagination.append('<span class="page-btn current-page">' + (i + 1) + '</span>');
	            } else {
	                pagination.append('<button class="page-btn" value="' + i + '">' + (i + 1) + '</button>');
	            }
	        }

	        if (currentPage < totalPages - 1) {
	            pagination.append('<button class="page-btn" value="' + (currentPage + 1) + '">Next</button>');
	        }

	        $(".pagination h6").text("Page " + (currentPage + 1) + " of " + totalPages);
	    }

	    $(document).on('click', '.pagination .page-btn:not(.current-page)', function (e) {
	        e.preventDefault();
	        var page = parseInt($(this).val());
	        var size = 5;
	        loadTableData(page, size);
	    });

	    loadTableData(0, 5);
	});

	</script>
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