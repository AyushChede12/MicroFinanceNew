$(document).ready(function() {
	BranchNameDropdown();

	$("#formid").submit(function(e) {
		e.preventDefault();
		saveIncomingReceipt();
	});

	$('#searchBtn').click(function(e) {
		e.preventDefault();
		searchIncomingReceipts();
	});

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
		loadIncomingReceipts(); // Will populate #tableBody
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


// Save New Incoming Receipt Entry
function saveIncomingReceipt() {
	const receiptData = {
		branchName: $('#entryBranchName').val().trim(),
		dateOfEntry: $('#dateOfEntry').val(),
		transferMode: $('#transferMode').val(),
		ledgerAccount: $('#ledgerAccount').val().trim(),
		transactionAmount: $('#transactionAmount').val(),
		remarks: $('#remarks').val()
	};

	// ✅ Client-side validation
	if (!receiptData.branchName || !receiptData.dateOfEntry || !receiptData.transferMode || !receiptData.ledgerAccount || !receiptData.transactionAmount || !receiptData.remarks) {
		alert("Please fill in all required fields.");
		return;
	}

	$.ajax({
		type: "POST",
		url: "/accountManagement/createIncomingReceipt",
		contentType: "application/json",
		data: JSON.stringify(receiptData),
		success: function(response) {
			if (response?.status === "CREATED") {
				alert(response.message || "Incoming Receipt saved successfully!");
				$("#formid")[0].reset();
				loadIncomingReceipts();
			} else {
				alert(response.message || "Unexpected response.");
			}
		},
		error: function(xhr) {
			let errorMsg = "Error saving Incoming Receipt.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) errorMsg = res.message;
			} catch (e) {
				// fallback message
			}
			alert(errorMsg);
		}
	});
}

// Load all Incoming Receipts
function loadIncomingReceipts() {
	$.ajax({
		type: "GET",
		url: "/accountManagement/allIncomingReceipt",
		contentType: "application/json",
		success: function(response) {
			const tbody = $("#tableBody");
			tbody.empty();

			// ✅ Properly handle ApiResponse wrapper
			const receipts = response?.data || [];

			if (receipts.length === 0) {
				tbody.append(`<tr><td colspan="8">No Incoming Receipt Entry found</td></tr>`);
				return;
			}

			// ✅ Safely render all outgoing payments
			receipts.forEach(receipt => {
				const row = `
					<tr>
						<td>${receipt.id ?? ''}</td>
						<td>${receipt.branchName ?? ''}</td>
						<td>${receipt.dateOfEntry ?? ''}</td>
						<td>${receipt.transferMode ?? ''}</td>
						<td>${receipt.ledgerAccount ?? ''}</td>
						<td>${receipt.transactionAmount ?? ''}</td>
						<td>${receipt.remarks ?? ''}</td>
						<td>
							<button class="iconbutton" onclick="viewIncomingReceipt(${receipt.id})" title="View">
								<i class="fa-solid fa-eye text-primary"></i>
							</button>
						</td>
					</tr>
				`;
				tbody.append(row);
			});
		},
		error: function(xhr) {
			let errorMessage = "Failed to load Incoming Receipt Entry.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) {
					errorMessage = res.message;
				}
			} catch (e) {
				// fallback message already set
			}
			alert(errorMessage);
		}
	});
}
// View a single Incoming Receipt
function viewIncomingReceipt(id) {
	$.ajax({
		type: "GET",
		url: `/accountManagement/incomingReceipt/${id}`,
		contentType: "application/json",
		success: function(response) {
			const data = response.data;

			if (!data) {
				alert("No receipt data found.");
				return;
			}

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
			alert(" error Failed to load Incoming Receipt data");
		}
	});
}


// Search Incoming Receipts
function searchIncomingReceipts() {
	const branchName = $('#searchBranchName').val();
	const startDate = $('#startDate').val();
	const endDate = $('#endDate').val();

	if (!branchName || !startDate || !endDate) {
		alert("Please fill in Branch Name, Start Date, and End Date.");
		return;
	}

	$.ajax({
		type: "GET",
		url: "/accountManagement/searchIncomingReceipt",
		data: {
			branchName: branchName,
			startDate: startDate,
			endDate: endDate
		},
		success: function(response) {
			const tbody = $("#tableBody");
			tbody.empty();

			// ✅ Access response.data now
			const receipts = response.data;

			if (receipts.length === 0) {
				tbody.append(`<tr><td colspan="7">No results found</td></tr>`);
				return;
			}

			$.each(receipts, function(index, receipt) {
				const row = `
                    <tr>
                        <td>${receipt.id || ''}</td>
                        <td>${receipt.branchName || ''}</td>
                        <td>${receipt.dateOfEntry || ''}</td>
                        <td>${receipt.transferMode || ''}</td>
                        <td>${receipt.ledgerAccount || ''}</td>
                        <td>${receipt.transactionAmount || ''}</td>
                        <td>${receipt.remarks || ''}</td>
						<td>
													<button class="iconbutton" onclick="viewIncomingReceipt(${receipt.id})" title="View">
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
			} catch (e) { }
			alert(errMsg);
		}
	});
}

// Branch Dropdown Loader
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
