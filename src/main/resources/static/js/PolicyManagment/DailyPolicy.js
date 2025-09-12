$(document).ready(function() {
	// 1. Populate dropdown with approved RD policies
	$.ajax({
		url: "api/Policymangment/getAllDDPolicies",
		type: "GET",
		success: function(response) {
			if (response.data && response.data.length > 0) {
				const policySelect = $("#policyCode");
				response.data.forEach(policy => {
					const optionText = `${policy.policyCode} - ${policy.customerName}`;
					policySelect.append(`<option value="${policy.policyCode}">${optionText}</option>`);
				});
			}
		},
		error: function() {
			alert("Failed to load policies.");
		}
	});

	// 2. On policyCode change, fetch full policy data
	$("#policyCode").on("change", function() {
		const selectedPolicyCode = $(this).val();
		if (selectedPolicyCode) {
			$.ajax({
				url: "api/Policymangment/getPolicyByPolicyCode",
				type: "GET",
				data: { policyCode: selectedPolicyCode },
				success: function(response) {
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
						$("#branchname").val(data.branchName);
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

						if (data.customerPhoto) {
							const photoPath = `Uploads/${data.customerPhoto}`;
							$("#photoPreview").attr("src", photoPath);
							$("#photoHidden").val(photoPath);
							photoSizeEdit({ target: { result: photoPath } });
						} else {
							$("#photoPreview").attr("src", "Uploads/default-placeholder.jpg");
							$("#photoHidden").val("");
						}

						// Signature
						if (data.customerSignature) {
							const signPath = `Uploads/${data.customerSignature}`;
							$("#signaturePreview").attr("src", signPath);
							$("#signatureHidden").val(signPath);
							signatureSizeEdit({ target: { result: signPath } });
						} else {
							$("#signaturePreview").attr("src", "Uploads/default-placeholder.jpg");
							$("#signatureHidden").val("");
						}
					}
				},
				error: function() {
					alert("Policy not found!");
				}
			});
		}
	});
});

$(document).ready(function() {
	$("#buttonSave").click(function(e) {
		e.preventDefault(); // Stop default form submission

		// Collect form values
		const policyCode = $("#policyCode").val()?.trim();
		const policyAmount = $("#policyAmount").val()?.trim();
		const noOfInstallments = $("#noOfInst").val()?.trim();

		// ✅ Basic validation
		if (!policyCode) {
			alert("❌ Policy Code is required.");
			return;
		}
		if (!policyAmount || isNaN(policyAmount) || parseFloat(policyAmount) <= 0) {
			alert("❌ Policy Amount must be a number greater than 0.");
			return;
		}
		if (!noOfInstallments || isNaN(noOfInstallments) || parseInt(noOfInstallments) <= 0) {
			alert("❌ Number of Installments must be a number greater than 0.");
			return;
		}

		// ✅ Prepare payload
		const payload = {
			policyCode: policyCode,
			policyAmount: parseFloat(policyAmount),
			noOfInstallments: parseInt(noOfInstallments)
		};

		// ✅ Send AJAX request
		$.ajax({
			url: "api/Policymangment/updateDDDueAndInstallment", // ✅ add leading slash
			type: "POST",
			data: JSON.stringify(payload),
			contentType: "application/json",
			dataType: "json", // ensure response is parsed as JSON
			success: function(response) {
				console.log("✅ Response:", response);
				alert("✅ " + (response.message || "Update successful!"));
				location.reload(); // Refresh after success
			},
			error: function(xhr) {
				console.error("❌ AJAX Error:", xhr);
				const errMsg = xhr.responseJSON?.message || "Something went wrong.";
				alert("❌ Error: " + errMsg);
			}
		});
	});


});

$("#viewBtn").on("click", function() {
	const selectedPolicyCode = $("#policyCode").val();

	if (!selectedPolicyCode) {
		alert("Please select a policy code first!");
		return;
	}

	$.ajax({
		url: "api/Policymangment/getFullMaturityByPolicyCode",
		type: "GET",
		dataType: "json",
		data: { policyCode: selectedPolicyCode },
		success: function(response) {
			console.log("✅ Full Response:", response);

			const $tbody = $("#installmentModal tbody");
			let rowsHtml = "";

			let installments = [];

			if (response && response.status === "OK") {
				if (Array.isArray(response.data)) {
					installments = response.data;
				} else if (response.data) {
					installments = [response.data];
				}
			}

			if (installments.length > 0) {
				installments.forEach((inst, index) => {
					const srNo = index + 1;

					// Dates parsing
					const paymentDateStr = inst.paymentDate || null;
					const currentDate = new Date();

					// Difference calculation
					let diffDays = "-";
					if (paymentDateStr) {
						const paymentDate = new Date(paymentDateStr);
						const diffMs = paymentDate - currentDate;
						diffDays = Math.ceil(diffMs / (1000 * 60 * 60 * 24));
					}

					// ✅ Status Logic
					const status = paymentDateStr && paymentDateStr.trim() !== ""
						? `<span class="text-success fw-bold">Paid</span>`
						: `<span class="text-danger fw-bold">Unpaid</span>`;

					const amount = inst.amount
						? `INR ${Number(inst.amount).toLocaleString("en-IN")}`
						: "INR 0";

					rowsHtml += `
						<tr>
						  <td>${srNo}</td>
						  <td>${diffDays} days</td>
						  <td>${amount}</td>
						  <td>${status}</td>
						  <td>${paymentDateStr || "-"}</td>
						</tr>
					`;
				});
			} else {
				rowsHtml = `
					<tr>
					  <td colspan="5" class="text-center text-danger">
						No installment data found for this policy.
					  </td>
					</tr>
				`;
			}

			$tbody.html(rowsHtml);
		}
	});
});

