$(document).ready(function() {
	$("#saveBtn").show();
	$("#genrateBtn").show();
	$("#updateBtn").hide();
	$("#deleteBtn").hide();

	// SAVE BUTTON
	$('#saveBtn').on('click', function(e) {
		e.preventDefault();

		const dailyDeposit = {
			planCode: $('#planCode').val(),
			planNameDD: $('#planNameDD').val(),
			minimumDeposit: $('#minimumDeposit').val(),
			rateOfInterest: $('#rateOfInterest').val(),
			installmentType: $('#installmentType').val(),    // ⬅️ Dropdown value
			duration: $('#duration').val(),
			termModeDD: $('#termModeDD').val(),
			termDD: $('#termDD').val(),
			commissionOnNew: $('#commissionOnNew').val(),
			renewalCommission: $('#renewalCommission').val(),
			interestInterval: $('#interestInterval').val(), // ⬅️ Dropdown value
			totalPaid: $('#totalPaid').val(),
			maturityAmount: $('#maturityAmount').val(),
			flexiblePlan: $('#flexiblePlan').val(),          // ⬅️ Dropdown value
			graceDays: $('#graceDays').val(),
			penaltyRate: $('#penaltyRate').val(),
			statusOfPlan: $('#statusOfPlan').val()
		};

		// Optional: Debug log before sending
		console.log("Sending Data:", dailyDeposit);

		$.ajax({
			url: '/api/daily-depositsave',
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
	function fetchDailyDeposits() {
		$.ajax({
			url: "/api/daily-deposit/view",
			type: "GET",
			dataType: "json",
			success: function(response) {
				const data = response.data || [];
				const tableBody = $("#depositTableBody").empty();

				if (data.length > 0) {
					$.each(data, function(index, item) {
						const row = `
                            <tr>
                                <td>${item.planCode || ''}</td>
								<td>${item.planNameDD || ''}</td>
								
                                <td>${item.minimumDeposit || ''}</td>
                                <td>${item.rateOfInterest || ''}</td>
                                <td>${item.installmentType || ''}</td>
                                <td>${item.duration || ''}</td>
								<td>${item.termModeDD || ''}</td>
								<td>${item.termDD || ''}</td>
                                <td>${item.commissionOnNew || ''}</td>
                                <td>${item.renewalCommission || ''}</td>
                                <td>${item.interestInterval || ''}</td>
                                <td>${item.totalPaid || ''}</td>
                                <td>${item.maturityAmount || ''}</td>
                                <td>${item.flexiblePlan || ''}</td>
                                <td>${item.graceDays || ''}</td>
                                <td>${item.penaltyRate || ''}</td>
                                <td>${item.statusOfPlan || ''}</td>
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
					tableBody.html(`<tr><td colspan="16" class="text-center text-warning">No data found.</td></tr>`);
				}
			},
			error: function() {
				$("#depositTableBody").html(`<tr><td colspan="16" class="text-center text-danger">Something went wrong.</td></tr>`);
			}
		});
	}

	fetchDailyDeposits();

	// DELEGATED EVENT for edit button
	$('#depositTableBody').on('click', '.edit-btn', function() {
		const id = $(this).data('id');
		editDailyDeposit(id);
	});

	// EDIT FUNCTION
	function editDailyDeposit(id) {
		$.ajax({
			url: `/api/dailyedit/${id}`,
			method: 'GET',
			contentType: 'application/json',
			success: function(response) {
				if (response && response.data) {
					const data = response.data;

					$('#formid').data('id', id); // ✅ Set the ID for update

					$('#planCode').val(data.planCode);
					$('#planNameDD').val(data.planNameDD);
					$('#minimumDeposit').val(data.minimumDeposit);
					$('#rateOfInterest').val(data.rateOfInterest);
					$('#duration').val(data.duration);
					$('#termModeDD').val(data.termModeDD);
					$('#termDD').val(data.termDD);
					$('#commissionOnNew').val(data.commissionOnNew);
					$('#renewalCommission').val(data.renewalCommission);
					$('#interestInterval').val(data.interestInterval);
					$('#totalPaid').val(data.totalPaid);
					$('#maturityAmount').val(data.maturityAmount);
					$('#graceDays').val(data.graceDays);
					$('#penaltyRate').val(data.penaltyRate);
					$('#statusOfPlan').val(data.statusOfPlan);

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
			url: `/api/dailyupdate/${id}`,
			type: 'PUT',
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
			planCode: $('#planCode').val(),
			planNameDD: $('#planNameDD').val(),
			minimumDeposit: $('#minimumDeposit').val(),
			rateOfInterest: $('#rateOfInterest').val(),
			installmentType: $('#installmentType').val(),
			termModeDD: $('#termModeDD').val(),
			termDD: $('#termDD').val(),
			duration: $('#duration').val(),
			commissionOnNew: $('#commissionOnNew').val(),
			renewalCommission: $('#renewalCommission').val(),
			interestInterval: $('#interestInterval').val(),
			totalPaid: $('#totalPaid').val(),
			maturityAmount: $('#maturityAmount').val(),
			flexiblePlan: $('#flexiblePlan').val(),
			graceDays: $('#graceDays').val(),
			penaltyRate: $('#penaltyRate').val(),
			statusOfPlan: $('#statusOfPlan').val()
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
		const id = $(this).data('id');

		if (!id) {
			alert("Invalid record. ID not found.");
			return;
		}

		if (!confirm("Are you sure you want to delete this Daily Deposit?")) {
			return;
		}

		$.ajax({
			url: `/api/dailydelete/${id}`,
			type: 'DELETE',
			contentType: 'application/json',
			success: function(response) {
				alert(response.message || "Deleted successfully.");
				fetchDailyDeposits(); // Refresh table
			},
			error: function(xhr) {
				const message = xhr.responseJSON?.message || "Failed to delete.";
				alert("Error: " + message);
			}
		});
	});

	// save the Reccuring deposite
	$("#ReccuringsaveBtn").show();
	$("#ReccuringgenrateBtn").show();
	$("#ReccuringupdateBtn").hide();
	$("#ReccuringdeleteBtn").hide();

	// SAVE BUTTON
	$('#ReccuringsaveBtn').on('click', function(e) {
		e.preventDefault();

		const reccuringDeposite = {
			planCodeRD: $('#planCodeRD').val(),
			planNameRD: $('#planNameRD').val(),
			minimumAmountRD: $('#minimumAmountRD').val(),
			rateOfInterestRD: $('#rateOfInterestRD').val(),
			installmentTypeRD: $('#installmentTypeRD').val(),
			durationRD: $('#durationRD').val(),
			termMode: $('#termMode').val(),
			term: $('#term').val(),
			commissionOnNewRD: $('#commissionOnNewRD').val(),
			renewalCommissionRD: $('#renewalCommissionRD').val(),
			componentIntervalRD: $('#componentIntervalRD').val(),
			totalPaidRD: $('#totalPaidRD').val(),
			maturityAmountRD: $('#maturityAmountRD').val(),
			flexiblePlanRD: $('#flexiblePlanRD').val(),
			graceDaysRD: $('#graceDaysRD').val(),
			penltyfineRD: $('#penltyfineRD').val(),
			statusOfPlanRD: $('#statusOfPlanRD').val()
		};

		// Debug log
		console.log("Sending Recurring Deposit Data:", reccuringDeposite);

		$.ajax({
			url: '/api/recurring-depositsave', // ✅ Corrected endpoint
			type: 'GET',
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
			url: "/api/recurring-depositview",  // ✅ Make sure this matches your controller mapping
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
	                            <td>${item.term || ''}</td>
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
			url: `/api/recurringedit/${id}`,
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
			url: `/api/recurringupdate/${id}`,
			type: 'PUT',
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
			term: $('#term').val(),
			commissionOnNewRD: $('#commissionOnNewRD').val(),
			renewalCommissionRD: $('#renewalCommissionRD').val(),
			componentIntervalRD: $('#componentIntervalRD').val(),
			totalPaidRD: $('#totalPaidRD').val(),
			maturityAmountRD: $('#maturityAmountRD').val(),
			flexiblePlanRD: $('#flexiblePlanRD').val(),
			graceDaysRD: $('#graceDaysRD').val(),
			penltyfineRD: $('#penltyfineRD').val(),
			statusOfPlanRD: $('#statusOfPlanRD').val()
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
			url: `/api/recurringdelete/${id}`,
			type: 'DELETE',
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

		const fixedDeposit = {
			planCodeFD: $('#planCodeFD').val(),
			planNameFD: $('#planNameFD').val(),
			minimumAmountFD: $('#minimumAmountFD').val(),
			rateOfInterestFD: $('#rateOfInterestFD').val(),
			termModeFD: $('#termModeFD').val(),
			termFD: $('#termFD').val(),                      // ✅ fixed
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
			statusOfPlanFD: $('#statusOfPlanFD').val()
		};

		console.log("Sending FD Data:", fixedDeposit);

		$.ajax({
			url: '/api/fixed-depositsave',
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
			url: "/api/fixed-depositview",  // ✅ Controller mapping बरोबर आहे याची खात्री कर
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
						                           <td>${item.termFD || ''}</td>
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
			url: `/api/fixededit/${id}`,
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
			url: `/api/fixedupdate/${id}`,
			type: 'PUT',
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
			termFd: $('#termFd').val(),
			componentIntervalFD: $('#componentIntervalFD').val(),
			totalPaidFD: $('#totalPaidFD').val(),
			maturityAmountFD: $('#maturityAmountFD').val(),
			flexiblePlanFD: $('#flexiblePlanFD').val(),
			graceDaysFD: $('#graceDaysFD').val(),
			commissionOnNewFD: $('#commissionOnNewFD').val(),
			penltyfineFD: $('#penltyfineFD').val(),
			renewalCommissionFD: $('#renewalCommissionFD').val(),
			statusOfPlanFD: $('#statusOfPlanFD').val()
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
			url: `/api/fixeddelete/${id}`,
			type: 'DELETE',
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

//Mis deposite 



});
