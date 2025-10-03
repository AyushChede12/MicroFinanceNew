$(document).ready(function() {
	$.ajax({
		url: "api/Maturitymanagement/getApplymaturitydetails", // your API endpoint
		type: "GET",
		success: function(response) {
			if (response.status === "FOUND") {
				const branchList = response.data;

				// Use a Set to collect distinct branch names
				const uniqueBranches = new Set();
				branchList.forEach(branch => {
					if (branch.branchName) {
						uniqueBranches.add(branch.branchName.trim());
					}
				});

				// Clear existing options and add default
				$("#branchName").empty();
				$("#branchName").append("<option value=''>-- Select Branch --</option>");

				// Append unique branch names
				uniqueBranches.forEach(branchName => {
					let option = `<option value="${branchName}">${branchName}</option>`;
					$("#branchName").append(option);
				});
			} else {
				alert("Error: " + response.message);
			}
		},
		error: function(xhr) {
			console.error("Error loading branches:", xhr.responseText);
			alert("Failed to load dropdown data.");
		}
	});
	
	$.ajax({
			url: "api/Maturitymanagement/getApplymaturitydetails", // Updated path
			type: "GET",
			contentType: "application/json",
			success: function(response) {
				if (response.status = "FOUND") {
					var data = response.data;
					var tbody = $(".datatable tbody");
					tbody.empty();

					$.each(data, function(index, item) {
						var row = `<tr style="font-family: 'Poppins', sans-serif;">
								<th scope="row"><a href="#">${index + 1}</a></th>
								<td>${item.customerName || ''}</td>
								<td>${item.branchName || ''}</td>
								<td>${item.policyCode || ''}</td>
								<td>${item.policyAmount || ''}</td>
								<td>${item.maturityDate || ''}</td>
								<td>${item.maturityAmount || ''}</td>
								<td>${item.depositAmount || ''}</td>
								<td>${item.schemeName || ''}</td>
								<td>
									<button class="iconbutton" onclick="viewData(${item.id})" title="View">
										<i class="bi bi-printer" style="color: green;></i>
									</button>
								</td>
							</tr>`;
						tbody.append(row);
					});
				} else {
					alert("⚠️ " + response.message);
				}
			},
			error: function(xhr, status, error) {
				console.error("❌ Error fetching data:", error);
				alert("Failed to load executive founder data.");
			}
		});
});
