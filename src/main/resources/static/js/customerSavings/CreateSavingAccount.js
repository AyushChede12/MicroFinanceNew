$(document).ready(function() {
	alert("Hello");
    $.ajax({
        url: "/findAllCustomerCode", // make sure this endpoint returns customer list
        type: "GET",
        success: function(response) {
			console.log("API response:", response);
            var dropdown = $('#selectByCustomer');
            dropdown.empty();
            dropdown.append('<option value="">Select</option>');

            if (response.status === "OK" && response.data) {
                $.each(response.data, function(index, customer) {
                    dropdown.append('<option value="' + customer.memberCode + '">' + customer.customerName + '</option>');
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
