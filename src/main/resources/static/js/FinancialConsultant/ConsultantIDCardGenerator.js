$(document).ready(function () {
	const apiUrl = "/api/financialconsultant/getAllFinancialConsultantDetails";

	// Function to render table rows
	function renderTable(data) {
		let tableBody = "";
		$.each(data, function (index, item) {
			tableBody += `
				<tr>
					<td>${index + 1}</td>
					<td>${item.financialCode || ''}</td>
					<td>${item.financialName || ''}</td>
					<td>${item.contactNo || ''}</td>
					<td>${item.branchName || ''}</td>
					<td>${item.customerAddress || ''}</td>
					<td>${item.district || ''}</td>
					<td>${item.state || ''}</td>
					<td>${item.pinCode || ''}</td>
					<td>${item.profession || ''}</td>
					<td>${item.selectPosition || ''}</td>
				</tr>`;
		});
		$("table tbody").html(tableBody);
	}

	// Fetch all and filter based on input
	function fetchAndFilter(keyword = "") {
		$.ajax({
			url: apiUrl,
			type: "POST",
			contentType: "application/json",
			success: function (response) {
				let data = response.data || [];
				if (keyword) {
					keyword = keyword.toUpperCase();
					data = data.filter(c => c.financialCode.toUpperCase().includes(keyword));
				}
				renderTable(data);
			},
			error: function () {
				alert("Error fetching data.");
			}
		});
	}

	// Live search
	$("#searchKeyword").on("input", function () {
		let keyword = $(this).val();
		fetchAndFilter(keyword);
	});

	// Initial fetch without filter
	fetchAndFilter();
});
