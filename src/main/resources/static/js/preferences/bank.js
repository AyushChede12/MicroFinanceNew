function saveBank() {
	const formData = {
		bankName: $('input[name="bankName"]').val(),
		accountNo: $('input[name="accountNo"]').val(),
		contactNo: $('input[name="contactNo"]').val(),
		address: $('textarea[name="address"]').val(),
		openingDate: $('input[name="openingDate"]').val(),
		openingBalance: $('input[name="openingBalance"]').val()
	};

	$.ajax({
		type: "POST",
		url: "/saveAllBankModule", // Replace this with your actual endpoint
		contentType: "application/json",
		data: JSON.stringify(formData),
		success: function(response) {
			if (response === "success") {
				alert("Bank Saved Successfully");
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
		url: "/getAllBankModule",
		type: "GET",
		contentType: "application/json",
		success: function(data) {
			var tbody = $(".datatable tbody");
			tbody.empty(); // Clear existing rows

			$.each(data, function(index, item) {
				var row = `<tr style="font-family: 'Poppins', sans-serif;">
              <th scope="row"><a href="#">${index + 1}</a></th>
              <td>${item.bankName || ''}</td>
              <td>${item.accountNo || ''}</td>
              <td>${item.contactNo || ''}</td>
              <td>${item.address || ''}</td>
              <td>${item.openingDate || ''}</td>
              <td>${item.openingBalance || ''}</td>
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
