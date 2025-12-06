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
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="./css/admin.css" />
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <li class="breadcrumb-item action">Saving Account Statement</li>
                </ol>
            </nav>
        </div>

        <div>
            <form id="formid">
                <div>
                    <nav>
                        <ol class="breadcrumb breadcrumb-title">
                            <li class="breadcrumb-item action">Search By</li>
                        </ol>
                    </nav>
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="d-flex flex-column formFields mb-4">
                                <label for="">Select Account Number</label> <select id="accountNumber" name="accountNumber"
                                    required="required" class="form-control selectField" style="height: 30px;">
                                    <option value=""> Select</option>
                                </select>
                            </div>
                        </div>                                               
                    </div>
                     <div class="row">
                        <div class="col-lg-12 text-center">
                            <button id="searchByAccNo" class="btn btn-warning" style="margin-left: 80%;">Search</button>
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
                                <div class="form-div" id="form-div" style="margin-top: 20px;">
											<div class="form-header">
												<h2 style="color: red; margin-top: 0px;">MICRODINANCE
													SOFTWARE</h2>
												<p style="margin-top: -10px">Nagpur</p>
											</div>
											<div class="form-div-main" style="padding: 5px;">
												<div
													style="display: flex; text-align: center; justify-item: center; width: 100%; border-bottom: 2px solid black; padding-bottom: 10px;">
													<h4 style="margin: auto;">NEW RECEIPT</h4>
												</div>

												<div style="width: 55%; float: left; padding-top: 20px;">
													<p style="font-weight: 600;">
														Account No : <span id="accountNoDisplay"></span>
													</p>
													<p style="font-weight: 600;">
														A/C Holder Name : <span id="memberName"></span>
													</p>
													<p style="font-weight: 600;">
														Relative Name/Relation : <span id="relativeDetails"></span>
													</p>
													<p style="font-weight: 600;">
														Address :<span id="address"></span>
													</p>
												</div>


												<div style="width: 43%; float: right; padding-top: 20px;+">
													<!-- <p style="font-weight: 600;">Print Date : <span></span></p> -->
													<p style="font-weight: 600;">
														Op. Date : <span id="opDate"></span>
													</p>
													<p style="font-weight: 600;">
														Member Code : <span id="selectMember"></span>
													</p>
													<!-- <p style="font-weight: 600;">
														PAN : <span id="pan"></span>
													</p> -->
													<p style="font-weight: 600;">
														Mode of op. : <span id="modeOfOp"></span>
													</p>
													<p style="font-weight: 600;">
														Op. Branch : <span id="BranchName"></span>
													</p>


													<!-- <p style="font-weight: 600;">Consideration Amount : 36500</p> -->
													<!-- <p style="font-weight: 600;">Transaction Date : 22/11/2024</p> -->
													<!-- <p style="font-weight: 600;">Maturity Date : 21/11/2025</p> -->
												</div>
												<div
													style="width: 200px; height: 150px; display: flex; flex-direction: column; text-align: center; font-weight: 600;">
													<div
														style="width: 800%; height: 40px; border-bottom: 2px solid black;">
													</div>


												</div>
												<div class="box-body">
													<div class="clearfix margin-bottom-10"
														style="margin-top: -50px;"></div>												
													<table class="table table-borderless datatable overflow-scroll">
									<thead class="table-light">
										<tr style="font-family: 'Poppins', sans-serif;">
											<th scope="col">Account No.</th>
											<th scope="col">Txn Date</th>
											<th scope="col">Deposit/Withdrawal</th>
											<th scope="col">Balance</th>
											<th scope="col">Paymode</th>
											<th scope="col">Branch</th>
											<th scope="col">Remarks</th>																			
										</tr>
									</thead>
									<tbody id="tableSavingAcc">

									</tbody>
								</table>
												</div>
											</div>

										</div>

                                <table class="table table-borderless datatable overflow-scroll">
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>


    </main>
    <!-- <script src="js/chartScript.js"></script> -->
    <script src="./js/adminscript.js"></script>
     <script src="./js/customerSavings/savingsAccountStatement.js"></script>
</body>

</html>