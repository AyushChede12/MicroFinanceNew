$(document).ready(function() {
	alert("Hello");
    $.ajax({
        url: "/api/customersavings/getAllSavingAccountData",
        type: "GET",
        success: function(response) {
			console.log("API response:", response);
            var dropdown = $('#debitAccountNumber');
            dropdown.empty();
            dropdown.append('<option value="">Select</option>');

            if (response.status === "FOUND" && response.data) {
                $.each(response.data, function(index, item) {
                   dropdown.append('<option value="' + item.accountNumber+ '">' + item.accountNumber + '</option>');
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