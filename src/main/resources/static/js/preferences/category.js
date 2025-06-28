$(document).ready(function() {
	$("#saveBtn").click(function() {

		$('#chkcategory').text('');

		var category = $('#category').val().trim();

		let isValid = true;

		if (category === '') {
			$('#chkcategory').text('* This field is required');
			$('#category').focus();
			isValid = false;
		}

		if (!isValid) {
			return false; // Stop AJAX call
		}

		const formData = {
			category: $('input[name="category"]').val()
		};

		$.ajax({
			url: '/api/preference/saveCategoryModule',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(formData),
			success: function(response) {
				if (response.status=='CREATED') {
					alert(response.message);
					location.reload();
				} else {
					alert("Error: " + (response.message || "Unknown error occurred."));
				}
			},
			error: function(xhr) {
				console.error('Error:', xhr.responseText);
				alert('Failed to save Category data.');
			}
		});
	});

	$.ajax({
		type: "GET",
		url: "/api/preference/getAllCategoryModule",
		contentType: "application/json",
		success: function(response) {
			console.log("Full Response from API:", response);
			if (response.status=="FOUND") {
				let data = response.data;
				let tableBody = $(".datatable tbody");
				tableBody.empty();
				data.forEach((item, index) => {
					let row = `<tr>
					                        <td>${index + 1}</td>
					                        <td>${item.category}</td>
											<td><button class="iconbutton" onclick="deleteData(${item.id})" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
					                    </tr>`;
					tableBody.append(row);
				});
			} else {
				alert("Failed to fetch Category data: " + response.message);
			}
		},
		error: function() {
			alert("Error while calling the API.");
		}
	});
});

function deleteData(id) {
	if (confirm("Are you sure you want to delete this Category?")) {
		$.ajax({
			url: "/api/preference/deleteCategoryModuleById",
			type: "POST",
			data: { id: id },
			success: function(response) {
				if (response.status="OK") {
					alert("Category Deleted Successfully");
					location.reload();
				} else {
					alert("Delete failed: " + response.message);
				}
			},
			error: function(xhr, status, error) {
				alert("Failed to delete Caste.");
				console.error("Error:", error);
			}
		});
	}
}

