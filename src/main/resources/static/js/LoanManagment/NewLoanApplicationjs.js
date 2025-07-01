/**
 * 
 */
//fetch only Drowpdown
$(document).ready(function () {
    console.log("Document ready");

    $.ajax({
        url: '/api/loanmanegment/allfetchdata', // ✅ Ensure this endpoint returns ApiResponse<List<Loan>>
        type: 'GET',
        success: function (response) {
            if (response.status=="OK" && response.data.length > 0) {
                const dropdown = $('#findMember');
                dropdown.empty(); // Clear existing options
                dropdown.append('<option value="">Select Member</option>'); // Default

                response.data.forEach(function (loan) {
                    dropdown.append(
                        `<option value="${loan.id}">${loan.customerName} - ${loan.memberCode}</option>`
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
    $('#findMember').on('change', function () {
        const selectedId = $(this).val();
        alert("Selected ID: " + selectedId);  // ✅ Debugging purpose

        if (selectedId !== "") {
            $.ajax({
                url: '/api/loanmanegment/getByIdNewLoanApplication',
                type: 'GET',
                data: { id: selectedId },
                success: function (response) {
                    console.log("Response:", response);

                    if (response.success) {
                        const d = response.data;
						alert(d.customerName);
                        $('#relativeDetail').val(d.relationToApplicant || '');
                        $('#newloanApplicationDOB').val(d.dob || '');
                        $('#newApplictionAge').val(d.customerAge || '');
                        $('#phoneNo').val(d.contactNo || '');
                        $('#noficationStatus').val(d.noficationStatus || '');
                        $('#newAplicationAddress').val(d.customerAddress || '');
                        $('#newAppicationPinCode').val(d.pinCode || '');
						alert(d.branchName);
                        $('#newApplicationBranchName').val(d.branchName || '');
                     
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

//branch name fetch for prefrences

$(document).ready(function () {
    console.log("Document ready");

    $.ajax({
        url: '/api/loanmanegment/allfetchdataBranchName', 
        type: 'GET',
        success: function (response) {
            if (response.success && response.data.length > 0) {
                const dropdown = $('#newApplicationBranchName');
                dropdown.empty(); 
                dropdown.append('<option value="">Select Branch Name</option>'); // Default

                
                response.data.forEach(function (loan) {
                    if (loan.branchName) {
                        dropdown.append(
                            `<option value="${loan.branchName}">${loan.branchName}</option>`
                        );
                    }
                });
            } else {
                alert('No branch data found');
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error:', status, error);
            alert('Failed to fetch branch names');
        }
    });
});

// Dropdawn in Loan schem Code

$(document).ready(function () {
	
    console.log("Document ready");

    $.ajax({
        url: '/api/loanmanegment/allfetchdataLoanSchemCode', 
        type: 'GET',
        success: function (response) {
            if (response.success && response.data.length > 0) {
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
			alert("success");
            if (response && response.data) {
                console.log("✅ Loan Found:", response.data);

                $('#newApplicationLoanPlaneName').val(response.data.loanPlaneName || '');
                $('#newLoanTypeofloan').val(response.data.typeloan || '');
                $('#newLoanROI').val(response.data.rateIntrestType || '');
                // Add other fields as needed
            } else {
                alert("Loan not found or empty response.");
            }
        },
        error: function(xhr) {
            console.error(" Error:", xhr);
            alert("Loan code not found or server error.");
        }
    });
}


