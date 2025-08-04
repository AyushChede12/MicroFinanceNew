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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
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
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="./css/admin.css" />
    <jsp:include page="../sidebar.jsp"></jsp:include>
    <jsp:include page="../header.jsp"></jsp:include>
</head>


<body>
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Customer Saving</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="home">
                            <i class="bi bi-bank text-blue"></i>
                        </a>
                    </li>
                    <li class="breadcrumb-item action">Search Saving Account</li>
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
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px;">
								<label for="">Branch Name</label> <select id="branchName" name="branchName"
									required="required" class="form-control selectField"
									style="height: 30px;">
									<option value="">Select Branch</option>									
								</select>
							</div>
						</div>

                        <div class="col-lg-3">
                            <div class="d-flex flex-column formFields">
                                <label for="vehicalNo">From Date</label>
                                <input type="date" name="fromDate" id="fromDate" required="required"
                                    placeholder="Enter Vehicle No" style="text-transform: uppercase;" />
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <div class="d-flex flex-column formFields">
                                <label for="vehicalNo">To Date</label>
                                <input type="date" name="toDate" id="toDate" required="required"
                                    placeholder="Enter Vehicle No" style="text-transform: uppercase;" />
                            </div>
                        </div>

                         <div class="col-lg-3">
                            <div class="d-flex flex-column formFields mb-4">
                                <label for="">Customer Name</label> <input type="text" name="customerName" id="customerName"
                                    required="required" placeholder="Member Code" />
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <div class="d-flex flex-column formFields mb-4">
                                <label for="">Account Number</label> <select id="accountNumber" name="accountNumber"
                                    required="required" class="form-control selectField" style="height: 30px;">
                                    <option value=""> Select Account Number</option>
                                </select>
                            </div>
                        </div>

                         <div class="col-lg-3">
                            <div class="d-flex flex-column formFields mb-4">
                                <label for="">Customer Code</label> <input type="text" name="customerCode" id="customerCode"
                                    required="required" placeholder="Enter Customer Code" />
                            </div>
                        </div>

                         <div class="col-lg-3">
                            <div class="d-flex flex-column formFields mb-4">
                                <label for="">Financial Consultant Code</label> <input type="text" name="financialConsultantCode" id="financialConsultantCode"
                                    required="required" placeholder="Enter Financial Consultant Code" />
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="d-flex flex-column formFields mb-4">
                                <label for="">Plan name</label> <select id="schemename" name="schemename"
                                    required="required" class="form-control selectField" style="height: 30px;">
                                    <option value=""> Select Colour</option>
                                    <option value="Blue">Blue</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 text-center">
                            <button id="saveBtn" class="btn btn-warning" style="margin-left: 80%;">Search</button>
                            <button id="saveBtn" class="btn btn-warning" style="background-color: orangered;">Print</button>
                        </div>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col-12">
                        <div class="card recent-sales">

                            <div class="card-body table-responsive">
                                <h5 class="card-title">
                                    Search Result <span>| Today</span>
                                </h5>

								<table class="table table-borderless datatable overflow-scroll">
									<thead class="table-light">
										<tr style="font-family: 'Poppins', sans-serif;">
											<th scope="col">Sr No</th>
											<th scope="col">Account Number</th>
											<th scope="col">Account Type</th>
											<th scope="col">Customer Code</th>
											<th scope="col">Customer Name</th>
											<th scope="col">Mobile</th>
											<th scope="col">Branch Name</th>
											<th scope="col">Address</th>
											<th scope="col">City</th>
											<th scope="col">State</th>
											<th scope="col">Opening Date</th>
											<th scope="col">Financial Consultant Code</th>
											<th scope="col">Plan Name</th>											
										</tr>
									</thead>
									<tbody id="tableSavingAcc">

									</tbody>
								</table>
							</div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
<script>
$(document).ready(function() {
	searchInTheSavingAcc();
	
});	
</script>

    </main>
    <!-- <script src="js/chartScript.js"></script> -->
    <script src="./js/adminscript.js"></script>
    <script src="./js/customerSavings/savingsAccountEnquiry.js"></script>
</body>

</html>