
$(document).ready(function () {
    $.ajax({
        url: "/api/Approval/findAllMemberCode",  // ✅ Corrected URL (case-sensitive)
        type: "GET",
        success: function (response) {
			alert("hii");
            console.log("API response:", response);

            var dropdown = $('#Code');  // ✅ Matches your <select id="Code">
            dropdown.empty();
            dropdown.append('<option value="">Select Member Code</option>');

            // ✅ Correct status check
            if (response.status === 200 && response.data) {
                $.each(response.data, function (index, customer) {
                    dropdown.append('<option value="' + customer.memberCode + '">' + customer.memberCode + '</option>');
                });
            } else {
                dropdown.append('<option value="">No member codes found</option>');
            }
        },
        error: function () {
            alert("Failed to fetch member codes.");
        }
    });
});

-
414