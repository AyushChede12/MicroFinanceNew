$(document).ready(function () {
    loadChequeData();
});

function loadChequeData() {
    let tableBody = $(".datatable tbody");
    tableBody.empty(); // sabse pehle table clear kar do

    // ---- 1st API Call (Loan Payment) ----
    $.ajax({
        type: "GET",
        url: "api/reports/getCheckDataFromLoanPayment",
        contentType: "application/json",
        success: function (response) {
            if (response.status == "OK") {
                let data = response.data;
                data.forEach((item, index) => {
                    let row = `<tr>
                                <td>${index + 1}</td>
                                <td>${item.memberName}</td>
                                <td>${item.paymentDate}</td>
                                <td>${item.chequeNo}</td>
                                <td>Paid</td>
                                <td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="bi bi-printer" style="color: green;"></i></button></td>
                            </tr>`;
                    tableBody.append(row);
                });

                // ---- Ab 2nd API Call karo (Saving Account Activity) ----
                savingAccountChequeData(data.length); // pehle wale data length ko pass kar rahe hai row number continue rakhne ke liye
            } else {
                alert("Failed to fetch Loan data: " + response.message);
            }
        },
        error: function () {
            alert("Error while calling Loan Payment API.");
        }
    });
}

function savingAccountChequeData(startIndex) {
    $.ajax({
        type: "GET",
        url: "api/reports/getPayByFromSavingAccountActivity",
        contentType: "application/json",
        success: function (response) {
            if (response.status == "OK") {
                let data = response.data;
                let tableBody = $(".datatable tbody");
                data.forEach((item, index) => {
                    let row = `<tr>
                                <td>${startIndex + index + 1}</td>
                                <td>${item.customerName}</td>
                                <td>${item.transactionDate}</td>
                                <td>${item.chequeNo}</td>
                                <td>Paid</td>
                                <td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="bi bi-printer" style="color: green;"></i></button></td>
                            </tr>`;
                    tableBody.append(row);
                });
            } else {
                alert("Failed to fetch Saving Account data: " + response.message);
            }
        },
        error: function () {
            alert("Error while calling Saving Account API.");
        }
    });
}
