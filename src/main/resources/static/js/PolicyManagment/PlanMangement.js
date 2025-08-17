$(document).ready(function() {
	$("#saveBtn").show();
	$("#genrateBtn").show();
	$("#updateBtn").hide();
	$("#deleteBtn").hide();

	// SAVE BUTTON
	$('#saveBtn').on('click', function(e) {
		e.preventDefault();

		const statusPlanValue = $('#toggle-status-planDD').is(':checked') ? 1 : 0;

		const dailyDeposit = {
			drd: $('#drd').val(),
			planCodeDD: $('#planCodeDD').val(),
			planNameDD: $('#planNameDD').val(),
			minimumDeposit: $('#minimumDeposit').val(),
			rateOfInterest: $('#rateOfInterest').val(),
			installmentType: $('#installmentType').val(),    // ⬅️ Dropdown value
			duration: $('#duration').val(),
			termModeDD: $('#termModeDD').val(),
			ddterm: $('#ddterm').val(),
			commissionOnNew: $('#commissionOnNew').val(),
			renewalCommission: $('#renewalCommission').val(),
			interestInterval: $('#interestInterval').val(), // ⬅️ Dropdown value
			totalPaid: $('#totalPaid').val(),
			maturityAmount: $('#maturityAmount').val(),
			flexiblePlan: $('#flexiblePlan').val(),          // ⬅️ Dropdown value
			graceDays: $('#graceDays').val(),
			penaltyRate: $('#penaltyRate').val(),
			statusOfPlan: statusPlanValue
		};

		// Optional: Debug log before sending
		console.log("Sending Data:", dailyDeposit);

		$.ajax({
			url: '/api/Policymangment/daily-depositsave',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(dailyDeposit),
			success: function(response) {
				alert("Daily Deposit Saved Successfully");
				location.reload(); // refresh table or UI
			},
			error: function(xhr) {
				console.error("Save Error:", xhr.responseText);
				alert("Something went wrong while saving!");
			}
		});
	});

	// FETCH DATA
	/*function fetchDailyDeposits() {
		$.ajax({
			url: "/api/Policymangment/daily-deposit/view",
			type: "GET",
			dataType: "json",
			success: function(response) {
				const data = response.data || [];
				const tableBody = $("#depositTableBody").empty();

				if (data.length > 0) {
					$.each(data, function(index, item) {
						const statusText = item.statusOfPlan == 1 ? 'Active' : 'Inactive';
						const row = `
							<tr>
								<td>${item.planCodeDD || ''}</td>
								<td>${item.planNameDD || ''}</td>
								<td>${item.minimumDeposit || ''}</td>
								<td>${item.rateOfInterest || ''}</td>
								<td>${item.installmentType || ''}</td>
								<td>${item.ddterm || ''}</td>
								<td>${item.maturityAmount || ''}</td>
								<td>${statusText}</td>
								<td class="d-flex" style="gap: .7rem;">
									<button class="iconbutton edit-btn" data-id="${item.id}">
										<i class="fa-solid fa-pen-to-square text-success"></i>
									</button>
								    
									<button class="iconbutton delete-btn" data-id="${item.id}">
										<i class="fa-solid fa-trash text-danger"></i>
									</button>
								</td>
							</tr>`;
						tableBody.append(row);
					});
				} else {
					tableBody.html(`<tr><td colspan="9" class="text-center text-warning">No data found.</td></tr>`);
				}
			},
			error: function() {
				$("#depositTableBody").html(`<tr><td colspan="9" class="text-center text-danger">Something went wrong.</td></tr>`);
			}
		});
	}*/

	var totalDataMISD = [];
	var currentPageMISD = 1;
	var pageSizeMISD = 5;

	// Load data once
	function fetchDailyDeposits() {
		$.ajax({
			type: "GET",
			url: "/api/Policymangment/daily-deposit/view",
			dataType: "json",
			success: function(response) {
				if (response.status === "OK") {
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
		let tableBody = $("#depositTableBody");
		tableBody.empty();

		let startIndex = (page - 1) * pageSizeMISD;
		let endIndex = Math.min(startIndex + pageSizeMISD, totalDataMISD.length);

		for (let i = startIndex; i < endIndex; i++) {
			let person = totalDataMISD[i];
			const statusText = person.statusOfPlan == 1 ? 'Active' : 'Inactive';
			let row = `<tr>
					<td>${i + 1}</td>
	                <td>${person.planCodeDD}</td>
	                <td>${person.planNameDD}</td>
	                <td>${person.minimumDeposit}</td>
	                <td>${person.rateOfInterest}</td>
	                <td>${person.installmentType}</td>
	                <td>${person.ddterm}</td>
					<td>${person.maturityAmount}</td>
					<td>${statusText}</td>
					<td class="d-flex" style="gap: .7rem;">
						<button type="button" class="iconbutton edit-btn" data-id="${person.id}">
						<i class="fa-solid fa-pen-to-square text-success"></i>
						</button>
						<button type="button" class="iconbutton delete-btn" data-id="${person.id}">
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
		fetchDailyDeposits();
	});

	// DELEGATED EVENT for edit button
	$('#depositTableBody').on('click', '.edit-btn', function() {
		const id = $(this).data('id');
		editDailyDeposit(id);
	});

	// EDIT FUNCTION
	function editDailyDeposit(id) {
		$.ajax({
			url: `/api/Policymangment/dailyedit/${id}`,
			method: 'GET',
			contentType: 'application/json',
			success: function(response) {
				if (response && response.data) {
					const data = response.data;

					$('#formid').data('id', id); // ✅ Set the ID for update

					$('#planCodeDD').val(data.planCodeDD);
					$('#planNameDD').val(data.planNameDD);
					$('#minimumDeposit').val(data.minimumDeposit);
					$('#rateOfInterest').val(data.rateOfInterest);
					$('#duration').val(data.duration);
					$('#termModeDD').val(data.termModeDD);
					$('#ddterm').val(data.ddterm);
					$('#commissionOnNew').val(data.commissionOnNew);
					$('#renewalCommission').val(data.renewalCommission);
					$('#interestInterval').val(data.interestInterval);
					$('#totalPaid').val(data.totalPaid);
					$('#maturityAmount').val(data.maturityAmount);
					$('#graceDays').val(data.graceDays);
					$('#penaltyRate').val(data.penaltyRate);
					$('#toggle-status-planDD').val(data.statusOfPlan);

					setDropdownValue("#installmentType", data.installmentType);
					setDropdownValue("#flexiblePlan", data.flexiblePlan);
					setDropdownValue("#interestInterval", data.interestInterval);

					$('#saveBtn').hide();
					$('#updateBtn').show();
					$('#deleteBtn').show();
					$('#genrateBtn').hide();
				} else {
					alert('No data found for this ID');
				}
			},
			error: function() {
				alert('Failed to fetch daily deposit details.');
			}
		});
	}

	// UPDATE BUTTON
	$('#updateBtn').on('click', function(e) {
		e.preventDefault();

		const id = $('#formid').data('id');

		if (!id) {
			alert("ID missing. Please select a record by clicking Edit.");
			return;
		}

		const updatedDailyDeposit = getFormData();

		$.ajax({
			url: `/api/Policymangment/dailyupdate/${id}`,
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(updatedDailyDeposit),
			success: function() {
				alert("Daily Deposit updated successfully.");
				location.reload();
			},
			error: function(xhr) {
				console.error('Update error:', xhr.responseText);
				alert("Failed to update Daily Deposit.");
			}
		});
	});

	// GET FORM DATA
	function getFormData() {
		return {
			planCode: $('#planCodeDD').val(),
			planNameDD: $('#planNameDD').val(),
			minimumDeposit: $('#minimumDeposit').val(),
			rateOfInterest: $('#rateOfInterest').val(),
			installmentType: $('#installmentType').val(),
			termModeDD: $('#termModeDD').val(),
			ddterm: $('#ddterm').val(),
			duration: $('#duration').val(),
			commissionOnNew: $('#commissionOnNew').val(),
			renewalCommission: $('#renewalCommission').val(),
			interestInterval: $('#interestInterval').val(),
			totalPaid: $('#totalPaid').val(),
			maturityAmount: $('#maturityAmount').val(),
			flexiblePlan: $('#flexiblePlan').val(),
			graceDays: $('#graceDays').val(),
			penaltyRate: $('#penaltyRate').val(),
			statusOfPlan: $('#toggle-status-planDD').val()
		};
	}

	// Helper for dropdowns
	function setDropdownValue(selector, value) {
		const dropdown = $(selector);
		if (dropdown.find(`option[value="${value}"]`).length) {
			dropdown.val(value);
		} else {
			dropdown.append(`<option value="${value}">${value}</option>`).val(value);
		}
	}


	// DELETE BUTTON (when editing a record)

	$(document).on('click', '.delete-btn', function() {
		alert("delete function called");
		const id = $(this).data('id');

		if (!id) {
			alert("Invalid record. ID not found.");
			return;
		}

		if (!confirm("Are you sure you want to delete this Daily Deposit?")) {
			return;
		}

		$.ajax({
			url: `/api/Policymangment/dailydelete/${id}`,
			type: 'POST',
			contentType: 'application/json',
			success: function(response) {
				alert("deleted");
				alert(response.message || "Deleted successfully.");
				fetchDailyDeposits(); // Refresh table
			},
			error: function(xhr) {
				const message = xhr.responseJSON?.message || "Failed to delete.";
				alert("Error: " + message);
			}
		});
	});

	$("#ddcompoundIntrval").change(function() {

		const minAmount = parseFloat(document.getElementById("minimumDeposit").value);
		alert(minAmount);
		//alert(minAmount);
		const term = parseInt(document.getElementById("ddterm").value);
		const interestRate = parseFloat(document.getElementById("rateOfInterest").value) / 100;
		const compoundInterval = (document.getElementById("interestInterval").value);
		alert(term);
		alert(interestRate);
		alert(compoundInterval);

		let n; // Number of compounding periods per year
		if (compoundInterval === "Daily") n = 365;
		else if (compoundInterval === "Monthly") n = 12;
		else if (compoundInterval === "Quaterly") n = 4;
		else if (compoundInterval === "Half-Yearly") n = 2;
		else if (compoundInterval === "Yearly") n = 1;
		else if (compoundInterval === "On Maturity") n = 1;


		alert(n);
		const totalDeposit = minAmount * term;
		const termInYears = term / 365;
		const maturityAmount = totalDeposit * Math.pow((1 + interestRate / n), n * termInYears);


		document.getElementById("ddtotalDeposit").value = totalDeposit.toFixed(2);
		document.getElementById("ddmaturityAmount").value = maturityAmount.toFixed(2);

	});

	// save the Reccuring deposite
	$("#ReccuringsaveBtn").show();
	$("#ReccuringgenrateBtn").show();
	$("#ReccuringupdateBtn").hide();
	$("#ReccuringdeleteBtn").hide();

	// SAVE BUTTON
	$('#ReccuringsaveBtn').on('click', function(e) {
		e.preventDefault();

		const statusPlanValue = $('#toggle-status-planRD').is(':checked') ? 1 : 0;
		const reccuringDeposite = {
			rd: $('#rd').val(),
			planCodeRD: $('#planCodeRD').val(),
			planNameRD: $('#planNameRD').val(),
			minimumAmountRD: $('#minimumAmountRD').val(),
			rateOfInterestRD: $('#rateOfInterestRD').val(),
			installmentTypeRD: $('#installmentTypeRD').val(),
			durationRD: $('#durationRD').val(),
			termMode: $('#termMode').val(),
			rdterm: $('#rdterm').val(),
			commissionOnNewRD: $('#commissionOnNewRD').val(),
			renewalCommissionRD: $('#renewalCommissionRD').val(),
			componentIntervalRD: $('#componentIntervalRD').val(),
			totalPaidRD: $('#totalPaidRD').val(),
			maturityAmountRD: $('#maturityAmountRD').val(),
			flexiblePlanRD: $('#flexiblePlanRD').val(),
			graceDaysRD: $('#graceDaysRD').val(),
			penltyfineRD: $('#penltyfineRD').val(),
			statusOfPlanRD: statusPlanValue
		};

		// Debug log
		console.log("Sending Recurring Deposit Data:", reccuringDeposite);

		$.ajax({
			url: '/api/Policymangment/recurring-depositsave', // ✅ Corrected endpoint
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(reccuringDeposite),
			success: function(response) {
				alert("Recurring Deposit Saved Successfully");
				location.reload(); // ✅ Reload page after success
			},
			error: function(xhr) {
				console.error("Save Error:", xhr.responseText);
				alert("Something went wrong while saving!");
			}
		});
	});
	// feacth recuuring deposite
	function fetchRecurringDeposits() {
		$.ajax({
			url: "/api/Policymangment/recurring-depositview",  // ✅ Make sure this matches your controller mapping
			type: "GET",
			dataType: "json",
			success: function(response) {
				const data = response.data || [];
				const tableBody = $("#recurringTableBody").empty();

				if (data.length > 0) {
					$.each(data, function(index, item) {
						const row = `
	                        <tr>
	                            <td>${item.planCodeRD || ''}</td>
	                            <td>${item.planNameRD || ''}</td>
	                            <td>${item.minimumAmountRD || ''}</td>
	                            <td>${item.rateOfInterestRD || ''}</td>
	                            <td>${item.installmentTypeRD || ''}</td>
	                            <td>${item.durationRD || ''}</td>
	                            <td>${item.termMode || ''}</td>
	                            <td>${item.rdterm || ''}</td>
	                            <td>${item.commissionOnNewRD || ''}</td>
	                            <td>${item.renewalCommissionRD || ''}</td>
	                            <td>${item.componentIntervalRD || ''}</td>
	                            <td>${item.totalPaidRD || ''}</td>
	                            <td>${item.maturityAmountRD || ''}</td>
	                            <td>${item.flexiblePlanRD || ''}</td>
	                            <td>${item.graceDaysRD || ''}</td>
	                            <td>${item.penltyfineRD || ''}</td>
	                            <td>${item.statusOfPlanRD || ''}</td>
	                            <td class="d-flex" style="gap: .7rem;">
	                                <button class="iconbutton reccuringedit-btn" data-id="${item.id}">
	                                    <i class="fa-solid fa-pen-to-square text-success"></i>
	                                </button>
	                                <button class="iconbutton reccuringdelete-btn" data-id="${item.id}">
	                                    <i class="fa-solid fa-trash text-danger"></i>
	                                </button>
	                            </td>
	                        </tr>`;
						tableBody.append(row);
					});
				} else {
					tableBody.html(`<tr><td colspan="17" class="text-center text-warning">No data found.</td></tr>`);
				}
			},
			error: function() {
				$("#recurringTableBody").html(`<tr><td colspan="17" class="text-center text-danger">Something went wrong.</td></tr>`);
			}
		});
	}

	fetchRecurringDeposits();

	$(document).on('click', '.reccuringedit-btn', function() {
		const id = $(this).data('id');
		editRecurringDeposit(id);
	});
	// get by id reccuring deposite
	function editRecurringDeposit(id) {
		console.log("🔍 Fetching Recurring Deposit with ID:", id);

		$.ajax({
			url: `/api/Policymangment/recurringedit/${id}`,
			method: 'GET',
			contentType: 'application/json',
			success: function(response) {
				if (response && response.data) {
					const data = response.data;

					$('#recurringformid').data('id', id);

					// Fill fields
					Object.keys(data).forEach(key => {
						$(`#${key}`).val(data[key]);
						setDropdownValue(`#${key}`, data[key]);
					});

					$('#ReccuringsaveBtn').hide();
					$('#ReccuringupdateBtn').show();
					$('#ReccuringdeleteBtn').show();
					$('#ReccuringgenrateBtn').hide();
				} else {
					alert('⚠️ No data found for this ID');
				}
			},
			error: function(xhr) {
				console.error("❌ Error fetching RD details:", xhr);
				alert(`Failed to fetch recurring deposit details.\nStatus: ${xhr.status}`);
			}
		});
	}
	// UPDATE BUTTON for recuuring deposite code
	$('#ReccuringupdateBtn').on('click', function(e) {
		e.preventDefault();

		const id = $('#recurringformid').data('id');

		if (!id) {
			alert("ID missing. Please select a record by clicking Edit.");
			return;
		}

		const updatedRecurringDeposit = getRDFormData();

		$.ajax({
			url: `/api/Policymangment/recurringupdate/${id}`,
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(updatedRecurringDeposit),
			success: function() {
				alert("Recurring Deposit updated successfully.");
				location.reload();
			},
			error: function(xhr) {
				console.error('Update error:', xhr.responseText);
				alert("Failed to update Recurring Deposit.");
			}
		});
	});
	// Get form Data
	function getRDFormData() {
		return {
			planCodeRD: $('#planCodeRD').val(),
			planNameRD: $('#planNameRD').val(),
			minimumAmountRD: $('#minimumAmountRD').val(),
			rateOfInterestRD: $('#rateOfInterestRD').val(),
			installmentTypeRD: $('#installmentTypeRD').val(),
			durationRD: $('#durationRD').val(),
			termMode: $('#termMode').val(),
			rdterm: $('#rdterm').val(),
			commissionOnNewRD: $('#commissionOnNewRD').val(),
			renewalCommissionRD: $('#renewalCommissionRD').val(),
			componentIntervalRD: $('#componentIntervalRD').val(),
			totalPaidRD: $('#totalPaidRD').val(),
			maturityAmountRD: $('#maturityAmountRD').val(),
			flexiblePlanRD: $('#flexiblePlanRD').val(),
			graceDaysRD: $('#graceDaysRD').val(),
			penltyfineRD: $('#penltyfineRD').val(),
			statusOfPlanRD: $('#toggle-status-planRD').val()
		};
	}

	function setDropdownValue(selector, value) {
		const dropdown = $(selector);
		if (dropdown.find(`option[value="${value}"]`).length) {
			dropdown.val(value);
		} else {
			dropdown.append(`<option value="${value}">${value}</option>`).val(value);
		}
	}
	// DELETE BUTTON Reccuring Deposite
	$(document).on('click', '.reccuringdelete-btn', function() {
		const id = $(this).data('id');

		if (!id) {
			alert("Invalid record. ID not found.");
			return;
		}

		if (!confirm("Are you sure you want to delete this Recurring Deposit?")) {
			return;
		}

		$.ajax({
			url: `/api/Policymangment/recurringdelete/${id}`,
			type: 'POST',
			contentType: 'application/json',
			success: function(response) {
				alert(response.message || "Deleted successfully.");
				fetchRecurringDeposits(); // Table reload logic here
			},
			error: function(xhr) {
				const message = xhr.responseJSON?.message || "Failed to delete.";
				alert("Error: " + message);
			}
		});
	});

	// save ajax code for fixed deposite
	// Initial Button Setup
	$("#FixedsaveBtn").show();
	$("#FixedgenrateBtn").show();
	$("#FixedupdateBtn").hide();


	// SAVE BUTTON
	$('#FixedsaveBtn').on('click', function(e) {
		e.preventDefault();

		const statusPlanValue = $('#toggle-status-planFD').is(':checked') ? 1 : 0;

		const fixedDeposit = {
			fd: $('#fd').val(),
			planCodeFD: $('#planCodeFD').val(),
			planNameFD: $('#planNameFD').val(),
			minimumAmountFD: $('#minimumAmountFD').val(),
			rateOfInterestFD: $('#rateOfInterestFD').val(),
			termModeFD: $('#termModeFD').val(),
			fdterm: $('#fdterm').val(),                      // ✅ fixed
			durationFD: $('#durationFD').val(),
			installmentTypeFD: $('#installmentTypeFD').val(),
			commissionOnNewFD: $('#commissionOnNewFD').val(),
			renewalCommissionFD: $('#renewalCommissionFD').val(),
			componentIntervalFD: $('#componentIntervalFD').val(),
			totalPaidFD: $('#totalPaidFD').val(),            // ✅ already correct
			maturityAmountFD: $('#maturityAmountFD').val(),
			flexiblePlanFD: $('#flexiblePlanFD').val(),
			graceDaysFD: $('#graceDaysFD').val(),
			penltyfineFD: $('#penltyfineFD').val(),
			statusOfPlanFD: statusPlanValue
		};

		console.log("Sending FD Data:", fixedDeposit);

		$.ajax({
			url: '/api/Policymangment/fixed-depositsave',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(fixedDeposit),
			success: function(response) {
				alert("Fixed Deposit Saved Successfully");
				location.reload(); // Refresh UI
			},
			error: function(xhr) {
				console.error("Save Error:", xhr.responseText);
				alert("Something went wrong while saving!");
			}
		});
	});
	// featch Fixed deposite
	function fetchFixedDeposits() {
		$.ajax({
			url: "/api/Policymangment/fixed-depositview",  // ✅ Controller mapping बरोबर आहे याची खात्री कर
			type: "GET",
			dataType: "json",
			success: function(response) {
				const data = response.data || [];
				const tableBody = $("#fixedTableBody").empty();

				if (data.length > 0) {
					$.each(data, function(index, item) {
						const row = `
                        <tr>
						<td>${item.planCodeFD || ''}</td>
						                           <td>${item.planNameFD || ''}</td>
						                           <td>${item.minimumAmountFD || ''}</td>
						                           <td>${item.rateOfInterestFD || ''}</td>
						                           <td>${item.installmentTypeFD || ''}</td>
						                           <td>${item.durationFD || ''}</td>
						                           <td>${item.termModeFD || ''}</td>
						                           <td>${item.fdterm || ''}</td>
						                           <td>${item.componentIntervalFD || ''}</td>
						                           <td>${item.totalPaidFD || ''}</td>
						                           <td>${item.maturityAmountFD || ''}</td>
						                           <td>${item.flexiblePlanFD || ''}</td>
						                           <td>${item.graceDaysFD || ''}</td>
						                           <td>${item.penltyfineFD || ''}</td>
						                           <td>${item.commissionOnNewFD || ''}</td>
						                           <td>${item.renewalCommissionFD || ''}</td>
						                           <td>${item.statusOfPlanFD || ''}</td>
                            <td class="d-flex" style="gap: .7rem;">
                                <button class="iconbutton fixededit-btn" data-id="${item.id}">
                                    <i class="fa-solid fa-pen-to-square text-success"></i>
                                </button>
                                <button class="iconbutton fixeddelete-btn" data-id="${item.id}">
                                    <i class="fa-solid fa-trash text-danger"></i>
                                </button>
                            </td>
                        </tr>`;
						tableBody.append(row);
					});
				} else {
					tableBody.html(`<tr><td colspan="17" class="text-center text-warning">No data found.</td></tr>`);
				}
			},
			error: function() {
				$("#fixedTableBody").html(`<tr><td colspan="17" class="text-center text-danger">Something went wrong.</td></tr>`);
			}
		});
	}

	fetchFixedDeposits();  // Call once page loads

	$(document).on('click', '.fixededit-btn', function() {
		const id = $(this).data('id');
		editFixedDeposit(id);
	});
	function editFixedDeposit(id) {
		console.log("🔍 Fetching Fixed Deposit with ID:", id);

		$.ajax({
			url: `/api/Policymangment/fixededit/${id}`,
			method: 'GET',
			contentType: 'application/json',
			success: function(response) {
				if (response && response.data) {
					const data = response.data;

					$('#fixedformid').data('id', id);

					// Fill form fields
					Object.keys(data).forEach(key => {
						$(`#${key}`).val(data[key]);
						setDropdownValue(`#${key}`, data[key]);  // Reuse same dropdown setter
					});

					$('#FixedsaveBtn').hide();
					$('#FixedupdateBtn').show();
					$('#FixeddeleteBtn').show();
					$('#FixedgenrateBtn').hide();
				} else {
					alert('⚠️ No data found for this ID');
				}
			},
			error: function(xhr) {
				console.error("❌ Error fetching FD details:", xhr);
				alert(`Failed to fetch fixed deposit details.\nStatus: ${xhr.status}`);
			}
		});
	}
	$('#FixedupdateBtn').on('click', function(e) {
		e.preventDefault();

		const id = $('#fixedformid').data('id');

		if (!id) {
			alert("ID missing. Please select a record by clicking Edit.");
			return;
		}

		const updatedFixedDeposit = getFDFormData();

		$.ajax({
			url: `/api/Policymangment/fixedupdate/${id}`,
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(updatedFixedDeposit),
			success: function() {
				alert("Fixed Deposit updated successfully.");
				location.reload();
			},
			error: function(xhr) {
				console.error('Update error:', xhr.responseText);
				alert("Failed to update Fixed Deposit.");
			}
		});
	});
	// get all the data from the database
	function getFDFormData() {
		return {
			planCodeFD: $('#planCodeFD').val(),
			planNameFD: $('#planNameFD').val(),
			minimumAmountFD: $('#minimumAmountFD').val(),
			rateOfInterestFD: $('#rateOfInterestFD').val(),
			installmentTypeFD: $('#installmentTypeFD').val(),
			durationFD: $('#durationFD').val(),
			termModeFD: $('#termModeFD').val(),
			fdterm: $('#fdterm').val(),
			componentIntervalFD: $('#componentIntervalFD').val(),
			totalPaidFD: $('#totalPaidFD').val(),
			maturityAmountFD: $('#maturityAmountFD').val(),
			flexiblePlanFD: $('#flexiblePlanFD').val(),
			graceDaysFD: $('#graceDaysFD').val(),
			commissionOnNewFD: $('#commissionOnNewFD').val(),
			penltyfineFD: $('#penltyfineFD').val(),
			renewalCommissionFD: $('#renewalCommissionFD').val(),
			statusOfPlanFD: $('#toggle-status-planFD').val()
		};
	}
	$(document).on('click', '.fixeddelete-btn', function() {
		const id = $(this).data('id');

		if (!id) {
			alert("Invalid record. ID not found.");
			return;
		}

		if (!confirm("Are you sure you want to delete this Fixed Deposit?")) {
			return;
		}

		$.ajax({
			url: `/api/Policymangment/fixeddelete/${id}`,
			type: 'POST',
			contentType: 'application/json',
			success: function(response) {
				alert(response.message || "Deleted successfully.");
				fetchFixedDeposits(); // Refresh table after delete
			},
			error: function(xhr) {
				const message = xhr.responseJSON?.message || "Failed to delete.";
				alert("Error: " + message);
			}
		});
	});
	function setDropdownValue(selector, value) {
		const dropdown = $(selector);
		if (dropdown.find(`option[value="${value}"]`).length) {
			dropdown.val(value);
		} else {
			dropdown.append(`<option value="${value}">${value}</option>`).val(value);
		}
	}

	//Mis deposite save
	$("#missaveBtn").show();
	$("#misgenrateBtn").show();
	$("#misdupdateBtn").hide();



	$('#missaveBtn').on('click', function(e) {
		e.preventDefault();

		const statusPlanValue = $('#toggle-status-planMIS').is(':checked') ? 1 : 0;

		const misDeposit = {
			mis: $('#mis').val(),
			planCodeMD: $('#planCodeMD').val(),
			planNameMD: $('#planNameMD').val(),
			minimumAmountMD: $('#minimumAmountMD').val(),
			rateOfInterestMD: $('#rateOfInterestMD').val(),
			installmentTypeMD: $('#installmentTypeMD').val(),
			termModeMD: $('#termModeMD').val(),
			misTerm: $('#misTerm').val(),
			durationMD: $('#durationMD').val(),
			commissionOnNewMD: $('#commissionOnNewMD').val(),
			renewalCommissionMD: $('#renewalCommissionMD').val(),
			MISIntervalMD: $('#MISIntervalMD').val(),
			MISInterestMD: $('#MISInterestMD').val(),
			maturityAmountMD: $('#maturityAmountMD').val(),
			flexiblePlanMD: $('#flexiblePlanMD').val(),
			graceDaysMD: $('#graceDaysMD').val(),
			penaltyRateMD: $('#penaltyRateMD').val(),
			statusOfPlanMDRD2: statusPlanValue
		};

		console.log("Sending MIS Data:", misDeposit);

		$.ajax({
			url: '/api/Policymangment/mis-deposit/save',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(misDeposit),
			success: function(response) {
				alert("MIS Deposit Saved Successfully");
				location.reload();
			},
			error: function(xhr) {
				console.error("Save Error:", xhr.responseText);
				alert("Something went wrong while saving MIS Deposit!");
			}
		});
	});
	// FETCH MIS DEPOSITS
	function fetchMISDeposits() {
		$.ajax({
			url: "/api/Policymangment/mis-deposit/view",
			type: "GET",
			dataType: "json",
			success: function(response) {
				const data = response.data || [];
				const tableBody = $("#misdepositeTableBody").empty();

				if (data.length > 0) {
					$.each(data, function(index, item) {
						const row = `
						<tr>
						<td>${item.planCodeMD || ''}</td>                 
						<td>${item.planNameMD || ''}</td>                 
						<td>${item.minimumAmountMD || ''}</td>            
						<td>${item.rateOfInterestMD || ''}</td>           
						<td>${item.installmentTypeMD || ''}</td>          
						<td>${item.termModeMD || ''}</td>                 
						<td>${item.misTerm || ''}</td>                     
						<td>${item.durationMD || ''}</td>                 
						<td>${item.commissionOnNewMD || ''}</td>         
						<td>${item.renewalCommissionMD || ''}</td>       
						<td>${item.MISIntervalMD || ''}</td>              
						<td>${item.MISInterestMD || ''}</td>              
						<td>${item.maturityAmountMD || ''}</td>          
						<td>${item.flexiblePlanMD || ''}</td>             
						<td>${item.graceDaysMD || ''}</td>                
						<td>${item.penaltyRateMD || ''}</td>             
						<td>${item.statusOfPlanMDRD2 || ''}</td>  
							<td class="d-flex" style="gap: .7rem;">
								<button class="iconbutton misedit-btn" data-id="${item.id}">
									<i class="fa-solid fa-pen-to-square text-success"></i>
								</button>
								<button class="iconbutton misdelete-btn" data-id="${item.id}">
									<i class="fa-solid fa-trash text-danger"></i>
								</button>
							</td>
						</tr>`;
						tableBody.append(row);
					});
				} else {
					tableBody.html(`<tr><td colspan="17" class="text-center text-warning">No data found.</td></tr>`);
				}
			},
			error: function() {
				$("#misdepositeTableBody").html(`<tr><td colspan="17" class="text-center text-danger">Something went wrong.</td></tr>`);
			}
		});
	}

	fetchMISDeposits();

	// Fix this line (change `.misdelete-btn` to `.misedit-btn`)
	$(document).on('click', '.misedit-btn', function() {
		const id = $(this).data('id');
		editMISDeposit(id);
	});


	function editMISDeposit(id) {
		$.ajax({
			url: `/api/Policymangment/misedit/${id}`,
			method: 'GET',
			contentType: 'application/json',
			success: function(response) {
				if (response && response.data) {
					const data = response.data;
					console.log("Editing ID:", id, data); // ✅ log

					$('#misdepositeid').data('id', id); // ✅ Consistent ID holder

					$('#planCodeMD').val(data.planCodeMD);
					$('#planNameMD').val(data.planNameMD);
					$('#minimumAmountMD').val(data.minimumAmountMD);
					$('#rateOfInterestMD').val(data.rateOfInterestMD);
					setDropdownValue("#installmentTypeMD", data.installmentTypeMD);
					$('#termModeMD').val(data.termModeMD);
					$('#misTerm').val(data.misTerm);
					$('#durationMD').val(data.durationMD);
					$('#commissionOnNewMD').val(data.commissionOnNewMD);
					$('#renewalCommissionMD').val(data.renewalCommissionMD);
					setDropdownValue("#MISIntervalMD", data.MISIntervalMD);
					$('#MISInterestMD').val(data.MISInterestMD);
					$('#maturityAmountMD').val(data.maturityAmountMD);
					setDropdownValue("#flexiblePlanMD", data.flexiblePlanMD);
					$('#graceDaysMD').val(data.graceDaysMD);
					$('#penltyfineMD').val(data.penltyfineMD);
					$('#toggle-status-planMIS').val(data.statusOfPlanMDRD2);

					$("#missaveBtn").hide();
					$("#misgenrateBtn").hide();
					$("#misdupdateBtn").show();
				} else {
					alert('No data found for this ID');
				}
			},
			error: function() {
				alert('Failed to fetch MIS Deposit details.');
			}
		});
	}
	//update code of the mis deposite
	$('#misdupdateBtn').on('click', function(e) {
		e.preventDefault();
		const id = $('#misdepositeid').data('id'); // ✅ fix here

		if (!id) {
			alert("ID missing. Please select a record to update.");
			return;
		}

		const updatedMIS = getMISFormData();

		$.ajax({
			url: `/api/Policymangment/misupdate/${id}`,
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(updatedMIS),
			success: function() {
				alert("MIS Deposit updated successfully.");
				location.reload();
			},
			error: function(xhr) {
				console.error('Update error:', xhr.responseText);
				alert("Failed to update MIS Deposit.");
			}
		});
	});

	// DELETE
	// DELETE HANDLER
	$(document).on('click', '.misdelete-btn', function() {
		const id = $(this).data('id');

		if (!id) {
			alert("Invalid record ID.");
			return;
		}

		// Confirmation prompt
		if (!confirm("Are you sure you want to delete this MIS Deposit?")) {
			return;
		}

		// Perform AJAX DELETE request
		$.ajax({
			url: `/api/Policymangment/misdelete/${id}`,
			type: 'POST',
			contentType: 'application/json',
			success: function(response) {
				alert(response.message || "MIS Deposit deleted successfully.");
				fetchMISDeposits(); // Refresh the table
			},
			error: function(xhr) {
				const message = xhr.responseJSON?.message || "Failed to delete the MIS Deposit.";
				alert("Error: " + message);
				console.error("Delete error:", xhr.responseText);
			}
		});
	});

	// HELPER FUNCTION TO GET FORM DATA
	function getMISFormData() {
		return {
			planCodeMD: $('#planCodeMD').val(),
			planNameMD: $('#planNameMD').val(),
			minimumAmountMD: $('#minimumAmountMD').val(),
			rateOfInterestMD: $('#rateOfInterestMD').val(),
			installmentTypeMD: $('#installmentTypeMD').val(),
			termModeMD: $('#termModeMD').val(),
			misTerm: $('#misTerm').val(),
			durationMD: $('#durationMD').val(),
			commissionOnNewMD: $('#commissionOnNewMD').val(),
			renewalCommissionMD: $('#renewalCommissionMD').val(),
			MISIntervalMD: $('#MISIntervalMD').val(),
			MISInterestMD: $('#MISInterestMD').val(),
			maturityAmountMD: $('#maturityAmountMD').val(),
			flexiblePlanMD: $('#flexiblePlanMD').val(),
			graceDaysMD: $('#graceDaysMD').val(),
			penaltyRateMD: $('#penaltyRateMD').val(),
			statusOfPlanMDRD2: $('#toggle-status-planMIS').val()

		};
	}
	function setDropdownValue(selector, value) {
		const dropdown = $(selector);
		if (dropdown.find(`option[value="${value}"]`).length) {
			dropdown.val(value);
		} else {
			dropdown.append(`<option value="${value}">${value}</option>`).val(value);
		}
	}




});

document.addEventListener('DOMContentLoaded', function() {
	const toggles = document.querySelectorAll('.toggle__input');

	toggles.forEach((toggle) => {
		updateToggleColor(toggle);

		toggle.addEventListener('change', () => {
			updateToggleColor(toggle);
			console.log(`${toggle.dataset.toggleType} is now ${toggle.checked}`);
		});
	});

	function updateToggleColor(input) {
		const label = input.nextElementSibling;
		if (label) {
			label.style.backgroundColor = input.checked ? '#28a745' : '#ccc';
		}
	}
});