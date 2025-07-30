$(document).ready(function(){
	$.ajax({
			url: "api/Policymangment/getaddinvestmentdetails",
			type: "GET",
			success: function(response) {
				if (response.status === "OK") {
					$("#policyCode").empty().append("<option value=''>-- Select Policy Code --</option>");
					response.data.forEach(function(item) {
						$("#policyCode").append(`<option value='${item.policyCode}'>${item.customerName}-${item.policyCode}</option>`);
					});
				} else {
					alert("No Policy codes found.");
				}
			},
			error: function() {
				alert("Failed to load Policy codes.");
			}
		});
});