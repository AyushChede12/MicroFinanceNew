//anjali (AddCustmer Count)
$(document).ready(function () {
	 $.ajax({
		  url: "api/customermanagement/getAllCustomer", 
		        type: "GET",
		        dataType: "json",
		        success: function (response) {
		            if (response && Array.isArray(response)) {
		                let count = response.length; 
		                console.log("Total customers:", count);
		                $("#CustomerCount h6").text(count); 
		            } else {
		                $("#CustomerCount h6").text("0");
		            }
		        },
		        error: function (xhr, status, error) {
		            console.error("Error fetching all customers:", error);
		            $("#CustomerCount h6").text("0");
		        }
		    });
		});
		
//anjali (saving acount count)	
$(document).ready(function () {
	$.ajax({
	        url: "api/customersavings/getAllSavingAccountData", // ✅ API endpoint
	        type: "GET",
	        dataType: "json",
	        success: function (response) {
	            if (response && response.data && Array.isArray(response.data)) {
	                let count = response.data.length; 
	                console.log("Total Saving Accounts:", count);
	                $("#SavingAccountCount h6").text(count); // Update card value
	            } else {
	                $("#SavingAccountCount h6").text("0");
	            }
	        },
	        error: function (xhr, status, error) {
	            console.error("Error fetching Saving Account:", error);
	            $("#SavingAccountCount h6").text("0");
	        }
	    });
	});
	
//anjali (financial consultant count)
$(document).ready(function () {
    $.ajax({
        url: "api/financialconsultant/getAllFinancialConsultantDetails", // ✅ match controller mapping
        type: "POST", // ✅ because you used @PostMapping
        dataType: "json",
        success: function (response) {
            if (response && response.data && Array.isArray(response.data)) {
                let count = response.data.length;
                console.log("Total Financial Consultants:", count);
                $("#FinancialConsultantCount h6").text(count); // Update in card
            } else {
                $("#FinancialConsultantCount h6").text("0");
				
				
            }
        },
        error: function (xhr, status, error) {
            console.error("Error fetching Financial Consultant details:", error);
            $("#FinancialConsultantCount h6").text("0");
        }
    });
});

//anjali (policy count)
$(document).ready(function () {
    $.ajax({
        url: "api/Policymangment/getAllPolicyManagementData",  // ✅ Matches @GetMapping
        type: "GET",
        dataType: "json",
        success: function (response) {
            if (response && response.data && Array.isArray(response.data)) {
                let count = response.data.length;
                console.log("Total Policies:", count);
                $("#policyCount h6").text(count);  // Update <h6> inside policy card
            } else {
                $("#policyCount h6").text("0");
            }
        },
        error: function (xhr, status, error) {
            console.error("Error fetching Policy data:", error);
            $("#policyCount h6").text("0");
        }
    });
});

//anjali (loan Application)
$(document).ready(function () {
    $.ajax({
        url: "api/loanmanegment/getStatementLoanId",  // your API endpoint
        type: "GET",
        dataType: "json",
        success: function (response) {
            if (response && response.data && Array.isArray(response.data)) {
                let count = response.data.length;
                console.log("Total Loan Applications:", count);
                $("#loanApplication h6").text(count); // ✅ fixed selector
            } else {
                $("#loanApplication h6").text("0");
            }
        },
        error: function (xhr, status, error) {
            console.error("Error fetching Loan IDs:", error);
            $("#loanApplication h6").text("0");
        }
    });
});

//anjali ( Share Issues)
$(document).ready(function () {
    $.ajax({
        url: "api/customershareholdingcontroller/getAllTransferShare",  // your API endpoint
        type: "GET",
        dataType: "json",
        success: function (response) {
            if (response && response.data && Array.isArray(response.data)) {
                let count = response.data.length;
                console.log("Total Transfer Share:", count);
                $("#ShareIssueCount h6").text(count); // ✅ fixed selector
            } else {
                $("#ShareIssueCount h6").text("0");
            }
        },
        error: function (xhr, status, error) {
            console.error("Error fetching Loan IDs:", error);
            $("#ShareIssueCount h6").text("0");
        }
    });
});


	