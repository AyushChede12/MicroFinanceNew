$(document).ready(function() {
	$("#tableBody").hide();
	$("#updateBtn").hide();
	$("#prevBtn").hide();
	$("#nextBtn").hide();
	$("#pageInfo").hide();
	$("#saveBtn").click(function() {

		$('#chkbankname').text('');
		$('#chkaccountno').text('');
		$('#chkifsccode').text('');
		$('#chkmicrcode').text('');
		$('#chkcontactno').text('');
		$('#chkaddress').text('');
		$('#chkopeningdate').text('');
		$('#chkopeningbalance').text('');
		$('#chkclosingdate').text('');

		var bankName = $('#bankName').val().trim();
		var accountNo = $('#accountNo').val().trim();
		var ifscCode = $('#ifscCode').val().trim();
		var micrCode = $('#micrCode').val().trim();
		var contactNo = $('#contactNo').val().trim();
		var address = $('#address').val().trim();
		var openingDate = $('#openingDate').val().trim();
		var openingBalance = $('#openingBalance').val().trim();
		var closingDate = $('#closingDate').val().trim();

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

		if (ifscCode === '') {
			$('#chkifsccode').text('* This field is required');
			$('#ifscCode').focus();
			isValid = false;
		}

		if (micrCode === '') {
			$('#chkmicrcode').text('* This field is required');
			$('#micrCode').focus();
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

		if (closingDate === '') {
			$('#chkclosingdate').text('* This field is required');
			$('#closingDate').focus();
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
			ifscCode: $('input[name="ifscCode"]').val(),
			micrCode: $('input[name="micrCode"]').val(),
			contactNo: $('input[name="contactNo"]').val(),
			address: $('textarea[name="address"]').val(),
			openingDate: $('input[name="openingDate"]').val(),
			openingBalance: $('input[name="openingBalance"]').val(),
			closingDate: $('input[name="closingDate"]').val()
		};

		$.ajax({
			url: 'api/preference/saveAndUpdateAllBankModule',
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



});



var totalDataMISD = [];
var currentPageMISD = 1;
var pageSizeMISD = 5;

// Load data once
function loadMISData() {
	$.ajax({
		type: "GET",
		url: "api/preference/getAllBankModule",
		contentType: "application/json",
		success: function(response) {
			if (response.status === "FOUND") {
				totalDataMISD = response.data;
				renderTable(currentPageMISD);
				togglePageNavigationMISD();
			} else {
				alert("Failed to fetch data: " + response.message);
			}
		},
		error: function() {
			alert("Error while calling the API.");
		}
	});
}

// Render paginated table
function renderTable(page) {
	let tableBody = $(".datatable tbody");
	tableBody.empty();

	let startIndex = (page - 1) * pageSizeMISD;
	let endIndex = Math.min(startIndex + pageSizeMISD, totalDataMISD.length);

	for (let i = startIndex; i < endIndex; i++) {
		let person = totalDataMISD[i];
		let row = `<tr>
				<td><input type="checkbox"></td>
				<td>${i + 1}</td>
                <td>${person.bankName}</td>
                <td>${person.accountNo}</td>
				<td>${person.ifscCode}</td>
				<td>${person.micrCode}</td>
                <td>${person.contactNo}</td>
                <td>${person.address}</td>
                <td>${person.openingDate}</td>
                <td>${person.openingBalance}</td>
				<td>${person.closingDate}</td>
                <td>
                  <button class="iconbutton" onclick="viewData(${person.id})" title="View">
                    <i class="fa-solid fa-pen-to-square text-primary"></i>
                  </button>
                </td>
                <td>
                  <button class="iconbutton" onclick="deleteData(${person.id})" title="Delete">
                    <i class="fa-solid fa-trash text-danger"></i>
                  </button>
                </td>
              </tr>`;
		tableBody.append(row);
	}

	// Update page info
	$("#pageInfo").text(`Page ${currentPageMISD} of ${Math.ceil(totalDataMISD.length / pageSizeMISD)}`);
}

// Button state toggling
function togglePageNavigationMISD() {
	let totalPages = Math.ceil(totalDataMISD.length / pageSizeMISD);
	$("#prevBtn").prop("disabled", currentPageMISD === 1);
	$("#nextBtn").prop("disabled", currentPageMISD === totalPages || totalPages === 0);
}

// Button click handlers
$("#prevBtn").click(function() {
	if (currentPageMISD > 1) {
		currentPageMISD--;
		renderTable(currentPageMISD);
		togglePageNavigationMISD();
	}
});

$("#nextBtn").click(function() {
	let totalPages = Math.ceil(totalDataMISD.length / pageSizeMISD);
	if (currentPageMISD < totalPages) {
		currentPageMISD++;
		renderTable(currentPageMISD);
		togglePageNavigationMISD();
	}
});

// Call on page load
$(document).ready(function() {
	loadMISData();
});


function showTableData() {
	$("#tableBody").show();
	$("#prevBtn").show();
	$("#nextBtn").show();
	$("#pageInfo").show();
}

function hideTableData() {
	$("#tableBody").hide();
	$("#prevBtn").hide();
	$("#nextBtn").hide();
	$("#pageInfo").hide();
}

function viewData(id) {
	$("#updateBtn").show();
	$("#saveBtn").hide();
	$("#hideBtn").hide();
	$("#showBtn").hide();

	$.ajax({
		url: "api/preference/getBankModuleById",
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
			url: "api/preference/deleteBankModuleById",
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
		url: "api/preference/saveAndUpdateAllBankModule",
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