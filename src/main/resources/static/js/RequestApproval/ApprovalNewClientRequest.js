
/*function memberCodeDropdown() {    //anjali
	$.ajax({
		type: "GET",
		url: '/api/requestapproval/findAllMemberCode',
		contentType: "application/json",
		async: true,
		success: function(response) {
			console.log("API Response:", response);

			var appenddata1 = "<option value=''>Select Member Code</option>";

			if (response.status === "OK" && Array.isArray(response.data)) {
				for (var i = 0; i < response.data.length; i++) {
					appenddata1 += "<option value='" + response.data[i].memberCode + "'>" + response.data[i].memberCode + "</option>";
				}
			} else {
				console.warn("Unexpected response format:", response);
			}

			$("#Code").html(appenddata1);
		},
		error: function() {
			alert("Failed to load member codes.");
		}
	});
}*/

$(document).ready(function() {
	memberCodeDropdown();
});


/*$(document).ready(function () {                 //anjali
	// Set today's date to all date inputs
	const today = new Date().toISOString().split('T')[0];
	$('#applicationDate, #fromDate, #toDate, #approvalDate, #openingDate').val(today);

	// Load KYC Data into Table
	loadCustomerKYCData();
});

function loadCustomerKYCData() {
	$.ajax({
		url: "/api/requestapproval/findAllMemberCode", // Update if your endpoint is different
		type: "GET",
		contentType: "application/json",
		success: function (response) {
			if (response.status === "OK" && Array.isArray(response.data)) {
				const tbody = $(".datatable tbody");
				tbody.empty(); // Clear table body

				$.each(response.data, function (index, item) {
					const row = `
						<tr style="font-family: 'Poppins', sans-serif;">
							<td>${index + 1}</td>
							<td>${item.customerName || '-'}</td>
							<td>${item.memberCode || '-'}</td>
							<td>${item.dob || '-'}</td>
							<td>${item.customerAge || '-'}</td>
							<td>${item.customerGender || '-'}</td>
							<td>${item.customerAddress || '-'}</td>
							<td>${item.academicBackground || '-'}</td>
							<td>${item.panNo || '-'}</td>
							<td>${item.contactNo || '-'}</td>
							<td>${item.emailId || '-'}</td>
							<td>${item.branchName || '-'}</td>
							<td>${item.district || '-'}</td>
							<td>${item.state || '-'}</td>
						</tr>`;
					tbody.append(row);
				});
			} else {
				alert("No member data found.");
			}
		},
		error: function (xhr, status, error) {
			console.error("Error loading member data:", error);
			alert("Failed to load member data.");
		}
	});
}*/
//anjali patil

let allKYCData = [];

$(document).ready(function() {
	// Load all member data on page load
	loadCustomerKYCData();

	// Button click filter
	$('#findBtn').on('click', function(e) {
		e.preventDefault(); // Prevent form submission
		filterKYCData();
	});
});

