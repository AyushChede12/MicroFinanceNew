//all unprove data

let allKYCData = [];

$(document).ready(function() {
	// Load all member data on page load
	loadCustomerKYCData();

	// Button click filter
	$('#saveBtn').on('click', function(e) {
		e.preventDefault(); // Prevent form submission
		filterKYCData();
	});
});
//

function loadCustomerKYCData() {
	$.ajax({	
		url: "/api/requestapproval/getUnapprovedDailyPremiumRenewalPM",
		type: "GET",
		contentType: "application/json",
		success: function(response) {
			if (response.status === "OK" && Array.isArray(response.data)) {
				allKYCData = response.data;
				//populateMemberCodeDropdown(allKYCData);
				renderTable(allKYCData); // Initially show all
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

function populateMemberCodeDropdown(data) {
	const dropdown = $('#branchName');
	dropdown.empty().append('<option value="">Select Branch</option>');
	const uniqueCodes = [...new Set(data.map(item => item.branchName))];
	uniqueCodes.forEach(code => {
		dropdown.append(`<option value="${code}">${code}</option>`);
	});
}

function renderTable(data) {
    const tbody = $(".datatable tbody");
    tbody.empty();

    if (!data || data.length === 0) {
        const noDataRow = `
            <tr>
                <td colspan="12" style="text-align:center; font-family: 'Poppins', sans-serif;">
                    No data found
                </td>
            </tr>
        `;
        tbody.append(noDataRow);0
        return; // Exit the function early
    }

    data.forEach((item, index) => {
        const row = `
            <tr style="font-family: 'Poppins', sans-serif;">
                <td>
                    <input type="checkbox" class="approval-checkbox"
                        data-id="${item.id}" ${item.isApproved ? 'checked' : ''} />
                </td>   
				<td>${index + 1}</td>
				                  
				                   <td>${item.policyCode || '-'}</td>
				                   <td>${item.policyDate || '-'}</td>
								   <td>${item.customerCode || '-'}</td>
								   <td>${item.policyAmount || '-'}</td>
								   <td>${item.maturityDate || '-'}</td>
								   <td>${item.clientName || '-'}</td>
								   <td>${item.contactNo || '-'}</td>
								   <td>${item.renewalDate || '-'}</td>
								   
								   
            </tr>
        `;
        tbody.append(row);
    });
}
