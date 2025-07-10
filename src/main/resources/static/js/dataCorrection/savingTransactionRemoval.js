$(document).ready(function() {
	$.ajax({
		url: "/api/customersavings/getAllSavingAccountData",
		type: "GET",
		success: function(response) {
			if (response.status === "FOUND") {
				$("#accountNumber").empty().append("<option value=''>-- Select Account No --</option>");
				response.data.forEach(function(item) {
					$("#accountNumber").append(`<option value='${item.accountNumber}'>${item.enterCustomerName}-${item.accountNumber}</option>`);
				});
			} else {
				alert("No Account Number found.");
			}
		},
		error: function() {
			alert("Failed to load Account Numbers.");
		}
	});
	
	$.ajax({
			url: "/api/preference/getAllBranchModule", // Add base path if needed like /api/preference/getAllBranchModule
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
});