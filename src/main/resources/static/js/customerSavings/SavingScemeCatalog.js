// Svaing the save scheme catalog (Customer Savings)
$(document).ready(function() {
	$("#saveBtn").on("click", function(e) {
		alert("hii")
		e.preventDefault();

		var formData = {
			policyName: $("#policyName").val(),
			yearlyROI: $("#yearlyROI").val(),
			customerName: $("#customerName").val(),
			initialDeposite: $("#initialDeposite").val(),
			monthlyMinimumBalance: $("#monthlyMinimumBalance").val(),
			reservedFunds: $("#reservedFunds").val(),
			messagingFees: $("#messagingFees").val(),
			messagingInterval: $("#messagingInterval").val(),
			monthlyFreeIFSCTransactions: $("#monthlyFreeIFSCTransactions").val(),
			freeMoneyTransfers: $("#freeMoneyTransfers").val(),
			limitperTransaction: $("#limitperTransaction").val(),
			dailyLimit: $("#dailyLimit").val(),
			weeklyLimit: $("#weeklyLimit").val(),
			monthlyLimit: $("#monthlyLimit").val(),
			serviceFee: $("#serviceFee").val(),
			billingCycle: $("#billingCycle").val(),
			cardFee: $("#cardFee").val(),
			monthlyCardLimit: $("#monthlyCardLimit").val(),
			yearlyCardLimit: $("#yearlyCardLimit").val()
		};

alert(formData)
		console.log(formData);
		$.ajax({
			type: "POST",
			url: "/api/customersavings/savescheme",  // Spring Boot endpoint
			contentType: "application/json",
			data: JSON.stringify(formData),
			success: function(response) {
				alert("Data saved successfully!");
			},
			error: function() {
				alert("Error saving data.");
			}
		});
	});
});
