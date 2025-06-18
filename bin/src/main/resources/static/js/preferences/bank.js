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
<<<<<<< HEAD
	$("#updateBtn").hide();
=======
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
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
<<<<<<< HEAD
			  <td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="fa-solid fa-pen-to-square text-primary"></i></button></td>
=======
              <td><button class="iconbutton" onclick="editData(${item.id})" title="Edit"><i class="fa-solid fa-pen-to-square text-success"></i></button></td>
			  <td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="fa-solid fa-eye text-primary"></i></button></td>
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
			  <td><button class="iconbutton" onclick="deleteData(${item.id})" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
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

function viewData(id) {
<<<<<<< HEAD
	$("#updateBtn").show();
	$("#saveBtn").hide();
	$("#hideBtn").hide();
	$("#showBtn").hide();
=======
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
	$.ajax({
		url: "/getBankModuleById",
		type: "GET",
		data: { id: id },
		success: function(data) {
			$("#id").val(data.id);
			$("#bankName").val(data.bankName);
			$("#accountNo").val(data.accountNo);
			$("#contactNo").val(data.contactNo);
			$("#address").val(data.address);
			$("#openingDate").val(data.openingDate);
			$("#openingBalance").val(data.openingBalance);
		},
		error: function(xhr) {
			alert("Error: " + xhr.responseText);
		}
	});

}

<<<<<<< HEAD
function deleteData(id) {
	if (confirm("Are you sure you want to delete this bank?")) {
		$.ajax({
			url: "/deleteBankModuleById", // or "/deleteAllBranchModule" if you're sending full object
			type: "POST",
			data: { id: id }, // if using @RequestParam long id
			success: function(response) {
				alert("Bank deleted successfully.");
				// Refresh the table or page here
				location.reload(); // example method to reload your data
			},
			error: function(xhr, status, error) {
				alert("Failed to delete bank.");
				console.error(error);
			}
		});
	}
}

function updateBank() {
	let payload = {
		id: $("#id").val(),
=======
function editData(id) {
	let payload = {
		id: id,
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
		bankName: $("#bankName").val(),
		accountNo: $("#accountNo").val(),
		contactNo: $("#contactNo").val(),
		address: $("#address").val(),
		openingDate: $("#openingDate").val(),
		openingBalance: $("#openingBalance").val()
	};
	$.ajax({
		url: "/updateBankModuleById",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify(payload),
		success: function(response) {
			alert("Bank Updated successfully!");
			location.reload();
			// Optionally refresh table or redirect
		},
		error: function(xhr, status, error) {
			alert("Update failed: " + xhr.responseText);
		}
	});
<<<<<<< HEAD
=======
}

function deleteData(id) {
	if (confirm("Are you sure you want to delete this bank?")) {
		$.ajax({
			url: "/deleteBankModuleById", // or "/deleteAllBranchModule" if you're sending full object
			type: "POST",
			data: { id: id }, // if using @RequestParam long id
			success: function(response) {
				alert("Bank deleted successfully.");
				// Refresh the table or page here
				location.reload(); // example method to reload your data
			},
			error: function(xhr, status, error) {
				alert("Failed to delete bank.");
				console.error(error);
			}
		});
	}
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
}