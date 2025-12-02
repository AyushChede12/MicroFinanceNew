let allCustomers = []; // ⬅️ Add this at the top

$(document).ready(function() {
	$.ajax({
		url: "api/customermanagement/getAllCustomer",
		type: "GET",
		success: function(data) {
			allCustomers = data; // Store data globally
			populateTable(data);
		},
		error: function() {
			alert("Failed to fetch customer data.");
		}
	});
});

function populateTable(data) {
    const tbody = $("table tbody");
    tbody.empty();

    if (data.length === 0) {
        tbody.append("<tr><td colspan='12' class='text-center'>No matching records</td></tr>");
        return;
    }

    for (let i = 0; i < data.length; i++) {
        const c = data[i];

        const row = `
        <tr>
            <td>${i + 1}</td>
            <td>${(c.customerName || "").toUpperCase()}</td>
            <td>${(c.profession || "").toUpperCase()}</td>
            <td>${(c.branchName || "").toUpperCase()}</td>
            <td>${(c.dob || "").toUpperCase()}</td>
            <td>${(c.nomineeName || "").toUpperCase()}</td>
            <td>${(c.customerAddress || "").toUpperCase()}</td>
            <td>${(c.contactNo || "").toUpperCase()}</td>
            <td>${(c.aadharNo || "").toUpperCase()}</td>
            <td>${(c.panNo || "").toUpperCase()}</td>
            <td>${(c.signupDate || "").toUpperCase()}</td>

            <td>
                <button class="btn btn-outline-success btn-sm printBankReportBtn"
                    data-id="${c.id}"
                    data-bs-toggle="modal"
                    data-bs-target="#bankReportModal"
                    title="View Report">
                    <i class="bi bi-printer"></i>
                </button>
            </td>
        </tr>
        `;

        tbody.append(row);
    }

    bindModalEvents();
}


$(document).ready(function() {
	$("#searchBtn").on("click", function(e) {
		e.preventDefault();

		const selectedBranch = $("#branchName").val();
		const fromDate = $("#fromDate").val();
		const toDate = $("#toDate").val();		

		if (!selectedBranch || !fromDate || !toDate) {
			alert("Please select Branch, From Date, and To Date.");
			return;
		}

		const from = new Date(fromDate);
		const to = new Date(toDate);

		const filtered = allCustomers.filter(c => {
			if (!c.branchName || !c.signupDate) return false;

			const regDate = new Date(c.signupDate);
			return (
				c.branchName === selectedBranch &&
				regDate >= from &&
				regDate <= to
			);
		});

		populateTable(filtered);
	});

	// ✅ 6. Print Modal Content
	$("#printBankReportBtn").click(function () {
	    const content = document.getElementById("bankReportContent").innerHTML;
	    const printWindow = window.open("", "", "width=900,height=700");

	    printWindow.document.write(`
	        <html>
	            <head>
	                <title>Transaction Report</title>
	                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	                <style>
	                    body { font-family: Arial, sans-serif; padding: 20px; }
	                    h4, h5, h6 { color: #0d6efd; }
	                    table { width: 100%; border-collapse: collapse; }
	                    th, td { padding: 8px; border: 1px solid #ddd; }
	                    th { background-color: #f2f2f2; }
	                </style>
	            </head>
	            <body>${content}</body>
	        </html>
	    `);

	    printWindow.document.close();
	    printWindow.print();
	});

});

function bindModalEvents() {
    $(".bankReportBtn").off("click").on("click", function () {
        const id = $(this).data("id");
        const policy = allCustomers.find(p => p.id === id);
        if (!policy) return;

        $("#bankLogo").attr("src", "https://i.ibb.co/zFSWbkC/banklogo.png");
        $("#bankName").text("Sterling Bank");
        $("#reportTitle").text("Microfinance Transaction Report");

        $("#accountNumber").text(policy.memberSelection || "N/A");
        $("#periodCovered").text(`${policy.policyStartDate} - ${policy.maturityDate}`);

        $("#customerName").text(policy.customerName || "");
        $("#customerAddress1").text(policy.address ? `Address: ${policy.address}` : "");
        $("#customerAddress2").text(policy.branchName ? `Branch: ${policy.branchName}` : "");

        $("#startingBalance").html(`₹ ${policy.policyAmount || 0}`);
        $("#incomeAmount").html(`₹ ${policy.depositAmount || 0}`);
        $("#expensesAmount").html(`₹ ${policy.amountDue || 0}`);
        $("#closingBalance").html(`₹ ${policy.maturityAmount || 0}`);

        const tbody = $("#transactionTableBody");
        tbody.empty();

        if (policy.policyCode) {
            tbody.append(`
                <tr>
                    <td>${policy.policyCode}</td>
                    <td>${policy.policyStartDate}</td>
                    <td>${policy.policyAmount}</td>
                    <td>${policy.schemeType}</td>
                    <td>${policy.schemeMode}</td>
                </tr>
            `);
        } else {
            tbody.append(`
                <tr>
                    <td colspan="5" class="text-center text-muted">No transaction data available</td>
                </tr>
            `);
        }
    });
}





