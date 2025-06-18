$(document).ready(function () {
		// Get today's date in YYYY-MM-DD format
		let today = new Date().toISOString().split('T')[0];
		// Set it to the input field
		$("#dateFrom").val(today);
		$("#dateTo").val(today);
	});
	

	$(document).ready(function() {
	    $.ajax({
	        url: "/getAllTeamMembers",
	        type: "GET",
	        success: function(response) {
	            var dropdown = $('#teamMemberName');
	            dropdown.empty();
	            dropdown.append('<option value="">Select</option>');

	            if (response.status === "OK" && response.data) {
	                $.each(response.data, function(index, name) {
	                    dropdown.append('<option value="' + name + '">' + name + '</option>');
	                });
	            } else {
	                dropdown.append('<option value="">No team members found</option>');
	            }
	        },
	        error: function() {
	            alert("Failed to fetch team members.");
	        }
	    });
	});

	
		$(document).ready(function () {
		    // Set today's date initially
		    const today = new Date().toISOString().split('T')[0];
		    $("#dateFrom").val(today);
		    $("#dateTo").val(today);

		    $("#incentiveMonth").on("change", function () {
		        const monthValue = $(this).val(); // e.g. "01", "02", ...
		        const year = new Date().getFullYear();

		        if (monthValue) {
		            // Month is zero-based in JS: Jan = 0, Feb = 1, ..., Dec = 11
		            const monthIndex = parseInt(monthValue) - 1;

		            const firstDay = new Date(year, monthIndex, 2);
		            const lastDay = new Date(year, monthIndex + 1, 1); // last day of selected month

		            const formatDate = (date) => date.toISOString().split("T")[0];

		            $("#dateFrom").val(formatDate(firstDay));
		            $("#dateTo").val(formatDate(lastDay));
		        } else {
		            // Reset if user selects 'Select'
		            $("#dateFrom").val(today);
		            $("#dateTo").val(today);
		        }
		    });
		});
