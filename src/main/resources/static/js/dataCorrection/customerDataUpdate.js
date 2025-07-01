$(document).ready(function(){
	$.ajax({
			url: "/api/financialconsultant/getAllCustomerCodes",
			type: "POST",
			success: function (response) {
				if (response.status === "FOUND") {
					$("#memberCode").empty().append("<option value=''>-- Select Code --</option>");
					response.data.forEach(function (item) {
						$("#memberCode").append(`<option value='${item.memberCode}'>${item.memberCode}</option>`);
					});
				} else {
					alert("No customer codes found.");
				}
			},
			error: function () {
				alert("Failed to load customer codes.");
			}
		});
});