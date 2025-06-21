$(document).ready(function() {

	$("#saveBtn").click(function() {
		const formData = {
			relation: $('input[name="relation"]').val()
		};

		$.ajax({
			url: '/api/preference/saveRelativeModule',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(formData),
			success: function(response) {
				if (response.success) {
					alert(response.message); 
					location.reload();
				} else {
					alert("Error: " + (response.message || "Unknown error occurred."));
				}
			},
			error: function(xhr) {
				console.error('Error:', xhr.responseText);
				alert('Failed to save Relative data.');
			}
		});
	});

	$.ajax({
		type: "GET",
		url: "/api/preference/getAllRelativeModule", 
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
			                        <td>${item.relation}</td>
									<td><button class="iconbutton" onclick="deleteData(${item.id})" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
			                    </tr>`;
					tableBody.append(row);
				});
			} else {
				alert("Failed to fetch bank data: " + response.message);
			}
		},
		error: function() {
			alert("Error while calling the API.");
		}
	});
});

function deleteData(id) {
	if (confirm("Are you sure you want to delete this bank?")) {
		$.ajax({
			url: "/api/preference/deleteRelativeModuleById",
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
				alert("Failed to delete Relative.");
				console.error("Error:", error);
			}
		});
	}
}
