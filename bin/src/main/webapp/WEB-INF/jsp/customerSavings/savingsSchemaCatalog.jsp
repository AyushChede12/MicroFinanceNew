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
          <li class="breadcrumb-item action">Savings Scheme Catalog</li>
        </ol>
      </nav>
    </div>

    <div>
      <form id="formid">
        <div>
          <nav>
            <ol class="breadcrumb breadcrumb-title">
              <li class="breadcrumb-item action">Saving Plan Details</li>
            </ol>
          </nav>
          <div class="row">
            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Plan Name </label> <input type="text" name="PolicyName" id="PolicyName" required="required"
                  placeholder="Enter plan Name" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Yearly ROI(%) </label> <input type="text" name="YearlyROI" id="YearlyROI"
                  required="required" placeholder="Enter Yearly ROI" />
              </div>
            </div>
            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Customer Name </label> <input type="text" name="CustomerName" id="CustomerName" required="required"
                  placeholder="Enter Customer Name" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Initial Deposite </label> <input type="text" name="InitialDeposite" id="InitialDeposite"
                  required="required" placeholder="Enter Initial Deposite" />
              </div>
            </div>


            <div class="col-lg-3">
              <div class="d-flex flex-column formFields  mb-4">
                <label for="">Monthly Minimum Balance </label> <input type="text" name="MonthlyMinimumBalance" id="MonthlyMinimumBalance"
                  required="required" placeholder="Enter Monthly Minimum Balance" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Reserved Funds </label> <input type="text" name="ReservedFunds" id="ReservedFunds"
                  required="required" placeholder="Enter Reserved Funds" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Messaging Fees </label> <input type="text" name="MessagingFees" id="MessagingFees" required="required"
                  placeholder="Enter Messaging Fees" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Messaging Interval</label> <select id="MessagingInterval" name="MessagingInterval" required="required"
                  class="form-control selectField" style="height: 30px;">
                  <option value=""> Select Colour</option>
                  <option value="Blue">Blue</option>
                </select>
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Monthly Free IFSC Transactions </label> <input type="text" name="MonthlyFreeIFSCTransactions" id="MonthlyFreeIFSCTransactions"
                  required="required" placeholder="Enter Monthly Free IFSC Transactions" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields  mb-4">
                <label for="">Free Money Transfers / Month</label> <input type="text" name="FreeMoneyTransfers" id="FreeMoneyTransfers"
                  required="required" placeholder="Enter Location" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Limit per Transaction</label> <input type="text" name="LimitperTransaction" id="LimitperTransaction"
                  required="required" placeholder="Enter Limit per Transaction" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Daily Limit </label> <input type="text" name="DailyLimit" id="DailyLimit"
                  required="required" placeholder="Enter Daily Limit" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Weekly Limit </label> <input type="text" name="WeeklyLimit" id="WeeklyLimit"
                  required="required" placeholder="Enter Weekly Limit" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Monthly Limit </label> <input type="text" name="MonthlyLimit" id="MonthlyLimit"
                  required="required" placeholder="Enter Monthly Limit" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Service Fee</label> <input type="text" name="ServiceFee" id="ServiceFee"
                  required="required" placeholder="Enter Service Fee" />
              </div>
            </div>

            <div class="col-lg-3">

            <div class="d-flex flex-column formFields mb-4">
              <label for="">Billing Cycle</label> <select id="BillingCycle" name="BillingCycle" required="required"
                class="form-control selectField" style="height: 30px;">
                <option value=""> Select Colour</option>
                <option value="Blue">Blue</option>
              </select>
            </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Card Fee</label> <input type="text" name="CardFee" id="CardFee" required="required"
                  placeholder="Enter Card Fee" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Monthly Card Limit </label> <input type="text" name="MonthlyCardLimit" id="MonthlyCardLimit"
                  required="required" placeholder="Enter Monthly Card Limit" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Yearly Card Limit </label> <input type="text" name="YearlyCardLimit" id="YearlyCardLimit"
                  required="required" placeholder="Enter Yearly Card Limit" />
              </div>
            </div>


          </div>
        </div>




        <div class="row mt-4">
          <div class="col-12 text-center">
            <button id="saveBtn" class="btn btn-warning" style="margin-left: 80%;">Save</button>
            
          </div>
        </div>
      </form>

      <div class="row mt-5">
        <div class="col-12">
          <div class="card recent-sales">

            <div class="card-body table-responsive">
              <h5 class="card-title">
                Recent Sales <span>| Today</span>
              </h5>

              <table class="table table-borderless datatable overflow-scroll">
                
              </table>
            </div>
          </div>
        </div>
      </div>

    </div>


  </main>
  <!-- <script src="js/chartScript.js"></script> -->
  <script src="./js/adminscript.js"></script>
</body>

</html>