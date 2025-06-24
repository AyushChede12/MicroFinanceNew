/**
 * 
 */

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
                        $('#relativeDetail').val(d.relationshipStatus || '');
                        $('#newloanApplicationDOB').val(d.dob || '');
                        $('#newApplictionAge').val(d.customerAge || '');
                        $('#phoneNo').val(d.contactNo || '');
                        $('#noficationStatus').val(d.noficationStatus || '');
                        $('#newAplicationAddress').val(d.customerAddress || '');
                        $('#newAppicationPinCode').val(d.pinCode || '');
                        $('#newApplicationBranchName').val(d.branchNames || '');
                        $('#newApplicationLoanPlaneName').val(d.newApplicationLoanPlaneName || '');
                        $('#newLoanApplicationTypeofloan').val(d.newLoanApplicationTypeofloan || '');
                        $('#newApplicationDurationPlan').val(d.newApplicationDurationPlan || '');
                        $('#newLoanApplicationCategoryLoan').val(d.newLoanApplicationCategoryLoan || '');
                        $('#newApplicationROI').val(d.newApplicationROI || '');
                        $('#newApplicationLoanAmount').val(d.newApplicationLoanAmount || '');
                        $('#newApplicationTypeIntrest').val(d.newApplicationTypeIntrest || '');
                        $('#newLoanApplicationPaymnetEMI').val(d.newLoanApplicationPaymnetEMI || '');
                        $('#newApplicationLoanPurpose').val(d.newApplicationLoanPurpose || '');
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
