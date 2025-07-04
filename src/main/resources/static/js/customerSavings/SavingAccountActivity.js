//fetch financial name from financialConsultantController
$('#financialConsultantCode').on('blur', function () {
	
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