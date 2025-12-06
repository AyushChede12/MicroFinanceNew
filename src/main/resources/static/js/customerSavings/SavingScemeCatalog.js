$(document).ready(function () {

    // ------------------- Save Button -------------------
    $("#saveBtn").on("click", function (e) {
        e.preventDefault();

        var formData = {
            policyName: $("#policyName").val(),
            yearlyROI: $("#yearlyROI").val(),
            customerName: $("#customerName").val(),
            initialDeposite: $("#initialDeposite").val(),
            monthlyMinimumBalance: $("#monthlyMinimumBalance").val(),
            reservedFunds: $("#reservedFunds").val(),
            messagingFees: $("#messagingFees").val(),
            messagingInterval: $("#messagingInterval").val(),
            monthlyFreeIFSCTransactions: $("#monthlyFreeIFSCTransactions").val(),
            freeMoneyTransfers: $("#freeMoneyTransfers").val(),
            limitperTransaction: $("#limitperTransaction").val(),
            dailyLimit: $("#dailyLimit").val(),
            weeklyLimit: $("#weeklyLimit").val(),
            monthlyLimit: $("#monthlyLimit").val(),
            serviceFee: $("#serviceFee").val(),
            billingCycle: $("#billingCycle").val(),
            cardFee: $("#cardFee").val(),
            monthlyCardLimit: $("#monthlyCardLimit").val(),
            yearlyCardLimit: $("#yearlyCardLimit").val()
        };

        $.ajax({
            type: "POST",
            url: "/api/customersavings/savescheme",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (response) {
                alert("Data saved successfully!");
                $("#id").val(""); // reset hidden id
                $("form")[0].reset(); // clear form
                fetchAllData(); // refresh table
            },
            error: function (xhr) {
                console.error(xhr.responseText);
                alert("Error saving data.");
            }
        });
    });

    // ------------------- Update Button -------------------
    $("#updateBtn").on("click", function (e) {
        e.preventDefault();

        var id = $("#id").val();
        if (!id) {
            alert("Please select a record to update!");
            return;
        }

        var formData = {
            id: id,
            policyName: $("#policyName").val(),
            yearlyROI: $("#yearlyROI").val(),
            customerName: $("#customerName").val(),
            initialDeposite: $("#initialDeposite").val(),
            monthlyMinimumBalance: $("#monthlyMinimumBalance").val(),
            reservedFunds: $("#reservedFunds").val(),
            messagingFees: $("#messagingFees").val(),
            messagingInterval: $("#messagingInterval").val(),
            monthlyFreeIFSCTransactions: $("#monthlyFreeIFSCTransactions").val(),
            freeMoneyTransfers: $("#freeMoneyTransfers").val(),
            limitperTransaction: $("#limitperTransaction").val(),
            dailyLimit: $("#dailyLimit").val(),
            weeklyLimit: $("#weeklyLimit").val(),
            monthlyLimit: $("#monthlyLimit").val(),
            serviceFee: $("#serviceFee").val(),
            billingCycle: $("#billingCycle").val(),
            cardFee: $("#cardFee").val(),
            monthlyCardLimit: $("#monthlyCardLimit").val(),
            yearlyCardLimit: $("#yearlyCardLimit").val()
        };

        $.ajax({
            type: "POST",
            url: "/api/customersavings/saveandupdatesavingaccount",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (response) {
                alert(response.message);
                $("#id").val(""); // reset hidden id
                $("form")[0].reset(); // clear form
                fetchAllData(); // refresh table
            },
            error: function (xhr) {
                console.error(xhr.responseText);
                alert("Error updating data.");
            }
        });
    });

    // ------------------- Fetch All Data -------------------
    function fetchAllData() {
        $.ajax({
            type: "GET",
            url: "/api/customersavings/fetchalllll",
            contentType: "application/json",
            success: function (response) {
                if (response.status === "FOUND" || response.status === 302) {
                    let data = response.data;
                    let tableBody = $(".datatable tbody");
                    tableBody.empty();

                    data.forEach((item, index) => {
                        let row = `
                            <tr>
                                <td>${index + 1}</td>
                                <td>${item.policyName}</td>
                                <td>${item.customerName}</td>
                                <td>${item.initialDeposite}</td>
                                <td>${item.monthlyMinimumBalance}</td>
                                <td>${item.dailyLimit}</td>
                                <td>${item.monthlyCardLimit}</td>
                                <td>${item.yearlyCardLimit}</td>
                                <td>
                                    <button class="iconbutton" onclick="viewData(${item.id})" title="Edit">
                                        <i class="fa-solid fa-pen-to-square text-primary"></i>
                                    </button>
                                </td>
                                <td>
                                    <button class="iconbutton" onclick="deleteData(${item.id})" title="Delete">
                                        <i class="fa-solid fa-trash text-danger"></i>
                                    </button>
                                </td>
                            </tr>`;
                        tableBody.append(row);
                    });
                } else {
                    alert("Failed to fetch data: " + response.message);
                }
            },
            error: function () {
                alert("Error while calling the API.");
            }
        });
    }

    // Initial fetch
    fetchAllData();

});

// ------------------- View/Edit -------------------
function viewData(id) {
    $.ajax({
        url: "/api/customersavings/getSavingSchemeCatalogById",
        type: "GET",
        data: { id: id },
        success: function (response) {
            if (response.status === "FOUND") {
                const data = response.data;

                $("#id").val(data.id);
                $("#policyName").val(data.policyName);
                $("#yearlyROI").val(data.yearlyROI);
                $("#customerName").val(data.customerName);
                $("#initialDeposite").val(data.initialDeposite);
                $("#monthlyMinimumBalance").val(data.monthlyMinimumBalance);
                $("#reservedFunds").val(data.reservedFunds);
                $("#messagingFees").val(data.messagingFees);
                $("#messagingInterval").val(data.messagingInterval);
                $("#monthlyFreeIFSCTransactions").val(data.monthlyFreeIFSCTransactions);
                $("#freeMoneyTransfers").val(data.freeMoneyTransfers);
                $("#limitperTransaction").val(data.limitperTransaction);
                $("#dailyLimit").val(data.dailyLimit);
                $("#weeklyLimit").val(data.weeklyLimit);
                $("#monthlyLimit").val(data.monthlyLimit);
                $("#serviceFee").val(data.serviceFee);
                $("#billingCycle").val(data.billingCycle);
                $("#cardFee").val(data.cardFee);
                $("#monthlyCardLimit").val(data.monthlyCardLimit);
                $("#yearlyCardLimit").val(data.yearlyCardLimit);
            } else {
                alert("Record not found: " + response.message);
            }
        },
        error: function (xhr) {
            alert("Request failed: " + xhr.responseText);
        }
    });
}

// ------------------- Delete -------------------
function deleteData(id) {
    if (confirm("Are you sure you want to delete this Scheme?")) {
        $.ajax({
            url: "/api/customersavings/deleteSavingSchemeCatalogDataById",
            type: "POST",
            data: { id: id },
            success: function (response) {
                if (response.data === "success") {
                    alert(response.message);
                    fetchAllData();
                } else {
                    alert("Delete failed: " + response.message);
                }
            },
            error: function (xhr, status, error) {
                alert("Failed to delete record.");
                console.error("Error:", error);
            }
        });
    }
}
