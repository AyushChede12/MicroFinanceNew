// janvi : search In Th eFinance Onboarding on Table
let allFinancialConsultantData = []; 

function searchInTheFinanceOnboarding() {
	$.ajax({
		url: "/api/financialconsultant/getUnapprovedFinancialConsultants",
		type: "POST",
		contentType: "application/json",
		success: function(response) {
			console.log("API Response:", response);
			if (response.status === "OK" && Array.isArray(response.data)) {
				allFinancialConsultantData = response.data;
				renderTable(allFinancialConsultantData);
			} else {
				alert("No member data found.");
			}
		},
		error: function(xhr, status, error) {
			console.error("Error fetching data:", error);
			alert("Failed to load data.");
		}
	});
}

function renderTable(data) {
	const tbody = $(".datatable tbody");
	tbody.empty();

	data.forEach((item, index) => {
		const row = `
            <tr style="font-family: 'Poppins', sans-serif;">
                <td><input type="checkbox" class="member-checkbox" value="${item.id}"></td>
				<td>${index + 1}</td>
				<td>${item.customerName || '-'}</td>
				<td>${item.financialCode || '-'}</td>
				<td>${item.dob || '-'}</td>
				<td>${item.age || '-'}</td>
				<td>${item.address || '-'}</td>
				<td>${item.academicBackground || '-'}</td>
				<td>${item.contactNo || '-'}</td>
				<td>${item.profession || '-'}</td>
				<td>${item.joiningDate || '-'}</td>
				<td>${item.modeofPayment || '-'}</td>
            </tr>
        `;
		tbody.append(row);
	});
}




//janvi:financial Code Dropdown
function financialCodeDropdown() {
$.ajax({
		url: "/api/financialconsultant/getAllFinancialConsultantDetails",
		type: "POST",
		success: function (response) {
			if (response.status === "OK" && response.data) {
				$("#financialCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function (item) {
					$("#financialCode").append(`<option value='${item.financialCode}'>${item.financialCode}</option>`);
				});
			} else {
				alert("No financial codes found.");
			}
		},
		error: function () {
			alert("Failed to load financial codes.");
		}
	});
}


function filterFinancialCodeData() {
	const selectedCode = $('#financialCode').val();
	const fromDateVal = $('#fromDate').val();
	const toDateVal = $('#toDate').val();

	const fromDate = fromDateVal ? new Date(fromDateVal) : null;
	const toDate = toDateVal ? new Date(toDateVal) : null;

	const filtered = allFinancialConsultantData.filter(item => {
		const financialCode = item.financialCode;
		const joiningDate = item.joiningDate ? new Date(item.joiningDate) : null;

		const matchesCode = selectedCode ? financialCode === selectedCode : true;
		const matchesFrom = fromDate && joiningDate ? joiningDate >= fromDate : true;
		const matchesTo = toDate && joiningDate ? joiningDate <= toDate : true;

		return matchesCode && matchesFrom && matchesTo;
	});

	renderTable(filtered);
}


//Janvi : set approved status
// Approve selected members
/*function updateSelectedMembersStatus() {
$(document).on("change", ".member-checkbox", function() {
    const id = $(this).val();
    const isApproved = $(this).is(":checked");

    $.ajax({
        url: "/api/financialconsultant/approvedFinancialConsultantData",
        type: "POST",
        data: {
            id: id,
            isApproved: isApproved
        },
        success: function(response) {
            console.log("Approval updated:", response);
            // Optionally show success toast
        },
        error: function(xhr, status, error) {
            console.error("Error updating approval:", error);
            alert("Could not update approval status.");
        }
    });
});

}*/

function updateMemberApprovalStatus(id, isApproved) {
	 
    $.ajax({
        url: "/api/financialconsultant/approvedFinancialConsultantData",
        type: "POST",
        data: {
            id: id,
            isApproved: isApproved
        },
        success: function(response) {
            console.log("Approval updated for ID:", id, response);
            // Optionally show success toast
        },
        error: function(xhr, status, error) {
            console.error("Error updating approval for ID:", id, error);
            alert("Could not update approval status for ID: " + id);
        }
    });
}