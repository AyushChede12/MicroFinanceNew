$(document).ready(function () {
    // Populate member codes
    $.ajax({
        url: "/api/securedGoldLoan/getAllMembersForGoldLoan",
        type: "GET",
        data: { memberCode: "" },
        success: function (response) {
            var select = $("#memberCode");
            select.empty();
            select.append('<option value="">Select member Code</option>');

            if (response && response.data && response.data.length > 0) {
                response.data.forEach(function (customer) {
                    var optionText = customer.memberCode + "-" + customer.customerName;
                    var optionValue = customer.memberCode;
                    select.append(
                        '<option value="' + optionValue + '">' + optionText + "</option>"
                    );
                });
            } else {
                console.log("No members found");
            }
        },
        error: function (err) {
            console.error("Error fetching members", err);
        },
    });

    // On memberCode change, fetch details
    $("#memberCode").on("change", function () {
        var memberCode = $(this).val();
        if (memberCode) {
            $.ajax({
                url: "/api/securedGoldLoan/getByMemberCodeApplyForGold",
                type: "GET",
                data: { memberCode: memberCode },
                success: function (response) {
                    if (response && response.data && response.data.length > 0) {
                        var customer = response.data[0]; // assuming first record

                        // Populate form fields
                        $("#customerName").val(customer.customerName || "");
                        $("#dateOfBirth").val(customer.dob || "");
                        $("#age").val(customer.customerAge || "");
                        $("#contactNo").val(customer.contactNo || "");
                        $("#address").val(customer.customerAddress || "");
                        $("#pinCode").val(customer.pinCode || "");
                        $("#branchName").val(customer.branchName || "");
                    } else {
                        alert("No details found for this member");
                    }
                },
                error: function (err) {
                    console.error("Error fetching customer details", err);
                },
            });
        } else {
            // clear fields if no member selected
            $("#customerName, #dateOfBirth, #age, #contactNo, #address, #pinCode, #branchName").val("");
        }
    });
});
