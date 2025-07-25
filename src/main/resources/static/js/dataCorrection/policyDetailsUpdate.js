$(document).ready(function() {

	//Search Without Dropdown
	/*$.ajax({
		url: "/api/Policymangment/getaddinvestmentdetails",
		type: "GET",
		success: function(response) {
			if (response.status === "OK") {
				$("#policyCode").empty().append("<option value=''>-- Select Policy Code --</option>");
				response.data.forEach(function(item) {
					$("#policyCode").append(`<option value='${item.policyCode}'>${item.customerName}-${item.policyCode}</option>`);
				});
			} else {
				alert("No Policy codes found.");
			}
		},
		error: function() {
			alert("Failed to load Policy codes.");
		}
	});*/

	//Search With Dropdown
	$.ajax({
		url: '/api/Policymangment/getaddinvestmentdetails',
		type: 'GET',
		success: function(response) {
			if (response.status === "OK") {
				let policyOptions = response.data.map(function(item) {
					return {
						id: item.policyCode,
						text: item.policyCode + " - " + item.customerName
					};
				});

				// Initialize Select2 with full data and custom search matcher
				$('#policyCode').select2({
					placeholder: '-- Search Policy Code or Name --',
					data: policyOptions,
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
				alert("No Policy codes found.");
			}
		},
		error: function() {
			alert("Failed to load Policy codes.");
		}
	});

	$.ajax({
		url: "/api/Policymangment/getAllPolicyManagementData",
		type: "GET",
		success: function(response) {
			if (response.status === "OK") {
				$("#memberSelection").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#memberSelection").append(`<option value='${item.memberSelection}'>${item.memberSelection}</option>`);
				});
			} else {
				alert("No customer codes found.");
			}
		},
		error: function() {
			alert("Failed to load customer codes.");
		}
	});

	$("#policyCode").change(function() {
		let policyCode = $("#policyCode").val();
		if (!policyCode) {
			alert("Please enter/select a Policy Code.");
			return;
		}

		$.ajax({
			type: "GET",
			url: "api/Policymangment/getPolicyByPolicyCode",
			data: { policyCode: policyCode },
			success: function(response) {
				console.log("Full Response:", response);

				if (response.status === "OK" && response.data) {
					let data = response.data; // ✅ direct object access

					// Populate form fields
					$("#id").val(data.id);
					$("#policyStartDate").val(data.policyStartDate);
					$("#memberSelection").val(data.memberSelection);
					$("#customerName").val(data.customerName);
					$("#dateofBirth").val(data.dateofBirth);
					$("#relationDetails").val(data.relationDetails);
					$("#contactNo").val(data.contactNo);
					$("#suggestedNominee").val(data.suggestedNominee);
					$("#relationToApplicant").val(data.relation);
					$("#address").val(data.address);
					$("#district").val(data.district);
					$("#state").val(data.state);
					$("#pinCode").val(data.pinCode);
					$("#branchName").val(data.branchName);
					$("#ModeOfOperation").val(data.ModeOfOperation);
					$("#maturityDate").val(data.maturityDate);
					$("#schemeType").val(data.schemeType);
					$("#schemeTerm").val(data.schemeTerm);
					$("#schemeMode").val(data.schemeMode);
					$("#policyAmount").val(data.policyAmount);
					$("#depositAmount").val(data.depositAmount);
					$("#maturityAmount").val(data.maturityAmount);
					$("#MISInterest").val(data.MISInterest);
					$("#paymentBy").val(data.paymentBy);
					$("#remark").val(data.remark);

					// SMS toggle
					const isSmsSend = parseInt(data.smsSend) === 1;
					$('#toggle-sms-send').prop('checked', isSmsSend);
					updateToggleColor(document.getElementById('toggle-sms-send'));

				} else {
					alert("Policy Details Not Found For Customer");
				}
			},
			error: function() {
				alert("Policy not found or server error");
			}
		});
	});

	$('#updateBtn').click(function(e) {
		e.preventDefault();

		let policyData = {
			id: $('#id').val(),
			policyCode: $('#policyCode').val(),
			policyStartDate: $('#policyStartDate').val(),
			memberSelection: $('#memberSelection').val(),
			customerName: $('#customerName').val(),
			dateofBirth: $('#dateofBirth').val(),
			relationDetails: $('#relationDetails').val(),
			contactNo: $('#contactNo').val(),
			suggestedNominee: $('#suggestedNominee').val(),
			relation: $('#relationToApplicant').val(),  // Match backend field name
			address: $('#address').val(),
			district: $('#district').val(),
			state: $('#state').val(),
			pinCode: $('#pinCode').val(),
			branchName: $('#branchName').val(),
			modeOfOperation: $('#ModeOfOperation').val(),
			maturityDate: $('#maturityDate').val(),
			schemeType: $('#schemeType').val(),
			schemeTerm: $('#schemeTerm').val(),
			schemeMode: $('#schemeMode').val(),
			policyAmount: $('#policyAmount').val(),
			depositAmount: $('#depositAmount').val(),
			maturityAmount: $('#maturityAmount').val(),
			paymentBy: $('#paymentBy').val(),
			remark: $('#remark').val(),
			smsSend: $('#toggle-sms-send').is(':checked') ? 1 : 0
		};

		$.ajax({
			url: "/api/datacorrection/updateDataOfPolicyManagement",
			type: "POST",
			data: JSON.stringify(policyData),
			contentType: "application/json",
			success: function(response) {
				if (response.status === "OK") {
					alert("Policy Details Updated Successfully");
					location.reload();
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
		let policyCode = $("#policyCode").val();
		if (policyCode !== "") {
			if (confirm("Are you sure you want to delete this Policy Data?")) {
				$.ajax({
					url: "/api/datacorrection/deletePolicyDataByForm",
					type: "POST",
					data: { id: id },
					success: function(response) {
						if (response.status == "OK") {
							alert("Policy Data Deleted Successfully");
							location.reload();
						} else {
							alert("Delete failed: " + response.message);
						}
					},
					error: function(xhr, status, error) {
						alert("Failed to delete Policy Data.");
						console.error("Error:", error);
					}
				});
			}
		}
		else {
			alert("First Select Any One Data Then Proceed To Delete!");
		}

	});

	$("#printBtn").on("click", function(e) {
		e.preventDefault();

		var policyCode = $('#policyCode').val();
		if (policyCode && policyCode !== "") {

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
							<title>Print - Policy Form</title>
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
							<h3>Policy Information</h3>
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
		else {
			alert("First Select Any One Data Then Proceed to Print");
		}
	});


});

document.addEventListener('DOMContentLoaded', function() {
	const toggles = document.querySelectorAll('.toggle__input');

	toggles.forEach((toggle) => {
		updateToggleColor(toggle);

		toggle.addEventListener('change', () => {
			updateToggleColor(toggle);
			console.log(`${toggle.dataset.toggleType} is now ${toggle.checked}`);
		});
	});

	function updateToggleColor(input) {
		const label = input.nextElementSibling;
		if (label) {
			label.style.backgroundColor = input.checked ? '#28a745' : '#ccc';
		}
	}


});

function updateToggleColor(input) {
	const label = input.nextElementSibling;
	if (input.checked) {
		label.style.backgroundColor = "#4caf50";  // green
		label.style.borderColor = "#4caf50";
	} else {
		label.style.backgroundColor = "#ccc";  // gray
		label.style.borderColor = "#ccc";
	}
}

function photoUpload() {
	const file = document.getElementById("image1").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			photoSizeEdit(e);
			$("#photoHidden").val("");

		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for photo.");
	}
}


//Ayush
function signatureUpload() {
	const file = document.getElementById("image2").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			signatureSizeEdit(e);
			$("#signatureHidden").val("");
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

function photoSizeEdit(e) {
	const previewimg = document.getElementById("photoPreview");
	previewimg.src = e.target.result;
	previewimg.style.width = "100%";
	previewimg.style.height = "100%";
	previewimg.style.objectFit = "cover";
	previewimg.style.overflow = "hidden";
	previewimg.style.borderRadius = "20px";
}

function signatureSizeEdit(e) {
	const previewimg = document.getElementById("signaturePreview");
	previewimg.src = e.target.result;
	previewimg.style.width = "100%";
	previewimg.style.height = "100%";
	previewimg.style.objectFit = "cover";
	previewimg.style.overflow = "hidden";
	previewimg.style.borderRadius = "20px";
}
