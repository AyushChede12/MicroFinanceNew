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
<link
	href="https://fonts.googleapis.com/css2?family=Dosis:wght@200..800&display=swap"
	rel="stylesheet">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>

<!-- jQuery CDN (latest 3.x version) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
 <style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Dosis", sans-serif;
	font-weight: 600;
}

body {
	background: url();
}

#head-logo {
	padding: 14px 16px;
}

#container {
	width: 96vw;
	margin: auto;
	font-size: 14px;
	background: transparent;
	box-shadow: 2px 4px 20px grey;
	border-radius: 7px;
}

table {
	background: transparent;
}

.text-left {
	text-align: left;
}

td {
	flex-grow: 1;
	font-weight: 500;
	font-size: 14px;
}

.ip-center {
	width: 12vw;
}

button {
	padding: 2px 6px;
	background-color: coral;
	border: none;
	font-weight: 500;
	border-radius: 3px;
}

.row {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.row>* {
	flex: 1 1 150px;
	min-width: 120px;
}

/* Responsive CSS */
@media ( max-width : 768px) {
	table, thead, tbody, th, td, tr {
		display: block;
		width: 100%;
	}
	thead {
		display: none;
	}
	tr {
		margin-bottom: 20px;
		border: 1px solid #ccc;
		padding: 10px;
		border-radius: 8px;
		background-color: #f9f9f9;
	}
	td {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 10px;
		border: none;
		border-bottom: 1px solid #eee;
		position: relative;
	}
	td::before {
		content: attr(data-label);
		font-weight: bold;
		flex: 1;
		color: #333;
		padding-right: 10px;
	}
	td input, td button {
		flex: 2;
		width: 100%;
	}
	td input[type="checkbox"] {
		flex: none;
		width: auto;
		transform: scale(1.2);
		margin-left: auto;
	}
}
</style> 

<body>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Code Module</h1>
		</div>

		<div>
			<div class="row mt-5">
				<div class="col-12">
					<div class="card recent-sales">

						<div class="card-body table-responsive">
							<h5 class="card-title">
								Code Module <span>| Table</span>
							</h5>

							<table class="table table-borderless datatable overflow-scroll">

								<thead class="table-light">
									<tr style="font-family: 'Poppins', sans-serif;">
										<div class="row"></div>
										<th class="text-left">Name</th>
										<th class="text-left">Branch Prefix</th>
										<th>Code Prefix</th>
										<th>No.of Digit</th>
										<th>Last No (ID).</th>
										<th>Preview</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td data-label="Name">Customer Code</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="M" readonly="readonly"></td>
										<td data-label="No.of Digit"><input class="ip-center"
											type="number" value="5" readonly="readonly"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number" value="1" readonly="readonly"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" value="M00001";	" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<tr style="font-family: 'Poppins', sans-serif;">
										<td data-label="Name">Financial Code</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="FC" readonly="readonly"></td>
										<td data-label="No.of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<tr>
										<td data-label="Name">Team Member Code</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="TM" readonly="readonly"></td>
										<td data-label="No.of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<tr>
										<td data-label="Name">RD Policy No.</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="RD" readonly="readonly"></td>
										<td data-label="No.of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<tr>
										<td data-label="Name">FD Policy No.</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="FD" readonly="readonly"></td>
										<td data-label="No.of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<tr>
										<td data-label="Name">Daily Policy No.</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="DD" readonly="readonly"></td>
										<td data-label="No. of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
<!-- 									<tr>
										<td data-label="Name">Flexy Daily Policy</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="FP" readonly="readonly"></td>
										<td data-label="No. of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr> -->
									<tr>
										<td data-label="Name">MIS Policy No.</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="MIS" readonly="readonly"></td>
										<td data-label="No. of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<tr>
										<td data-label="Name">Saving Account No.</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="NA" readonly="readonly"></td>
										<td data-label="No. of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<!-- <tr>
										<td data-label="Name">Fixed EMI Loan</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="Fixed EMI" readonly="readonly"></td>
										<td data-label="No. of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<tr>
										<td data-label="Name">No EMI Loan</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="OD EMI" readonly="readonly"></td>
										<td data-label="No. of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<tr>
										<td data-label="Name">Fixed EMI Gold Loan</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="Fixed GL" readonly="readonly"></td>
										<td data-label="No. of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<tr>
										<td data-label="Name">No EMI Gold Loan</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="OD GL" readonly="readonly"></td>
										<td data-label="No. of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr> -->
									<tr>
										<td data-label="Name">Loan ID</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="LP" readonly="readonly"></td>
										<td data-label="No. of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									<tr>
										<td data-label="Name">Group Code</td>
										<td data-label="Branch Prefix"><input type="checkbox"></td>
										<td data-label="Code Prefix"><input class="ip-center"
											type="text" value="GD" readonly="readonly"></td>
										<td data-label="No. of Digit"><input class="ip-center"
											type="number"></td>
										<td data-label="Last No."><input class="ip-center"
											type="number"></td>
										<td data-label="Preview"><input class="ip-center"
											type="text" readonly></td>
										<td data-label="Action"><button class="btn btn-success">Save</button></td>
									</tr>
									


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
	<!-- <script src="./js/preferences/bank.js"></script> -->

</body>

</html>