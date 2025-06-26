$(document).ready(function() {

	$('#saveBtn').click(function(event) {
		event.preventDefault();

		// Clear all previous messages
		$('#chkbranchcode').text('');
		$('#chkbranchName').text('');
		$('#chkopeningdate').text('');
		$('#chkaddress').text('');
		$('#chkpin').text('');
		$('#chkstate').text('');
		$('#chkprimarycontact').text('');
		$('#chkcontact').text('');

		// Fetch input values
		var branchCode = $('#branchCode').val().trim();
		var branchName = $('#branchName').val().trim();
		var openingDate = $('#openingDate').val().trim();
		var address = $('#address').val().trim();
		var pin = $('#pin').val().trim();
		var state = $('#state').val().trim();
		var primaryContact = $('#primaryContact').val().trim();
		var contact = $('#contact').val().trim();

		var contactPattern = /^[6-9][0-9]{9}$/;

		let isValid = true;

		// Validation: Financial Year Name
		if (branchCode === '') {
			$('#chkbranchcode').text('* This field is required');
			$('#branchCode').focus();
			isValid = false;
		}

		if (branchName === '') {
			$('#chkbranchName').text('* This field is required');
			$('#branchName').focus();
			isValid = false;
		}

		if (openingDate === '') {
			$('#chkopeningdate').text('* This field is required');
			$('#openingDate').focus();
			isValid = false;
		}

		if (address === '') {
			$('#chkaddress').text('* This field is required');
			$('#address').focus();
			isValid = false;
		}

		if (pin === '') {
			$('#chkpin').text('* This field is required');
			$('#pin').focus();
			isValid = false;
		}

		if (state === '') {
			$('#chkstate').text('* This field is required');
			$('#state').focus();
			isValid = false;
		}

		if (primaryContact === '') {
			$('#chkprimarycontact').text('* This field is required');
			$('#primaryContact').focus();
			isValid = false;
		}
		else if (!contactPattern.test(primaryContact)) {
			alert("Please enter a valid 10-digit mobile number.");
			primaryContact.focus();
			isValid = false;
		}

		if (contact === '') {
			$('#chkcontact').text('* This field is required');
			$('#contact').focus();
			isValid = false;
		}
		else if (!contactPattern.test(contact)) {
			alert("Please enter a valid 10-digit mobile number.");
			contact.focus();
			isValid = false;
		}

		if (!isValid) {
			return false; // Stop AJAX call
		}

		const branchData = {
			branchCode: $('#branchCode').val(),
			branchName: $('#branchName').val(),
			openingDate: $('#openingDate').val(),
			address: $('#address').val(),
			pin: $('#pin').val(),
			state: $('#state').val(),
			primaryContact: $('#primaryContact').val(),
			contact: $('#contact').val()
		};

		$.ajax({
			url: '/api/preference/saveAndUpdateAllBranchModule',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(branchData),
			success: function(response) {
				alert("Branch Saved Successfully");
				location.reload();
			},
			error: function(xhr) {
				console.error('Error:', xhr.responseText);
				alert('Failed to save branch data.');
			}
		});
	});


	$("#tableBody").hide();
	$("#updateBtn").hide();

	$.ajax({
		type: "GET",
		url: "/api/preference/getAllBranchModule",
		contentType: "application/json",
		success: function(response) {
			console.log("Full Response from API:", response);
			if (response.success) {
				let data = response.data;
				let tableBody = $(".datatable tbody");
				tableBody.empty();
				data.forEach((item, index) => {
					let row = `<tr>
	                        <td>${index + 1}</td>
	                        <td>${item.branchCode}</td>
	                        <td>${item.branchName}</td>
	                        <td>${item.openingDate}</td>
	                        <td>${item.address}</td>
	                        <td>${item.pin}</td>
	                        <td>${item.state}</td>
	                        <td>${item.primaryContact}</td>
	                        <td>${item.contact}</td>
							<td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="fa-solid fa-pen-to-square text-primary"></i></button></td>
							<td><button class="iconbutton" onclick="deleteData(${item.id})" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
	                    </tr>`;
					tableBody.append(row);
				});
			} else {
				alert("Failed to fetch branch data: " + response.message);
			}
		},
		error: function() {
			alert("Error while calling the API.");
		}
	});
});

function showTableData() {
	$("#tableBody").show();
}

function hideTableData() {
	$("#tableBody").hide();
}

function viewData(id) {
	$("#updateBtn").show();
	$("#saveBtn").hide();
	$("#hideBtn").hide();
	$("#showBtn").hide();
	$.ajax({
		url: "/api/preference/getBranchModuleById",
		type: "GET",
		data: { id: id },
		success: function(response) {
			if (response.success) {
				const branch = response.data;
				$("#id").val(branch.id);
				$("#branchCode").val(branch.branchCode);
				$("#branchName").val(branch.branchName);
				$("#openingDate").val(branch.openingDate);
				$("#address").val(branch.address);
				$("#pin").val(branch.pin);
				$("#state").val(branch.state);
				$("#primaryContact").val(branch.primaryContact);
				$("#contact").val(branch.contact);
			} else {
				alert("Branch not found: " + response.message);
			}
		},
		error: function(xhr) {
			alert("Request failed: " + xhr.responseText);
		}
	});


}

function deleteData(id) {
	if (confirm("Are you sure you want to delete this branch?")) {
		$.ajax({
			url: "/api/preference/deleteBranchModuleById",
			type: "POST",
			data: { id: id },
			success: function(response) {
				if (response.success) {
					alert(response.message);
					location.reload();
				} else {
					alert("Delete failed: " + response.message);
				}
			},
			error: function(xhr, status, error) {
				alert("Failed to delete branch.");
				console.error("Error:", error);
			}
		});
	}

}



function updateBranch() {
	let payload = {
		id: $("#id").val(),
		branchCode: $("#branchCode").val(),
		branchName: $("#branchName").val(),
		openingDate: $("#openingDate").val(),
		address: $("#address").val(),
		pin: $("#pin").val(),
		state: $("#state").val(),
		primaryContact: $("#primaryContact").val(),
		contact: $("#contact").val()
	};

	$.ajax({
		url: "/api/preference/saveAndUpdateAllBranchModule",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify(payload),
		success: function(response) {
			if (response.success) {
				alert(response.message);
				location.reload();
			} else {
				alert("Operation failed: " + response.message);
			}
		},
		error: function(xhr) {
			alert("Update failed: " + xhr.responseText);
		}
	});
}


$(document).ready(function() {

	$.ajax({
		url: "/api/preference/getAllBranchModule",
		method: "GET",
		success: function(data) {
			console.log("Fetched Branches:", data);
			data.forEach(function(branch) {
				$('#branchName').append(
					$('<option>', {
						value: branch.branchName,
						text: branch.branchName
					})
				);
			});
		},
		error: function(err) {
			console.error("Error fetching branches:", err);
		}
	});
});


