function saveFinancialYear() {
	const formData = {
		financialYearName: $('input[name="financialYearName"]').val(),
		dateFrom: $('input[name="dateFrom"]').val(),
		dateTo: $('input[name="dateTo"]').val()
	};
	alert(formData.dateFrom);
	alert(formData.dateTo);

	$.ajax({
		type: "POST",
		url: "/saveFinancialYear", // Replace this with your actual endpoint
		contentType: "application/json",
		data: JSON.stringify(formData),
		success: function(response) {
			if (response == "success") {
				alert("Financial Year Saved Successfully");
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
		url: "/getAllCasteModule",
		type: "GET",
		contentType: "application/json",
		success: function(data) {
			var tbody = $(".datatable tbody");
			tbody.empty(); // Clear existing rows

			$.each(data, function(index, item) {
				var row = `<tr style="font-family: 'Poppins', sans-serif;">
              <th scope="row"><a href="#">${index + 1}</a></th>
              <td>${item.financialYearName || ''}</td>
              
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

$(document).ready(function() {
	$.ajax({
		url: "/getAllFinancialYear",
		type: "GET",
		contentType: "appslication/json",
		success: function(data) {
			var tbody = $(".datatable tbody");
			tbody.empty(); // Clear existing rows

			$.each(data, function(index, item) {
				var row = `<tr style="font-family: 'Poppins', sans-serif;">
              <th scope="row"><a href="#">${index + 1}</a></th>
              <td>${item.financialYearName || ''}</td>
              <td>${item.dateFrom || ''}</td>
			  <td>${item.dateTo || ''}</td>
			  <td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="fa-solid fa-pen-to-square text-primary"></i></button></td>
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

function viewData(id) {

	$.ajax({
		url: '/fetchExecutiveFounderById',
		type: 'POST',
		data: { id: id },
		success: function(response) {
			// Example: populate form fields with the fetched data
			$('#id').val(response.id);
			$('#type').val(response.type);
			$('#branchName').val(response.branchName);
			
			//Images
			
			
			// Add other fields accordingly
		},
		error: function(xhr) {
			alert("Failed to fetch data: " + xhr.responseText);
		}
	});
}

function updateFY(){
	alert("hii");
}