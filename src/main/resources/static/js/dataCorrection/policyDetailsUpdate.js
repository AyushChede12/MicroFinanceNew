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
		$.ajax({
			type: "POST",
			url: "api/financialconsultant/getfinancialHierarchyByFinancialCode",
			data: { financialCode: financialCode },
			success: function(response) {
				if (response.status == "OK") {
					let data = response.data[0];
					$("#id").val(data.id);
					$("#joiningDate").val(data.joiningDate);
					$("#memberCode").val(data.memberCode);
					$("#customerName").val(data.customerName);
					$("#dob").val(data.dob);
					$("#customerAge").val(data.customerAge);
					$("#guardianName").val(data.guardianName);
					$("#relationToApplicant").val(data.relationToApplicant);
					$("#contactNo").val(data.contactNo);
					$("#nomineeName").val(data.nomineeName);
					$("#branchName").val(data.branchName);
					$("#nomineeAge").val(data.nomineeAge);
					$("#customerAddress").val(data.customerAddress);
					$("#district").val(data.district);
					$("#state").val(data.state);
					$("#pinCode").val(data.pinCode);
					$("#profession").val(data.profession);
					$("#academicBackground").val(data.academicBackground);
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
					if (data.customerPhoto) {
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


					$("#selectPosition").val(data.selectPosition);
					$("#referralCode").val(data.referralCode);
					$("#referralName").val(data.referralName);

					$("#fees").val(data.fees);
					$("#modeofPayment").val(data.modeofPayment);
					$("#comments").val(data.comments);

					if (parseInt(data.financialStatus) === 1) {
						$('#toggle-financial-status').prop('checked', true);
					} else {
						$('#toggle-financial-status').prop('checked', false);
					}

					if (parseInt(data.smsSend) === 1) {
						$('#toggle-sms-send').prop('checked', true);
					} else {
						$('#toggle-sms-send').prop('checked', false);
					}

					updateToggleColor(document.getElementById('toggle-financial-status'));
					updateToggleColor(document.getElementById('toggle-sms-send'));


				} else {
					alert("Transfer Share Details Not Found For Customer");
				}
			},
			error: function() {
				alert("Shares not found or server error");
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