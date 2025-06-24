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
/*$('#selectPlan').on('change', function () {
    let selectedName = $(this).val();

    if (selectedName !== "") {
        $.ajax({
            url: '/api/customersavings/fetchpolicyname',
            type: 'GET',
        contentType: 'application/json',
            data: JSON.stringify({ policyName: selectedName }),
            success: function (response) {
                if (response.status === "FOUND") {
                    let customer = response.data[0];
					alert(customer);
                    $('#openingAmount').val(customer.monthlyMinimumBalance);
                } else {
                    alert('No customer data found!');
                    $('#openingAmount').val('');
                }
            },
            error: function () {
                alert('Error while fetching customer data!');
                $('#openingAmount').val('');
            }
        });
    } else {
        $('#openingAmount').val('');
    }
});
*/

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


