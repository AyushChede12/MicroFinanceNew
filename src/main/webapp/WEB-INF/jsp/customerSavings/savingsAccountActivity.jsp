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
      <h1>Customer Savings</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="home">
              <i class="bi bi-bank text-blue"></i>
            </a>
          </li>
          <li class="breadcrumb-item action">Saving Account Activity</li>
        </ol>
      </nav>
    </div>

    <div>
      <form id="formid">
        <div>
          <nav>
            <ol class="breadcrumb breadcrumb-title">
              <li class="breadcrumb-item action">Account Details</li>
            </ol>
          </nav>
          <div class="row">
          
            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Saving Transaction Id</label> <input type="text" name="selectSavingTransactionId" id="selectSavingTransactionId" required="required"
                 value="${transactionCode}" placeholder=" " />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="vehicalNo">Transaction Date</label>
                <input type="date" name="transactionDate" id="transactionDate" required="required" placeholder="Enter Vehicle No"
                  style="text-transform: uppercase;" />
              </div>
            </div>                         
              
              <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Account Number</label> <input type="text" name="accountNumber" id="accountNumber" required="required"
                  placeholder="Enter Account Number" />
              </div>
            </div>
            
               <div class="col-lg-3">           
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Select Branch Name</label> <select id="selectBranchName" name="selectBranchName" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> Select Colour</option>
                    <option value="">Blue</option>
                  </select>
                </div>
              </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Customer Code</label> <input type="text" name="customerCode" id="customerCode" required="required"
                  placeholder="Member Code" />
              </div>
            </div>

            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Customer Name</label> <input type="text" name="customerName" id="customerName" required="required"
                    placeholder="" />
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Contact Number</label> <input type="text" name="contactNumber" id="contactNumber" required="required"
                    placeholder="" />
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Joint Holder Name</label> <input type="text" name="jointHolderName" id="jointHolderName" required="required"
                    placeholder="" />
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Saving Plan Name</label> <input type="text" name="savingPlanName" id="savingPlanName" required="required"
                    placeholder="" />
                </div>
              </div>
            
          </div>
        </div>


        <div class="mt-5">
          <nav>
            <ol class="breadcrumb breadcrumb-title">
              <li class="breadcrumb-item action">Payment Details</li>
            </ol>
          </nav>
          <div class="row">

            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Average Balance</label> <input type="text" name="averageBalance" id="averageBalance" required="required"
                    placeholder="" />
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Transaction For</label> <input type="text" name="transactionFor" id="transactionFor" required="required"
                    placeholder="" />
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Comments</label> <input type="text" name="comments" id="comments" required="required"
                    placeholder="" />
                </div>
              </div>


              <div class="col-lg-3">
             
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Transaction Type</label> <select id="transactionType" name="transactionType" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> -Select-</option>
                    <option value="Deposit">Deposit</option>
                    <option value="Withdraw">Withdraw</option>
                   
                  </select>
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Transaction Amount</label> <input type="text" name="transactionAmount" id="transactionAmount" required="required"
                    placeholder="" />
                </div>
              </div>

              <div class="col-lg-3">
             
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Pay By</label> <select id="payBy" name="payBy" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option selected="selected" value="">Select</option>
					<option value="Cash">Cash</option>
					<option value="Cheque">Cheque</option>
					<option value="Online">Online</option>
					<option value="NEFT">Neft</option>
                  </select>
                </div>
              </div>
          </div>
          <!-- Cheque input fields -->
					 <div id="chequeInputs" style="display: none;" >
						<div class="row">
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Cheque No. </label> <input type="text"
										name="chequeNo" id="chequeNo" required="required"
										placeholder="Enter Cheque No." />
								</div>
							</div>
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Cheque Date </label> <input type="Date"
										name="chequeDate" id="chequeDate" required="required"
										placeholder="Enter Cheque Date" />
								</div>
							</div>						
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Deposit A/C </label> <input type="text"
										name="depositAcc1" id="depositAcc1" required="required"
										placeholder="Enter Deposite A/C No." />
								</div>
							</div>
						</div>												
					</div>
					<!-- Online input fields -->
					<div id="onlineInputs" style="display: none;">
						<div class="row" >
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Deposit A/C </label> <input type="text"
										name="depositAcc2" id="depositAcc2" required="required"
										placeholder="Enter Deposite A/C No." />
								</div>
							</div>
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Ref Number </label> <input type="text"
										name="refNumber1" id="refNumber1" required="required"
										placeholder="Enter Deposite Ref No." />
								</div>
							</div>
						</div>										
					</div>
					<!-- NEFT input fields -->
					<div id="neftInputs" style="display: none;">
						<div class="row">
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Deposit A/C </label> <input type="text"
										name="depositAcc3" id="depositAcc3" required="required"
										placeholder="Enter Deposite A/C No." />
								</div>
							</div>
							<div class="col-lg-3">
								<div class="d-flex flex-column formFields">
									<label for="">Ref Number </label> <input type="text"
										name="refNumber2" id="refNumber2" required="required"
										placeholder="Enter Deposite Ref No." />
								</div>
							</div>
						</div>											
					</div>
        </div>

        <div class="row">
          <div class="col-12 text-center">
            <button id="saveBtn" class="btn btn-warning" style="margin-left: 80%;">Save</button>
          </div>
        </div>
      </form>

    </div>
    <div class="row mt-5">
			<div class="col-12">
				<div class="card recent-sales">

					<div class="card-body table-responsive">
						<h5 class="card-title">
							Saving Account Data <span>| Table View</span>
						</h5>

						<table class="table table-borderless datatable overflow-scroll">
							<thead class="table-light">
								<tr style="font-family: 'Poppins', sans-serif;">
									<th scope="col">Sr No</th>
									<th scope="col">Branch Name</th>
									<th scope="col">Opening Date</th>
									<th scope="col">Account Number</th>
									<th scope="col">Transaction Type</th>
									<th scope="col">Credit/Debit</th>
									<th scope="col">Balance</th>
									<th scope="col">Pay Mode</th>
									<th scope="col">Remarks</th>
									<th scope="col">TXN ID</th>
									<th scope="col">User ID</th>
								</tr>
							</thead>
							<tbody id="tbody">

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

  </main>
  <!-- <script src="js/chartScript.js"></script> -->
  <script src="./js/adminscript.js"></script>
  <script src="./js/customerSavings/SavingAccountActivity.js"></script>
  <script>    
document.getElementById('payBy').addEventListener('change', function () {
    // Get the selected payment mode
    let mode = this.value;

    // Define all input field sections
    const chequeInputs = document.getElementById('chequeInputs');
    const onlineInputs = document.getElementById('onlineInputs');
    const neftInputs = document.getElementById('neftInputs');

    // Reset the display of all sections
    chequeInputs.style.display = 'none';
    onlineInputs.style.display = 'none';
    neftInputs.style.display = 'none';

    // Show the section corresponding to the selected payment mode
    if (mode === 'Cheque') {
        chequeInputs.style.display = 'block';
    } else if (mode === 'Online') {
        onlineInputs.style.display = 'block';
    } else if (mode === 'NEFT') {
        neftInputs.style.display = 'block';
    }
});
</script>
</body>

</html>