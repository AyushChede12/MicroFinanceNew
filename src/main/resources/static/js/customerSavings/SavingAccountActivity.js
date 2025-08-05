//fetch saving account details by account number
/*$('#accountNumber').on('blur', function () {
    let selectedCode = $(this).val().trim();
	alert(selectedCode);
    if (selectedCode !== "") {
        $.ajax({
            url: '/api/customersavings/getallbyaccountnumber?accountNumber=' + encodeURIComponent(selectedCode),
            type: 'GET',
            success: function (response) {
                if (response.status === 302  || response.status === "FOUND" && response.data.length > 0) {
                    let customer = response.data[0];
                    $('#customerCode').val(customer.selectByCustomer);
					$('#customerName').val(customer.enterCustomerName);
					$('#contactNumber').val(customer.contactNumber);
					$('#jointHolderName').val(customer.jointSurvivorCode);
					$('#savingPlanName').val(customer.selectPlan);
					$('#averageBalance').val(customer.openingAmount);
					$('#selectBranchName').val(customer.branchName);
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
*/
$(document).ready(function () {
$('#accountNumber').on('blur', function () {
    let accountNumber = $(this).val().trim();

    if (accountNumber !== "") {
        $.ajax({
            url: 'api/customersavings/getallbyaccountnumber',
            type: 'GET',
            data: { accountNumber: accountNumber },
            success: function (response) {
                console.log("Success response:", response);

                if (response.data && response.data.length > 0) {
                    let customer = response.data[0];

                    $('#customerCode').val(customer.selectByCustomer || '');
                    $('#customerName').val(customer.enterCustomerName || '');
                    $('#contactNumber').val(customer.contactNumber || '');
                    $('#jointHolderName').val(customer.jointSurvivorCode || '');
                    $('#savingPlanName').val(customer.selectPlan || '');
                    $('#averageBalance').val(customer.openingAmount || '');
                    $('#selectBranchName').val(customer.branchName || '');
                } else {
                    alert('No data found!');
                    clearAccountForm();
                }
            },
            error: function (xhr) {
                console.error("Fetch error:", xhr);
                alert('First approve account!');
                clearAccountForm();
            }
        });
         $.ajax({
        type: "GET",
        url: "api/customersavings/getsavingaccountactivity",
        data: { accountNumber: accountNumber }, // <-- Pass it here
        success: function(response) {
            console.log("Full Response from API:", response); 
            if (response.status && response.status.toUpperCase() === "OK") {
                let data = response.data;
                let tableBody = $(".datatable tbody");
                tableBody.empty();
                data.forEach((item, index) => {
                    let row = `<tr>
                        <td>${index + 1}</td>
                        <td>${item.selectBranchName || ''}</td>
                        <td>${item.transactionDate || ''}</td>
                        <td>${item.accountNumber || ''}</td>
                        <td>${item.transactionType || ''}</td>
                        <td>${item.transactionAmount || ''}</td>
                        <td>${item.averageBalance || ''}</td>
                        <td>${item.payBy || ''}</td>
                        <td>${item.comments || ''}</td>
                        <td>${item.selectSavingTransactionId || ''}</td>
                        <td>${item.customerCode || ''}</td>
                    </tr>`;
                    tableBody.append(row);
                });
            } else {
                alert("No transactions found.");
            }
        },
        error: function(xhr) {
            console.error("API Error:", xhr.responseText);
            alert("Error fetching saving account activity.");
        }
    });
      
    } else {
        clearAccountForm();
    }

    function clearAccountForm() {
        $('#customerCode').val('');
        $('#customerName').val('');
        $('#contactNumber').val('');
        $('#jointHolderName').val('');
        $('#savingPlanName').val('');
        $('#averageBalance').val('');
        $('#selectBranchName').val('');
    }
    
});
   
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

        // Adjust average balance
        if (transactionType == 'Deposit') {
            avgBalance += txnAmount;
        } else if (transactionType == 'Withdraw') {
            avgBalance -= txnAmount;
        }

        if (avgBalance < 0) {
            alert("Balance cannot be negative.");
            return;
        }

        // Update balance field in form
        avgBalanceField.val(avgBalance).val();
		

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
            /*chequeNo: $('#chequeNo').val(),
            chequeDate: $('#chequeDate').val(),
            depositAcc1: $('#depositAcc1').val(),
            depositAcc2: $('#depositAcc2').val(),
            refNumber1: $('#refNumber1').val(),
            depositAcc3: $('#depositAcc3').val(),
            refNumber2: $('#refNumber2').val()*/
            
        };

        $.ajax({
            url: 'api/customersavings/savesavingaccountactivity',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(accountData),
            success: function (response) {
				
                alert("Saving Account transaction saved successfully!");
				getAccountNumberAndUpdateData(accountNumber);
            },
            error: function (xhr) {
                console.error('Error:', xhr.responseText);
                alert('Failed to save transaction data.');
            }
        });
    });
  
});

function getAccountNumberAndUpdateData(accountNumber) {
    $.ajax({
        type: "GET",
        url: "api/customersavings/getsavingaccountactivity",
        data: { accountNumber: accountNumber },
        success: function(response) {
            if (response.data && response.data.length > 0) {
                let data = response.data[0]; // Get the latest or first transaction
                let newBalance = parseFloat(data.averageBalance);

                if (!isNaN(newBalance)) {
                    updateMainAccountBalance(accountNumber, newBalance); // ✅ Call to update
                } else {
                    alert("Invalid balance received from server.");
                }
            } else {
                alert("No customer found for this account number.");
            }
        },
        error: function() {
            alert("Member not found or server error.");
        }
    });
}


function updateMainAccountBalance(accountNumber, newBalance) {
    $.ajax({
        type: "POST",
        url: "api/customersavings/updateaveragebalance",
        contentType: "application/json",
        data: JSON.stringify({
            accountNumber: accountNumber,
            openingAmount: parseFloat(newBalance)
        }),
        success: function (response) {
            alert("Main account balance updated successfully!");
        },
        error: function () {
            alert("Failed to update main account balance.");
        }
    });
}


