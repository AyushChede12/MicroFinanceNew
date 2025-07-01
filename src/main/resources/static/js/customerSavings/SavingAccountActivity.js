//fetch saving account details by account number
$('#accountNumber').on('blur', function () {
    let selectedCode = $(this).val().trim();
	alert(selectedCode);
    if (selectedCode !== "") {
        $.ajax({
            url: '/api/customersavings/getallbyaccountnumber?accountNumber=' + encodeURIComponent(selectedCode),
            type: 'GET',
            success: function (response) {
                if (response.status === "FOUND" && response.data.length > 0) {
                    let customer = response.data[0];
                    $('#customerCode').val(customer.selectByCustomer);
					$('#customerName').val(customer.enterCustomerName);
					$('#contactNumber').val(customer.contactNumber);
					$('#jointHolderName').val(customer.jointSurvivorCode);
					$('#savingPlanName').val(customer.selectPlan);
                } else {
                    alert('No data found!');
                    $('#customerCode').val('');
                }
            },
            error: function () {
                alert('Error while fetching data!');
                $('#customerCode').val('');
            }
        });
    } else {
        $('#customerCode').val('');
    }
});
