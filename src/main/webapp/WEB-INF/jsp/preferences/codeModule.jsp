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
	width: 18vw;
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
		<h2 id="head-logo">
			Code Setting
			</h1>

			<div id="container">
				<table cellspacing="10" width="100%" height="100%"
					jusify-content="start" align-items="center" display="flex">
					<thead>
						<tr>
							<div class="row"></div>
							<th class="text-left">Name</th>
							<th class="text-left">Branch Prefix</th>
							<th>Code Prefix</th>
							<th>No.of Digit</th>
							<th>Last No.</th>
							<th>Preview</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td data-label="Name">Member Code</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="01/NGP/"></td>
							<td data-label="No.of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">Collector/Advisor Code</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="01/ADV/"></td>
							<td data-label="No.of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">Employee Code</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="01/EMP/"></td>
							<td data-label="No.of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">RD Policy No.</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="01/RD/"></td>
							<td data-label="No.of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">FD Policy No.</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="01/FD/"></td>
							<td data-label="No.of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">Daily Policy No.</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="01/DD/"></td>
							<td data-label="No. of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">Flexy Daily Policy</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="01/FP/"></td>
							<td data-label="No. of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">MIS Policy No.</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="01/MIS/"></td>
							<td data-label="No. of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">Saving Account No.</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="10"></td>
							<td data-label="No. of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">Fixed EMI Loan</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="Fixed EMI"></td>
							<td data-label="No. of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">No EMI Loan</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="OD EMI"></td>
							<td data-label="No. of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">Fixed EMI Gold Loan</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="Fixed GL"></td>
							<td data-label="No. of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">No EMI Gold Loan</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="OD GL"></td>
							<td data-label="No. of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">Group Loan ID</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="GRP"></td>
							<td data-label="No. of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
						<tr>
							<td data-label="Name">HRM Code</td>
							<td data-label="Branch Prefix"><input type="checkbox"></td>
							<td data-label="Code Prefix"><input class="ip-center"
								type="text" placeholder="01/EMP"></td>
							<td data-label="No. of Digit"><input class="ip-center"
								type="number"></td>
							<td data-label="Last No."><input class="ip-center"
								type="number"></td>
							<td data-label="Preview"><input class="ip-center"
								type="text" readonly></td>
							<td data-label="Action"><button>Save</button></td>
						</tr>
					</tbody>
				</table>
	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<!-- <script src="./js/preferences/bank.js"></script> -->

</body>

</html>