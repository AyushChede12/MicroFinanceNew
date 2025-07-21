$(document).ready(function() {

	//Without Search in Dropdown
	/*$.ajax({
		url: "/api/financialconsultant/getAllCustomerCodes",
		type: "POST",
		success: function(response) {
			if (response.status === "FOUND") {
				$("#customerCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#customerCode").append(<option value='${item.memberCode}'>${item.memberCode}-${item.customerName}</option>);
				});
			} else {
				alert("No customer codes found.");
			}
		},
		error: function() {
			alert("Failed to load customer codes.");
		}
	}); */

	//With Search in Dropdown
	$.ajax({
		url: 'approved',
		type: 'GET',
		success: function(response) {
			// response is a direct array of addCustomer
			if (Array.isArray(response) && response.length > 0) {
				let customerOptions = response.map(function(item) {
					return {
						id: item.memberCode,
						text: item.memberCode + " - " + item.customerName
					};
				});

				$('#customerCode').select2({
					placeholder: '-- Search Customer Code or Name --',
					data: customerOptions,
					matcher: function(params, data) {
						if ($.trim(params.term) === '') return data;
						if (typeof data.text === 'undefined') return null;

						const term = params.term.toLowerCase();
						const text = data.text.toLowerCase();
						return text.includes(term) ? data : null;
					}
				});
			} else {
				alert("No approved customers found.");
			}
		},
		error: function() {
			alert("Failed to load customer codes.");
		}
	});



	$("#customerCode").change(function() {
		let customerCode = $("#customerCode").val();
		if (customerCode !== "") {
			$.ajax({
				type: "POST",
				url: "/api/customershareholdingcontroller/fetchByCustomerCode",
				data: { memberCode: customerCode },
				success: function(response) {
					if (response.status == "FOUND") {
						let data = response.data[0];
						$("#id").val(data.id);
						$("#signupDate").val(data.signupDate);
						$("#major").val(data.major);
						$("#customerName").val(data.customerName);
						$("#familyMemberName").val(data.guardianName);
						$("#relationToApplicant").val(data.relationToApplicant);
						$("#customerGender").val(data.customerGender);
						$("#dob").val(data.dob);
						$("#customerAge").val(data.customerAge);
						$("#relationshipStatus").val(data.relationshipStatus);
						$("#customerAddress").val(data.customerAddress);
						$("#district").val(data.district);
						$("#state").val(data.state);
						$("#branchName").val(data.branchName);
						$("#pinCode").val(data.pinCode);
						$("#aadharNo").val(data.aadharNo);
						$("#panNo").val(data.panNo);
						$("#voterNo").val(data.voterNo);
						$("#contactNo").val(data.contactNo);
						$("#emailId").val(data.emailId);
						$("#profession").val(data.profession);
						$("#academicBackground").val(data.academicBackground);
						$("#referralCode").val(data.referralCode);
						$("#referralName").val(data.referralName);
						$("#minor").val(data.minor);
						//$("#photoPreview").attr("src", data.customerPhoto ? `Uploads/${data.customerPhoto}` : "Uploads/default-placeholder.jpg");

						if (data.customerPhoto) {
							const photoPath = `Uploads/${data.customerPhoto}`;
							$("#photoPreview").attr("src", photoPath);
							$("#photoHidden").val(photoPath);
							const fakePhotoEvent = { target: { result: photoPath } };
							photoSizeEdit(fakePhotoEvent);

						} else {
							$("#photoPreview").attr("src", "Uploads/default-placeholder.jpg");
							$("#photoHidden").val("");
						}

						// Image: Signature
						if (data.customerSignature) {
							const signPath = `Uploads/${data.customerSignature}`;
							$("#signaturePreview").attr("src", signPath);
							$("#signatureHidden").val(signPath);
							const fakeSignEvent = { target: { result: signPath } };
							signatureSizeEdit(fakeSignEvent);

						} else {
							$("#signaturePreview").attr("src", "Uploads/default-placeholder.jpg");
							$("#signatureHidden").val("");
						}

						//Nominee 
						$("#nomineeName").val(data.nomineeName);
						$("#nomineeRelationToApplicant").val(data.nomineeRelationToApplicant);
						$("#nomineeAddress").val(data.nomineeAddress);
						$("#nomineeKycNo").val(data.nomineeKycNo);
						$("#nomineeMobileNo").val(data.nomineeMobileNo);
						$("#nomineeAge").val(data.nomineeAge);
						$("#nomineePanNo").val(data.nomineePanNo);
						$("#nomineeKycType").val(data.nomineeKycType);

						if (parseInt(data.memberStatus) === 1) {
							$('#toggle-member-status').prop('checked', true);
						} else {
							$('#toggle-member-status').prop('checked', false);
						}

						if (parseInt(data.memberBanking) === 1) {
							$('#toggle-mobile-banking').prop('checked', true);
						} else {
							$('#toggle-mobile-banking').prop('checked', false);
						}

						if (parseInt(data.netBanking) === 1) {
							$('#toggle-net-banking').prop('checked', true);
						} else {
							$('#toggle-net-banking').prop('checked', false);
						}

						if (parseInt(data.smsSend) === 1) {
							$('#toggle-sms-send').prop('checked', true);
						} else {
							$('#toggle-sms-send').prop('checked', false);
						}

						updateToggleColor(document.getElementById('toggle-member-status'));
						updateToggleColor(document.getElementById('toggle-mobile-banking'));
						updateToggleColor(document.getElementById('toggle-net-banking'));
						updateToggleColor(document.getElementById('toggle-sms-send'));

					} else {
						alert("No customer found for this member code.");
					}
				},
				error: function() {
					alert("Member not found or server error.");
				}
			});
		}
	});

	$.ajax({
		url: "/api/preference/getAllRelativeModule", // Add base path if needed like /api/preference/getAllBranchModule
		type: "GET",
		success: function(response) {
			if (response.status == "FOUND") {
				const relativeList = response.data;
				$("#nomineeRelationToApplicant").empty(); // Clear existing options
				$("#nomineeRelationToApplicant").append("<option value=''>-- Select Relative --</option>");

				for (let i = 0; i < relativeList.length; i++) {
					let relative = relativeList[i];
					let option = `<option value="${relative.relation}">${relative.relation}</option>`;
					$("#nomineeRelationToApplicant").append(option);
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



	$('#updateBtn').click(async function(event) {
		event.preventDefault();
		var customerData = new FormData();
		var id = $('#id').val();
		customerData.append("id",id);
		customerData.append("memberCode", $('#customerCode').val());
		customerData.append("signupDate", $('#signupDate').val());
		customerData.append("customerName", $('#customerName').val());
		customerData.append("customerGender", $('#customerGender').val());
		customerData.append("guardianName", $('#guardianName').val());
		customerData.append("relationToApplicant", $('#relationToApplicant').val());
		customerData.append("dob", $('#dob').val());
		customerData.append("customerAge", $('#customerAge').val());
		customerData.append("relationshipStatus", $('#relationshipStatus').val());
		customerData.append("customerAddress", $('#customerAddress').val());
		customerData.append("state", $('#state').val());
		customerData.append("district", $('#district').val());
		customerData.append("aadharNo", $('#aadharNo').val());
		customerData.append("pinCode", $('#pinCode').val());
		customerData.append("branchName", $('#branchName').val());
		customerData.append("panNo", $('#panNo').val());
		customerData.append("voterNo", $('#voterNo').val());
		customerData.append("drivingLicenceNo", $('#drivingLicenceNo').val());
		customerData.append("referralCode", $('#referralCode').val());
		customerData.append("referralName", $('#referralName').val());
		customerData.append("contactNo", $('#contactNo').val());
		customerData.append("emailId", $('#emailId').val());
		customerData.append("profession", $('#profession').val());
		customerData.append("academicBackground", $('#academicBackground').val());

		// Nominee
		customerData.append("nomineeName", $('#nomineeName').val());
		customerData.append("nomineeRelationToApplicant", $('#nomineeRelationToApplicant').val());
		customerData.append("nomineeAddress", $('#nomineeAddress').val());
		customerData.append("nomineeKycNo", $('#nomineeKycNo').val());
		customerData.append("nomineeMobileNo", $('#nomineeMobileNo').val());
		customerData.append("nomineeAge", $('#nomineeAge').val());
		customerData.append("nomineePanNo", $('#nomineePanNo').val());
		customerData.append("nomineeKycType", $('#nomineeKycType').val());
		customerData.append("memberStatus", $('#toggle-member-status').is(':checked') ? 1 : 0);
		customerData.append("memberBanking", $('#toggle-mobile-banking').is(':checked') ? 1 : 0);
		customerData.append("netBanking", $('#toggle-net-banking').is(':checked') ? 1 : 0);
		customerData.append("smsSend", $('#toggle-sms-send').is(':checked') ? 1 : 0);

		const photoFile = $('#customerPhoto')[0].files[0];
		const signatureFile = $('#customerSignature')[0].files[0];

		if (photoFile) {
			customerData.append("customerPhoto", photoFile);
		}

		if (signatureFile) {
			customerData.append("customerSignature", signatureFile);
		}

		$.ajax({
			type: 'POST',
			url: 'saveOrUpdateCustomer',
			data: customerData,
			contentType: false,
			processData: false,
			cache: false,
			success: function(response) {
				if (response.status === "OK") {
					alert("Customer Data Updated Successfully");
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
		if (confirm("Are you sure you want to delete this Customer Data?")) {
			$.ajax({
				url: "/api/datacorrection/deleteCustomerDataByForm",
				type: "POST",
				data: { id: id },
				success: function(response) {
					if (response.status == "OK") {
						alert("Customer Data Deleted Successfully");
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

	$("#printBtn").on("click", function(e) {
		e.preventDefault();

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

document.addEventListener('DOMContentLoaded', function() {
	const toggles = document.querySelectorAll('.toggle__input');

	toggles.forEach((toggle) => {
		updateToggleColor(toggle); // initial state
		toggle.addEventListener('change', function() {
			updateToggleColor(this);
		});
	});
});

function photoUpload() {
	const file = document.getElementById("customerPhoto").files[0];
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
	const file = document.getElementById("customerSignature").files[0];
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
