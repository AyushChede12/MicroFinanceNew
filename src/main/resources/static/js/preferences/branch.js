function saveBranch() {
	const formData = {
		branchCode: $('input[name="branchCode"]').val(),
		branchName: $('input[name="branchName"]').val(),
		openingDate: $('input[name="openingDate"]').val(),
		address: $('textarea[name="address"]').val(),
		pin: $('input[name="pin"]').val(),
		state: $('select[name="state"]').val(),
		primaryContact: $('input[name="primaryContact"]').val(),
		contact: $('input[name="contact"]').val()
	};

	$.ajax({
		type: "POST",
		url: "/saveAllBranchModule", // Make sure the context path is correct
		contentType: "application/json",
		data: JSON.stringify(formData),
		success: function(response) {
			if (response === "success") {
				alert("Branch Saved Successfully");
				location.reload();
			}

		},
		error: function(xhr, status, error) {
			$('#responseMessage').text("Error: " + xhr.responseText);
		}
	});

}

$(document).ready(function() {
	$("#tableBody").hide();
	$.ajax({
		url: "/getAllBranchModule",
		type: "GET",
		contentType: "application/json",
		success: function(data) {
			var tbody = $(".datatable tbody");
			tbody.empty(); // Clear existing rows

			$.each(data, function(index, item) {
				var row = `<tr style="font-family: 'Poppins', sans-serif;">
              <th scope="row"><a href="#">${index + 1}</a></th>
              <td>${item.branchCode || ''}</td>
              <td><a href="#" class="text-primary">${item.branchName || ''}</a></td>
              <td>${item.openingDate || ''}</td>
              <td>${item.address || ''}</td>
              <td>${item.pinCode || ''}</td>
              <td>${item.state || ''}</td>
              <td>${item.primaryContact || ''}</td>
              <td>${item.contact || ''}</td>
              <td><button class="iconbutton" title="Edit"><i class="fa-solid fa-pen-to-square text-success"></i></button></td>
			  <td><button class="iconbutton" title="View"><i class="fa-solid fa-eye text-primary"></i></button></td>
			  <td><button class="iconbutton" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
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

function showTableData() {
	$("#tableBody").show();
}

function hideTableData() {
	$("#tableBody").hide();
}