$(document).ready(function () {
		// Get today's date in YYYY-MM-DD format
		let today = new Date().toISOString().split('T')[0];
		// Set it to the input field
		$("#dateFrom").val(today);
		$("#dateTo").val(today);
	});
