$(document).ready(function() {
	BranchNameDropdown();
	loadManualJournalData();

	// 🔸 Form Submit
	$("#formid").submit(function(e) {
		e.preventDefault();
		saveManualJournal();
	});

	// 🔸 Clear Button
	$("#clearBtn").click(function() {
		$("#formid")[0].reset();
		$("#creditLedger, #debitLedger").html("<option value=''>Select Ledger</option>");
	});

	// 🔸 Search Button
	$("#searchBtn").click(function(e) {
		e.preventDefault();
		searchManualJournal();
	});

	// 🔸 Branch Dropdown Change
	$("#entryBranchName").change(function() {
		const selectedBranch = $(this).val();
		loadManualJournalLedgers(selectedBranch);
	});
});





// 🔹 Load Ledgers for Manual Journal
function loadManualJournalLedgers(branchName) {
	if (!branchName) return;

	$.ajax({
		type: "GET",
		url: `accountManagement/eligibleLedgersForManualJournal/${branchName}`,
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

// 🔹 Save Manual Journal Entry
function saveManualJournal() {
	const data = {
		branchName: $("#entryBranchName").val().trim(),
		dateOfEntry: $("#dateOfEntry").val(),
		creditLedger: $("#creditLedger").val(),
		debitLedger: $("#debitLedger").val(),
		transactionAmount: $("#transactionAmount").val(),
		remarks: $("#remarks").val()
	};

	if (!data.branchName || !data.dateOfEntry || !data.creditLedger || !data.debitLedger || !data.transactionAmount) {
		alert("Please fill all required fields.");
		return;
	}

	$.ajax({
		type: "POST",
		url: "accountManagement/createManualJournal",
		contentType: "application/json",
		data: JSON.stringify(data),
		success: function(response) {
			if (response.status == 201 || response.status === "CREATED") {
				alert(response.message || "Entry saved successfully.");
				$("#formid")[0].reset();
				$("#creditLedger, #debitLedger").html("<option value=''>Select Ledger</option>");
				loadManualJournalData();

				if (response.data?.voucherID) {
					$("#voucherID").val(response.data.voucherID);
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

// 🔹 Load All Manual Journal Entries
function loadManualJournalData() {
	$.ajax({
		type: "GET",
		url: "accountManagement/allManualJournal",
		contentType: "application/json",
		success: function(response) {
			const list = response.data || [];
			const tbody = $("#tableBody").empty();

			if (list.length === 0) {
				tbody.append("<tr><td colspan='8'>No Manual Journal Entries found.</td></tr>");
				return;
			}

			list.forEach(entry => {
				tbody.append(`
                    <tr>
                        <td>${entry.id || ''}</td>
                        <td>${entry.branchName || ''}</td>
						<td>${entry.voucherID ?? ''}</td>
                        <td>${entry.dateOfEntry || ''}</td>
                        <td>${entry.creditLedger || ''}</td>
                        <td>${entry.debitLedger || ''}</td>
                        <td>${entry.transactionAmount || ''}</td>
                        <td>${entry.remarks || ''}</td>
                        <td>
                            <button class="iconbutton" onclick="viewManualJournal(${entry.id})" title="View">
                                <i class="fa-solid fa-eye text-primary"></i>
                            </button>
                        </td>
                    </tr>
                `);
			});
		},
		error: function(xhr) {
			let msg = "Failed to load Manual Journal entries.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) msg = res.message;
			} catch (e) { }
			alert(msg);
		}
	});
}

// 🔹 View Manual Journal Entry
function viewManualJournal(id) {
	$.ajax({
		type: "GET",
		url: `accountManagement/manualJournal/${id}`,
		contentType: "application/json",
		success: function(response) {
			const entry = response.data;
			if (!entry) return alert("No entry data found.");

			$("#entryBranchName").val(entry.branchName).trigger("change");

			setTimeout(() => {
				$("#creditLedger").val(entry.creditLedger);
				$("#debitLedger").val(entry.debitLedger);
			}, 300);

			$("#dateOfEntry").val(entry.dateOfEntry);
			$("#transactionAmount").val(entry.transactionAmount);
			$("#remarks").val(entry.remarks);
			$("#voucherID").val(entry.voucherID || '');
		},
		error: function(xhr) {
			let msg = "Error loading entry.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) msg = res.message;
			} catch (e) { }
			alert(msg);
		}
	});
}

// 🔹 Search Manual Journal Entries
function searchManualJournal() {
	const branchName = $('#searchBranchName').val();
	const startDate = $('#startDate').val();
	const endDate = $('#endDate').val();

	if (!branchName || !startDate || !endDate) {
		alert("Please fill in all search fields.");
		return;
	}

	$.ajax({
		type: "GET",
		url: "accountManagement/searchManualJournal",
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
                            <button class="iconbutton" onclick="viewManualJournal(${entry.id})" title="View">
                                <i class="fa-solid fa-eye text-primary"></i>
                            </button>
                        </td>
                    </tr>
                `);
			});
		},
		error: function(xhr) {
			let msg = "Search failed.";
			try {
				const res = JSON.parse(xhr.responseText);
				if (res?.message) msg = res.message;
			} catch (e) { }
			alert(msg);
		}
	});
}
// 🔹 Load Branch Dropdown
function BranchNameDropdown() {
	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: 'api/preference/getAllBranchModule',
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

