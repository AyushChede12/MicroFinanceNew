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
		url: "/api/financialconsultant/getAllCustomerCodes",
		type: "POST",
		success: function(response) {
			if (response.status === "FOUND") {
				$("#customerCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#customerCode").append(`<option value='${item.memberCode}'>${item.memberCode}</option>`);
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

					// Photo preview
					if (data.image1) {
						const photoPath = `Uploads/${data.image1}`;
						$("#photoPreview").attr("src", photoPath).show();
						$("#photoHidden").val(data.image1);
					} else {
						$("#photoPreview").attr("src", "Uploads/default-placeholder.jpg").show();
						$("#photoHidden").val("");
					}

					// Signature preview
					if (data.image2) {
						const signPath = `Uploads/${data.image2}`;
						$("#signaturePreview").attr("src", signPath).show();
						$("#signatureHidden").val(data.image2);
					} else {
						$("#signaturePreview").attr("src", "Uploads/default-placeholder.jpg").show();
						$("#signatureHidden").val("");
					}

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

		let savingData = new FormData();

		// Append regular text fields
		savingData.append("id", $('#id').val());
		savingData.append("policyCode", $('#policyCode').val());
		savingData.append("policyStartDate", $('#policyStartDate').val());
		savingData.append("memberSelection", $('#memberSelection').val());
		savingData.append("customerName", $('#customerName').val());
		savingData.append("dateofBirth", $('#dateofBirth').val());
		savingData.append("relationDetails", $('#relationDetails').val());
		savingData.append("contactNo", $('#contactNo').val());
		savingData.append("suggestedNominee", $('#suggestedNominee').val());
		savingData.append("relationToApplicant", $('#relationToApplicant').val());
		savingData.append("address", $('#address').val());
		savingData.append("district", $('#district').val());
		savingData.append("state", $('#state').val());
		savingData.append("pinCode", $('#pinCode').val());
		savingData.append("branchName", $('#branchName').val());
		savingData.append("ModeOfOperation", $('#ModeOfOperation').val());
		savingData.append("maturityDate", $('#maturityDate').val());
		savingData.append("schemeType", $('#schemeType').val());
		savingData.append("schemeTerm", $('#schemeTerm').val());
		savingData.append("schemeMode", $('#schemeMode').val());
		savingData.append("policyAmount", $('#policyAmount').val());
		savingData.append("depositAmount", $('#depositAmount').val());
		savingData.append("maturityAmount", $('#maturityAmount').val());
		savingData.append("MISInterest", $('#MISInterest').val());
		
		//Fees Details
		savingData.append("paymentBy", $('#paymentBy').val());
		savingData.append("remark", $('#remark').val());

		savingData.append("smsSend", $('#toggle-sms-send').is(':checked') ? 1 : 0);

		//Image
		const photoFile = $('#image1')[0].files[0];
		const signatureFile = $('#image2')[0].files[0];

		if (photoFile) {
			savingData.append("image1", photoFile);
		}

		if (signatureFile) {
			savingData.append("image2", signatureFile);
		}


		$.ajax({
			url: "/api/customersavings/saveandupdatesavingaccount",
			type: "POST",
			data: savingData,
			enctype: 'multipart/form-data',
			contentType: false,
			processData: false,
			cache: false,
			success: function(response) {
				if (response.status === "OK") {
					alert("Saving Account Updated Successfully");
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
