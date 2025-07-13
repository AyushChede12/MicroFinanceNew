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

					// Photo preview
					if (data.image1) {
						const photoPath = `Uploads/${data.image1}`;
						$("#photoPreview").attr("src", photoPath).show();
						$("#photoHidden").val(data.image1);
						const fakePhotoEvent = { target: { result: photoPath } };
						photoSizeEdit(fakePhotoEvent);
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

		let policyData = new FormData();

		// Append regular text fields
		policyData.append("id", $('#id').val());
		policyData.append("policyCode", $('#policyCode').val());
		policyData.append("policyStartDate", $('#policyStartDate').val());
		policyData.append("memberSelection", $('#memberSelection').val());
		policyData.append("customerName", $('#customerName').val());
		policyData.append("dateofBirth", $('#dateofBirth').val());
		policyData.append("relationDetails", $('#relationDetails').val());
		policyData.append("contactNo", $('#contactNo').val());
		policyData.append("suggestedNominee", $('#suggestedNominee').val());
		policyData.append("relationToApplicant", $('#relationToApplicant').val());
		policyData.append("address", $('#address').val());
		policyData.append("district", $('#district').val());
		policyData.append("state", $('#state').val());
		policyData.append("pinCode", $('#pinCode').val());
		policyData.append("branchName", $('#branchName').val());
		policyData.append("ModeOfOperation", $('#ModeOfOperation').val());
		policyData.append("maturityDate", $('#maturityDate').val());
		policyData.append("schemeType", $('#schemeType').val());
		policyData.append("schemeTerm", $('#schemeTerm').val());
		policyData.append("schemeMode", $('#schemeMode').val());
		policyData.append("policyAmount", $('#policyAmount').val());
		policyData.append("depositAmount", $('#depositAmount').val());
		policyData.append("maturityAmount", $('#maturityAmount').val());
		policyData.append("MISInterest", $('#MISInterest').val());

		//Fees Details
		policyData.append("paymentBy", $('#paymentBy').val());
		policyData.append("remark", $('#remark').val());

		policyData.append("smsSend", $('#toggle-sms-send').is(':checked') ? 1 : 0);

		//Image
		const photoFile = $('#image1')[0].files[0];
		const signatureFile = $('#image2')[0].files[0];

		if (photoFile) {
			policyData.append("image1", photoFile);
		}

		if (signatureFile) {
			policyData.append("image2", signatureFile);
		}


		$.ajax({
			url: "/api/datacorrection/saveOrUpdatePolicyManagement",
			type: "POST",
			data: policyData,
			enctype: 'multipart/form-data',
			contentType: false,
			processData: false,
			cache: false,
			success: function(response) {
				alert("success");
				if (response.status === "OK") {
					alert("Policy Details Updated Successfully");
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
