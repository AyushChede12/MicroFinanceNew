$(document).ready(function() {
	$.ajax({
		url: "/api/financialconsultant/getAllFinancialConsultantDetails",
		type: "POST",
		success: function(response) {
			if (response.status === "OK") {
				$("#financialCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#financialCode").append(`<option value='${item.financialCode}'>${item.financialCode}-${item.customerName}</option>`);
				});
			} else {
				alert("No Financial codes found.");
			}
		},
		error: function() {
			alert("Failed to load Financial codes.");
		}
	});

	$.ajax({
		url: "/api/financialconsultant/getAllFinancialConsultantDetails",
		type: "POST",
		success: function(response) {
			if (response.status === "OK") {
				$("#memberCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#memberCode").append(`<option value='${item.memberCode}'>${item.memberCode}</option>`);
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
		url: "/api/preference/getAllRelativeModule", // Add base path if needed like /api/preference/getAllBranchModule
		type: "GET",
		success: function(response) {
			if (response.status == "FOUND") {
				const relativeList = response.data;
				$("#relationToApplicant").empty(); // Clear existing options
				$("#relationToApplicant").append("<option value=''>-- Select Relative To Applicant --</option>");

				for (let i = 0; i < relativeList.length; i++) {
					let relative = relativeList[i];
					let option = `<option value="${relative.relation}">${relative.relation}</option>`;
					$("#relationToApplicant").append(option);
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

	$("#financialCode").change(function() {
		let financialCode = $("#financialCode").val();
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

	$('#updateBtn').click(function(e) {
		e.preventDefault();

		let financialData = new FormData();

		// Append regular text fields
		financialData.append("id", $('#id').val());
		financialData.append("financialCode", $('#financialCode').val());
		financialData.append("joiningDate", $('#joiningDate').val());
		financialData.append("memberCode", $('#memberCode').val());
		financialData.append("customerName", $('#customerName').val());
		financialData.append("dob", $('#dob').val());
		financialData.append("customerAge", $('#customerAge').val());
		financialData.append("guardianName", $('#guardianName').val());
		financialData.append("relationToApplicant", $('#relationToApplicant').val());
		financialData.append("contactNo", $('#contactNo').val());
		financialData.append("nomineeName", $('#nomineeName').val());
		financialData.append("branchName", $('#branchName').val());
		financialData.append("nomineeAge", $('#nomineeAge').val());
		financialData.append("customerAddress", $('#customerAddress').val());
		financialData.append("district", $('#district').val());
		financialData.append("state", $('#state').val());
		financialData.append("pinCode", $('#pinCode').val());
		financialData.append("profession", $('#profession').val());
		financialData.append("academicBackground", $('#academicBackground').val());
		financialData.append("selectPosition", $('#selectPosition').val());
		financialData.append("referralCode", $('#referralCode').val());
		financialData.append("referralName", $('#referralName').val());
		financialData.append("fees", $('#fees').val());
		financialData.append("modeofPayment", $('#modeofPayment').val());
		financialData.append("comments", $('#comments').val());
		financialData.append("financialStatus", $('#financialStatus').is(':checked') ? 1 : 0);
		financialData.append("smsSend", $('#smsSend').is(':checked') ? 1 : 0);

		// Append image paths or Base64 values
		//var photo = $('#customerPhoto')[0].files[0]; // Match 'photoWithAadhar' with backend
		//if (photo) financialData.append("customerPhoto", photo);
		//var signature = $('#customerSignature')[0].files[0]; // Match 'photoWithAadhar' with backend
		//if (signature) financialData.append("customerPhoto", signature);

		/*financialData.append("customerPhoto", $('#financialphotoHidden').val());
		financialData.append("customerSignature", $('#financialsignatureHidden').val());*/

		let photoValue = $('#financialphotoHidden').val();
		financialData.append("customerPhoto", photoValue || ""); // Always send string path

		let signatureValue = $('#financialsignatureHidden').val();
		financialData.append("customerSignature", signatureValue || "");


		$.ajax({
			url: "/api/financialconsultant/saveOrUpdateFinancialConsultant",
			type: "POST",
			data: financialData,
			enctype: 'multipart/form-data',
			contentType: false,
			processData: false,
			cache: false,
			success: function(response) {
				if (response.status === "OK") {
					alert("Updated Successfully");
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



	$("#printBtn").on("click", function(e) {
		e.preventDefault();

		var financialCode = $('#financialCode').val();
		if (financialCode && financialCode !== "") {

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
						<title>Print - Financial Consultant Form</title>
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
						<h3>Financial Information</h3>
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

	$('#deleteBtn').click(function(event) {
		var id = $("#id").val();
		if (confirm("Are you sure you want to delete this Financial Data?")) {
			$.ajax({
				url: "/api/financialconsultant/deleteFinancialConsultantById",
				type: "POST",
				data: { id: id },
				success: function(response) {
					if (response.status == "OK") {
						alert("Financial Data Deleted Successfully");
						location.reload();
					} else {
						alert("Delete failed: " + response.message);
					}
				},
				error: function(xhr, status, error) {
					alert("Failed to delete Financial Share Data.");
					console.error("Error:", error);
				}
			});
		}

	});

});

//Colour Change After Binding - Ayush
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
	const file = document.getElementById("customerPhoto").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("financialPhotoPreview").src = e.target.result;
			const previewimg = document.getElementById("photoPreview");
			document.getElementById("financialPhotoPreview").src = e.target.result;
			previewimg.style.width = "100%";
			previewimg.style.height = "100%";
			previewimg.style.objectFit = "cover"
			previewimg.style.overflow = "hidden"
			previewimg.style.borderRadius = "20px"
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
			document.getElementById("financialSignaturePreview").src = e.target.result;
			const previewimg = document.getElementById("signaturePreview");
			document.getElementById("financialSignaturePreview").src = e.target.result;
			previewimg.style.width = "100%";
			previewimg.style.height = "100%";
			previewimg.style.objectFit = "cover"
			previewimg.style.overflow = "hidden"
			previewimg.style.borderRadius = "20px"
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

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
