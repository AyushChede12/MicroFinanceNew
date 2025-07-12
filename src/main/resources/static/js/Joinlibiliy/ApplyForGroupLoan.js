$(document).ready(function() {
		$.ajax({
			url: "/api/joinliability/viewGroupDirectories",
			type: "GET",
			success: function(response) {
				console.log("API response:", response);

				var dropdown1 = $('#groupCode');       // shows: memberCode - customerName
				// var dropdown2 = $('#jointOperationCode');     // shows: memberCode only

				dropdown1.empty();
				// dropdown2.empty();

				dropdown1.append('<option value="">Select</option>');
				//  dropdown2.append('<option value="">Select</option>');

				if (response.status === "OK" && response.data) {
					$.each(response.data, function(index, customer) {
						dropdown1.append('<option value="' + customer.groupID + '">' + customer.groupID +  '</option>');
						//dropdown2.append('<option value="' + customer.memberCode + '">' + customer.memberCode + '</option>');
					});
				} else {
					dropdown1.append('<option value="">No customers found</option>');
					// dropdown2.append('<option value="">No customers found</option>');
				}
			},
			error: function() {
				alert("Failed to fetch customer list.");
			}
		});
	});




$('#groupCode').on('change', function() {
		let selectedCode = $(this).val();
		alert(selectedCode);
		if (selectedCode !== "") {
			$.ajax({
				url: '/api/joinliability/viewGroupDirectories?memberCode=' + selectedCode, // ✅ send as query param
				type: 'GET',
				success: function(response) {
					if (response.status === "FOUND") {
						let customer = response.data[0];
						$('#communityName').val(customer.communityName || '');
						                   $('#openingDate').val(customer.openingDate || '');
						                   $('#communityLeader').val(customer.communityLeader || '');
						                   $('#contactNumber').val(customer.contactNo || '');
						                   $('#allocatedStaff').val(customer.allocatedStaff || '');
						                   $('#collectionDays').val(customer.collectionDays || '');
					} else {
						alert('No customer data found!');
						$('#communityName').val('');
					}
				},
				error: function() {
					alert('Error while fetching customer data!');
				}
			});
		} else {
			$('#communityName').val('');
		}
	});