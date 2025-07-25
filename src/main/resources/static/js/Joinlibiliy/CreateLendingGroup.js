$(document).ready(function() {
	$('#updatelendingBtn').hide();
	$('#savelendingBtn').show();

	$('#updatelendingBtn').hide(); // Hide update initially

	$('#savelendingBtn').on('click', function(e) {
		e.preventDefault(); // Prevent default form submission

		const loanData = {
			planCode: $('#planCode').val(),
			loanSchemeInformation: $('#loanSchemeInformation').val(),
			minimumAge: $('#minimumAge').val(),
		
			term: $('#term').val(), 
			branchName: $('#branchName').val(),
			maximumAge: $('#maximumAge').val(),
			
			emiFrequency: $('#emiFrequency').val(),
			minLoanAmt: $('#minLoanAmt').val(),
			rateOfInterest: $('#rateOfInterest').val(),
			interestType: $('#interestType').val(),
			maximumLoanAmount: $('#maximumLoanAmount').val(),
			securityType: $('#securityType').val(),
			emiType: $('#emiType').val(),
			planActivationStatus: $('#planActivationStatus').is(':checked'),

			// Payment deductions
			processingFeePercent: $('#processingFeePercent').val(),
			legalChargesPercent: $('#legalChargesPercent').val(),
			gstPercent: $('#gstPercent').val(),
			insuranceFeePercent: $('#insuranceFeePercent').val(),
			valuationFeePercent: $('#valuationFeePercent').val(),

			// Late fee
			lateAllowanceDays: $('#lateAllowanceDays').val(),
			penaltyMode: $('#penaltyMode').val(),
			monthlyPenalty: $('#monthlyPenalty').val()
		};

		console.log("Sending loanData:", loanData);

		$.ajax({
			url: '/api/joinliability/createLendingGroupsave',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(loanData),
			success: function(response) {
				alert("Lending Group saved successfully");
				$('#LendingIdForm')[0].reset();
				fetchLoanPlans(); // reload data if needed
			},
			error: function(xhr, status, error) {
				console.error("Save failed:", xhr.responseText);
				alert("Failed to save data");
			}
		});
	});

	// Load loan data into table
	function fetchLoanPlans() {
		$.ajax({
			url: "/api/joinliability/viewlendinggroup",
			type: "GET",
			dataType: "json",
			success: function(response) {
				const data = response.data || [];
				const tableBody = $("#LendingBody").empty();

				if (data.length > 0) {
					$.each(data, function(index, item) {
						const row = `
              <tr>
                <td>${item.planCode || ''}</td>
                <td>${item.loanSchemeInformation || ''}</td>
                <td>${item.branchName || ''}</td>
                <td>${item.rateOfInterest || ''}</td>
                <td>${item.interestType || ''}</td>
                <td>${item.emiType || ''}</td>
                <td>${item.emiFrequency || ''}</td>
                <td>${item.planActivationStatus || ''}</td>
                <td>${item.processingFeePercent || ''}</td>
                <td>${item.legalChargesPercent || ''}</td>
                <td>${item.gstPercent || ''}</td>
                <td>${item.insuranceFeePercent || ''}</td>
                <td>${item.valuationFeePercent || ''}</td>
                <td>${item.lateAllowanceDays || ''}</td>
                <td>${item.penaltyMode || ''}</td>
                <td>${item.monthlyPenalty || ''}</td>
                <td class="d-flex" style="gap: .7rem;">
                  <button class="iconbutton edit-btn" data-id="${item.id}">
                    <i class="fa-solid fa-pen-to-square text-success"></i>
                  </button>
                  <button class="iconbutton delete-loan-btn" data-id="${item.id}">
                    <i class="fa-solid fa-trash text-danger"></i>
                  </button>
                </td>
              </tr>`;
						tableBody.append(row);
					});
				} else {
					tableBody.html(`<tr><td colspan="17" class="text-center text-warning">No loan plan data found.</td></tr>`);
				}
			},
			error: function() {
				$("#LendingBody").html(`<tr><td colspan="17" class="text-center text-danger">Failed to load loan data.</td></tr>`);
			}
		});
	}

	fetchLoanPlans();

	// Edit
	$(document).on('click', '.edit-btn', function() {
		const id = $(this).data('id');

		$.ajax({
			url: `/api/joinliability/editLendingGroup/${id}`,
			type: 'GET',
			dataType: 'json',
			success: function(res) {
				const item = res.data;
				if (item) {
					
					$('#id').val(item.id);
					$('#planCode').val(item.planCode);
					$('#loanSchemeInformation').val(item.loanSchemeInformation);
					$('#minimumAge').val(item.minimumAge);
					$('#maximumAge').val(item.maximumAge);
					$('#Term').val(item.Term);
					
					$('#branchName').val(item.branchName);
					$('#minLoanAmt').val(item.minLoanAmt);
					$('#maximumLoanAmount').val(item.maximumLoanAmount);
					$('#rateOfInterest').val(item.rateOfInterest);
					$('#emiFrequency').val(item.emiFrequency);
					$('#interestType').val(item.interestType);
					$('#securityType').val(item.securityType);
					$('#emiType').val(item.emiType);
					$('#planActivationStatus').val(item.planActivationStatus);
					$('#processingFeePercent').val(item.processingFeePercent);
					$('#legalChargesPercent').val(item.legalChargesPercent);
					$('#gstPercent').val(item.gstPercent);
					$('#insuranceFeePercent').val(item.insuranceFeePercent);
					$('#valuationFeePercent').val(item.valuationFeePercent);
					$('#lateAllowanceDays').val(item.lateAllowanceDays);
					$('#penaltyMode').val(item.penaltyMode);
					$('#monthlyPenalty').val(item.monthlyPenalty);

					$('#updatelendingBtn').show();
					$('#savelendingBtn').hide();
				} else {
					alert('No data found for editing.');
				}
			},
			error: function(xhr) {
				console.error('Edit fetch error:', xhr.responseText);
				alert('Failed to load plan for editing.');
			}
		});
	});

	// Update
	$('#updatelendingBtn').on('click', function() {
			const id = $('#id').val();// Ensure this is correctly set in your HTML

		console.log("Updating Lending Group ID:", id); // Debug

		if (!id) {
			alert("ID is missing. Cannot update.");
			return;
		}

		// Gather form values
		const loanPlan = {
			
			loanSchemeInformation: $('#loanSchemeInformation').val()?.trim(),
			minimumAge: $('#minimumAge').val(),
			maximumAge: $('#maximumAge').val(),
			Term: $('#Term').val(),
			
			branchName: $('#branchName').val()?.trim(),
			minLoanAmt: $('#minLoanAmt').val(),
			maximumLoanAmount: $('#maximumLoanAmount').val(),
			rateOfInterest: $('#rateOfInterest').val(),
			emiFrequency: $('#emiFrequency').val(),
			interestType: $('#interestType').val(),
			securityType: $('#securityType').val(),
			emiType: $('#emiType').val(),
			planActivationStatus: $('#planActivationStatus').val(),
			processingFeePercent: $('#processingFeePercent').val(),
			legalChargesPercent: $('#legalChargesPercent').val(),
			gstPercent: $('#gstPercent').val(),
			insuranceFeePercent: $('#insuranceFeePercent').val(),
			valuationFeePercent: $('#valuationFeePercent').val(),
			lateAllowanceDays: $('#lateAllowanceDays').val(),
			penaltyMode: $('#penaltyMode').val(),
			monthlyPenalty: $('#monthlyPenalty').val()
		};

		
		// AJAX call to update the lending group
		$.ajax({
			url: `/api/joinliability/updateLendingGroup/${id}`,
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(loanPlan),
			success: function(response) {
				alert("Lending Group Updated Successfully");
				$('#LendingIdForm')[0].reset();
				//$('#updatelendingBtn').hide();
				//$('#savelendingBtn').show();
				fetchLoanPlans(); // Refresh list
			},
			error: function(xhr, status, error) {
				console.error("Update error:", xhr.responseText || error);
				alert("Update failed. Please check the console for details.");
			}
		});
	});


	// Delete
	$(document).on("click", ".delete-loan-btn", function() {
		const id = $(this).data("id");

		if (confirm("Are you sure you want to delete this record?")) {
			$.ajax({
				url: `/api/joinliability/deleteLendingGroup/${id}`,
				type: "POST",
				success: function(response) {
					alert("Record deleted successfully!");
					fetchLoanPlans();
				},
				error: function(xhr) {
					console.error(xhr);
					alert("Delete failed.");
				}
			});
		}
	});

});
