$(document).ready(function() {
	BranchNameDropdown();
	//loadOutgoingPaymentData();


	// Handle form submission for creating outgoing payment
	$("#formid").submit(function(e) {
		e.preventDefault();
		saveOutgoingPayment();
	});

	// Handle search
	$('#searchBtn').click(function(e) {
		e.preventDefault();
		searchOutgoingPayments();
	});

	// Clear form
	$("#clearBtn").click(function() {
		$("#formid")[0].reset();
	});

	$("#entryBranchName").on("change", function() {
		const selectedBranch = $(this).val();
		LedgerDropdown(selectedBranch);
	});

});

function showTableData() {
	const tableBody = $("#tableBody");
	const toggleBtn = $("#toggleBtn");

	if (tableBody.children().length === 0) {
		// No data loaded yet — load and show
		loadOutgoingPaymentData(); // Will populate #tableBody
		toggleBtn.html('Hide');
	} else {
		// Data exists — toggle visibility
		if (tableBody.is(":visible")) {
			tableBody.hide();
			toggleBtn.html('Show');
		} else {
			tableBody.show();
			toggleBtn.html('Hide');
		}
	}
}




// Save New Outgoing Payment Entry
function saveOutgoingPayment() {
	const paymentData = {
		branchName: $('#entryBranchName').val().trim(),
		dateOfEntry: $('#dateOfEntry').val(),
		transferMode: $('#transferMode').val(),
		ledgerAccount: $('#ledgerAccount').val().trim(),
		transactionAmount: $('#transactionAmount').val(),
		remarks: $('#remarks').val()
	};

	//  Client-side validation
	if (!paymentData.branchName || !paymentData.dateOfEntry || !paymentData.transferMode || !paymentData.ledgerAccount || !paymentData.transactionAmount) {
		alert("Please fill in all required fields.");
		return;
	}

	$.ajax({
		type: "POST",
		url: "/accountManagement/createOutgoingPayment",
		contentType: "application/json",
		data: JSON.stringify(paymentData),
		success: function(response) {
			if (response?.status === "CREATED") {
				alert(response.message || "Outgoing Payment saved successfully!");
				$("#formid")[0].reset();
				loadOutgoingPaymentData();
			} else {
				alert("Unexpected response: " + response.message);
			}
		},
		error: function(xhr) {
			let errorMsg = "Error saving outgoing payment.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) errorMsg = res.message;
			} catch (e) {
				console.error("Error parsing save response:", e);
			}
			alert(errorMsg);
		}
	});
}


function loadOutgoingPaymentData() {
	$.ajax({
		type: "GET",
		url: "/accountManagement/allOutgoingPayment",
		contentType: "application/json",
		success: function(response) {
			const tbody = $("#tableBody");
			tbody.empty();

			//  Properly handle ApiResponse wrapper
			const payments = response?.data || [];

			if (payments.length === 0) {
				tbody.append(`<tr><td colspan="8">No outgoing payments found</td></tr>`);
				return;
			}

			//  Safely render all outgoing payments
			payments.forEach(payment => {
				const row = `
					<tr>
						<td>${payment.id ?? ''}</td>
						<td>${payment.branchName ?? ''}</td>
						<td>${payment.dateOfEntry ?? ''}</td>
						<td>${payment.transferMode ?? ''}</td>
						<td>${payment.ledgerAccount ?? ''}</td>
						<td>${payment.transactionAmount ?? ''}</td>
						<td>${payment.remarks ?? ''}</td>
						<td>
							<button class="iconbutton" onclick="viewOutgoingPayment(${payment.id})" title="View">
								<i class="fa-solid fa-eye text-primary"></i>
							</button>
						</td>
					</tr>
				`;
				tbody.append(row);
			});
		},
		error: function(xhr) {
			let errorMessage = "Failed to load outgoing payments.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) {
					errorMessage = res.message;
				}
			} catch (e) {
				console.error("Error parsing response loadalloutgoingpayment:", e);
			}
			alert(errorMessage);
		}
	});
}


