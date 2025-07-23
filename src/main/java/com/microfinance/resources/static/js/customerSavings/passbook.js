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

     function displayTransactionDataList() {
       // const accountNumber = $(this).val();
 let accountNumber = document.getElementById("accountNumber").value; // Get the selected Account No.
    // $("#tabl").show();
    if (!accountNumber) {
        alert("Please select an Account Number.");
        return;
    }
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
                        $("#tableSection").show();
                $('#printbtnSection').hide();
                $('#passbookSection').hide();
                $("#headingSection").hide();
                $("#TransactionSection").hide();
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
    }

//Janvi passbook data fetch
 /*function displaySavingfrontPage() {
       // var accountNo = $("#accountNoList").val(); // Get the account number from input field
            let accountNo = document.getElementById("accountNumber").value; // Get the selected Account No.
        if (!accountNo) {
            alert("Please enter an account number!");
            return;
        }
        if (accountNo !== "") {

        $.ajax({
            type: "GET",
            url: "/api/customersavings/getDataByAccountNumber",
            data: { accountNo: accountNo },
            success: function (response) {
				if (response.status === "OK" && response.data) {
                        const data = response.data;
				 // Concatenate address, state, and pin into a single string
                 let fullAddress = `${data.address}, ${data.state}, ${data.pinCode}`;
    
                // Populate HTML elements with API response
                $("#customerNo").text(data.selectByCustomer);
                $("#accountNo").text(data.accountNumber);
                $("#customerName").text(data.enterCustomerName);
                $("#familyDetails").text(data.familyDetails);
                $("#dateOfBirth").text(data.dateOfBirth);
                $("#contactNo").text(response.contactNumber);
                $("#emailId").text(response.emailId);
                $("#operationType").text(response.operationType);
                $("#aadharNo").text(response.aadharNo);
                $("#address").text(fullAddress);
                $("#openingDate").text(response.openingDate);
                $("#typeofaccount").text(response.typeofaccount);
                $("#branch").text(response.branchName);
                
				
			 } else {
                alert("No account numbers found for selected type.");
            }
            },
            error: function (xhr) {
                alert("Error: " + xhr.responseJSON.error);
            }
        });
      }
    }
*/

function displaySavingfrontPage() {
    let accountNumber = document.getElementById("accountNumber").value;

    if (!accountNumber) {
        alert("Please select an account number!");
        return;
    }

    $.ajax({
        type: "GET",
        url: "/api/customersavings/getDataByAccountNumber",
        data: { accountNumber: accountNumber },  // 🔥 make sure name matches @RequestParam
        success: function (response) {
            if (response.status === "OK" && response.data) {
                const data = response.data;
                let fullAddress = `${data.address}, ${data.state}, ${data.pinCode}`;

                $("#customerNo").text(data.selectByCustomer);
                $("#accountNo").text(data.accountNumber);
                $("#customerName").text(data.enterCustomerName);
                $("#familyDetails").text(data.familyDetails);
                $("#dateOfBirth").text(data.dateOfBirth);
                $("#contactNo").text(data.contactNumber);
                $("#emailId").text(data.emailId);
                $("#operationType").text(data.operationType);
                $("#aadharNo").text(data.aadharNo);
                $("#address").text(fullAddress);
                $("#openingDate").text(data.openingDate);
                $("#typeofaccount").text(data.typeofaccount);
                $("#branch").text(data.branchName);

                // If you have these fields in your data, else remove
                $("#IFSCCode").text(data.ifscCode || '');
                $("#dateOfIssue").text(data.dateOfIssue || '');
                $("#nominationStatus").text(data.nominationStatus || '');
                $("#nominationName").text(data.nominationName || '');
                $("#upi").text(data.upi || '');
                $("#tableSection").hide();
                $('#printbtnSection').show();
                $('#passbookSection').show();
                $("#headingSection").hide();
                $("#TransactionSection").hide();

            } else {
                alert("No account data found.");
            }
        },
        error: function (xhr) {
            alert("Error fetching data: " + (xhr.responseJSON?.error || xhr.statusText));
        }
    });
}

//Janvi : Print Button
// print Code
$("#printBtn").on("click", function (e) {
		e.preventDefault();

		// Clone the form
		const $formClone = $("#passbookId").clone();

		/*// Remove the button row from cloned form
		$formClone.find("#editmember").remove();
		$formClone.find("#printBtn").remove();
		$formClone.find("#updateBtn").remove();
		$formClone.find("#deleteBtn").remove();*/

		// Optional: remove any row that holds the buttons
		$formClone.find(".text-center").each(function () {
			if ($(this).find("button").length > 0) {
				$(this).remove();
			}
		});

		// Open print window
		const printWindow = window.open("", "_blank");

		if (printWindow) {
			printWindow.document.open();
			printWindow.document.write(`
				<html>
				<head>
					<title>Print - Customer Form</title>
					<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
					<style>
						body {
							font-family: Arial, sans-serif;
							padding: 20px;
						}
						.formFields {
							margin-bottom: 15px;
						}
						label {
							font-weight: bold;
						}
						input, select, textarea {
							border: 1px solid #ccc;
							border-radius: 5px;
							padding: 5px;
							width: 100%;
						}
						.toggle {
							pointer-events: none;
						}
					</style>
				</head>
				<body onload="window.print(); window.close();">
					<h3 class="text-center mb-4">Customer Information</h3>
					${$formClone[0].outerHTML}
				</body>
				</html>
			`);
			printWindow.document.close();
		} else {
			alert("Popup blocked. Please allow popups for this website.");
		}
	});
	
function displayHeadingSA(){
	$("#tableSection").hide();
	$('#printbtnSection').show();
    $('#passbookSection').hide();
	$("#headingSection").show();
	$("#TransactionSection").hide();
}

function displaySavingTransaction(){
	let accountNumber = document.getElementById("accountNumber").value; // Get the selected Account No.
    if (!accountNumber) {
        alert("Please select an Account Number.");
        return;
    }

    var input = {
        accountNo: accountNumber // Match the backend expectation
    };
   // const myJson = JSON.stringify(input);

    //AJAX call to fetch SavingTransactionEntry details
    $.ajax({
        type: "GET",
        contentType: "application/json",
        data: JSON.stringify({ accountNumber: accountNumber }), // Ensure correct parameter name
        url: '/api/customersavings/getsavingaccountactivity',
        async: false,
        success: function(data) {
            if (data && data.length > 0) {
				//let j=1;
                const tableData = data.map(function(value) {
                    return (
                        `<tr>                      
                          
                            <td>${value.transactionDate}</td>
                            <td>${value.accountNumber}</td>
                            <td>${value.transactionAmount}</td>
                            <td>${value.transactionAmount}</td>                           
                            <td>${value.averageBalance}</td>
                        </tr>`
                    );
                }).join('');

                document.querySelector("#tableBody1").innerHTML = tableData;
                document.getElementById("transaction-tabl").style.display = "table";
				$("#tableSection").hide();
	            $('#printbtnSection').show();
                $('#passbookSection').hide();
	            $("#headingSection").hide();
	            $("#TransactionSection").show();
            } else {
                document.querySelector("#tableBody").innerHTML = "<tr><td colspan='11' class='text-center'>No transactions found.</td></tr>";
                document.getElementById("tabl").style.display = "table"; 
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert("Failed to fetch transactions. Error: " + textStatus + ", " + errorThrown);
        }
    });	
}
