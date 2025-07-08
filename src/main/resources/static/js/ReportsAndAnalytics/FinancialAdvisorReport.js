// janvi : search In The Financial Consultants on Table
//Fetch Unapproved Financial Consultants
let allFinancialConsultants = []; 

function searchFinancialConsultants() {
	$.ajax({
		url: "/api/reports/getApprovedFinancialConsultant",
		type: "get",
		contentType: "application/json",
		success: function(response) {
			console.log("API Response:", response);
			if (response.status === "OK" && Array.isArray(response.data)) {
				allFinancialConsultants = response.data;
				renderTable(allFinancialConsultants);
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
				<td>${index + 1}</td>
				<td>${item.branchName || '-'}</td>
				<td>${item.financialCode || '-'}</td>
				<td>${item.joiningDate || '-'}</td>
				
			
            </tr>
        `;
		tbody.append(row);
	});
}

//Janvi : Apply filter
function filterByBranchName() {
    const selectedbranchName = $('#branchName').val().trim().toLowerCase();
    const fromDateVal = $('#fromDate').val();
    const toDateVal = $('#toDate').val();

    const fromDate = fromDateVal ? new Date(fromDateVal) : null;
    const toDate = toDateVal ? new Date(toDateVal) : null;

    const filtered = allSavingTransactionData.filter(item => {
        const branchName = item.branchName ? item.branchName.trim().toLowerCase() : "";
        const joiningDate = item.joiningDate ? new Date(item.joiningDate) : null;

        const matchesbranch = selectedbranchName ? branchName === selectedbranchName : true;

        let matchesFrom = true;
        let matchesTo = true;

        if (fromDate && joiningDate) {
            matchesFrom = joiningDate.getTime() >= fromDate.getTime();
        }

        if (toDate && joiningDate) {
            matchesTo = joiningDate.getTime() <= toDate.getTime();
        }

        return matchesbranch && matchesFrom && matchesTo;
    });

    renderTable(filtered);
}

//janvi:Financial Code Dropdown
function financialCodeDropdown() {
$.ajax({
		url: "/api/reports/getApprovedFinancialConsultant",
		type: "GET",
		contentType: "application/json",
		success: function (response) {
			if (response.status === "OK" && response.data) {
				$("#financialCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function (item) {
					$("#financialCode").append(`<option value='${item.financialCode}'>${item.financialCode}</option>`);
				});
			} else {
				alert("No Financial Code found.");
			}
		}
	});
}
