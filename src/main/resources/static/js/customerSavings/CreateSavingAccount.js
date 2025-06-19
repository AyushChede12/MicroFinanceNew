//shubham kewat 18/06/25
//fetch customer name  
$(document).ready(function() {
    $.ajax({
        url: "/findAllCustomerCode", // This mapping is used from customerShareHolder controller.
        type: "GET",
        success: function(response) {
			console.log("API response:", response);
            var dropdown = $('#selectByCustomer');
            dropdown.empty();
            dropdown.append('<option value="">Select</option>');

            if (response.status === "OK" && response.data) {
                $.each(response.data, function(index, customer) {
                   dropdown.append('<option value="' + customer.memberCode + '">' + customer.memberCode  + " - " + customer.customerName +'</option>');
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





