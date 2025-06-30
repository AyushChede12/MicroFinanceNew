

$(document).ready(function() {
	// 1. Load dropdown data on page load
	alert("Welcome to  Generate Share Certificate");
	$.ajax({
		url: "/api/customershareholdingcontroller/getAllTransferShare",
		type: "GET",
		success: function(response) {
			var dropdown = $('#referralCodeEntry');
			dropdown.empty();
			dropdown.append('<option value="">Select</option>');

			if (response.status === "OK" && response.data) {
				$.each(response.data, function(index, customer) {
					dropdown.append('<option value="' + customer.findByCode + '">' + customer.findByCode + " - " + customer.customerName + '</option>'
					);
				});
			} else {
				dropdown.append('<option value="">No customers found</option>');
			}
		},
		error: function(error) {
			console.error("Dropdown Load Error:", error);
			alert("Error loading referral codes.");
		}
	});

	// 2. Fetch and display table data on dropdown change
	$('#referralCodeEntry').on('change', function() {
		var selectedCode = $(this).val();

		if (selectedCode === "") {
			alert("Please select a referral code.");
			return;
		}

		$.ajax({
			type: "POST",
			url: "/api/customershareholdingcontroller/fetchByCertificateNo",
			data: { findByCode: selectedCode },
			success: function(response) {
				if (response.status === "FOUND" && response.data) {
					var tableBody = "";
					$.each(response.data, function(index, share) {
						tableBody += `
                            <tr>
                                <td><input type="checkbox" value="${index + 1}" /></td>
                                <td>${index + 1}</td>
                                <td>${share.findByCode || ''}</td>
                                <td>${share.customerName || ''}</td>
                                <td>${share.balanceShares || ''}</td>
                                <td>${share.noOfShare || ''}</td>
                                <td>${share.certificateNo || ''}</td>
                            </tr>`;
					});
					$('.datatable tbody').html(tableBody);
				} else {
					$('.datatable tbody').html('');
					alert("No share data found for the selected referral code.");
				}
			},
			error: function(xhr) {
				console.error("Fetch Error:", xhr);
				alert("Error fetching share data.");
			}
		});
	});
});
