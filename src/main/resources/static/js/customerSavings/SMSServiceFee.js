//Fetch Unapproved Savings Transaction
let allmessageSendData = []; 

function searchInThemessageSend() {
	$.ajax({
		url: "api/customersavings/getSavingAccountDataSMSEnable",
		type: "POST",
		contentType: "application/json",
		success: function(response) {
			console.log("API Response:", response);
			if (response.status === "OK" && Array.isArray(response.data)) {
				allmessageSendData = response.data;
				renderTable(allmessageSendData);
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
	const tbody = $("#tbody");
	tbody.empty();

	data.forEach((item, index) => {
		const row = `
            <tr style="font-family: 'Poppins', sans-serif;">
            <td><input type="checkbox" class="member-checkbox" value="${item.id}"></td>
				<td>${index + 1}</td>
				<td>${item.accountNumber || '-'}</td>
				<td>${item.openingDate || '-'}</td>
				<td>${item.balance || '-'}</td>
				<td>${item.messageSend === "1" ? "Enabled" : "Disabled"}</td>
				<td><button class="btn btn-primary btn-sm apply-btn" data-id="${item.id}">Apply</button></td>
            </tr>
        `;
		tbody.append(row);
	});
}