function loadCustomerKYCData() {
	$.ajax({
		url: "/api/requestapproval/unapproved",
		type: "GET",
		contentType: "application/json",
		success: function(response) {
			if (response.status === "OK" && Array.isArray(response.data)) {
				allKYCData = response.data;
				populateMemberCodeDropdown(allKYCData);
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
	const dropdown = $('#Code');
	dropdown.empty().append('<option value="">Select Member Code</option>');
	const uniqueCodes = [...new Set(data.map(item => item.memberCode))];
	uniqueCodes.forEach(code => {
		dropdown.append(`<option value="${code}">${code}</option>`);
	});
}

function renderTable(data) {
	const tbody = $(".datatable tbody");
	tbody.empty();

	data.forEach((item, index) => {
		const row = `
            <tr style="font-family: 'Poppins', sans-serif;">
			<td>
							                <input type="checkbox" class="approval-checkbox"
							                        data-id="${item.id}" ${item.isApproved}
							                         />
							                </td>   
			 <td>${index + 1}</td>
                <td>${item.customerName || '-'}</td>
                <td>${item.memberCode || '-'}</td>
				<td>${item.branchName || '-'}</td>
                <td>${item.dob || '-'}</td>
                <td>${item.customerAge || '-'}</td>
                <td>${item.customerGender || '-'}</td>
                <td>${item.customerAddress || '-'}</td>
                <td>${item.academicBackground || '-'}</td>
                <td>${item.contactNo || '-'}</td>
                <td>${item.emailId || '-'}</td>
               
            </tr>
        `;
		tbody.append(row);
	});
}

function filterKYCData() {
	const selectedCode = $('#Code').val();
	const fromDateVal = $('#fromDate').val();
	const toDateVal = $('#toDate').val();

	const fromDate = fromDateVal ? new Date(fromDateVal) : null;
	const toDate = toDateVal ? new Date(toDateVal) : null;

	const filtered = allKYCData.filter(item => {
		const memberCode = item.memberCode;
		const dob = item.dob ? new Date(item.dob) : null;

		const matchesCode = selectedCode ? memberCode === selectedCode : true;
		const matchesFrom = fromDate && dob ? dob >= fromDate : true;
		const matchesTo = toDate && dob ? dob <= toDate : true;

		return matchesCode && matchesFrom && matchesTo;
	});

	renderTable(filtered);
}

//anjali 


$(document).ready(function () {
  $('#approvedBtn').click(function (e) {
    e.preventDefault();

    const selectedCheckboxes = $('.approval-checkbox:checked');

    if (selectedCheckboxes.length === 0) {
      alert("Please select at least one customer to approve.");
      return;
    }

    selectedCheckboxes.each(function () {
      const id = $(this).data('id');
      const isApproved = 1; // because you're only approving selected ones

      $.ajax({
        url: `/api/requestapproval/approvedCustomerData?id=${id}&isApproved=${isApproved}`,
        type: 'POST',
        success: function (response) {
          if (response.status === "OK") {
			alert("Approved Successfully!");
			location.reload();
          }
        },
        error: function (xhr) {
          alert("Error approving ID " + id);
          console.error(xhr);
        }
      });
    });

  });
});

/*$(document).ready(function () {
    // Fetch unapproved customers when page loads
    fetchUnapprovedCustomers();
    
});

function fetchUnapprovedCustomers() {
        $.ajax({
            url: '/api/requestapproval/unapproved',
            method: 'GET',
            success: function (response) {
                if (response.status === 'OK') {
                    populateUnapprovedCustomerTable(response.data);
                } else {
                    $('.datatable tbody').empty();
                    alert("No unapproved customers found.");
                }
            },
            error: function () {
                $('.datatable tbody').empty();
                alert("Error fetching unapproved customer data.");
            }
        });
    }

function populateUnapprovedCustomerTable(data) {
        const tbody = $('.datatable tbody');
        tbody.empty();

        data.forEach((item, index) => {
            const row = `
                <tr>
                    <td><input type="checkbox" value="${item.id}" /></td>
                    <td>${index + 1}</td>
                    <td>${item.customerName || ''}</td>
                    <td>${item.memberCode || ''}</td>
                    <td>${item.branchName || ''}</td>
                    <td>${item.dob || ''}</td>
                    <td>${item.customerAge || ''}</td>
                    <td>${item.customerGender || ''}</td>
                    <td>${item.customerAddress || ''}</td>
                    <td>${item.academicBackground || ''}</td>
                    <td>${item.contactNo || ''}</td>
                    <td>${item.emailId || ''}</td>
                </tr>
            `;
            tbody.append(row);
        });
    }*/

	$(document).ready(function() {
	$.ajax({
			url: "/api/preference/getAllBranchModule", // Add base path if needed like /api/preference/getAllBranchModule
			type: "GET",
			success: function(response) {
				if (response.status == "FOUND") {
					const branchList = response.data;
					$("#branchName").empty(); // Clear existing options
					$("#branchName").append("<option value=''>-- Select Branch --</option>");

					for (let i = 0; i < branchList.length; i++) {
						let branch = branchList[i];
						let option = `<option value="${branch.branchName}">${branch.branchName}</option>`;
						$("#branchName").append(option);
						$("#branch").append(option);
					}
				} else {
					alert("Error: " + response.message);
				}
			},
			error: function(xhr) {
				console.error("Error loading branches:", xhr.responseText);
				alert("Failed to load dropdown data.");
			}
		});
		});