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
      <h1> Customer Saving</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="openDashboard">
              <i class="bi bi-bank text-blue"></i>
            </a>
          </li>
          <li class="breadcrumb-item action">Create Current Account </li>
        </ol>
      </nav>
    </div>

    <div>
      <form id="formid">
       <div>
          <nav>
            <ol class="breadcrumb breadcrumb-title">
              <li class="breadcrumb-item action">Saving Details</li>
            </ol>
          </nav>
          <div class="row">

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="vehicalNo">Opening Date</label>
                <input type="date" name="OpeningDate" id="OpeningDate" required="required" placeholder="Opening Date"
                  style="text-transform: uppercase;" />
              </div>
            </div>

            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Select By Customer</label> <select id="SelectByCustomer" name="SelectByCustomer" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
                  </select>
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Enter Customer Name </label> <input type="text" name="EnterCustomerName" id="EnterCustomerName" required="required"
                    placeholder="Enter Customer Name" />
                </div>
              </div>
    

            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="vehicalNo">Date Of Birth</label>
                  <input type="date" name="DateOfBirth" id="DateOfBirth" required="required" placeholder="Enter DateOfBirth"
                    style="text-transform: uppercase;" />
                </div>
            </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Family Details</label> <input type="text" name="familyDetails" id="familyDetails" required="required"
                    placeholder="Enter family Details" />
                </div>
              </div>
            

            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Contact Number </label> <input type="text" name="contactNumber" id="contactNumber" required="required"
                    placeholder="Enter contact Number" />
                </div>
              </div>
            

            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Suggested Nominee Name </label> <input type="text" name="suggestedNomineeName" id="suggestedNomineeName" required="required"
                    placeholder="Enter suggested Nominee Name" />
                </div>
              </div>
            

            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Suggested Nominee Age </label> <input type="text" name="suggestedNomineeAge" id=suggestedNomineeAge required="required"
                    placeholder="Enter suggested Nominee Age" />
                </div>
              </div>
            

            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Suggested Nominee Relation </label> <select id="suggestedNomineeRelation" name="suggestedNomineeRelation" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
                  </select>
                </div>
              </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Address</label>
                <textarea name="address" id="address"
                  style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
              </div>
            </div>

            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">District</label> <input type="text" name="district" id="district" required="required"
                    placeholder="Enter district" />
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Branch Name</label> <select id="branchName" name="branchName" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
                  </select>
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">State</label> <input type="text" name="state" id="state" required="required"
                    placeholder="Enter state" />
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Pin Code</label> <input type="text" name="pinCode" id="pinCode" required="required"
                    placeholder="Enter pinCode" />
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Operation Type</label> <select id="operationType" name="operationType" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
                  </select>
                </div>
              </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Joint Operation Code</label> <input type="text" name="jointOperationCode" id="jointOperationCode" required="required"
                  placeholder="Enter joint Operation Code" />
              </div>
            </div>

            <div class="col-lg-3">
              <div class="d-flex flex-column formFields mb-4">
                <label for="">Joint Survivor Code</label> <input type="text" name="jointSurvivorCode" id="jointSurvivorCode" required="required"
                  placeholder="Enter joint Survivor Code" />
              </div>
            </div>

            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Family Relation</label> <select id="familyRelation" name="familyRelation" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
                  </select>
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Select Plan </label> <select id="selectPlan" name="selectPlan" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
                  </select>
                </div>
              </div>


            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Opening Amount</label> <input type="text" name="openingAmount" id="openingAmount" required="required"
                    placeholder="Enter opening Amount" />
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Financial Consultant Code</label> <input type="text" name=financialConsultantCode id="financialConsultantCode" required="required"
                    placeholder="Enter financial Consultant Code" />
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Financial Consultant Name</label> <input type="text" name="financialConsultantName" id="financialConsultantName" required="required"
                    placeholder="Enter Financial Consultant Name" />
                </div>
              </div>


              
            <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Opening Fees (if any)</label> <input type="text" name="openingFees" id="openingFees" required="required"
                    placeholder="Enter Licence No" />
                </div>
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
              <div class="d-flex flex-column formFields mb-4" style="margin-bottom: 30px">
                <label>Authenticate With</label>
                <div class="position-relative">
                  <div class="select-btn1" style="cursor: pointer;">
                    <span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span> <i
                      class="fa-solid fa-angle-down"></i>
                  </div>
                  <div class="content" id="contentCityName" style="display: none;">
                    <div class="search">
                      <input type="text" id="city-search" class="m-0" placeholder="Search City" />
                    </div>
                    <ul class="options" id="city-options">
                      <!-- Options will be dynamically added here -->

                    </ul>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-3"> 
                <div class="d-flex flex-column formFields mb-4">
                  <label for="">Mode of payment</label> <select id="colour" name="colour" required="required"
                    class="form-control selectField" style="height: 30px;">
                    <option value=""> Select Colour</option>
                    <option value="Blue">Blue</option>
                  </select>
                </div>
              </div>

              <div class="col-lg-3">
                <div class="d-flex flex-column formFields mb-4">
                  <label for=""> Comment</label>
                  <textarea name="" id=""
                    style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
                </div>
              </div>

              <div class="col-lg-3">
                <div class=" h-100 d-flex justify-content-start align-items-center">
                  <div class="d-flex justify-content-start align-items-center  formFields">
                    <label style="margin-left: 20px;" class="mb-2">Account Status</label>
                    <div class="cont">
                      <div class="toggle">
                        <input type="checkbox" id="toggle-member-status" class="toggle__input"
                          data-toggle-type="member-status">
                        <label for="toggle-member-status" class="toggle__label"></label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3">
                <div class=" h-100 d-flex justify-content-start align-items-center">
                  <div class="d-flex justify-content-start align-items-center  formFields">
                    <label style="margin-left: 20px;" class="mb-2">Message Send</label>
                    <div class="cont">
                      <div class="toggle">
                        <input type="checkbox" id="toggle-member-status" class="toggle__input"
                          data-toggle-type="member-status">
                        <label for="toggle-member-status" class="toggle__label"></label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3">
                <div class=" h-100 d-flex justify-content-start align-items-center">
                  <div class="d-flex justify-content-start align-items-center  formFields">
                    <label style="margin-left: 20px;" class="mb-2">Debit Card Issue</label>
                    <div class="cont">
                      <div class="toggle">
                        <input type="checkbox" id="toggle-member-status" class="toggle__input"
                          data-toggle-type="member-status">
                        <label for="toggle-member-status" class="toggle__label"></label>
                      </div>
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


  </main>
  <!-- <script src="js/chartScript.js"></script> -->
  <script src="./js/adminscript.js"></script>
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