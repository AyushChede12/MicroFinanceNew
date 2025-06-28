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
            if (response.success && response.data.length > 0) {
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

// Dropdawn in Loan Plan Name

$(document).ready(function () {
    console.log("Document ready");

    $.ajax({
        url: '/api/loanmanegment/allfetchdataLoanPlanName', 
        type: 'GET',
        success: function (response) {
            if (response.success && response.data.length > 0) {
                const dropdown = $('#newApplicationLoanPlaneName');
                dropdown.empty();
                dropdown.append('<option value="">Select Loan Plan Name</option>'); 

                response.data.forEach(function (loan) {
                    if (loan.loanPlaneName) {
                        dropdown.append(
                            `<option value="${loan.loanPlaneName}">${loan.loanPlaneName}</option>`
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
