let allCustomers = []; // ⬅️ Add this at the top

$(document).ready(function () {
    $.ajax({
        url: "getAllCustomer",
        type: "GET",
        success: function (data) {
            allCustomers = data; // Store data globally
            populateTable(data);
        },
        error: function () {
            alert("Failed to fetch customer data.");
        }
    });
});

function populateTable(data) {
    const tbody = $("table tbody");
    tbody.empty();

    if (data.length === 0) {
        tbody.append("<tr><td colspan='11' class='text-center'>No matching records</td></tr>");
        return;
    }

    for (let i = 0; i < data.length; i++) {
        const customer = data[i];

        const row = "<tr>" +
            "<td>" + (i + 1) + "</td>" +
            "<td>" + (customer.customerName || '') + "</td>" +
            "<td>" + (customer.profession || '') + "</td>" +
            "<td>" + (customer.branchName || '') + "</td>" +
            "<td>" + (customer.dob || '') + "</td>" +
            "<td>" + (customer.nomineeName || '') + "</td>" +
            "<td>" + (customer.customerAddress || '') + "</td>" +
            "<td>" + (customer.contactNo || '') + "</td>" +
            "<td>" + (customer.aadharNo || '') + "</td>" +
            "<td>" + (customer.panNo || '') + "</td>" +
            "<td>" + (customer.signupDate || '') + "</td>" +
            "</tr>";

        tbody.append(row);
    }
}

$(document).ready(function () {
    $("#searchBtn").on("click", function (e) {
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
});



$(document).ready(function() {
	// Fetch all branches and populate the dropdown
	$.ajax({
		url: "getAllBranchModule",
		method: "GET",
		success: function(data) {
			console.log("Fetched Branches:", data);
			data.forEach(function(branch) {
				$('#branchName').append(
					$('<option>', {
						value: branch.branchName,
						text: branch.branchName
					})
				);
			});
		},
		error: function(err) {
			console.error("Error fetching branches:", err);
		}
	});
});
