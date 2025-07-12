
$(document).ready(function() {
    loadAllPolicyData();
});

function loadAllPolicyData() {
    $.ajax({
        url: "/getAllPolicyManagementData",
        type: "GET",
        success: function(response) {
            if (response && response.status === "OK" && response.data.length > 0) {
                renderPolicyTable(response.data);
            } else {
                renderNoDataRow();
            }
        },
        error: function(xhr, status, error) {
            console.error("Error fetching policy data:", error);
            renderNoDataRow();
        }
    });
}

function renderPolicyTable(data) {
    const tbody = $(".datatable tbody");
    tbody.empty();

    data.forEach((item, index) => {
        const row = `
            <tr>
                <td>${index + 1}</td>
                <td>${item.id}</td>
                <td>${item.address || '-'}</td>
                <td>${item.branchName || '-'}</td>
            </tr>
        `;
        tbody.append(row);
    });
}

function renderNoDataRow() {
    const tbody = $(".datatable tbody");
    tbody.empty();
    const noDataRow = `
        <tr>
            <td colspan="4" style="text-align:center;">No data found</td>
        </tr>
    `;
    tbody.append(noDataRow);
}

