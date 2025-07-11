$(document).ready(function () {
    $.ajax({
        url: "/api/Policymangment/getAllRDPolicies",  // Make sure this matches your controller
        type: "GET",
        success: function (response) {
            const $policyDropdown = $("#policyCode");
            $policyDropdown.empty(); // Clear existing options
            $policyDropdown.append('<option value="">Select Policy Code</option>');

            const policies = response.data;

            if (Array.isArray(policies) && policies.length > 0) {
                policies.forEach(policy => {
                    if (policy.policyCode && policy.policyCode.startsWith("RD")) {
                        $policyDropdown.append(
                            `<option value="${policy.policyCode}">${policy.policyCode}</option>`
                        );
                    }
                });
            } else {
                console.warn("No RD policy codes found.");
            }
        },
        error: function (xhr, status, error) {
            console.error("Error fetching RD policy codes:", error);
        }
    });
});
