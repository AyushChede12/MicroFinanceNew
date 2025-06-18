$(document).ready(function () {
    
    $.ajax({
        url: "api/fixed-deposit/view",
        type: "GET",
        success: function (response) {
            var dropdown = $('#fdPolicyCode');
            dropdown.empty();
            dropdown.append('<option value="">Select Policy Code</option>');

            if (response.status == "OK" && response.data) {
                $.each(response.data, function (index, planCode) {
                    dropdown.append('<option value="' + planCode.planCodeRD1 + '">' + planCode.planCodeRD1 + '</option>');
                });
            } else {
                dropdown.append('<option value="">No policy code found</option>');
            }
        },
        error: function () {
            alert("No policy code found.");
        }
    });
	
});


$("#formfd").submit(function (event) {
    event.preventDefault();

    var data = {
        policyCode: $("#fdPolicyCode").val(),       // Must match Java field: PolicyCode
        instFrom: $("#fdMonthsFrom").val(),         // Must match Java field: InstFrom
        instTo: $("#fdMonthsTo").val(),             // Must match Java field: InstTo
        interestRate: $("#fdInterestRate").val(),   // Must match Java field: InterestRate
        deduction: $("#fdDeduction").val()          // Must match Java field: Deduction
    };

    $.ajax({
        url: "savematurityscheme",  // Your backend POST URL
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function (response) {
            if (response.status === "OK") {
                alert(" " + response.message);
                $("#formfd")[0].reset(); // Reset the form after success
            } else {
                alert(" " + response.message);
            }
        },
        error: function (xhr, status, error) {
            console.error("❌ Error saving:", error);
            alert("❌ Something went wrong while saving the data.");
        }
    });
});



