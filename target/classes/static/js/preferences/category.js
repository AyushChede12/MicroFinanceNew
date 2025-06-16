function saveCategory() {
	const formData = {
		category: $('input[name="category"]').val(),	
	};

	$.ajax({
		type: "POST",
		url: "/saveAllCategoryModule", // Replace this with your actual endpoint
		contentType: "application/json",
		data: JSON.stringify(formData),
		success: function(response) {
			if (response == "success") {
				alert("Category Saved Successfully");
				location.reload();
			}
		},
		error: function(xhr, status, error) {
			$('#responseMessage').text("Error: " + xhr.responseText);
		}
	});
}





$(document).ready(function() {
	$.ajax({
		url: "/getAllCategoryModule",
		type: "GET",
		contentType: "application/json",
		success: function(data) {
			var tbody = $(".datatable tbody");
			tbody.empty(); // Clear existing rows

			$.each(data, function(index, item) {
				var row = `<tr style="font-family: 'Poppins', sans-serif;">
              <th scope="row"><a href="#">${index + 1}</a></th>
              <td>${item.category || ''}</td>
              
            </tr>`;
				tbody.append(row);
			});
		},
		error: function(xhr, status, error) {
			console.error("Error fetching data:", error);
			alert("Failed to load branch module data.");
		}
	});
});