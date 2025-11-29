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
<title>Search Client</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
</head>


<body>

	<main id="main" class="main">
	<form>
		<div class="pagetitle">
			<h1>Customer Management</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-people-fill"></i>
					</a></li>
					<li class="breadcrumb-item action">Search Customer</li>
				</ol>
			</nav>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Search Box</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">Branch</label> <select id="branchName" name="branchName"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Branch</option>
									
								</select>
							</div>
						</div>

						

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields mb-4">
								<label for="">Customer Name</label> <input type="text"
									name="customerName" id="customerName" required="required"
									placeholder="Enter Customer Name"  />
							</div>
						</div>

						

						
					</div>
				</div>
		</div>

		
		</form>

		<div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">

					<div class="card-body table-responsive">
						<table class="table table-borderless datatable overflow-scroll">
							<thead class="table-light">
								<tr style="font-family: 'Poppins', sans-serif;">
									<th scope="col">Sl No.</th>
									<th scope="col">Customer Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Date Of Birth</th>
									<th scope="col">Aadhar No</th>
									<th scope="col">PAN</th>
									<th scope="col">Contact No.</th>
									<th scope="col">Nominee Name</th>
									
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
	<script src="./js/customerManagement/addCustomer.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function () {
    $.ajax({
        url: "api/customermanagement/getAllCustomer",
        type: "GET",
        success: function (data) {
            var tbody = $("table tbody");
            tbody.empty(); // Clear existing rows

            for (var i = 0; i < data.length; i++) {
                var customer = data[i];
                var status = customer.approved ? "Approved" : "Pending";

                var row = "<tr>" +
                    "<td>" + (i + 1) + "</td>" +
                    "<td>" + (customer.customerName || '') + "</td>" +
                    "<td>" + (customer.customerGender || '') + "</td>" +
                    "<td>" + (customer.dob || '') + "</td>" +
                    "<td>" + (customer.aadharNo || '') + "</td>" +
                    "<td>" + (customer.panNo || '') + "</td>" +
                    "<td>" + (customer.contactNo || '') + "</td>" +
                    "<td>" + (customer.nomineeName || '') + "</td>" +
                    "</tr>";

                tbody.append(row);
            }
        },
        error: function () {
            alert("Failed to fetch customer data.");
        }
    });
});
</script>
	
	
	<script>
$(document).ready(function () {
    // Filter table rows as user types in customer name field
    $("#customerName").on("keyup", function () {
        var value = $(this).val().toLowerCase();

        $("table tbody tr").filter(function () {
            var name = $(this).find("td:eq(1)").text().toLowerCase(); // 2nd column = Customer Name
            $(this).toggle(name.startsWith(value));
        });
    });
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