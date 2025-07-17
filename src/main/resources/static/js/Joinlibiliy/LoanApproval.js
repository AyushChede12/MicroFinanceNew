$.ajax({
	url: "/api/joinliability/viewGroupDirectories",
	type: "GET",
	success: function(response) {
		console.log("API response:", response);
		var dropdown1 = $('#groupcode');
		dropdown1.empty();
		dropdown1.append('<option value="">Select</option>');

		if (response.status === "OK" && response.data) {
			$.each(response.data, function(index, customer) {
				dropdown1.append('<option value="' + customer.groupID + '">' + customer.groupID + '</option>');
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
$('#groupcode').on('change', function() {
	let selectedCode = $(this).val();

	if (selectedCode !== "") {
		$.ajax({
			url: '/api/joinliability/fetchByGroupID?groupID=' + selectedCode, // ✅ send as query param
			type: 'POST',
			success: function(response) {
				if (response.status === "FOUND") {
					let customer = response.data[0];
					$('#communityName').val(customer.communityName);
					$('#openingDate').val(customer.openingDate);
					$('#selectedMember').val(customer.selectedMember);
					$('#customerName').val(customer.customerName);
					$('#communityLeader').val(customer.communityLeader );
					$('#contactNumber').val(customer.contactNo );
					$('#branchName').val(customer.branchName );
					$('#allocatedStaff').val(customer.allocatedStaff);
					$('#collectionDays').val(customer.collectionDay);

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
	$('#saveBtn').on('click', function (e) {
			        e.preventDefault();

			        const groupLoanData = {
			            groupcode: $('#groupcode').val(),
			            openingDate: $('#openingDate').val(),
						selectedMember: $('#selectedMember').val(),
						communityName: $('#communityName').val(),
			            allocatedStaff: $('#allocatedStaff').val(),
			            branchName: $('#branchName').val(),
			            collectionDays: $('#collectionDays').val(),
			            paymentMode: $('#paymentMode').val(),
			            contactNumber: $('#contactNumber').val(),
			            purposeOfLoan: $('#purposeOfLoan').val(),
			            dateOfApproval: $('#dateOfApproval').val(),
			            approvalStatus: $('#approvalStatus').val()
			           
			        };

			        console.log("Sending group loan data:", groupLoanData);

			        $.ajax({
			            url: '/api/joinliability/saveloanapproval',
			            type: 'POST',
			            contentType: 'application/json',
			            data: JSON.stringify(groupLoanData),
			            success: function (response) {
			                console.log("✅ Saved successfully:", response);
			                alert(response.message || "Group Loan saved successfully!");
			                // Optional: Clear form or reload
			                $('#formid')[0].reset();
			            },
			            error: function (xhr, status, error) {
			                console.error("❌ Save error:", xhr.responseText);
			                alert("Failed to save group loan data. Check inputs or server logs.");
			            }
			        });
			    });
});
/**
 * 
 */