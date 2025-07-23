$(document).ready(function() {
	BranchNameDropdown();
	GroupNameDropdown(); // 🔹 Load group names too


	$("#formid").submit(function(e) {
		e.preventDefault();
		saveLedger();
	});

	$("#clearBtn").click(function() {
		$("#formid")[0].reset();
	});
});

function showTableData() {
	const tableBody = $("#tableBody");
	const toggleBtn = $("#toggleBtn");

	if (tableBody.children().length === 0) {
		// No data loaded yet — load and show
		loadLedgerData(); // Will populate #tableBody
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



// Save New Ledger
function saveLedger() {
	const ledgerData = {
		accountTitle: $('#accountTitle').val(),
		branchName: $('#branchName').val(),
		groupName: $('#groupName').val() // ✅ include Group Name

	};

	$.ajax({
		type: "POST",
		url: "/accountManagement/create",
		contentType: "application/json",
		data: JSON.stringify(ledgerData),
		success: function(response, status, xhr) {
			if (xhr.status === 201) {
				alert(response.message);
				$("#formid")[0].reset();
				loadLedgerData();
			} else {
				alert("Unexpected response: " + response.message);
			}
		},
		error: function(xhr) {
			const err = xhr.responseJSON;
			const message = err && err.message ? err.message : "Error saving ledger account";
			alert(message);
		}
	});
}

// Load all ledger accounts
function loadLedgerData() {
	$.ajax({
		type: "GET",
		url: "/accountManagement/all",
		contentType: "application/json",
		success: function(response) {
			const ledgers = response.data;
			const tbody = $("#tableBody");
			tbody.empty();

			if (Array.isArray(ledgers) && ledgers.length > 0) {
				$.each(ledgers, function(index, ledger) {
					const row = `
						<tr>
						<td>${ledger.id || ''}</td>
							<td>${ledger.accountTitle || ''}</td>
							<td>${ledger.groupName || ''}</td> <!-- ✅ Group column -->
							<td>${ledger.branchName || ''}</td>
							<td>
								<button class="iconbutton" onclick="viewLedger(${ledger.id})" title="View">
									<i class="fa-solid fa-eye text-primary"></i>
								</button>
							</td>
						</tr>
					`;
					tbody.append(row);
				});
			} else {
				tbody.append(`<tr><td colspan="3">No ledgers found.</td></tr>`);
			}
		},
		error: function(xhr) {
			const err = xhr.responseJSON;
			const message = err && err.message ? err.message : "Failed to load ledger account list.";
			alert(message);
			$("#tableBody").html(`<tr><td colspan="3">${message}</td></tr>`);
		}
	});
}

// View single ledger and populate the form
function viewLedger(id) {
	$.ajax({
		type: "GET",
		url: `/accountManagement/${id}`,
		success: function(response) {
			const ledger = response.data;
			$('#accountTitle').val(ledger.accountTitle);
			$('#groupName').val(ledger.groupName); // ✅ Prefill group name
			$('#branchName').val(ledger.branchName);
		},
		error: function(xhr) {
			const err = xhr.responseJSON;
			const message = err && err.message ? err.message : "Error fetching ledger account.";
			alert(message);
		}
	});
}

// Populate Branch Name Dropdown
function BranchNameDropdown() {
	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: '/getAllBranchModule',
		success: function(data) {
			let options = "<option value=''>Select Branch Name</option>";
			data.forEach(branch => {
				options += `<option value='${branch.branchName}'>${branch.branchName}</option>`;
			});
			$("#branchName").html(options);
		},
		error: function() {
			alert("Failed to load branch names.");
		}
	});
}
// 🔹 Populate Group Name Dropdown
function GroupNameDropdown() {
	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: '/accountManagement/groupNames',
		success: function(response) {
			const groupNames = response.data;
			let options = "<option value=''>Select Group Name</option>";
			groupNames.forEach(group => {
				options += `<option value='${group}'>${group}</option>`;
			});
			$("#groupName").html(options);
		},
		error: function() {
			alert("Failed to load group names.");
		}
	});
}
