$(document).ready(function() {
	/*$.ajax({
		url: "/api/customershareholdingcontroller/findAllTransferShare",
		type: "GET",
		success: function(response) {
			if (response.status === "OK") {
				$("#findByCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#findByCode").append(`<option value='${item.findByCode}'>${item.findByCode}-${item.customerName}</option>`);
				});
			} else {
				alert("No customer codes found.");
			}
		},
		error: function() {
			alert("Failed to load customer codes.");
		}
	});*/
	
	$.ajax({
		url: '/api/customershareholdingcontroller/findAllTransferShare',
		type: 'GET',
		success: function(response) {
			if (response.status === "OK") {
				let transferOptions = response.data.map(function(item) {
					return {
						id: item.findByCode,
						text: item.findByCode + " - " + item.customerName
					};
				});

				// Initialize Select2 with full data and custom search matcher
				$('#findByCode').select2({
					placeholder: '-- Search Customer Code or Name --',
					data: transferOptions,
					matcher: function(params, data) {
						// If no search term, return all
						if ($.trim(params.term) === '') {
							return data;
						}

						if (typeof data.text === 'undefined') {
							return null;
						}

						// Case-insensitive match on memberCode or customerName
						const term = params.term.toLowerCase();
						const text = data.text.toLowerCase();

						if (text.includes(term)) {
							return data;
						}

						return null;
					}
				});

			} else {
				alert("No customer codes found.");
			}
		},
		error: function() {
			alert("Failed to load customer codes.");
		}
	});

	$.ajax({
		url: "api/preference/getAllBranchModule", // Add base path if needed like /api/preference/getAllBranchModule
		type: "GET",
		success: function(response) {
			if (response.status == "FOUND") {
				const branchList = response.data;
				$("#branchName").empty(); // Clear existing options
				$("#branchName").append("<option value=''>-- Select Branch --</option>");

				for (let i = 0; i < branchList.length; i++) {
					let branch = branchList[i];
					let option = `<option value="${branch.branchName}">${branch.branchName}</option>`;
					$("#branchName").append(option);

				}
			} else {
				alert("Error: " + response.message);
			}
		},
		error: function(xhr) {
			console.error("Error loading branches:", xhr.responseText);
			alert("Failed to load dropdown data.");
		}
	});

	$("#findByCode").change(function() {
		let findByCode = $("#findByCode").val();
		$.ajax({
			type: "POST",
			url: "api/customershareholdingcontroller/fetchByFindByCode",
			data: { findByCode: findByCode },
			success: function(response) {
				if (response.status == "FOUND") {
					let data = response.data[0];
					$("#id").val(data.id);
					$("#customerName").val(data.customerName);
					$("#startDate").val(data.startDate);
					$("#previousAccountBalance").val(data.previousAccountBalance);
					$("#previousShareCount").val(data.previousShareCount);
					$("#baseValue").val(data.baseValue);
					$("#branchName").val(data.branch);
					$("#dateOfTransfer").val(data.dateOfTransfer);
					$("#shareIssuedBy").val(data.shareIssuedBy);
					$("#noOfShare").val(data.noOfShare);
					$("#amountTransferred").val(data.amountTransferred);
					$("#balanceShares").val(data.balanceShares);
					$("#modeOfPayment").val(data.modeOfPayment);
					$("#comments").val(data.comments);

				} else {
					alert("Transfer Share Details Not Found For Customer");
				}
			},
			error: function() {
				alert("Shares not found or server error");
			}
		});

	});

	$('#updateBtn').click(function(e) {
		e.preventDefault();

		let transferData = {
			id: $('#id').val(), // Required for update
			findByCode: $('#findByCode').val(),
			customerName: $('#customerName').val(),
			startDate: $('#startDate').val(),
			previousAccountBalance: $('#previousAccountBalance').val(),
			previousShareCount: $('#previousShareCount').val(),
			baseValue: $('#baseValue').val(),
			branch: $('#branch').val(),
			dateOfTransfer: $('#dateOfTransfer').val(),
			shareIssuedBy: $('#shareIssuedBy').val(),
			noOfShare: $('#noOfShare').val(),
			amountTransferred: $('#amountTransferred').val(),
			balanceShares: $('#balanceShares').val(),
			modeOfPayment: $('#modeOfPayment').val(),
			comments: $('#comments').val()
		};

		$.ajax({
			url: '/api/customershareholdingcontroller/updateTransferShare',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(transferData),
			success: function(response) {
				if (response.status === "FOUND") {
					alert("Transfer Data Updated Successfully");
					location.reload();
					// Optionally refresh the table or UI
				} else {
					alert("Something went wrong: " + response.message);
				}
			},
			error: function(xhr) {
				alert("Error while saving data: " + xhr.responseText);
			}
		});
	});

	$('#deleteBtn').click(function(event) {
		var id = $("#id").val();
		if (confirm("Are you sure you want to delete this Transfer Share Data Of Customer?")) {
			$.ajax({
				url: "/api/customershareholdingcontroller/deleteTransferShareById",
				type: "POST",
				data: { id: id },
				success: function(response) {
					if (response.status == "OK") {
						alert("Transfer Data Deleted Successfully");
						location.reload();
					} else {
						alert("Delete failed: " + response.message);
					}
				},
				error: function(xhr, status, error) {
					alert("Failed to delete Transfer Share Data.");
					console.error("Error:", error);
				}
			});
		}

	});

	$("#printBtn").on("click", function(e) {
		e.preventDefault();
		var findByCode = $('#findByCode').val();
		if(findByCode && findByCode !== ""){
			
			const $formClone = $("#formid").clone();

					// Remove buttons and extra dropdowns
					$formClone.find("#editmember, #printBtn, #updateBtn, #deleteBtn, #customerCode, #customerSelection").remove();
					$formClone.find(".text-center").each(function() {
						if ($(this).find("button").length > 0) {
							$(this).remove();
						}
					});

					// Convert selects to plain text
					$formClone.find("select").each(function() {
						const selectedText = $(this).find("option:selected").text();
						$(this).replaceWith(`<span class="form-value">${selectedText}</span>`);
					});

					// Convert inputs to plain text
					$formClone.find("input[type='text'], input[type='date'], input[type='number'], input[type='email'], input[type='tel']").each(function() {
						const value = $(this).val();
						$(this).replaceWith(`<span class="form-value">${value}</span>`);
					});

					// Convert textareas
					$formClone.find("textarea").each(function() {
						const value = $(this).val();
						$(this).replaceWith(`<span class="form-value">${value}</span>`);
					});

					// Convert checkboxes and radios
					$formClone.find("input[type='checkbox'], input[type='radio']").each(function() {
						const isChecked = $(this).is(':checked') ? 'Yes' : 'No';
						$(this).replaceWith(`<span class="form-value">${isChecked}</span>`);
					});

					// Optional: Resize images if any
					$formClone.find("img").each(function() {
						$(this).css({
							width: "100px",
							height: "auto",
							border: "1px solid #ccc",
							marginBottom: "10px"
						});
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
												font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
												padding: 30px;
												background: #fff;
												color: #333;
											}
											h3 {
												text-align: center;
												margin-bottom: 30px;
												border-bottom: 2px solid #444;
												padding-bottom: 10px;
											}
											.form-group, .form-row {
												margin-bottom: 20px;
												display: flex;
												flex-wrap: wrap;
												align-items: center;
											}
											label {
												width: 200px;
												font-weight: 600;
												margin-bottom: 5px;
												color: #000;
											}
											.form-value {
												flex: 1;
												padding: 8px 12px;
												border: 1px solid #ccc;
												border-radius: 5px;
												background-color: #f9f9f9;
												font-weight: 500;
												color: #222;
											}
											img {
												display: block;
												margin-top: 10px;
											}
											@media print {
												body {
													zoom: 95%;
												}
											}
										</style>
									</head>
									<body onload="window.print(); window.close();">
										<h3>Customer Information</h3>
										<div class="container">
											${$formClone[0].outerHTML}
										</div>
									</body>
									</html>
								`);
						printWindow.document.close();
					} else {
						alert("Popup blocked. Please allow popups for this website.");
					}
			
		}
		else{
			alert("First Select Any One Data Then Proceed to Print");
		}
		
	});

});