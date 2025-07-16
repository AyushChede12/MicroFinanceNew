
//fetch only Drowpdown
$(document).ready(function () {
    console.log("Document ready");

    $.ajax({
        url: '/approved', // ✅ This hits your @GetMapping
        type: 'GET',
        success: function (response) {
            if (Array.isArray(response) && response.length > 0) {
                const dropdown = $('#memberId');
                dropdown.empty(); // Clear existing options
                dropdown.append('<option value="">Select Member</option>');

                response.forEach(function (customer) {
                    dropdown.append(
                        `<option value="${customer.id}">${customer.customerName} - ${customer.memberCode}</option>`
                    );
                });
            } else {
                alert('No member data found');
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error:', status, error);
            alert('Failed to fetch members');
        }
    });
});

//data fetch from id and name

$(document).ready(function () {
    $('#memberId').on('change', function () {
        const selectedId = $(this).val();

        if (selectedId !== "") {
            $.ajax({
                url: '/api/loanmanegment/getByIdNewLoanApplication',
                type: 'GET',
                data: { id: selectedId },
                success: function (response) {
                    console.log("Response:", response);

                    if (response.status=="OK") {
                        const d = response.data;
                        $('#relativeDetails').val(d.relationToApplicant || '');
                        $('#dateOfBirth').val(d.dob || '');
                        $('#age').val(d.customerAge || '');
                        $('#contactNo').val(d.contactNo || '');
                        $('#notificationStatus').val(d.noficationStatus || '');
                        $('#address').val(d.customerAddress || '');
                        $('#pinCode').val(d.pinCode || '');
                        $('#branchName').val(d.branchName || '');
                     
                    } else {
                        alert("Customer not found!");
                    }
                },
                error: function (xhr) {
                    console.error("AJAX Error:", xhr.responseText);
                    alert("Something went wrong while fetching data.");
                }
            });
        } else {
            $('input, textarea').not('#findMember').val('');
        }
    });
});

$(document).ready(function() {
    $.ajax({
        url: "/api/loanmanegment/fetchLoanSchemeCatalog",
        type: "GET",
        success: function(response) {
            console.log("API response:", response);

            var dropdown = $('#loanPlanName');     // shows: memberCode only
            dropdown.empty();
       		dropdown.append('<option value="">Select</option>');

            if (response.status === "FOUND" && response.data) {
                $.each(response.data, function(index, customer) {
                    dropdown.append('<option value="' + customer.loanPlaneName + '">' + customer.loanPlaneName + '</option>');
                });
            } else {
                dropdown.append('<option value="">No customers found</option>');
            }
        },
        error: function() {
            alert("Failed to fetch customer list.");
        }
    });
});


$('#loanPlanName').on('change', function () {
    let selectedName = $(this).val();

    if (selectedName !== "") {
        $.ajax({
            url: '/api/loanmanegment/allfetchdataLoanPlanName?loanPlanName=' + encodeURIComponent(selectedName), // Pass as query param
            type: 'GET',
            success: function (response) {
                if (response.status === "FOUND") {
                    let customer = response.data[0];
                    $('#typeOfLoan').val(customer.typeLoan);
					//$('#openingAmount').val(customer.loanCategory);
					$('#planDuration').val(customer.loanDuration);
					$('#rateOfInterest').val(customer.rateIntrestType);
					$('#loanAmount').val(customer.loanAmount);
					$('#interestType').val(customer.typeIntrest);
					$('#emiPayment').val(customer.emiType);
					$('#purposeOfLoan').val(customer.typeLoan);
                } else {
                    alert('No data found!');
                    $('#openingAmount').val('');
                }
            },
            error: function () {
                alert('Error while fetching data!');
                $('#openingAmount').val('');
            }
        });
    } else {
        $('#openingAmount').val('');
    }
});


// Dropdawn in Loan schem Code

$(document).ready(function () {
	loadMemberCodesOnly();
	setupMemberChangeEvent();
	loadMemberCodeApplication();
	setupMemberChangeCoApplication();
	
    console.log("Document ready");

    $.ajax({
        url: '/api/loanmanegment/allfetchdataLoanSchemCode', 
        type: 'GET',
        success: function (response) {
            if (response.status=="OK" && response.data.length > 0) {
                const dropdown = $('#newApplicationLoanCode');
                dropdown.empty();
                dropdown.append('<option value="">Select Loan Plan Name</option>'); 

                response.data.forEach(function (loan) {
                    if (loan.loanSchemeCode) {
                        dropdown.append(
                            `<option value="${loan.loanSchemeCode}">${loan.loanSchemeCode}</option>`
                        );
                    }
                });
            } else {
                alert('No Loan Plan Name found');
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error:', status, error);
            alert('Failed to fetch Loan Plan names');
        }
    });
});


// All field fetch by loan new schem code by 
function getLoanByCode() {
    let code = $('#newApplicationLoanCode').val(); 
$.ajax({
        url: '/api/loanmanegment/getBySchemLoanCode?code=' + encodeURIComponent(code),
        type: 'GET',
        contentType: 'application/json',
        success: function(response) {
			//alert("success");
            if (response && response.data) {
                console.log(" Loan Found:", response.data);

                $('#newApplicationLoanPlaneName').val(response.data.loanPlaneName || '');
                $('#newLoanTypeofloan').val(response.data.typeLoan || '');
                $('#newApplicationDurationPlan').val(response.data.loanDuration || '');
				$('#newApplicationROI').val(response.data.rateIntrestType || '');
				$('#newApplicationTypeIntrest').val(response.data.typeIntrest || '');
				$('#newLoanApplicationCategoryLoan').val(response.data.loanMode || '');
								
				
                // Add other fields as needed
            } else {
               // alert("Loan not found or empty response.");
            }
        },
        error: function(xhr) {
            console.error(" Error:", xhr);
          //  alert("Loan code not found or server error.");
        }
    });
}

// calulate the Emi Amout 
function calculateEMI() {
  
let P = parseFloat(document.getElementById("newApplicationLoanAmount").value) || 0; // Principal amount
let annualRate = parseFloat(document.getElementById("newApplicationROI").value) || 0; // Annual ROI in percentage
let N = parseInt(document.getElementById("newApplicationDurationPlan").value) || 0; // Tenure in months
let roiType = document.getElementById("newApplicationTypeIntrest").value;
let EMI;


	
if (P <= 0 || annualRate <= 0 || N <= 0 || roiType === "") {
     alert("Please fill in all fields correctly.");
     return;
   }
   
   if (roiType === "Flat Interest") {
		let totalInterest = (P * annualRate * N) / 100;
		let totalRepayable = P + totalInterest;
		 EMI = totalRepayable / (N);
   	}
   else if (roiType === "Reducing interest") {
			let R = annualRate / 12 / 100; // Monthly interest rate
			 EMI = (P * R * Math.pow(1 + R, N)) / (Math.pow(1 + R, N) - 1);
			}
			else if (roiType === "Rule 78") {
			     let totalInterest = P * (annualRate / 100) * ( N / 12);
			    EMI = (P + totalInterest) /  N;
			   }
   document.getElementById("newLoanApplicationPaymentEMI").value = EMI.toFixed(2);
 }
 
	
	

// Fetching guarented Detail Memeber code
function loadMemberCodesOnly() {
    $.ajax({
        url: '/api/loanmanegment/allfetchdata',
        type: 'GET',
        success: function (response) {
            if (response.status === "OK" && Array.isArray(response.data) && response.data.length > 0) {
                const dropdown = document.getElementById("memberId");
                dropdown.innerHTML = '<option value="">Select Member Code</option>'; // Clear and add default

                response.data.forEach(function (member) {
                    const option = document.createElement("option");
                    option.value = member.id; // or member.memberCode if needed
                    option.text = member.memberCode;
                    dropdown.appendChild(option);
                });
            } else {
                alert('No member codes found');
            }
        },
        error: function (xhr, status, error) {	
            console.error('AJAX Error:', status, error);
            alert('Failed to fetch member codes');
        }
    });
}

// fetching the data 
function setupMemberChangeEvent() {
    const memberCode = $('#memberId');

    if (memberCode.length === 0) {
        console.error("Dropdown with id 'memberId' not found!");
        return;
    }

    memberCode.on('change', function () {
        const selectedCode = $(this).val();
        console.log("Selected Member Code:", selectedCode);
        if (selectedCode !== "") {
            $.ajax({
                url: '/api/loanmanegment/getByIdNewLoanApplication?id=' + selectedCode,
                type: 'GET',
                success: function (response) {
                    console.log("API Response:", response);

                    if (response.status === "OK" && response.data) {
                        const d = response.data;

                        $('#identifyGurantor').val(d.customerName || '');
                        $('#gurantorAddress').val(d.customerAddress || '');
                        $('#gurantorPinCode').val(d.pinCode || '');
                        $('#guarantorContactno').val(d.contactNo || '');
                    } else {
                        alert("Customer not found or data is missing.");
                        clearGuarantorFields();
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error:", status, error);
                    alert("Something went wrong while fetching data: " + error);
                    clearGuarantorFields();
                }
            });
        } else {
            clearGuarantorFields();
        }
    });

    function clearGuarantorFields() {
        $('#gurantorIdentifyGurantor').val('');
        $('#gurantorAddress').val('');
        $('#gurantorPinCode').val('');
        $('#guarantorContactno').val('');
    }
}



// Fetching guarented Co- Application Detail Memeber code
function loadMemberCodeApplication() {
    $.ajax({
        url: '/api/loanmanegment/allfetchdata',
        type: 'GET',
        success: function (response) {
            if (response.status === "OK" && Array.isArray(response.data) && response.data.length > 0) {
                const dropdown = document.getElementById("coApplictionMemberID");
                dropdown.innerHTML = '<option value="">Select Member Code</option>'; // Clear and add default

                response.data.forEach(function (member) {
                    const option = document.createElement("option");
                    option.value = member.id; // or member.memberCode if needed
                    option.text = member.memberCode;
                    dropdown.appendChild(option);
                });
            } else {
                alert('No member codes found');
            }
        },
        error: function (xhr, status, error) {	
            console.error('AJAX Error:', status, error);
            alert('Failed to fetch member codes');
        }
    });
}

// co-Application fetch Detail
function setupMemberChangeCoApplication() {
    const memberCode = $('#coApplictionMemberID');

    if (memberCode.length === 0) {
        console.error("Dropdown with id 'memberId' not found!");
        return;
    }

    memberCode.on('change', function () {
        const selectedCode = $(this).val();
        console.log("Selected Member Code:", selectedCode);
        if (selectedCode !== "") {
            $.ajax({
                url: '/api/loanmanegment/getByIdNewLoanApplication?id=' + selectedCode,
                type: 'GET',
                success: function (response) {
                    console.log("API Response:", response);

                    if (response.status === "OK" && response.data) {
                        const d = response.data;

                        $('#coApplictionGuarantorIdentity').val(d.customerName || '');
                        $('#coApplictionAdress').val(d.customerAddress || '');
                        $('#coAppicationPinCode').val(d.pinCode || '');
                        $('#coApplictionguarantorContactNo').val(d.contactNo || '');
                    } else {
                        alert("Customer not found or data is missing.");
                        clearGuarantorFields();
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error:", status, error);
                    alert("Something went wrong while fetching data: " + error);
                    clearGuarantorFields();
                }
            });
        } else {
            clearGuarantorFields();
        }
    });

    function clearGuarantorFields() {
        $('#gurantorIdentifyGurantor').val('');
        $('#gurantorAddress').val('');
        $('#gurantorPinCode').val('');
        $('#guarantorContactno').val('');
    }
}


   