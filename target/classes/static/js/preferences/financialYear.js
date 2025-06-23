$(document).ready(function() {

	$('#addBtn').click(function(event) {
		event.preventDefault();

		const branchData = {
			financialYearName: $('#financialYearName').val(),
			dateFrom: $('#dateFrom').val(),
			dateTo: $('#dateTo').val(),

		};

		$.ajax({
			url: '/api/preference/saveFinancialYear',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(branchData),
			success: function(response) {
				alert("Financial Year Saved Successfully");
				location.reload();
			},
			error: function(xhr) {
				console.error('Error:', xhr.responseText);
				alert('Failed to save financial data.');
			}
		});
	});

	$.ajax({
		type: "GET",
		url: "/api/preference/getAllFinancialYear",
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
		                        <td>${item.financialYearName}</td>
		                        <td>${item.dateFrom}</td>
		                        <td>${item.dateTo}</td>
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

function viewData(id) {

	$.ajax({
		url: "/api/preference/getFinancialYearById",
		type: "GET",
		data: { id: id },
		success: function(response) {
			if (response.success) {
				const branch = response.data;
				$("#id").val(branch.id);
				$("#financialYearName").val(branch.financialYearName);
				$("#dateFrom").val(branch.dateFrom);
				$("#dateTo").val(branch.dateTo);
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
			url: "/api/preference/deleteFinancialYearById", 
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
				alert("Failed to delete financial Year.");
				console.error("Error:", error);
			}
		});
	}

}

function updateFY() {
	let payload = {
		id: $("#id").val(),
		financialYearName: $("#financialYearName").val(),
		dateFrom: $("#dateFrom").val(),
		dateTo: $("#dateTo").val(),	
	};

	$.ajax({
		url: "/api/preference/saveAndUpdateAllFinancialYear",
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