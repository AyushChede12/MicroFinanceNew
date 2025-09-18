$(document).ready(function() {
	// Populate member codes
	$.ajax({
		url: "api/customermanagement/approved",
		type: "GET",
		data: { memberCode: "" },
		success: function(response) {
			var select = $("#memberCode");
			select.empty();
			select.append('<option value="">Select member Code</option>');

			if (response && response.data && response.data.length > 0) {
				response.data.forEach(function(customer) {
					var optionText = customer.memberCode + "-" + customer.customerName;
					var optionValue = customer.memberCode;
					select.append(
						'<option value="' + optionValue + '">' + optionText + "</option>"
					);
				});
			} else {
				console.log("No members found");
			}
		},
		error: function(err) {
			console.error("Error fetching members", err);
		},
	});

	// On memberCode change, fetch details
	$("#memberCode").on("change", function() {
		var memberCode = $(this).val();
		if (memberCode) {
			$.ajax({
				url: "api/securedGoldLoan/getByMemberCodeApplyForGold",
				type: "GET",
				data: { memberCode: memberCode },
				success: function(response) {
					if (response && response.data && response.data.length > 0) {
						var customer = response.data[0]; // assuming first record

						// Populate form fields
						$("#customerName").val(customer.customerName || "");
						$("#dateOfBirth").val(customer.dob || "");
						$("#age").val(customer.customerAge || "");
						$("#contactNo").val(customer.contactNo || "");
						$("#address").val(customer.customerAddress || "");
						$("#pinCode").val(customer.pinCode || "");
						$("#branchName").val(customer.branchName || "");
						//formData.append("smsSend", $('#toggle-sms-send').is(':checked') ? "1" : "0");
						// ✅ Toggle button status set karna
						/*  if (customer.smsSend === "1") {
							  $("#toggle-sms-send").prop("checked", true);
						  } else {
							  $("#toggle-sms-send").prop("checked", false);
						  }*/

						if (parseInt(customer.smsSend) === 1) {
							$('#toggle-sms-send').prop('checked', true);
						} else {
							$('#toggle-sms-send').prop('checked', false);
						}

						// Photo
						if (customer.customerPhoto) {
							const photoPath = `Uploads/${customer.customerPhoto}`;
							$("#photoPreview").attr("src", photoPath);
							$("#photoHidden").val(photoPath);
							photoSizeEdit({ target: { result: photoPath } });
						} else {
							$("#photoPreview").attr("src", "Uploads/default-placeholder.jpg");
							$("#photoHidden").val("");
						}

						// Signature
						if (customer.customerSignature) {
							const signPath = `Uploads/${customer.customerSignature}`;
							$("#signaturePreview").attr("src", signPath);
							$("#signatureHidden").val(signPath);
							signatureSizeEdit({ target: { result: signPath } });
						} else {
							$("#signaturePreview").attr("src", "Uploads/default-placeholder.jpg");
							$("#signatureHidden").val("");
						}
						updateToggleColor(document.getElementById('toggle-sms-send'));

					} else {
						alert("No details found for this member");
					}
				},
				error: function(err) {
					console.error("Error fetching customer details", err);
				},
			});
		} else {
			// clear fields if no member selected
			$("#customerName, #dateOfBirth, #age, #contactNo, #address, #pinCode, #branchName").val("");
		}
	});
});


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

function photoUpload() {
	const file = document.getElementById("photo").files[0];
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



function signatureUpload() {
	const file = document.getElementById("signature").files[0];
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
