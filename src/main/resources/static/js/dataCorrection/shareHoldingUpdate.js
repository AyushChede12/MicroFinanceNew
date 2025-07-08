$(document).ready(function() {
	$.ajax({
			url: "/api/financialconsultant/getAllCustomerCodes",
			type: "POST",
			success: function(response) {
				if (response.status === "FOUND") {
					$("#customerCode").empty().append("<option value=''>-- Select Code --</option>");
					response.data.forEach(function(item) {
						$("#customerCode").append(`<option value='${item.memberCode}'>${item.memberCode}-${item.customerName}</option>`);
					});
				} else {
					alert("No customer codes found.");
				}
			},
			error: function() {
				alert("Failed to load customer codes.");
			}
		});
	
	$.ajax({
			url: "api/preference/getAllBranchModule", // Add base path if needed like /api/preference/getAllBranchModule
			type: "GET",
			success: function(response) {
				if (response.status == "FOUND") {
					const branchList = response.data;
					$("#branchName").empty(); // Clear existing options
					$("#branchName").append("<option value=''>-- Select Branch --</option>");

					for (let i = 0; i < branchList.length; i++) {
						let branch = branchList[i];
						let option = `<option value="${branch.branchName}">${branch.branchName}</option>`;
						$("#branchName").append(option);

					}
				} else {
					alert("Error: " + response.message);
				}
			},
			error: function(xhr) {
				console.error("Error loading branches:", xhr.responseText);
				alert("Failed to load dropdown data.");
			}
		});

	$("#customerCode").change(function() {
		let customerCode = $("#customerCode").val();
		$.ajax({
			type: "POST",
			url: "api/customershareholdingcontroller/fetchByFindByCode",
			data: { findByCode: customerCode },
			success: function(response) {
				if (response.status == "FOUND") {
					let data = response.data[0];
					$("#customerName").val(data.customerName);
					$("#startDate").val(data.startDate);
					$("#previousAccountBalance").val(data.previousAccountBalance);
					$("#previousShareCount").val(data.previousShareCount);
					$("#baseValue").val(data.baseValue);
					$("#branchName").val(data.branch);
					$("#dateOfTransfer").val(data.dateOfTransfer);
					$("#shareIssuedBy").val(data.shareIssuedBy);
					$("#noOfShare").val(data.noOfShare);
					$("#amountTransferred").val(data.amountTransferred);
					$("#balanceShares").val(data.balanceShares);
					$("#modeOfPayment").val(data.modeOfPayment);
					$("#comments").val(data.comments);

				} else {
					alert("Transfer Share Details Not Found For Customer");
				}
			},
			error: function() {
				alert("Shares not found or server error");
			}
		});

	});
});