$(document).ready(function () {
	let allPolicies = [];

	// ✅ 1. On page load, fetch and show all approved policies
	$.ajax({
		url: "api/Policymangment/getApprovedPolicies",
		method: "GET",
		success: function (response) {
			console.log("API Response:", response);

			if (response && response.data && Array.isArray(response.data)) {
				allPolicies = response.data;

				// ✅ Fill branch dropdown with unique values
				let branches = new Set();
				allPolicies.forEach(policy => {
					if (policy.branchName) {
						branches.add(policy.branchName);
					}
				});
				branches.forEach(branch => {
					$('#branchName1').append(`<option value="${branch}">${branch}</option>`);
				});

				// ✅ Initially show all data
				renderTable(allPolicies);
			} else {
				$(".datatable tbody").html("<tr><td colspan='10'>No approved policies found.</td></tr>");
			}
		},
		error: function () {
			alert("Error while fetching data.");
		}
	});

	// ✅ 2. On Find button click, filter data
	$('#findBtn').click(function (e) {
		e.preventDefault();

		let selectedBranch = $('#branchName1').val();
		let fromDate = $('#fromDate').val();
		let toDate = $('#toDate').val();

		if (!fromDate || !toDate) {
			alert("Please select both From and To dates.");
			return;
		}

		// ✅ Frontend filter logic
		let filtered = allPolicies.filter(policy => {
			let policyDate = policy.policyStartDate;
			return (
				(!selectedBranch || policy.branchName === selectedBranch) &&
				policyDate >= fromDate && policyDate <= toDate
			);
		});

		renderTable(filtered);
	});

	// ✅ 3. Render table rows
	function renderTable(data) {
		let tableBody = $(".datatable tbody");
		tableBody.empty();

		if (!data.length) {
			tableBody.append("<tr><td colspan='10'>No matching policies found.</td></tr>");
			return;
		}

		data.forEach((policy, index) => {
			let row = `
				<tr>
					<td>${index + 1}</td>
					<td>${policy.policyCode || ''}</td>
					<td>${policy.customerName || ''}</td>
					<td>${policy.schemeType || ''}</td>
					<td>${policy.policyStartDate || ''}</td>
					<td>${policy.policyAmount || ''}</td>
					<td>${policy.contactNo || ''}</td>
					<td>${policy.branchName || ''}</td>
					<td>${policy.approved ? 'Yes' : 'No'}</td>
					<td>
						<button class="iconbutton editBtn" data-id="${policy.id}" title="Print">
							<i class="bi bi-floppy-fill" style="color: green;"></i>
						</button>
					</td>
				</tr>
			`;
			tableBody.append(row);
		});
	}
});