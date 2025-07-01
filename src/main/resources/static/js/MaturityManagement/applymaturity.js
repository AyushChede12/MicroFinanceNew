  $(document).ready(function () {
	
	$.ajax({
	    url: "/api/Maturitymanagement/getaddinvestmentdetails",
	    type: "GET",
	    success: function (response) {
	        console.log("Response received:", response); // ✅ Debug log
	        var dropdown = $('#policyId');
	        dropdown.empty();
	        dropdown.append('<option value="">Select Policy No</option>');

	        if (response.success && response.data) {
	            $.each(response.data, function (index, plan) {
	                dropdown.append('<option value="' + plan.id + '">' + plan.id + '</option>');
	            });
	        } else {
	            dropdown.append('<option value="">No policy No found</option>');
	        }
	    },
	    error: function (xhr) {
	        console.error("AJAX error:", xhr.responseText); // ✅ Error log
	        alert("No policy code found.");
	    }
	});

				
  });

