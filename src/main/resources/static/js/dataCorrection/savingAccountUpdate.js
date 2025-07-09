$(document).ready(function() {
	$.ajax({
		url: "/api/customersavings/getAllSavingAccountData",
		type: "GET",
		success: function(response) {
			if (response.status === "FOUND") {
				$("#accountNumber").empty().append("<option value=''>-- Select Account No --</option>");
				response.data.forEach(function(item) {
					$("#accountNumber").append(`<option value='${item.accountNumber}'>${item.accountNumber}-${item.enterCustomerName}</option>`);
				});
			} else {
				alert("No Account Number found.");
			}
		},
		error: function() {
			alert("Failed to load Account Numbers.");
		}
	});

	$.ajax({
		url: "/api/customersavings/getAllSavingAccountData",
		type: "GET",
		success: function(response) {
			if (response.status === "FOUND") {
				$("#selectByCustomer").empty().append("<option value=''>-- Select Customer Code --</option>");
				response.data.forEach(function(item) {
					$("#selectByCustomer").append(`<option value='${item.selectByCustomer}'>${item.selectByCustomer}</option>`);
				});
			} else {
				alert("No Account Number found.");
			}
		},
		error: function() {
			alert("Failed to load Account Numbers.");
		}
	});

	$.ajax({
		url: "/api/customersavings/getAllSavingAccountData",
		type: "GET",
		success: function(response) {
			if (response.status === "FOUND") {
				$("#financialConsultantCode").empty().append("<option value=''>-- Select Financial Code --</option>");
				response.data.forEach(function(item) {
					$("#financialConsultantCode").append(`<option value='${item.financialConsultantCode}'>${item.financialConsultantCode}</option>`);
				});
			} else {
				alert("No Account Number found.");
			}
		},
		error: function() {
			alert("Failed to load Account Numbers.");
		}
	});

	$.ajax({
		url: "/api/financialconsultant/getAllCustomerCodes",
		type: "POST",
		success: function(response) {
			if (response.status === "FOUND") {
				$("#jointOperationCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#jointOperationCode").append(`<option value='${item.memberCode}'>${item.memberCode}</option>`);
				});
			} else {
				alert("No customer codes found.");
			}
		},
		error: function() {
			alert("Failed to load customer codes.");
		}
	});

	$("#accountNumber").change(function() {
		let accountNumber = $("#accountNumber").val();
		$.ajax({
			type: "GET",
			url: "api/customersavings/getallbyaccountnumber",
			data: { accountNumber: accountNumber },
			success: function(response) {
				if (response.status == "FOUND") {
					let data = response.data[0];
					$("#id").val(data.id);
					$("#openingDate").val(data.openingDate);
					$("#selectByCustomer").val(data.selectByCustomer);
					$("#enterCustomerName").val(data.enterCustomerName);
					$("#dateOfBirth").val(data.dateOfBirth);
					$("#customerAge").val(data.customerAge);
					$("#familyDetails").val(data.familyDetails);
					$("#contactNumber").val(data.contactNumber);
					$("#suggestedNomineeName").val(data.suggestedNomineeName);
					$("#suggestedNomineeAge").val(data.suggestedNomineeAge);
					$("#relationToApplicant").val(data.suggestedNomineeRelation);
					$("#address").val(data.address);
					$("#district").val(data.district);
					$("#branchName").val(data.branchName);
					$("#state").val(data.state);
					$("#pinCode").val(data.pinCode);
					$("#operationType").val(data.operationType);
					$("#jointOperationCode").val(data.jointOperationCode);
					$("#jointSurvivorCode").val(data.jointSurvivorCode);
					$("#familyRelation").val(data.familyRelation);
					$("#selectPlan").val(data.selectPlan);
					$("#openingAmount").val(data.openingAmount);
					$("#financialConsultantCode").val(data.financialConsultantCode);
					$("#financialConsultantName").val(data.financialConsultantName);
					$("#openingFees").val(data.openingFees);

					//Payment Details
					$("#modeOfPayment").val(data.modeOfPayment);
					$("#comment").val(data.comment);
					//$("#financialPhotoPreview").attr("src", data.customerPhoto ? `Uploads/${data.customerPhoto}` : "Uploads/default-placeholder.jpg");
					//$("#financialSignaturePreview").attr("src", data.customerSignature ? `Uploads/${data.customerSignature}` : "Uploads/default-placeholder.jpg");

					/*if (data.customerPhoto) {
						$('#financialPhotoPreview').attr('src', '/Uploads/' + data.customerPhoto).show();
						$('#financialphotoHidden').val(data.customerPhoto);
					}

					if (data.customerSignature) {
						$('#financialSignaturePreview').attr('src', '/Uploads/' + data.customerSignature).show();
						$('#financialsignatureHidden').val(data.customerSignature);
					}*/

					// Image bindings (photo and signature)
					/*if (data.customerPhoto) {
						$('#financialPhotoPreview').attr('src', '/Uploads/' + data.customerPhoto);
						$('#financialphotoHidden').val(data.customerPhoto); // Store file name for fallback
					} else {
						$('#financialPhotoPreview').attr('src', '/Uploads/default-placeholder.jpg');
					}

					if (data.customerSignature) {
						$('#financialSignaturePreview').attr('src', '/Uploads/' + data.customerSignature);
						$('#financialsignatureHidden').val(data.customerSignature); // Store file name for fallback
					} else {
						$('#financialSignaturePreview').attr('src', '/Uploads/default-placeholder.jpg');
					}

*/

					if (parseInt(data.accountStatus) === 1) {
						$('#toggle-account-status').prop('checked', true);
					} else {
						$('#toggle-account-status').prop('checked', false);
					}

					if (parseInt(data.messageSend) === 1) {
						$('#toggle-sms-send').prop('checked', true);
					} else {
						$('#toggle-sms-send').prop('checked', false);
					}

					if (parseInt(data.debitCardIssue) === 1) {
						$('#toggle-debit-card').prop('checked', true);
					} else {
						$('#toggle-debit-card').prop('checked', false);
					}

					updateToggleColor(document.getElementById('toggle-account-status'));
					updateToggleColor(document.getElementById('toggle-sms-send'));
					updateToggleColor(document.getElementById('toggle-debit-card'));


				} else {
					alert("Transfer Share Details Not Found For Customer");
				}
			},
			error: function() {
				alert("Shares not found or server error");
			}
		});

	});

	$('#deleteBtn').click(function(event) {
		var id = $("#id").val();
		if (confirm("Are you sure you want to delete this Customer Data?")) {
			$.ajax({
				url: "/api/customersavings/deleteSavingAccountDataById",
				type: "POST",
				data: { id: id },
				success: function(response) {
					if (response.status == "OK") {
						alert("Customer Savings Data Deleted Successfully");
						location.reload();
					} else {
						alert("Delete failed: " + response.message);
					}
				},
				error: function(xhr, status, error) {
					alert("Failed to delete Customer.");
					console.error("Error:", error);
				}
			});
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

function fetchByFinancialCode() {
	var financialConsultantCode = $("#financialConsultantCode").val();

	$.ajax({
		type: "POST",
		url: "api/financialconsultant/getfinancialHierarchyByFinancialCode",
		data: { financialCode: financialConsultantCode },
		success: function(response) {
			alert("success");
			if (response.status == "OK") {
				alert("if condition");
				let data = response.data[0];
				$("#financialConsultantName").val(data.customerName);
			} else {
				alert("Transfer Share Details Not Found For Customer");
			}
		},
		error: function() {
			alert("Shares not found or server error");
		}
	});


}
