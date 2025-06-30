$(document).ready(function() {
	$("#saveBtn").click(function() {

		$('#chkbankname').text('');
		$('#chkaccountno').text('');
		$('#chkcontactno').text('');
		$('#chkaddress').text('');
		$('#chkopeningdate').text('');
		$('#chkopeningbalance').text('');

		var bankName = $('#bankName').val().trim();
		var accountNo = $('#accountNo').val().trim();
		var contactNo = $('#contactNo').val().trim();
		var address = $('#address').val().trim();
		var openingDate = $('#openingDate').val().trim();
		var openingBalance = $('#openingBalance').val().trim();

		var contactPattern = /^[6-9][0-9]{9}$/;

		let isValid = true;

		if (bankName === '') {
			$('#chkbankname').text('* This field is required');
			$('#bankName').focus();
			isValid = false;
		}

		if (accountNo === '') {
			$('#chkaccountno').text('* This field is required');
			$('#accountNo').focus();
			isValid = false;
		}

		if (address === '') {
			$('#chkaddress').text('* This field is required');
			$('#address').focus();
			isValid = false;
		}

		if (openingDate === '') {
			$('#chkopeningdate').text('* This field is required');
			$('#openingDate').focus();
			isValid = false;
		}

		if (openingBalance === '') {
			$('#chkopeningbalance').text('* This field is required');
			$('#openingBalance').focus();
			isValid = false;
		}

		if (contactNo === '') {
			$('#chkcontactno').text('* This field is required');
			$('#contactNo').focus();
			isValid = false;
		}
		else if (!contactPattern.test(contactNo)) {
			alert("Please enter a valid 10-digit mobile number and start from (6-9).");
			contactNo.focus();
			isValid = false;
		}

		if (!isValid) {
			return false; // Stop AJAX call
		}

		const formData = {
			bankName: $('input[name="bankName"]').val(),
			accountNo: $('input[name="accountNo"]').val(),
			contactNo: $('input[name="contactNo"]').val(),
			address: $('textarea[name="address"]').val(),
			openingDate: $('input[name="openingDate"]').val(),
			openingBalance: $('input[name="openingBalance"]').val()
		};

		$.ajax({
			url: '/api/preference/saveAndUpdateAllBankModule',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(formData),
			success: function(response) {
				if (response.status == 'CREATED') {
					alert("Bank Saved Successfully");
					location.reload();
				} else {
					alert("Unexpected response format");
					console.log(response);
				}
			},
			error: function(xhr) {
				console.error('Error:', xhr.responseText);
				alert('Failed to save bank data.');
			}
		});
	});

	$("#tableBody").hide();
	$("#updateBtn").hide();
	var totalDataMISD = [];
	var currentPageMISD = 1; // Track current page
	var pageSizeMISD = 5;

	
	$.ajax({
		type: "GET",
		url: "/api/preference/getAllBankModule",
		contentType: "application/json",
		success: function(response) {
			console.log("Full Response from API:", response);
			if (response.status == "FOUND") {
				let data = response.data;
				totalDataMISD = data;
				let tableBody = $(".datatable tbody");
				tableBody.empty();
				var startIndexMISD = (currentPageMISD - 1) * pageSizeMISD;
				var endIndexMISD = Math.min(startIndexMISD + pageSizeMISD, totalDataMISD.length);
				/*				data.forEach((item, index) => {
									let row = `<tr>
												<td>${index + 1}</td>
												<td>${item.bankName}</td>
												<td>${item.accountNo}</td>
												<td>${item.contactNo}</td>
												<td>${item.address}</td>
												<td>${item.openingDate}</td>
												<td>${item.openingBalance}</td>
												<td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="fa-solid fa-pen-to-square text-primary"></i></button></td>
												<td><button class="iconbutton" onclick="deleteData(${item.id})" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
											</tr>`;
									tableBody.append(row);
								});*/
				for (var i = startIndexMISD; i < endIndexMISD; i++) {
					var person = totalDataMISD[i];
					var row = $('<tr></tr>');
					row.append(`<td>${person.bankName}</td>`);
					row.append(`<td>${person.accountNo}</td>`);
					row.append(`<td>${person.contactNo}</td>`);
					row.append(`<td>${person.address}</td>`);
					row.append(`<td>${person.openingDate}</td>`);
					row.append(`<td>${person.openingBalance}</td>`);

					// View button with person.id passed to viewData
					row.append(`
					  <td>
					    <button class="iconbutton" onclick="viewData(${person.id})" title="View">
					      <i class="fa-solid fa-pen-to-square text-primary"></i>
					    </button>
					  </td>
					`);

					// Delete button with person.id passed to deleteData
					row.append(`
					  <td>
					    <button class="iconbutton" onclick="deleteData(${person.id})" title="Delete">
					      <i class="fa-solid fa-trash text-danger"></i>
					    </button>
					  </td>
					`);
					tableBody.append(row);
				}
			} else {
				alert("Failed to fetch Relative data: " + response.message);
			}
		},
		error: function() {
			alert("Error while calling the API.");
		}
	});
});



