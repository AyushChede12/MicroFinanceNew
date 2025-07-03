$(document).ready(function () {
    $('#branchName').on('change', function () {
        let branchName = $(this).val();
alert(branchName);
        if (branchName !== "") {
            $.ajax({
                url: 'api/Policymangment/getinvestmentdetails' + encodeURIComponent(branchName), // ✅ Use path variable
                type: 'GET',
                success: function (response) {
                    var dropdown = $('#policyId');
                    dropdown.empty();
                    dropdown.append('<option value="">Select Policy Code</option>');

                    if (response.status === "FOUND" || response.status === "OK") {
                        $.each(response.data, function (index, response) {
                            dropdown.append('<option value="' + response.jointMemCode + '">' + response.jointMemCode + '</option>');
                        });
                    } else {
                        dropdown.append('<option value="">No policy code found</option>');
                    }
                },
                error: function () {
                    alert("No policy code found.");
                }
            });
        }
    });
});
