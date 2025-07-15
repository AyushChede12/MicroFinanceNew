$(document).ready(function () {
	// 1. Populate dropdown with approved RD policies
	$.ajax({
		url: "api/Policymangment/getAllRDPolicies",
		type: "GET",
		success: function (response) {
			if (response.data && response.data.length > 0) {
				const policySelect = $("#policyCode");
				response.data.forEach(policy => {
					const optionText = `${policy.policyCode} - ${policy.customerName}`;
					policySelect.append(`<option value="${policy.policyCode}">${optionText}</option>`);
				});
			}
		},
		error: function () {
			alert("Failed to load policies.");
		}
	});

	// 2. On policyCode change, fetch full policy data
	$("#policyCode").on("change", function () {
		const selectedPolicyCode = $(this).val();
		if (selectedPolicyCode) {
			$.ajax({
				url: "api/Policymangment/getPolicyByPolicyCode",
				type: "GET",
				data: { policyCode: selectedPolicyCode },
				success: function (response) {
					if (response.data) {
						const data = response.data;

						// 2a. Calculate renewal date (for RD = add 1 month to policyStartDate)
						let renewalDate = "";
						if (data.policyStartDate && data.schemeType === "RD") {
							const startDate = new Date(data.policyStartDate);
							startDate.setMonth(startDate.getMonth() + 1);
							const yyyy = startDate.getFullYear();
							const mm = String(startDate.getMonth() + 1).padStart(2, '0');
							const dd = String(startDate.getDate()).padStart(2, '0');
							renewalDate = `${yyyy}-${mm}-${dd}`;
						}

						// 2b. Populate form fields (update IDs as needed)
						$("#policyDate").val(data.policyStartDate);
						$("#renewalDate").val(renewalDate);
						$("#maturityDate").val(data.maturityDate);
						$("#customerCode").val(data.memberSelection);
						$("#clientName").val(data.customerName);
						$("#contactNo").val(data.contactNo);
						$("#policyAmount").val(data.policyAmount);
						$("#policyType").val(data.schemeType);
						$("#policyTerm").val(data.schemeTerm);
						$("#maturityAmount").val(data.maturityAmount);
						$("#totalDeposit").val(data.depositAmount);
						$("#paymentDue").val(data.amountDue);
						$("#financialCode").val(data.introMCode);
						$("#lastPaymentDate").val(data.lastInstPaid);
						$("#dueDate").val(data.maturityDate);
						$("#noOfInstPaid").val(data.lastInstPaid);
						$("#installmentsCompleted").val(data.lastInstPaid);
						$("#paymentMode").val(data.paymentBy);
						$("#nomineeName").val(data.suggestedNominee);
						$("#comment").val(data.remark);
						$("#agentName").val(data.agent);
					}
				},
				error: function () {
					alert("Policy not found!");
				}
			});
		}
	});
});

$(document).ready(function () {
    $("#saveBtn").click(function (e) {
        e.preventDefault(); // Prevent default form submission

        // Collect form data
        const formData = {
            policyCode: $("#policyCode").val(),
            renewalDate: $("#renewalDate").val(),
            policyDate: $("#policyDate").val(),
            maturityDate: $("#maturityDate").val(),
            customerCode: $("#customerCode").val(),
            clientName: $("#clientName").val(),
            contactNo: $("#contactNo").val(),
            policyAmount: $("#policyAmount").val(),
            policyType: $("#policyType").val(),
            policyTerm: $("#policyTerm").val(),
            maturityAmount: $("#maturityAmount").val(),
            totalDeposit: $("#totalDeposit").val(),
            paymentDue: $("#paymentDue").val(),
            lastPaymentDate: $("#lastPaymentDate").val(),
            dueDate: $("#dueDate").val(),
            noOfInst: $("#noOfInst").val(),
            noOfInstPaid: $("#noOfInstPaid").val(),
            modeOfPayment: $("#modeOfPayment").val()
        };

        // Send to backend
        $.ajax({
            url: "/api/Policymangment/updateRenewalData",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (response) {
                alert("✅ " + response.message);
                $("#formid")[0].reset(); // Reset form if needed
            },
            error: function (xhr) {
                alert("❌ Error: " + (xhr.responseJSON?.message || "Something went wrong."));
            }
        });
    });
});