function togglePageNavigationMISD() {
	// Disable "Previous" button on the first page
	if (currentPageMISD === 1) {
		$('#prevBtn').prop('disabled', true);
	} else {
		$('#prevBtn').prop('disabled', false);
	}

	// Disable "Next" button on the last page
	var totalPages = Math.ceil(totalDataMISD.length / pageSizeMISD);
	if (currentPageMISD === totalPages) {
		$('#nextBtn').prop('disabled', true);
	} else {
		$('#nextBtn').prop('disabled', false);
	}
}

$('#prevBtn').click(function() {
	if (currentPageMISD > 1) {
		currentPageMISD--;
		getMISDepositeAjax(currentPageMISD)

		togglePageNavigationMISD();
	}
});

$('#nextBtn').click(function() {
	var totalPages = Math.ceil(totalDataMISD.length / pageSize);
	if (currentPageMISD < totalPages) {
		currentPageMISD++;
		getMISDepositeAjax(currentPageMISD)
		togglePageNavigationMISD();
	}
});

function getMISDepositeAjax(currentPageMISD){
	
}

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
		url: "/api/preference/getBankModuleById",
		type: "GET",
		data: { id: id },
		success: function(response) {
			if (response.status = "FOUND") {
				const branch = response.data;
				$("#id").val(branch.id);
				$("#bankName").val(branch.bankName);
				$("#accountNo").val(branch.accountNo);
				$("#contactNo").val(branch.contactNo);
				$("#address").val(branch.address);
				$("#openingDate").val(branch.openingDate);
				$("#openingBalance").val(branch.openingBalance);
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
	if (confirm("Are you sure you want to delete this bank?")) {
		$.ajax({
			url: "/api/preference/deleteBankModuleById",
			type: "POST",
			data: { id: id },
			success: function(response) {
				if (response.status = "OK") {
					alert(response.message);
					location.reload();
				} else {
					alert("Delete failed: " + response.message);
				}
			},
			error: function(xhr, status, error) {
				alert("Failed to delete bank.");
				console.error("Error:", error);
			}
		});
	}
}

function updateBank() {
	let payload = {
		id: $("#id").val(),
		bankName: $("#bankName").val(),
		accountNo: $("#accountNo").val(),
		contactNo: $("#contactNo").val(),
		address: $("#address").val(),
		openingDate: $("#openingDate").val(),
		openingBalance: $("#openingBalance").val()
	};
	$.ajax({
		url: "/api/preference/saveAndUpdateAllBankModule",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify(payload),
		success: function(response) {
			if (response.status = "OK") {
				alert("Bank Updated Successfully");
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
	const rowsPerPage = 10;
	let currentPage = 1;

	function showPage(page) {
		let rows = $("#tableBody tr");
		let totalRows = rows.length;
		let totalPages = Math.ceil(totalRows / rowsPerPage);

		// Boundary check
		if (page < 1) page = 1;
		if (page > totalPages) page = totalPages;

		// Hide all rows initially
		rows.hide();

		// Show only the relevant rows
		let start = (page - 1) * rowsPerPage;
		let end = start + rowsPerPage;
		rows.slice(start, end).show();

		// Disable/Enable buttons
		$("#prevBtn").prop("disabled", page === 1);
		$("#nextBtn").prop("disabled", page === totalPages);

		currentPage = page;
	}

	// Button click handlers
	$("#prevBtn").click(function() {
		if (currentPage > 1) {
			showPage(currentPage - 1);
		}
	});

	$("#nextBtn").click(function() {
		let rows = $("#tableBody tr").length;
		if (currentPage * rowsPerPage < rows) {
			showPage(currentPage + 1);
		}
	});

	// Initialize the table on page load
	showPage(currentPage);
});