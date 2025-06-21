$(document).ready(function () {
		// Get today's date in YYYY-MM-DD format
		let today = new Date().toISOString().split('T')[0];
		// Set it to the input field
		$("#dateFrom").val(today);
		$("#dateTo").val(today);
	});
	



	    $(document).ready(function () {
	        $.ajax({
	            url: "/getAllTeamMembers", // new endpoint
	            type: "GET",
	            success: function (data) {
	                var dropdown = $('#teamMemberName');
	                dropdown.empty();
	                dropdown.append('<option value="">Select</option>');
	                $.each(data, function (index, name) {
	                    dropdown.append('<option value="' + name + '">' + name + '</option>');
	                });
	            },
	            error: function () {
	                alert("Failed to fetch team members.");
	            }
	        });
	    });
	