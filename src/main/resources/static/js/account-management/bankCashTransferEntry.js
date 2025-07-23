$(document).ready(function() {
	BranchNameDropdown();
	loadBankCashTransferData();

	// Event Handlers
	$("#formid").submit(function(e) {
		e.preventDefault();
		saveBankCashTransfer();
	});

	$("#clearBtn").click(function() {
		$("#formid")[0].reset();
		$("#creditLedger, #debitLedger").html("<option value=''>Select Ledger</option>");
	});

	$("#searchBtn").click(function(e) {
		e.preventDefault();
		searchBankCashTransfers();
	});

	$("#entryBranchName").change(function() {
		const selectedBranch = $(this).val();
		loadBankCashLedgers(selectedBranch);
	});
});

// 🔹 Load Branch Dropdown for Search + Entry
function BranchNameDropdown() {
	$.ajax({
		type: "GET",
		url: "/getAllBranchModule",
		contentType: "application/json",
		success: function(data) {
			let options = "<option value=''>Select Branch Name</option>";
			data.forEach(branch => {
				options += `<option value='${branch.branchName}'>${branch.branchName}</option>`;
			});
			$("#searchBranchName, #entryBranchName").html(options);
		},
		error: function() {
			alert("Failed to load branch names.");
		}
	});
}

// 🔹 Load Only Bank/Cash Ledgers for Selected Branch
function loadBankCashLedgers(branchName) {
	if (!branchName) return;
	$.ajax({
		type: "GET",
		url: `/accountManagement/ledgerByBranchAndGroup/${branchName}`,
		contentType: "application/json",
		success: function(response) {
			const ledgers = response.data || [];
			let options = "<option value=''>Select Ledger</option>";
			ledgers.forEach(ledger => {
				options += `<option value="${ledger.accountTitle}">${ledger.accountTitle}</option>`;
			});
			$("#debitLedger, #creditLedger").html(options);
		},
		error: function(xhr) {
			alert("Failed to load ledgers: " + (xhr.responseText || "Unknown error"));
		}
	});
}

// 🔹 Save Entry
function saveBankCashTransfer() {
	const data = {
		branchName: $("#entryBranchName").val().trim(),
		dateOfEntry: $("#dateOfEntry").val(),
		creditLedger: $("#creditLedger").val(),
		debitLedger: $("#debitLedger").val(),
		transactionAmount: $("#transactionAmount").val(),
		remarks: $("#remarks").val()
	};

	// Validation
	if (!data.branchName || !data.dateOfEntry || !data.creditLedger || !data.debitLedger || !data.transactionAmount) {
		alert("Please fill all required fields.");
		return;
	}

	$.ajax({
		type: "POST",
		url: "/accountManagement/createBankCashTransfer",
		contentType: "application/json",
		data: JSON.stringify(data),
		success: function(response) {
			if (response.status == 201 || response.status === "CREATED") {
				alert(response.message || "Entry saved successfully.");
				$("#formid")[0].reset();
				$("#creditLedger, #debitLedger").html("<option value=''>Select Ledger</option>");
				loadBankCashTransferData();

				if (response.data?.generatedReceiptID) {
					$("#genratedReceiptId").val(response.data.generatedReceiptID);
				}
			} else {
				alert(response.message || "Unexpected response.");
			}
		},
		error: function(xhr) {
			let msg = "Error saving entry.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) msg = res.message;
			} catch (e) { }
			alert(msg);
		}
	});
}

// 🔹 Load All Entries
function loadBankCashTransferData() {
	$.ajax({
		type: "GET",
		url: "/accountManagement/allBankCashTransfer",
		contentType: "application/json",
		success: function(response) {
			const list = response.data || [];
			const tbody = $("#tableBody").empty();

			if (list.length === 0) {
				tbody.append("<tr><td colspan='8'>No Bank Cash Transfer Entries found.</td></tr>");
				return;
			}

			list.forEach(entry => {
				tbody.append(`
					<tr>
						<td>${entry.id || ''}</td>
						<td>${entry.branchName || ''}</td>
						<td>${entry.dateOfEntry || ''}</td>
						<td>${entry.creditLedger || ''}</td>
						<td>${entry.debitLedger || ''}</td>
						<td>${entry.transactionAmount || ''}</td>
						<td>${entry.remarks || ''}</td>
						<td>
							<button class="iconbutton" onclick="viewBankCashTransfer(${entry.id})" title="View">
								<i class="fa-solid fa-eye text-primary"></i>
							</button>
						</td>
					</tr>
				`);
			});
		},
		error: function(xhr) {
			let msg = "Failed to load Bank Cash Transfer entries.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) msg = res.message;
			} catch (e) { }
			alert(msg);
		}
	});
}

// 🔹 View Entry
function viewBankCashTransfer(id) {
	$.ajax({
		type: "GET",
		url: `/accountManagement/bankCashTransfer/${id}`,
		contentType: "application/json",
		success: function(response) {
			const entry = response.data;
			if (!entry) return alert("No entry data found.");

			// Set branch
			$("#entryBranchName").val(entry.branchName).trigger("change");

			// Delay to wait for dropdown options to load
			setTimeout(() => {
				$("#creditLedger").val(entry.creditLedger);
				$("#debitLedger").val(entry.debitLedger);
			}, 300);

			$("#genratedReceiptId").val(entry.generatedReceiptID || '');
			$("#dateOfEntry").val(entry.dateOfEntry);
			$("#transactionAmount").val(entry.transactionAmount);
			$("#remarks").val(entry.remarks);
		},
		error: function(xhr) {
			let msg = "Failed to load entry.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) msg = res.message;
			} catch (e) { }
			alert(msg);
		}
	});
}

// 🔹 Search Entries
function searchBankCashTransfers() {
	const branchName = $('#searchBranchName').val();
	const startDate = $('#startDate').val();
	const endDate = $('#endDate').val();

	if (!branchName || !startDate || !endDate) {
		alert("Please fill in all search fields.");
		return;
	}

	console.log("🔍 Search Parameters:", { branchName, startDate, endDate });

	$.ajax({
		type: "GET",
		url: "/accountManagement/searchBankCashTransfer",
		data: { branchName, startDate, endDate },
		contentType: "application/json",
		success: function(response) {
			const list = response.data || [];
			const tbody = $("#tableBody").empty();

			if (list.length === 0) {
				tbody.append("<tr><td colspan='8'>No matching results found.</td></tr>");
				return;
			}

			list.forEach(entry => {
				tbody.append(`
					<tr>
						<td>${entry.id || ''}</td>
						<td>${entry.branchName || ''}</td>
						<td>${entry.dateOfEntry || ''}</td>
						<td>${entry.creditLedger || ''}</td>
						<td>${entry.debitLedger || ''}</td>
						<td>${entry.transactionAmount || ''}</td>
						<td>${entry.remarks || ''}</td>
						<td>
							<button class="iconbutton" onclick="viewBankCashTransfer(${entry.id})" title="View">
								<i class="fa-solid fa-eye text-primary"></i>
							</button>
						</td>
					</tr>
				`);
			});
		},
		error: function(xhr) {
			console.error("❌ Search Error:", xhr.responseText);
			let msg = "Search failed.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) msg = res.message;
			} catch (e) { }
			alert(msg);
		}
	});
}

