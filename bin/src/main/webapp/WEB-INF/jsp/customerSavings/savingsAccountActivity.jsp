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
             
              <div class="d-flex flex-column formFields  mb-4">
                <label for="">Select Saving Transaction Id</label> <select id="selectSavingTransactionId" name="selectSavingTransactionId" required="required"
                  class="form-control selectField" style="height: 30px;">
                  <option value=""> Select Colour</option>
                  <option value="Blue">Blue</option>
                </select>
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
                  <label for="">Select Branch Name</label> <select id="selectBranchName" name="selectBranchName" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
                  </select>
                </div>
              </div>

              <div class="col-lg-3">
             
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Account Number</label> <select id="accountNumber" name="accountNumber" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
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
                    placeholder="Enter A/C Holder Name" />
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
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
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
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
                  </select>
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


  </main>
  <!-- <script src="js/chartScript.js"></script> -->
  <script src="./js/adminscript.js"></script>
</body>

</html>