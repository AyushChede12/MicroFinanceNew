$(document).ready(function() {
    $.ajax({
        url: "/api/customersavings/getAllSavingAccountData",
        type: "GET",
        success: function(response) {
			console.log("API response:", response);
            var dropdown1 = $('#debitAccountNumber');
			var dropdown2 = $('#creditAccountNumber');
            dropdown1.empty();
            dropdown1.append('<option value="">Select</option>');
			dropdown2.empty();
			dropdown2.append('<option value="">Select</option>');


            if (response.status === "FOUND" && response.data) {
                $.each(response.data, function(index, item) {
                   dropdown1.append('<option value="' + item.accountNumber+ '">' + item.accountNumber + '</option>');
				   dropdown2.append('<option value="' + item.accountNumber+ '">' + item.accountNumber + '</option>');
                });
            } else {
                dropdown1.append('<option value="">No Account Number found</option>');
				dropdown2.append('<option value="">No Account Number found</option>');
            }
        },
        error: function() {
            alert("Failed to fetch Policyname.");
        }
    });
})

$('#debitAccountNumber').on('change', function () {
    let accountNumber = $(this).val();

    if (accountNumber !== "") {
        $.ajax({
            url: '/api/customersavings/getallbyaccountnumber?accountNumber=' + encodeURIComponent(accountNumber), // Pass as query param
            type: 'GET',
            success: function (response) {
                if (response.status === "FOUND") {
                    let customer = response.data[0];
                    $('#debitCustomerCode').val(customer.selectByCustomer);
					$('#debitAccountBranch').val(customer.branchName);
					$('#debitAverageBalance').val(customer.openingAmount);
					$('#debitContactNumber').val(customer.contactNumber);
                } else {
                    alert('No data found!');
                    $('#debitCustomerCode').val('');
                }
            },
            error: function () {
                alert('Error while fetching data!');
                $('#debitCustomerCode').val('');
            }
        });
    } else {
        $('#debitCustomerCode').val('');
    }
});

$('#creditAccountNumber').on('change', function () {
    let accountNumber = $(this).val();

    if (accountNumber !== "") {
        $.ajax({
            url: '/api/customersavings/getallbyaccountnumber?accountNumber=' + encodeURIComponent(accountNumber), // Pass as query param
            type: 'GET',
            success: function (response) {
                if (response.status === "FOUND") {
                    let customer = response.data[0];
                    $('#creditCustomerCode').val(customer.selectByCustomer);
					$('#creditAccountBranch').val(customer.branchName);
					$('#creditAverageBalance').val(customer.openingAmount);
					$('#creditContactNumber').val(customer.contactNumber);
                } else {
                    alert('No data found!');
                    $('#debitCustomerCode').val('');
                }
            },
            error: function () {
                alert('Error while fetching data!');
                $('#debitCustomerCode').val('');
            }
        });
    } else {
        $('#debitCustomerCode').val('');
    }
});
