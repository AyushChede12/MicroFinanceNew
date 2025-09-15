$(document).ready(function() {
	$.ajax({
		url: "api/Policymangment/getAllRDPolicies",
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

	$.ajax({
		url: "api/Policymangment/getAllRDFromFullMaturity",
		type: "GET",
		contentType: "application/json",
		success: function(response) {
			if (response.status === "OK") {
				var tbody = $("#policyTableBody");
				tbody.empty();
				$.each(response.data, function(index, item) {
					var row = `
		                    <tr style="font-family: 'Poppins', sans-serif;">
		                        <td>${index + 1}</td>
		                        <td>${item.policyCode || ''}</td>
		                        <td>${item.customerName || ''}</td>
		                        <td>${item.policyStartDate || ''}</td>
		                        <td>${item.contactNo || ''}</td>
		                        <td>${item.address || ''}</td>
		                        <td>${item.district || ''}</td>
		                        <td>${item.state || ''}</td>
		                        <td>${item.branchName || ''}</td>
		                        <td>${item.schemeType || ''}</td>
		                        <td>${item.policyAmount || ''}</td>
		                        <td>${item.maturityAmount || ''}</td>
		                        <td>${item.paymentBy || ''}</td>
		                        <td>${item.approved == true ? 'Approved' : 'Pending'}</td>
		                    </tr>`;
					tbody.append(row);
				});

				// ✅ Bind print button event
				$(".print-btn").off().on("click", function(e) {
					e.preventDefault();
					const policyData = $(this).data("policy");

					$("#certificateTemplate").show();
					printCertificate(policyData); // 🔹 यह आपकी पहले से बनी हुई function call है
				});

			} else {
				$("#policyTableBody").html(
					`<tr><td colspan="15" class="text-center">No data available</td></tr>`
				);
			}
		},
		error: function(xhr, status, error) {
			console.error("❌ Error fetching policies:", error);
			alert("Failed to load policy data.");
		}
	});
});