$(document).ready(function () {
	//alert("oshin");
	$.ajax({
		url: "api/joinliability/viewgrouploans",
		type: "GET",
		success: function (response) {
			console.log("API response:", response);
			var dropdown1 = $('#groupid');
			dropdown1.empty();
			dropdown1.append('<option value="">Select GroupID</option>');

			let approvedCount = 0;

			if (response.status === "OK" && response.data) {
				$.each(response.data, function (index, customer) {
				
					let status = (customer.approvalStatus || "").trim().toLowerCase();
					
					if (status === "approved") {
						dropdown1.append('<option value="' + customer.groupCode + '">' + customer.groupCode + '</option>');
						approvedCount++;
					}
				});

				if (approvedCount === 0) {
					dropdown1.append('<option disabled>No approved groups available</option>');
				}
			} else {
				dropdown1.append('<option disabled>No groups found</option>');
			}
		},
		error: function () {
			alert("Failed to fetch group list.");
		}
	});
	
	$('#groupid').on('change', function() {
		let selectedCode = $(this).val();

		if (selectedCode !== "") {
			$.ajax({
				url: '/api/joinliability/fetchBygroupCode?groupCode=' + selectedCode, // ✅ fixed here
				type: 'POST',
				success: function(response) {
					if (response.status === "FOUND") {
						let customer = response.data[0];
						$('#openingdate').val(customer.openingDate);
						$('#communityname').val(customer.communityName);
						$('#branchname').val(customer.branchName);
						//$('#loanschemename').val(customer.loanSchemeName);
						//$('#communityaddress').val(customer.communityLeader);
						$('#contactno').val(customer.contactNumber);
						//$('#paymentmode').val(customer.branchName);
						$('#loanpurpose').val(customer.loanPurpose);
						//$('#term').val(customer.collectionDay);
						$('#rateofinterest').val(customer.rateOfInterest);
						//$('#interest').val(customer.loanPurpose);
						$('#loanamount').val(customer.totalAmount);
						//$('#emiamount').val(customer.loanPurpose);
						$('#Processingfee').val(customer.processingFee);
						$('#gstvalue').val(customer.gstPercentage);
						$('#legalfee').val(customer.legalCharges);
						$('#insurencefee').val(customer.insuranceFee);
						$('#Valuationfee').val(customer.valuationFee);
						//$('#loanpurpose12').val(customer.loanPurpose);
						
					} else {
						alert('No customer data found!');
						$('#communityname').val('');
					}
				},
				error: function() {
					alert('Error while fetching customer data!');
				}
			});
		} else {
			$('#communityname').val('');
		}
	});

});