function viewOutgoingPayment(id) {
	$.ajax({
		type: "GET",
		url: `/accountManagement/outgoingPayment/${id}`,
		contentType: "application/json",
		success: function(response) {
			const data = response.data;

			// ✅ Fix for case-insensitive matching of branchName
			$("#entryBranchName option").each(function() {
				const optionText = $(this).val()?.trim().toLowerCase();
				const targetText = data.branchName?.trim().toLowerCase();

				if (optionText === targetText) {
					$(this).prop("selected", true);
					return false;
				}
			});
			$("#generatedReceiptID").val(data.generatedReceiptID);
			$("#dateOfEntry").val(data.dateOfEntry);
			$("#transferMode").val(data.transferMode);
			$("#transactionAmount").val(data.transactionAmount);
			$("#remarks").val(data.remarks);

			// ✅ Load dropdown and preselect
			LedgerDropdown(data.branchName, data.ledgerAccount);
		},
		error: function() {
			alert("Failed to load outgoing payment data");
		}
	});
}




// Search outgoing payments
function searchOutgoingPayments() {
	const branchName = $('#searchBranchName').val();
	const startDate = $('#startDate').val();
	const endDate = $('#endDate').val();

	if (!branchName || !startDate || !endDate) {
		alert("Please fill in Branch Name, Start Date, and End Date.");
		return;
	}

	$.ajax({
		type: "GET",
		url: "/accountManagement/search",
		data: {
			branchName: branchName,
			startDate: startDate,
			endDate: endDate
		},
		success: function(response) {
			const tbody = $("#tableBody");
			tbody.empty();

			// ✅ Access response.data now
			const payments = response.data;

			if (payments.length === 0) {
				tbody.append(`<tr><td colspan="7">No results found</td></tr>`);
				return;
			}

			$.each(payments, function(index, payment) {
				const row = `
                    <tr>
                        <td>${payment.id || ''}</td>
                        <td>${payment.branchName || ''}</td>
                        <td>${payment.dateOfEntry || ''}</td>
                        <td>${payment.transferMode || ''}</td>
                        <td>${payment.ledgerAccount || ''}</td>
                        <td>${payment.transactionAmount || ''}</td>
                        <td>${payment.remarks || ''}</td>
						<td>
													<button class="iconbutton" onclick="viewOutgoingPayment(${payment.id})" title="View">
														<i class="fa-solid fa-eye text-primary"></i>
													</button>
												</td>
                    </tr>
                `;
				tbody.append(row);
			});
		},
		error: function(xhr) {
			let errMsg = "Search failed";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res && res.message) errMsg = res.message;
			} catch (e) {
				console.error("Error parsing response for search:", e);

			}
			alert(errMsg);
		}
	});
}
function LedgerDropdown(branchName, selectedLedger = "", callback = null) {

	if (!branchName || branchName.trim() === "") {
		console.warn("Branch name is missing. Skipping ledger dropdown load.");
		return; // 🔒 Prevents invalid AJAX call
	}
	$.ajax({
		type: "GET",
		url: `/accountManagement/ledgerByBranch/${branchName}`,
		contentType: "application/json",
		success: function(data) {
			const ledgers = data.data;
			let options = "<option value=''>Select ledger</option>";

			if (Array.isArray(ledgers)) {
				ledgers.sort((a, b) => {
					const nameA = a.accountTitle.toLowerCase();
					const nameB = b.accountTitle.toLowerCase();
					return nameA.localeCompare(nameB);
				});

				ledgers.forEach(ledger => {
					const isSelected = ledger.accountTitle.trim().toLowerCase() === selectedLedger.trim().toLowerCase() ? "selected" : "";
					options += `<option value="${ledger.accountTitle}" ${isSelected}>${ledger.accountTitle}</option>`;
				});
			}

			$("#ledgerAccount").html(options);

			if (typeof callback === "function") {
				callback();
			}
		},
		error: function() {
			alert("Failed to load ledger accounts for selected branch");
		}
	});
}




function BranchNameDropdown() {
	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: '/api/preference/getAllBranchModule',
		success: function(response) {
			let options = "<option value=''>Select Branch Name</option>";
			// The actual branch array is inside response.data
			if (response && Array.isArray(response.data)) {
				response.data.forEach(branch => {
					options += `<option value='${branch.branchName}'>${branch.branchName}</option>`;
				});
			}
			$("#searchBranchName").html(options);
			$("#entryBranchName").html(options);
		},
		error: function() {
			alert("Failed to load branch names.");
		}
	});
}
