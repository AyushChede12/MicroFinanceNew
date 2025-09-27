/*$(document).ready(function() {
	// Populate member codes
	$.ajax({
		url: "api/securedGoldLoan/getAllGoldDirectories",
		type: "GET",
		data: { memberCode: "" },
		success: function(response) {
			var select = $("#memberCode");
			select.empty();
			select.append('<option value="">Select member Code</option>');

			if (response && response.data && response.data.length > 0) {
				response.data.forEach(function(customer) {
					var optionText = customer.customerCode + "-" + customer.customerName;
					var optionValue = customer.customerCode;
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
						  if (customer.smsSend === "1") {
							  $("#toggle-sms-send").prop("checked", true);
						  } else {
							  $("#toggle-sms-send").prop("checked", false);
						  }

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
	
	$.ajax({
		url: "api/securedGoldLoan/allDataFetchGoldSecurePlan",
		type: "GET",
		data: { loanPlanName: "" },
		success: function(response) {
			var select = $("#loanPlanName");
			select.empty();
			select.append('<option value="">Select LoanPlanName</option>');

			if (response && response.data && response.data.length > 0) {
				var addedValues = new Set(); // duplicate avoid karne ke liye

				response.data.forEach(function(planName) {
					var optionText = planName.loanPlanName ? planName.loanPlanName.trim() : "";

					if (optionText !== "" && !addedValues.has(optionText)) {
						select.append(
							'<option value="' + optionText + '">' + optionText + "</option>"
						);
						addedValues.add(optionText);
					}
				});
			} else {
				console.log("No LoanPlanName found");
			}
		},
		error: function(err) {
			console.error("Error fetching members", err);
		},
	});
	
	$("#loanPlanName").on("change", function() {
			var loanPlanName = $(this).val();
			if (loanPlanName) {
				$.ajax({
					url: "api/securedGoldLoan/getLoanPlanNameApplyForGold",
					type: "GET",
					data: { loanPlanName: loanPlanName },
					success: function(response) {
						if (response && response.data && response.data.length > 0) {
							var planName = response.data[0]; // assuming first record

							// Populate form fields
							$("#typeOfLoan").val(planName.typeOfLoan || "");
							$("#loanMode").val(planName.loanMode || "");
							$("#loanTerm").val(planName.minTerm || "");
							$("#rateOfInterest").val(planName.rateInterestType || "");
							$("#loanAmount").val(planName.minAmt || "");
							$("#interestType").val(planName.interestType || "");
							//$("#emiPayment").val(planName.branchName || "");
							//formData.append("smsSend", $('#toggle-sms-send').is(':checked') ? "1" : "0");
							// ✅ Toggle button status set karna
							  if (customer.smsSend === "1") {
								  $("#toggle-sms-send").prop("checked", true);
							  } else {
								  $("#toggle-sms-send").prop("checked", false);
							  }

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
*/







$(document).ready(function() {
	$.ajax({
		url: "api/securedGoldLoan/getAllGoldDirectories",
		type: "GET",
		data: { memberCode: "" },
		success: function(response) {
			var select = $("#memberCode");
			select.empty();
			select.append('<option value="">Select member Code</option>');

			if (response && response.data && response.data.length > 0) {
				response.data.forEach(function(customer) {
					var optionText = customer.customerCode + "-" + customer.customerName;
					var optionValue = customer.customerCode;
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
	let goldDirectories = [];
	let customers = [];

	// Fetch GoldDirectory list
	$.ajax({
		url: "/api/securedGoldLoan/getAllGoldDirectories",
		type: "GET",
		success: function(response) {
			if (response && response.data) {
				goldDirectories = response.data;
			}
		}
	});

	// Fetch addCustomer list
	$.ajax({
		url: "/api/securedGoldLoan/getAllCustomers",
		type: "GET",
		success: function(response) {
			if (response && response.data) {
				customers = response.data;
			}
		}
	});

	// Jab user customerCode select kare
	$("#memberCode").on("change", function() {
		var selectedCode = $(this).val();

		// GoldDirectory me match check
		var gold = goldDirectories.find(g => g.customerCode === selectedCode);

		// addCustomer me match check
		var cust = customers.find(c => c.memberCode === selectedCode);

		if (gold && cust) {
			// Populate fields from addCustomer
			$("#customerName").val(cust.customerName || "");
			$("#dateOfBirth").val(cust.dob || "");
			$("#age").val(cust.customerAge || "");
			$("#contactNo").val(cust.contactNo || "");
			$("#address").val(cust.customerAddress || "");
			$("#pinCode").val(cust.pinCode || "");
			$("#branchName").val(cust.branchName || "");
			/*if (cust.smsSend === "1") {
										  $("#toggle-sms-send").prop("checked", true);
									  } else {
										  $("#toggle-sms-send").prop("checked", false);
									  }
*/
									if (parseInt(cust.smsSend) === 1) {
										$('#toggle-sms-send').prop('checked', true);
									} else {
										$('#toggle-sms-send').prop('checked', false);
									}									// Photo
									if (cust.customerPhoto) {
									    const photoPath = "Uploads/" + cust.customerPhoto; // ya jo bhi aapka folder path ho
									    $("#photoPreview").attr("src", photoPath);
									    $("#photoHidden").val(photoPath);
									    photoSizeEdit({ target: { result: photoPath } });
									} else {
									    $("#photoPreview").attr("src", "Uploads/default-placeholder.jpg");
									    $("#photoHidden").val("");
									}

									if (cust.customerSignature) {
									    const signPath = "Uploads/" + cust.customerSignature; // ya jo bhi folder path ho
									    $("#signaturePreview").attr("src", signPath);
									    $("#signatureHidden").val(signPath);
									    signatureSizeEdit({ target: { result: signPath } });
									} else {
									    $("#signaturePreview").attr("src", "Uploads/default-placeholder.jpg");
									    $("#signatureHidden").val("");
									}

									
									updateToggleColor(document.getElementById('toggle-sms-send'));


		} else {
			alert("No matching data found!");
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
