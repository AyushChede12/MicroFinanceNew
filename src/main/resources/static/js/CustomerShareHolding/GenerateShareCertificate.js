$('html, body').animate({
    scrollTop: $("#certificateSection").offset().top
}, 500);

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
                            <tr data-model='${JSON.stringify(share)}'>
                                <td><input type="checkbox" value="${index}" /></td>
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
	
	
//print button 	
$('#printCertificateBtn').on('click', function () {
    var selectedCheckbox = $('.datatable tbody input[type="checkbox"]:checked');

    if (selectedCheckbox.length === 0) {
        alert("Please select a row to print the certificate.");
        $('#certificateSection').hide();
        return;
    }

    // Get the selected row
    var selectedRow = selectedCheckbox.closest('tr').data('model'); // <-- get model object from row data

    // Fill certificate fields using model object
    $('#customeridandName').text(`${selectedRow.findByCode} - ${selectedRow.customerName}`);
    $('#certificateno').text(selectedRow.certificateNo);
    $('#numberofshare').text(selectedRow.noOfShare);
    $('#amounttransferred').text(selectedRow.amountTransferred);
    $('#branchname').text(selectedRow.branch);
    $('#startdate').text(selectedRow.startDate);
    $('#balanceshare').text(selectedRow.balanceShares);
    $('#shareissuedby').text(selectedRow.shareIssuedBy);
    $('#dataoftransfer').text(selectedRow.dateOfTransfer);
    $('#modeofpayement').text(selectedRow.modeOfPayment);

    $('#certificateSection').show();
});

	/*$('#printCertificateBtn').on('click', function () {
	    var selectedCheckbox = $('.datatable tbody input[type="checkbox"]:checked');

	    if (selectedCheckbox.length === 0) {
	        alert("Please select a row to print the certificate.");
	        $('#certificateSection').hide(); // hide certificate if no selection
	        return;
	    }

	    // Get the selected row
	    var selectedRow = selectedCheckbox.closest('tr');
	    var columns = selectedRow.find('td');

	    // Fill certificate fields
	    $('#customeridandName').text(columns.eq(2).text() + " - " + columns.eq(3).text());
	    $('#certificateno').text(columns.eq(6).text());
	    $('#numberofshare').text(columns.eq(5).text());
	    $('#amounttransferred').text("Rs. " + (columns.eq(5).text() * 10)); // You can replace this logic
	    $('#branchname').text("Main Branch"); // replace with dynamic if needed
	    $('#startdate').text(new Date().toLocaleDateString()); // or dynamic
	    $('#balanceshare').text(columns.eq(4).text());
	    $('#shareissuedby').text("Admin"); // or dynamic
	    $('#dataoftransfer').text(new Date().toLocaleDateString()); // or dynamic
	    $('#modeofpayement').text("NEFT"); // or dynamic

	    // Show the certificate section
	    $('#certificateSection').show();
	});
*/