$(document).ready(function () {
	$("#saveBtn").show();
		$("#genrateBtn").show();
	    $("#updateBtn").hide();
	    $("#deleteBtn").hide();

	    // SAVE BUTTON
		$('#saveBtn').on('click', function (e) {
		    e.preventDefault();

		    const dailyDeposit = {
		        planCode: $('#planCode').val(),
		        minimumDeposit: $('#minimumDeposit').val(),
		        rateOfInterest: $('#rateOfInterest').val(),
		        installmentType: $('#installmentType').val(),    // ⬅️ Dropdown value
		        duration: $('#duration').val(),
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
		        success: function (response) {
		            alert("Daily Deposit Saved Successfully");
		            location.reload(); // refresh table or UI
		        },
		        error: function (xhr) {
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
            success: function (response) {
                const data = response.data || [];
                const tableBody = $("#depositTableBody").empty();

                if (data.length > 0) {
                    $.each(data, function (index, item) {
                        const row = `
                            <tr>
                                <td>${item.planCode || ''}</td>
                                <td>${item.minimumDeposit || ''}</td>
                                <td>${item.rateOfInterest || ''}</td>
                                <td>${item.installmentType || ''}</td>
                                <td>${item.duration || ''}</td>
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
            error: function () {
                $("#depositTableBody").html(`<tr><td colspan="16" class="text-center text-danger">Something went wrong.</td></tr>`);
            }
        });
    }

    fetchDailyDeposits();

    // DELEGATED EVENT for edit button
    $('#depositTableBody').on('click', '.edit-btn', function () {
        const id = $(this).data('id');
        editDailyDeposit(id);
    });

    // EDIT FUNCTION
    function editDailyDeposit(id) {
        $.ajax({
            url: `/api/dailyedit/${id}`,
            method: 'GET',
            contentType: 'application/json',
            success: function (response) {
                if (response && response.data) {
                    const data = response.data;

                    $('#formid').data('id', id); // ✅ Set the ID for update

                    $('#planCode').val(data.planCode);
                    $('#minimumDeposit').val(data.minimumDeposit);
                    $('#rateOfInterest').val(data.rateOfInterest);
                    $('#duration').val(data.duration);
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
            error: function () {
                alert('Failed to fetch daily deposit details.');
            }
        });
    }

    // UPDATE BUTTON
    $('#updateBtn').on('click', function (e) {
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
            success: function () {
                alert("Daily Deposit updated successfully.");
                location.reload();
            },
            error: function (xhr) {
                console.error('Update error:', xhr.responseText);
                alert("Failed to update Daily Deposit.");
            }
        });
    });

    // GET FORM DATA
    function getFormData() {
        return {
            planCode: $('#planCode').val(),
            minimumDeposit: $('#minimumDeposit').val(),
            rateOfInterest: $('#rateOfInterest').val(),
            installmentType: $('#installmentType').val(),
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
	//this is my deposite delete code
	
	// DELETE BUTTON (when editing a record)
	// Delegated event listener for delete button
	$(document).on('click', '.delete-btn', function () {
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
	        success: function (response) {
	            alert(response.message || "Deleted successfully.");
	            fetchDailyDeposits(); // Refresh table
	        },
	        error: function (xhr) {
	            const message = xhr.responseJSON?.message || "Failed to delete.";
	            alert("Error: " + message);
	        }
	    });
	});

});
