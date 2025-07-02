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

                    if (response.status=="OK") {
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

//branch name fetch for prefrences
/*
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
});*/

// Dropdawn in Loan schem Code

$(document).ready(function () {
	loadMemberCodesOnly();
	setupMemberChangeEvent();
	
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
			alert("success");
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
                alert("Loan not found or empty response.");
            }
        },
        error: function(xhr) {
            console.error(" Error:", xhr);
            alert("Loan code not found or server error.");
        }
    });
}

// calulate the Emi Amout 
function calculateEMI() {
    let loanAmount = parseFloat(document.getElementById("newApplicationLoanAmount").value) || 0;
	alert(loanAmount);
    let loanROI = parseFloat(document.getElementById("newApplicationROI").value) || 0;
	alert(loanROI);
    let planTerm = parseInt(document.getElementById("newApplicationDurationPlan").value, 10) || 1;
	alert(planTerm);
    let roiType = document.getElementById("newApplicationTypeIntrest").value;
	alert(roiType);
    let monthlyEMI = 0;

    if (roiType === "Flat Interest") {
        monthlyEMI = (loanAmount + (loanAmount * (loanROI / 100) * (planTerm / 12))) / planTerm;
    } else if (roiType === "Reducing interest") {
        let monthlyRate = loanROI / (12 * 100);
        monthlyEMI = (loanAmount * monthlyRate * Math.pow(1 + monthlyRate, planTerm)) /
                     (Math.pow(1 + monthlyRate, planTerm) - 1);
    } else if (roiType === "Rule 78") {
        let totalInterest = (loanAmount * (loanROI / 100) * (planTerm / 12));
        monthlyEMI = (loanAmount + totalInterest) / planTerm;
    }

    // Set EMI into the form field
    document.getElementById("newLoanApplicationPaymnetEMI").value = monthlyEMI.toFixed(2);

    // Optional: calculateCharges(loanAmount);
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
    const memberCode = document.getElementById("memberId");

    if (!memberCode) {
        console.error("Dropdown with id 'memberId' not found!");
        return;
    }

    memberCode.addEventListener("change", function () {
        const selectedCode = this.value;
        console.log("Selected Member Code:", selectedCode);
        alert("Selected Member Code: " + selectedCode);

        if (selectedCode !== "") {
            fetch('/api/loanmanegment/getBySchemLoanCode' + selectedCode)
                .then(response => {
                    console.log("HTTP Status:", response.status);
                    if (!response.ok) {
                        throw new Error("Server returned status " + response.status);
                    }
                    return response.json();
                })
                .then(response => {
                    console.log("API JSON Response:", response);

                    if (response.status === "OK" && response.data) {
                        const d = response.data;

                        document.getElementById('gurantorIdentifyGurantor').value = d.aadharNo || '';
                        document.getElementById('gurantorAddress').value = d.customerAddress || '';
                        document.getElementById('gurantorPinCode').value = d.pinCode || '';
                        document.getElementById('guarantorContactno').value = d.contactNo || '';
                    } else {
                        alert("Customer not found or data is missing.");
                    }
                })
                .catch(error => {
                    console.error("Fetch Error:", error);
                    alert("Something went wrong while fetching data: " + error.message);
                });
        } else {
            // Clear fields if no member selected
            ['gurantorIdentifyGurantor', 'gurantorAddress', 'gurantorPinCode', 'guarantorContactno'].forEach(id => {
                const field = document.getElementById(id);
                if (field) field.value = '';
            });
        }
    });
}




