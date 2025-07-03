//fetch saving account details by account number
$('#accountNumber').on('blur', function () {
    let selectedCode = $(this).val().trim();
	alert(selectedCode);
    if (selectedCode !== "") {
        $.ajax({
            url: '/api/customersavings/getallbyaccountnumber?accountNumber=' + encodeURIComponent(selectedCode),
            type: 'GET',
            success: function (response) {
                if (response.status === "FOUND" && response.data.length > 0) {
                    let customer = response.data[0];
                    $('#customerCode').val(customer.selectByCustomer);
					$('#customerName').val(customer.enterCustomerName);
					$('#contactNumber').val(customer.contactNumber);
					$('#jointHolderName').val(customer.jointSurvivorCode);
					$('#savingPlanName').val(customer.selectPlan);
					$('#averageBalance').val(customer.openingAmount);
                } else {
                    alert('No data found!');
                    $('#customerCode').val('');
                }
            },
            error: function () {
                alert('Error while fetching data!');
                $('#customerCode').val('');
            }
        });
    } else {
        $('#customerCode').val('');
    }
});

$(document).ready(function () {
    $('#saveBtn').click(function (event) {
        event.preventDefault();

        // Basic validation
        const transactionDate = $('#transactionDate').val();
        const accountNumber = $('#accountNumber').val();
        const transactionAmountRaw = $('#transactionAmount').val().replace(/,/g, '').trim();
        const transactionType = $('#transactionType').val();
        const customerName = $('#customerName').val();

        if (!transactionDate || !accountNumber || !transactionAmountRaw || !transactionType || !customerName) {
            alert("Please fill all required fields.");
            return;
        }

        if (isNaN(transactionAmountRaw)) {
            alert("Transaction amount must be a number.");
            return;
        }

        if (!/^\d+$/.test(accountNumber)) {
            alert("Account number must contain digits only.");
            return;
        }

        // Parse and clean numeric values
        const avgBalanceField = $('#averageBalance');
        const averageBalanceRaw = avgBalanceField.val().replace(/,/g, '').trim();

        let avgBalance = parseFloat(averageBalanceRaw) || 0;
        const txnAmount = parseFloat(transactionAmountRaw);

        console.log("Before:", avgBalance, transactionType, txnAmount);
		alert(transactionType);

        // Adjust average balance
        if (transactionType == 'Deposit') {
			alert(transactionType);
            avgBalance += txnAmount;
        } else if (transactionType == 'Withdraw') {
            avgBalance -= txnAmount;
        }

        if (avgBalance < 0) {
            alert("Balance cannot be negative.");
            return;
        }

        // Update balance field in form
        alert(avgBalanceField.val(avgBalance).val());
		

        const accountData = {
            selectSavingTransactionId: $('#selectSavingTransactionId').val(),
            transactionDate: transactionDate,
            selectBranchName: $('#selectBranchName').val(),
            accountNumber: accountNumber,
            customerCode: $('#customerCode').val(),
            customerName: customerName,
            contactNumber: $('#contactNumber').val(),
            jointHolderName: $('#jointHolderName').val(),
            savingPlanName: $('#savingPlanName').val(),
            averageBalance: avgBalance.toFixed(2),
            transactionFor: $('#transactionFor').val(),
            comments: $('#comments').val(),
            transactionType: transactionType,
            transactionAmount: txnAmount.toFixed(2),
            payBy: $('#payBy').val()
        };

        $.ajax({
            url: '/api/customersavings/savesavingaccountactivity',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(accountData),
            success: function (response) {
                alert("Saving Account transaction saved successfully!");
                location.reload();
            },
            error: function (xhr) {
                console.error('Error:', xhr.responseText);
                alert('Failed to save transaction data.');
            }
        });
    });
});



/*$(document).ready(function () {
    $('#saveBtn').click(function (event) {
        event.preventDefault();

        // Basic validation
        const transactionDate = $('#transactionDate').val();
        const accountNumber = $('#accountNumber').val();
        const transactionAmount = $('#transactionAmount').val();
        const transactionType = $('#transactionType').val();
        const customerName = $('#customerName').val();

        if (!transactionDate || !accountNumber || !transactionAmount || !transactionType || !customerName) {
            alert("Please fill all required fields.");
            return;
        }

        if (isNaN(transactionAmount)) {
            alert("Transaction amount must be a number.");
            return;
        }

        if (!/^\d+$/.test(accountNumber)) {
            alert("Account number must contain digits only.");
            return;
        }

        const accountData = {
            selectSavingTransactionId: $('#selectSavingTransactionId').val(),
            transactionDate: transactionDate,
            selectBranchName: $('#selectBranchName').val(),
            accountNumber: accountNumber,
            customerCode: $('#customerCode').val(),
            customerName: customerName,
            contactNumber: $('#contactNumber').val(),
            jointHolderName: $('#jointHolderName').val(),
            savingPlanName: $('#savingPlanName').val(),
            averageBalance: $('#averageBalance').val(),
            transactionFor: $('#transactionFor').val(),
            comments: $('#comments').val(),
            transactionType: transactionType,
            transactionAmount: transactionAmount,
            payBy: $('#payBy').val()
        };

        $.ajax({
            url: '/api/customersavings/savesavingaccountactivity',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(accountData),
            success: function (response) {
                alert("Saving Account transaction saved successfully!");
                location.reload();
            },
            error: function (xhr) {
                console.error('Error:', xhr.responseText);
                alert('Failed to save transaction data.');
            }
        });
    });
});

*/