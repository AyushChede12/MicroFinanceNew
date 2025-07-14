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
				<td>${item.customerName || '-'}</td>
				<td>${item.dob || '-'}</td>
				<td>${item.contactNo || '-'}</td>				
			    <td>
					<button class="iconbutton editBtn" data-id="${item.id}" title="Print">
						<i class="bi bi-floppy-fill" style="color: green;"></i>
					</button>
				</td>
            </tr>
        `;
		tbody.append(row);
	});
}
//Janvi :09/07/2025
// Event listener for clicking the VIEW button
$(document).ready(function() {
	$("#fetchFinancialConsultants").on("click", ".editBtn", function() {
		var id = $(this).data("id"); // Get entry number from the data attribute
		console.log("View button clicked for entry:", id); // Debug log
		ViewDataAdvisor(id);
		window.location.href = 'ViewAdvisorData?id=' + id; // Redirect to entryView.jsp with the entry number as a query parameter
	});
});

//Janvi :09/07/2025
function ViewDataAdvisor(id) {
    $.ajax({
        url: "/api/financialconsultant/getFinancialConsultantById",
        type: "GET",
        data: { id: id },
        success: function(response) {
            if (response.status === "OK" && response.data) {
                const data = response.data;
                console.log("Fetched data:", data);

                $("#id").val(data.id || '');
                $("#branchName").text(data.branchName || '');
                $("#financialCode").text(data.financialCode || '');
                $("#joiningDate").text(data.joiningDate || '');
                $("#customerName").text(data.customerName || '');
                $("#dob").text(data.dob || '');
                $("#contactNo").text(data.contactNo || '');
                $("#customerAddress").text(data.customerAddress || '');
                $("#guardianName").text(data.guardianName || '');
                $("#relationToApplicant").text(data.relationToApplicant || '');
                $("#nomineeName").text(data.nomineeName || '');
                $("#district").text(data.district || '');
                $("#state").text(data.state || '');
                $("#pinCode").text(data.pinCode || '');
                $("#profession").text(data.profession || '');
                $("#academicBackground").text(data.academicBackground || '');
                $("#selectPosition").text(data.selectPosition || '');
                $("#referralCode").text(data.referralCode || '');
                $("#referralName").text(data.referralName || '');
            } else {
                alert("No data found for the selected financial consultant.");
            }
        },
        error: function() {
            alert("Failed to fetch data.");
        }
    });
}

function goBack() {
    window.history.back();
}


//Janvi : Apply filter
function filterDataByBranchName() {
    const selectedbranchName = $('#branchName').val().trim().toLowerCase();
    const fromDateVal = $('#fromDate').val();
    const toDateVal = $('#toDate').val();

    const fromDate = fromDateVal ? new Date(fromDateVal) : null;
    const toDate = toDateVal ? new Date(toDateVal) : null;

    const filtered = allFinancialConsultants.filter(item => {
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


