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
                $("#id").val("");
                $("form")[0].reset();
                fetchAllData();  // refresh table instantly
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
                $("#id").val("");
                $("form")[0].reset();
                fetchAllData();
            }
        });
    });

    // ------------------- Fetch All Data -------------------
    function fetchAllData() {
        $.ajax({
            type: "GET",
            url: "/api/customersavings/fetchalllll",
            success: function (response) {
                let tableBody = $(".datatable tbody");
                tableBody.empty();

                if (response.status === "FOUND") {
                    response.data.forEach((item, index) => {
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
                                    <button class="iconbutton" onclick="viewData(${item.id})">
                                        <i class="fa-solid fa-pen-to-square text-primary"></i>
                                    </button>
                                </td>
                                <td>
                                    <button class="iconbutton" onclick="deleteData(${item.id})">
                                        <i class="fa-solid fa-trash text-danger"></i>
                                    </button>
                                </td>
                            </tr>`;
                        tableBody.append(row);
                    });
                }
            }
        });
    }

    // Initial load
    fetchAllData();
});


// ------------------- View (Edit) -------------------
function viewData(id) {
    $.ajax({
        url: "/api/customersavings/getSavingSchemeCatalogById",
        type: "GET",
        data: { id: id },
        success: function (response) {
            if (response.status === "FOUND") {
                const d = response.data;

                $("#id").val(d.id);
                $("#policyName").val(d.policyName);
                $("#yearlyROI").val(d.yearlyROI);
                $("#customerName").val(d.customerName);
                $("#initialDeposite").val(d.initialDeposite);
                $("#monthlyMinimumBalance").val(d.monthlyMinimumBalance);
                $("#reservedFunds").val(d.reservedFunds);
                $("#messagingFees").val(d.messagingFees);
                $("#messagingInterval").val(d.messagingInterval);
                $("#monthlyFreeIFSCTransactions").val(d.monthlyFreeIFSCTransactions);
                $("#freeMoneyTransfers").val(d.freeMoneyTransfers);
                $("#limitperTransaction").val(d.limitperTransaction);
                $("#dailyLimit").val(d.dailyLimit);
                $("#weeklyLimit").val(d.weeklyLimit);
                $("#monthlyLimit").val(d.monthlyLimit);
                $("#serviceFee").val(d.serviceFee);
                $("#billingCycle").val(d.billingCycle);
                $("#cardFee").val(d.cardFee);
                $("#monthlyCardLimit").val(d.monthlyCardLimit);
                $("#yearlyCardLimit").val(d.yearlyCardLimit);
            } else {
                alert("Record not found!");
            }
        }
    });
}


function deleteData(id) {

    if (!confirm("Are you sure you want to delete this Scheme?")) {
        return;
    }

    $.ajax({
        url: "/api/customersavings/deleteSavingSchemeCatalogDataById?id=" + id,
        type: "POST",

        success: function (response) {

            if (response.data === "success") {

                alert("Deleted successfully!");

                // 🔥 INSTANT RELOAD TABLE
                fetchAllData();     // <-- BEST & CLEAN

            } else {
                alert("Delete failed: " + response.message);
            }
        },

        error: function () {
            alert("Failed to delete record.");
        }
    });
}
