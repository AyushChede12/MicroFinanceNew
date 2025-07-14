// JS for fetching the account number on the dropdown according to the account type (vaibhav)
$(document).ready(function () {
    $("#accountType").on("change", function () {
        const selectedType = $(this).val();

        if (selectedType) {
            fetchAccountNumbers(selectedType);
        } else {
            // Clear dropdown if no type is selected
            $("#accountNumber").empty().append('<option value="">-- Select Account Number --</option>');
        }
    });
});

function fetchAccountNumbers(accountType) {
    $.ajax({
        type: "GET",
        url: "/api/customersavings/fetchAccountNumbers",
        data: { accountType: accountType },
        success: function (response) {
            const $dropdown = $("#accountNumber");
            $dropdown.empty().append('<option value="">-- Select Account Number --</option>');

            if (response.status === "OK" && Array.isArray(response.data)) {
                response.data.forEach(function (accNo) {
                    $dropdown.append(`<option value="${accNo}">${accNo}</option>`);
                });
            } else {
                alert("No account numbers found for selected type.");
            }
        },
        error: function (xhr) {
            alert("Error fetching account numbers: " + xhr.responseText);
        }
    });
}



// Js for fetching the data on the tabel according to account number (vaibhav)
/*$(document).ready(function () {
    $("#accountNumber").on("change", function () {
        const accountNumber = $(this).val();

        if (accountNumber !== "") {
            $.ajax({
                type: "GET",
                url: "/api/customersavings/getDataByAccountNumber",
                data: { accountNumber: accountNumber },
                success: function (response) {
                    if (response.status === "OK" && response.data) {
                        const data = response.data;

                        // Inject table row dynamically
                        $("#customerDetails").html(`
                            <tr>
                                <td>${data.id || ''}</td>
                                <td>${data.branchName|| ''}</td>
                                <td>${data.accountNumber|| ''}</td>
                                <td>${data.contactNumber || ''}</td>
                                <td>${data.address || ''}</td>
                                <td>${data.openingDate || ''}</td>
                                <td>${data.openingAmount || ''}</td>
                                <td></td>
                            </tr>
                        `);
                    } else {
                        alert("No data found for this account.");
                        $("#customerDetails").empty();
                    }
                },
                error: function (xhr) {
                    alert("Error: " + xhr.responseText);
                    $("#customerDetails").empty();
                }
            });
        } else {
            $("#customerDetails").empty(); // Clear if no account selected
        }
    });
});*/