$(document).ready(function() {
	$.ajax({
	url: "/api/joinliability/viewgrouploans",
	type: "GET",
	success: function(response) {
		console.log("API response:", response);
		var dropdown1 = $('#groupcode');
		dropdown1.empty();
		dropdown1.append('<option value="">Select</option>');

		if (response.status === "OK" && response.data) {
			$.each(response.data, function(index, customer) {
				dropdown1.append('<option value="' + customer.groupCode + '">' + customer.groupCode + '</option>');
			});
		} else {
			dropdown1.append('<option value="">No groups found</option>');
		}
	},
	error: function() {
		alert("Failed to fetch group list.");
	}
});

// 2. On dropdown change, fetch details of selected group
// 2. On dropdown change, fetch details of selected group
			$('#groupcode').on('change', function() {
				let selectedCode = $(this).val();

				if (selectedCode !== "") {
					$.ajax({
						url: '/api/joinliability/fetchByGroupCode?groupCode=' + selectedCode, // ✅ send as query param
						type: 'POST',
						success: function(response) {
							if (response.status === "FOUND") {
								let customer = response.data[0];
								$('#openingDate').val(customer.openingDate);
													$('#communityName').val(customer.communityName);
													$('#allocatedStaff').val(customer.allocatedStaff );
													$('#branchName').val(customer.branchName );
													$('#collectionDays').val(customer.collectionDays );
													$('#contactNumber').val(customer.contactNumber);
													$('#purposeOfLoan').val(customer.loanPurpose);
													$('#dateOfApproval').val(customer.approvalDate);
													
													$('#approvalStatus').val(customer.approvalStatus);
													
													

							} else {
								alert('No customer data found!');
								$('#openingDate').val('');
							}
						},
						error: function() {
							alert('Error while fetching customer data!');
						}
					});
				} else {
					$('#openingDate').val('');
				}
			});
	$("#approved").click(function () {
	       let groupCode = $("#groupcode").val();
	       let approvalStatus = "approved"; // ✅ Approved करतोय
	       

	       if (groupCode === "") {
	           alert("Please select a Group Code first!");
	           return;
	       }

	       $.ajax({
	           url: "/api/joinliability/updateApprovalStatusApplyGroupLoan",
	           type: "POST",
	           contentType: "application/json",
	           data: JSON.stringify({
	               groupCode: groupCode,
	               approvalStatus: approvalStatus,
	               
	           }),
	           success: function (response) {
	               alert(response.message);
	               $("#approvalStatus").val("approved"); // ✅ UI Update
	           },
	           error: function () {
	               alert("Failed to update approval status!");
	           }
	       });
	   });

});