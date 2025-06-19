$(document).ready(function() {
	// Get today's date in YYYY-MM-DD format
	let today = new Date().toISOString().split('T')[0];
	// Set it to the input field
	$("#dateFrom").val(today);
	$("#dateTo").val(today);
});

$(document).ready(function() {
	// Fetch all team members and populate the dropdown
	$.ajax({
		url: "/api/incentive/getAllTeamMember",
		method: "GET",
		success: function(data) {
			console.log("Fetched Team Members:", data);
			$('#teamValue').empty().append('<option value="">Select</option>');

			data.forEach(function(member) {
				const combinedValue = member.teamMemberCode + ' - ' + member.teamMemberName;

				$('#teamValue').append(
					$('<option>', {
						value: combinedValue,
						text: combinedValue
					})
				);
			});
		},
		error: function(err) {
			console.error("Error fetching team members:", err);
		}
	});

	// Handle selection change and call function
	$('#teamValue').on('change', function() {
		const selectedValue = $(this).val();

		if (selectedValue) {
			const [teamMemberCode, teamMemberName] = selectedValue.split(' - ');
			handleTeamMemberSelection(teamMemberCode, teamMemberName);
		}
	});
});

// Your function to handle the values
function handleTeamMemberSelection(code, name) {
	var c = $("#teamCode").val(code);
	var n = $("#teamName").val(name);

	console.log("Team Member Code:", code);
	console.log("Team Member Name:", name);


}




$(document).ready(function() {
	const months = [
		"January", "February", "March", "April", "May", "June",
		"July", "August", "September", "October", "November", "December"
	];

	const monthDropdown = $('#incentiveMonth');
	monthDropdown.empty().append('<option value="">Select</option>');

	months.forEach((month, index) => {
		const monthValue = (index + 1).toString().padStart(2, '0'); // e.g., "01", "02"
		monthDropdown.append(`<option value="${monthValue}">${month}</option>`);
	});

	// Set Date From and Date To when month is selected
	monthDropdown.on('change', function() {
		const selectedMonth = parseInt($(this).val()); // "01" -> 1, "02" -> 2
		const currentYear = new Date().getFullYear();

		if (!isNaN(selectedMonth)) {
			// Create first day of selected month
			const startDate = new Date(currentYear, selectedMonth - 1, 2);
			// Create last day of selected month
			const endDate = new Date(currentYear, selectedMonth, 1);

			// Format as YYYY-MM-DD
			const formatDate = (date) => date.toISOString().split('T')[0];

			$('#dateFrom').val(formatDate(startDate));
			$('#dateTo').val(formatDate(endDate));
		} else {
			$('#dateFrom').val('');
			$('#dateTo').val('');
		}
	});
});



$(document).ready(function() {
	// Set today's date


	// Save button click
	$("#saveBtn").click(function(e) {
		e.preventDefault();
		var data = {
			teamCode: $("#teamCode").val(),
			teamName: $("#teamName").val(),
			teamMemberName: $("#teamMemberName").val(),
			incentiveMonth: $("#incentiveMonth").val(),
			dateFrom: $("#dateFrom").val(),
			dateTo: $("#dateTo").val(),
			// ✅ Add this
		};

		$.ajax({
			url: "/api/incentive/saveDataInGenerateIncentivePayments",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(data),
			success: function(response) {
				if (response.status === "OK") {
					alert("Generate successfully!");
					location.reload();
					$("#incentiveForm")[0].reset();
				} else {
					alert("Failed to save data.");
				}
			},
			error: function(xhr) {
				console.error("Error response:", xhr.responseText);
				alert("Error while saving data.");
			}
		});
	});
});
