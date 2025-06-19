$(document).ready(function() {

	$('#saveBtn').click(function(event) {
		alert("Save Button Clicked!");
		event.preventDefault(); // Prevent default form submission

		const branchData = {
			// If updating an existing branch, add: id: $('#id').val()
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
		type: "POST",
		url: "/api/preference/getAllBranchModule", // matches @PostMapping
		contentType: "application/json",
		success: function(response) {
			console.log("Full Response from API:", response); // Debug line
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
		type: "POST",
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
			url: "/api/preference/deleteBranchModuleById", // Matches your controller mapping
			type: "POST",
			data: { id: id }, // Sent as form-data (used with @RequestParam)
			success: function(response) {
				if (response.success) {
					alert(response.message); // e.g., "Branch module deleted successfully"
					location.reload();       // Refresh page or table
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
		url: "/api/preference/saveAndUpdateAllBranchModule", // This should match your controller mapping
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify(payload),
		success: function(response) {
			if (response.success) {
				alert(response.message); // e.g., "Branch updated successfully"
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
	// Fetch all branches and populate the dropdown
	$.ajax({
		url: "getAllBranchModule",
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


