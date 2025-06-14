// Svaing the save scheme catalog (Customer Savings)
function saveLoanPlan() {
	const formData = {
		PolicyName: $("#PolicyName").val(),
		YearlyROI: $("#YearlyROI").val(),
		CustomerName: $("#CustomerName").val(),
		InitialDeposite: $("#InitialDeposite").val(),
		MonthlyMinimumBalance: $("#MonthlyMinimumBalance").val(),
		ReservedFunds: $("#ReservedFunds").val(),
		MessagingFees: $("#MessagingFees").val(),
		MessagingInterval: $("#MessagingInterval").val(),
		MonthlyFreeIFSCTransactions: $("#MonthlyFreeIFSCTransactions").val(),
		FreeMoneyTransfers: $("#FreeMoneyTransfers").val(),
		LimitperTransaction: $("#LimitperTransaction").val(),
		DailyLimit: $("#DailyLimit").val(),
		WeeklyLimit: $("#WeeklyLimit").val(),
		MonthlyLimit: $("#MonthlyLimit").val(),
		//MonthlyLimit: $("#toggle-member-status").is(":checked") ? 1 : 0, // ✅ Updated here
		ServiceFee: $("#ServiceFee").val(),
		BillingCycle: $("#BillingCycle").val(),
		CardFee: $("#CardFee").val(),
		MonthlyCardLimit: $("#MonthlyCardLimit").val(),
		YearlyCardLimit: $("#YearlyCardLimit").val(),
	};

	console.log("Form Data: ", formData);

	$.ajax({
		type: "POST",
		url: "/savescheme",
		contentType: "application/json",
		dataType: "text",
		data: JSON.stringify(formData),
		success: function(response) {
			alert(response);
		},
		error: function(xhr, status, error) {
			alert(" Failed to save scheme catalog " + xhr.responseText);
		}
	});
}