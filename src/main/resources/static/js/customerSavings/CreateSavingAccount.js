//shubham kewat
//fetch Policy Name
$(document).ready(function() {
    $.ajax({
        url: "/api/customersavings/fetchsavingchemecatalog",
        type: "GET",
        success: function(response) {
			console.log("API response:", response);
            var dropdown = $('#selectPlan');
            dropdown.empty();
            dropdown.append('<option value="">Select</option>');

            if (response.status === "FOUND" && response.data) {
                $.each(response.data, function(index, item) {
                   dropdown.append('<option value="' + item.policyName+ '">' + item.policyName + '</option>');
                });
            } else {
                dropdown.append('<option value="">No Policyname found</option>');
            }
        },
        error: function() {
            alert("Failed to fetch Policyname.");
        }
    });
});

//fetch minimum opening balance
$('#selectPlan').on('change', function () {
    let selectedName = $(this).val();

    if (selectedName !== "") {
        $.ajax({
            url: '/api/customersavings/fetchpolicyname?policyName=' + encodeURIComponent(selectedName), // Pass as query param
            type: 'GET',
            success: function (response) {
                if (response.status === "FOUND") {
                    let customer = response.data[0];
                    $('#openingAmount').val(customer.monthlyMinimumBalance);
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


//shubham kewat 18/06/25
//fetch customer name 
$(document).ready(function() {
    $.ajax({
        url: "/findAllCustomerCode",
        type: "GET",
        success: function(response) {
            console.log("API response:", response);

            var dropdown1 = $('#selectByCustomer');       // shows: memberCode - customerName
            var dropdown2 = $('#jointOperationCode');     // shows: memberCode only

            dropdown1.empty();
            dropdown2.empty();

            dropdown1.append('<option value="">Select</option>');
            dropdown2.append('<option value="">Select</option>');

            if (response.status === "OK" && response.data) {
                $.each(response.data, function(index, customer) {
                    dropdown1.append('<option value="' + customer.memberCode + '">' + customer.memberCode + ' - ' + customer.customerName + '</option>');
                    dropdown2.append('<option value="' + customer.memberCode + '">' + customer.memberCode + '</option>');
                });
            } else {
                dropdown1.append('<option value="">No customers found</option>');
                dropdown2.append('<option value="">No customers found</option>');
            }
        },
        error: function() {
            alert("Failed to fetch customer list.");
        }
    });
});

//Member Code fetch in Customer Name 

$('#selectByCustomer').on('change', function () {
    let selectedCode = $(this).val();

    if (selectedCode !== "") {
        $.ajax({
            url: '/api/customersavings/fetchCustomerCode',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ memberCode: selectedCode }),
            success: function (response) {
                if (response.status === "FOUND") {
                    let customer = response.data[0];
                    $('#enterCustomerName').val(customer.customerName);
                    $('#familyDetails').val(customer.guardianName);
					$('#contactNumber').val(customer.contactNo);
					$('#suggestedNomineeName').val(customer.nomineeName);
					$('#suggestedNomineeAge').val(customer.nomineeAge);
					$('#suggestedNomineeRelation').val(customer.nomineeRelationToApplicant);
					$('#address').val(customer.customerAddress);
					$('#district').val(customer.district);
					$('#branchName').val(customer.branchName);
					$('#pinCode').val(customer.pinCode);
					$('#state').val(customer.state);
					$('#dateOfBirth').val(customer.dob);
                    //$('#panCardNumber').val(customer.panCardNumber);
                } else {
                    alert('No customer data found!');
                    $('#enterCustomerName').val('');
                    $('#previousShareCount').val('');
                    //$('#panCardNumber').val('');
                }
            },
            error: function () {
                alert('Error while fetching customer data!');
            }
        });
    } else {
        $('#enterCustomerName').val('');
        $('#previousShareCount').val('');
        $('#panCardNumber').val('');
    }
});


//fetch only customer name on cahnge in dropdown
$('#jointOperationCode').on('change', function () {
    let selectedCode = $(this).val();

    if (selectedCode !== "") {
        $.ajax({
            url: '/api/customersavings/fetchCustomerCode',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ memberCode: selectedCode }),
            success: function (response) {
                if (response.status === "FOUND") {
                    let customer = response.data[0];
                    $('#jointSurvivorCode').val(customer.customerName);
                } else {
                    alert('No customer data found!');
                    $('#jointSurvivorCode').val('');
                }
            },
            error: function () {
                alert('Error while fetching customer data!');
                $('#jointSurvivorCode').val('');
            }
        });
    } else {
        $('#jointSurvivorCode').val('');
    }
});


//fetch relative relation from preferences
$(document).ready(function() {
    $.ajax({
        url: "/api/preference/getAllRelativeModule",
        type: "GET",
        success: function(response) {
			console.log("API response:", response);
            var dropdown = $('#familyRelation');
            dropdown.empty();
            dropdown.append('<option value="">Select</option>');

            if (response.status === "OK" && response.data) {
                $.each(response.data, function(index, item) {
                   dropdown.append('<option value="' + item.relation+ '">' + item.relation + '</option>');
                });
            } else {
                dropdown.append('<option value="">No Relation found</option>');
            }
        },
        error: function() {
            alert("Failed to fetch relation.");
        }
    });
});

//fetch financial name from financialConsultantController
$('#financialConsultantCode').on('blur', function () {
	alert("Hello");
    let selectedCode = $(this).val();

    if (selectedCode !== "") {
        $.ajax({
            url: '/api/customersavings/fetchfinancialcode?financialCode=' + encodeURIComponent(selectedCode), // Pass as query param
            type: 'GET',
            success: function (response) {
                if (response.status === "FOUND") {
                    let customer = response.data[0];
                    $('#financialConsultantName').val(customer.customerName);
                } else {
                    alert('No data found!');
                    $('#financialConsultantName').val('');
                }
            },
            error: function () {
                alert('Error while fetching data!');
                $('#financialConsultantName').val('');
            }
        });
    } else {
        $('#financialConsultantName').val('');
    }
});

// save saving account details 
$(document).ready(function () {
    $('#saveBtn').click(function (event) {
        event.preventDefault();

        const accountData = {
            openingDate: $('#openingDate').val(),
            selectByCustomer: $('#selectByCustomer').val(),
            enterCustomerName: $('#enterCustomerName').val(),
            dateOfBirth: $('#dateOfBirth').val(),
            familyDetails: $('#familyDetails').val(),
            contactNumber: $('#contactNumber').val(),
            suggestedNomineeName: $('#suggestedNomineeName').val(),
            suggestedNomineeAge: $('#suggestedNomineeAge').val(),
            suggestedNomineeRelation: $('#suggestedNomineeRelation').val(),
            address: $('#address').val(),
            district: $('#district').val(),
            branchName: $('#branchName').val(),
            state: $('#state').val(),
            pinCode: $('#pinCode').val(),
            operationType: $('#operationType').val(),
            jointOperationCode: $('#jointOperationCode').val(),
            jointSurvivorCode: $('#jointSurvivorCode').val(),
            familyRelation: $('#familyRelation').val(),
            selectPlan: $('#selectPlan').val(),
            openingAmount: $('#openingAmount').val(),
            financialConsultantCode: $('#financialConsultantCode').val(),
            financialConsultantName: $('#financialConsultantName').val(),
            openingFees: $('#openingFees').val(),
            authenticateWith: $('#authenticateWith').val(),
            modeOfPayment: $('#modeOfPayment').val(),
            comment: $('#comment').val(),
			accountNumber: $('#accountNumber').val(),
			accountStatus: $('#toggle-member-status').is(':checked') ? 1 : 0,
			messageSend: $('#toggle-member-status1').is(':checked') ? 1 : 0,
			debitCardIssue: $('#toggle-member-status2').is(':checked') ? 1 : 0
        };
        $.ajax({
            url: '/api/customersavings/savesavingaccount', // Replace with your actual endpoint
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(accountData),
            success: function (response) {
                alert("Saving Account data saved successfully!\nAccount No : "+accountData.accountNumber);
                location.reload();
            },
            error: function (xhr) {
                console.error('Error:', xhr.responseText);
                alert('Failed to save saving account data.');
            }
        });
    });
	
	$.ajax({
			type: "GET",
			url: "/api/customersavings/getAllSavingAccountData",
			contentType: "application/json",
			success: function(response) {
				console.log("Full Response from API:", response); 
				if (response.status =="FOUND" ) {
					let data = response.data;
					let tableBody = $(".datatable tbody");
					tableBody.empty();
					data.forEach((item, index) => {
						let row = `<tr>
			                        <td>${index + 1}</td>
			                        <td>${item.accountNumber}</td>
			                        <td>${item.selectByCustomer}</td>
			                        <td>${item.enterCustomerName}</td>
									<td>${item.contactNumber}</td>
									<td>${item.branchName}</td>
									<td>${item.address}</td>
									<td>${item.district}</td>
									<td>${item.state}</td>
									<td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="fa-solid fa-pen-to-square text-primary"></i></button></td>
									<td><button class="iconbutton" onclick="deleteData(${item.id})" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
			                    </tr>`;
						tableBody.append(row);
					});
				} else {
					alert("Failed to fetch saving account data: " + response.message);
				}
			},
			error: function() {
				alert("Error while calling the API.");
			}
		});
});

function viewData(id) {
	$.ajax({
		url: "/api/customersavings/getSavingAccountDataById", // ✅ your correct endpoint
		type: "GET",
		data: { id: id },
		success: function(response) {
			if (response.status == "FOUND") {
				const data = response.data;

				$("#openingDate").val(data.openingDate);
				$("#selectByCustomer").val(data.selectByCustomer);
				$("#enterCustomerName").val(data.enterCustomerName);
				$("#dateOfBirth").val(data.dateOfBirth);
				$("#familyDetails").val(data.familyDetails);
				$("#contactNumber").val(data.contactNumber);
				$("#suggestedNomineeName").val(data.suggestedNomineeName);
				$("#suggestedNomineeAge").val(data.suggestedNomineeAge);
				$("#suggestedNomineeRelation").val(data.suggestedNomineeRelation);
				$("#address").val(data.address);
				$("#district").val(data.district);
				$("#branchName").val(data.branchName);
				$("#state").val(data.state);
				$("#pinCode").val(data.pinCode);
				$("#operationType").val(data.operationType);
				$("#jointOperationCode").val(data.jointOperationCode);
				$("#jointSurvivorCode").val(data.jointSurvivorCode);
				$("#familyRelation").val(data.familyRelation);
				$("#selectPlan").val(data.selectPlan);
				$("#openingAmount").val(data.openingAmount);
				$("#financialConsultantCode").val(data.financialConsultantCode);
				$("#financialConsultantName").val(data.financialConsultantName);
				$("#openingFees").val(data.openingFees);
				$("#authenticateWith").val(data.authenticateWith);
				$("#modeOfPayment").val(data.modeOfPayment);
				$("#comment").val(data.comment);
				$("#messageSend").val(data.messageSend);
				$("#debitCardIssue").val(data.debitCardIssue);
				$("#accountNumber").val(data.accountNumber);

				// ✅ Toggle accountStatus (1 = checked, 0 = unchecked)
				$("#toggle-member-status").prop('checked', data.accountStatus === 1);

			} else {
				alert("Account not found: " + response.message);
			}
		},
		error: function(xhr) {
			alert("Request failed: " + xhr.responseText);
		}
	});
}

function deleteData(id) {
	if (confirm("Are you sure you want to delete this branch?")) {
		$.ajax({
			url: "/api/customersavings/deleteSavingAccountDataById", 
			type: "POST",
			data: { id: id }, 
			success: function(response) {
				if (response.success) {
					alert(response.message); 
					location.reload();   
				} else {
					alert("Delete failed: " + response.message);
				}
			},
			error: function(xhr, status, error) {
				alert("Failed to delete financial Year.");
				console.error("Error:", error);
			}
		});
	}

}




