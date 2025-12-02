$(document).ready(function() {
	$("#guardianDetails").hide();
	$("#guardianAccount").hide();

	loadCustomerTable();


	// Hide Aadhar field initially
	$("#aadharNo").closest(".col-lg-3").hide();

	$("#authenticateFor").on("change", function() {
		const val = $(this).val();

		if (val === "aadhar") {
			$("#aadharNo").closest(".col-lg-3").show();
			$("#aadharNo").prop("required", true);
		} else {
			$("#aadharNo").closest(".col-lg-3").hide();
			$("#aadharNo").prop("required", false).val("");
		}
	});



	$('#saveBtn').click(function(event) {
		event.preventDefault();

		var formData = new FormData();

		// Text fields
		formData.append("memberCode", $('#memberCode').val());
		formData.append("authenticateFor", $('#authenticateFor').val());
		formData.append("signupDate", $('#signupDate').val());
		formData.append("major", $('#major').val());
		formData.append("minor", $('#minor').val());
		formData.append("customerGender", $('#customerGender').val());
		formData.append("guardianName", $('#guardianName').val());
		formData.append("relationToApplicant", $('#relationToApplicant').val());
		formData.append("dob", $('#dob').val());
		formData.append("customerAge", $('#customerAge').val());
		formData.append("relationshipStatus", $('#relationshipStatus').val());
		formData.append("customerAddress", $('#customerAddress').val());
		formData.append("state", $('#state').val());
		formData.append("district", $('#district').val());
		formData.append("aadharNo", $('#aadharNo').val());
		formData.append("pinCode", $('#pinCode').val());
		formData.append("branchName", $('#branchName').val());
		formData.append("panNo", $('#panNo').val());
		formData.append("voterNo", $('#voterNo').val());
		formData.append("drivingLicenceNo", $('#drivingLicenceNo').val());
		formData.append("referralCode", $('#referralCode').val());
		formData.append("referralName", $('#referralName').val());
		formData.append("contactNo", $('#contactNo').val());
		formData.append("emailId", $('#emailId').val());
		formData.append("profession", $('#profession').val());
		formData.append("academicBackground", $('#academicBackground').val());
		formData.append("firstName", $('#firstName').val());
		formData.append("middleName", $('#middleName').val());
		formData.append("lastName", $('#lastName').val());


		// Nominee
		formData.append("nomineeName", $('#nomineeName').val());
		formData.append("nomineeRelationToApplicant", $('#nomineeRelationToApplicant').val());
		formData.append("nomineeAge", $('#nomineeAge').val());
		formData.append("nomineeAddress", $('#nomineeAddress').val());
		formData.append("nomineePanNo", $('#nomineePanNo').val());
		formData.append("nomineeKycNo", $('#nomineeKycNo').val());
		formData.append("nomineeKycType", $('#nomineeKycType').val());
		formData.append("nomineeMobileNo", $('#nomineeMobileNo').val());

		// Payment
		formData.append("memberFees", $('#memberFees').val());
		formData.append("chequeNo", $('#chequeNo').val());
		formData.append("chequeDate", $('#chequeDate').val());
		formData.append("depositAcNo", $('#depositAcNo').val());
		formData.append("referenceNo", $('#referenceNo').val());
		formData.append("remarks", $('#remarks').val());
		formData.append("paymentBy", $('#paymentBy').val());
		formData.append("lightBill", $('#lightBill').val());
		formData.append("taxBill", $('#taxBill').val());
		formData.append("nomineeDOB", $('#nomineeDOB').val());
		formData.append("buildingFund", $('#buildingFund').val());
		formData.append("adminCharge", $('#adminCharge').val());
		formData.append("documentCharge", $('#documentCharge').val());
		formData.append("otherCharge", $('#otherCharge').val());
		formData.append("entryFee", $('#entryFee').val());
		formData.append("noOfShare", $('#noOfShare').val());
		formData.append("shareAmount", $('#shareAmount').val());


		// File uploads
		const customerPhoto = $('#customerPhoto')[0].files[0];
		const customerSignature = $('#customerSignature')[0].files[0];
		const customerVoter = $('#customerVoter')[0].files[0];
		const customerDriving = $('#customerDriving')[0].files[0];
		const nomineSignature = $('#nomineSignature')[0].files[0];
		const nomineAadhar = $('#nomineAadhar')[0].files[0];

		if (customerPhoto) formData.append("customerPhoto", customerPhoto);
		if (customerSignature) formData.append("customerSignature", customerSignature);
		if (customerVoter) formData.append("customerVoter", customerVoter);
		if (customerDriving) formData.append("customerDriving", customerDriving);
		if (nomineSignature) formData.append("nomineSignature", nomineSignature);
		if (nomineAadhar) formData.append("nomineAadhar", nomineAadhar);


		// Toggles
		formData.append("memberStatus", $('#toggle-member-status').is(":checked") ? "1" : "0");
		formData.append("memberBanking", $('#toggle-banking-status').is(":checked") ? "1" : "0");
		formData.append("netBanking", $('#toggle-netbanking-status').is(":checked") ? "1" : "0");
		formData.append("smsSend", $('#toggle-sms-status').is(":checked") ? "1" : "0");

		// ✅ Auto domain + context path
		const fullUrl = window.location.origin + "/api/customermanagement/saveOrUpdateCustomer";

		console.log("POST to URL: ", fullUrl);

		// AJAX call
		$.ajax({
			type: 'POST',
			url: fullUrl,
			data: formData,
			processData: false,
			contentType: false,
			success: function(response, textStatus, xhr) {
				console.log("✅ Response:", response);

				if (xhr.status === 200 || xhr.status === 201) {
					alert(response.message || "Customer saved successfully!");
					location.reload();
				} else {
					alert("Unexpected response: " + (response.message || "Unknown error"));
				}
			},
			error: function(xhr) {
				console.error("❌ Error response: ", xhr);
				let msg = "Something went wrong while saving.";
				if (xhr.responseJSON && xhr.responseJSON.message) {
					msg = xhr.responseJSON.message;
				} else if (xhr.responseText) {
					msg = xhr.responseText;
				}
				alert(msg);
			}
		});
	});
});


function photopreview() {
	const file = document.getElementById("customerPhoto").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const previewimg = document.getElementById("bike1imagePreview");
			document.getElementById("bike1imagePreview").src = e.target.result;
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
function signpreview() {
	const file = document.getElementById("customerSignature").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const previevimg = document.getElementById("bike2imagePreview");
			document.getElementById("bike2imagePreview").src = e.target.result;
			previevimg.style.width = "100%";
			previevimg.style.height = "100%";
			previevimg.style.objectFit = "cover"
			previevimg.style.overflow = "hidden"
			previevimg.style.borderRadius = "20px"
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

function voterpreview() {
	const file = document.getElementById("customerVoter").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const previevimg = document.getElementById("bike3imagePreview");
			document.getElementById("bike3imagePreview").src = e.target.result;
			previevimg.style.width = "100%";
			previevimg.style.height = "100%";
			previevimg.style.objectFit = "cover"
			previevimg.style.overflow = "hidden"
			previevimg.style.borderRadius = "20px"
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

function drivingpreview() {
	const file = document.getElementById("customerDriving").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const previevimg = document.getElementById("bike4imagePreview");
			document.getElementById("bike4imagePreview").src = e.target.result;
			previevimg.style.width = "100%";
			previevimg.style.height = "100%";
			previevimg.style.objectFit = "cover"
			previevimg.style.overflow = "hidden"
			previevimg.style.borderRadius = "20px"
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

function loadCustomerTable() {
	$.ajax({
		url: "api/customermanagement/getAllCustomer",
		type: "GET",
		success: function(data) {
			let tbody = $("#customerTableBody");
			tbody.empty();

			data.forEach((cust, idx) => {

				// 🔹 Build FULL NAME from first, middle, last
				const fullName = [
					cust.firstName,
					cust.middleName,
					cust.lastName
				].filter(Boolean).join(" ");

				tbody.append(`
                    <tr>
                        <td>${idx + 1}</td>
                        <td>${cust.memberCode}</td>
                        <td>${fullName}</td>   <!-- 👈 customer full name here -->
                        <td>${cust.contactNo}</td>
                        <td>${cust.aadharNo}</td>
                        <td>${cust.district}</td>
                        <td>${cust.branchName}</td>
                        <td>${cust.dob}</td>
                    </tr>
                `);
			});
		},
		error: function(err) {
			console.log("Error loading table:", err);
		}
	});
}



function nomineeSignaturePreview() {
	const file = document.getElementById("nomineSignature").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const previewImg = document.getElementById("nomineeSignatureImg");
			document.getElementById("nomineeSignatureImg").src = e.target.result;
			previewImg.style.width = "100%";
			previewImg.style.height = "100%";
			previewImg.style.objectFit = "cover";
			previewImg.style.borderRadius = "20px";
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}


function nomineeAadharPreview() {
	const file = document.getElementById("nomineAadhar").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const previewImg = document.getElementById("nomineeAadharImg");
			document.getElementById("nomineeAadharImg").src = e.target.result;
			previewImg.style.width = "100%";
			previewImg.style.height = "100%";
			previewImg.style.objectFit = "cover";
			previewImg.style.overflow = "hidden";
			previewImg.style.borderRadius = "20px";
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image for nominee Aadhar.");
	}
}

$(document).ready(function() {
	// Load States
	$.ajax({
		url: 'api/preference/getAllStates',
		method: "GET",
		success: function(response) {
			if (response && response.data && Array.isArray(response.data)) {
				console.log("Fetched states:", response.data);
				response.data.forEach(function(state) {
					$('#state').append(
						$('<option>', {
							value: state.stateName,  // What will be saved to DB
							text: state.stateName,   // What user sees
							'data-id': state.stateId // Optional: internal use
						})
					);
				});
			} else {
				console.warn("No state data available.");
			}
		},
		error: function(err) {
			console.error("Error fetching states:", err);
		}
	});
});


// Load Districts when state is selected
$('#state').on('change', function() {
	const selectedStateId = $(this).find(':selected').data('id'); // ✅ Get ID from selected option
	$('#district').empty().append('<option value="">Select District</option>');

	if (selectedStateId) {
		$.ajax({
			url: 'api/preference/getAllDistrictsByStateId',
			method: 'GET',
			data: { stateId: selectedStateId },  // ✅ Now correct ID passed
			success: function(response) {
				console.log("Fetched districts:", response);
				const districts = response.allDistricts;
				districts.forEach(function(district) {
					$('#district').append(
						$('<option>', {
							value: district.districtName,
							text: district.districtName
						})
					);
				});
			},
			error: function(err) {
				console.error("Error fetching districts:", err);
			}
		});
	}
});


$(document).ready(function() {
	const dropdownIds = ["relationToApplicant", "nomineeRelationToApplicant"];

	$.ajax({
		url: "api/preference/getAllRelativeModule", // Ensure correct server path
		method: "GET",
		success: function(data) {
			console.log("Received relation data:", data);

			dropdownIds.forEach(function(id) {
				const $select = $("#" + id);
				if ($select.length === 0) {
					console.warn(`Dropdown with ID '${id}' not found.`);
					return;
				}

				// Clear old options except the first placeholder
				$select.find("option:not(:first)").remove();

				// Loop through data.data array
				data.data.forEach(function(item) {
					$select.append(
						$("<option>", {
							value: item.relation,
							text: item.relation
						})
					);
				});
			});
		},
		error: function(err) {
			console.error("Error loading relations:", err);
		}
	});
});

$(document).ready(function() {
	// Fetch all branches and populate the dropdown
	$.ajax({
		url: "api/preference/getAllBranchModule", // Ensure correct API path
		method: "GET",
		success: function(data) {
			console.log("Fetched Branches:", data);

			const $branchDropdown = $('#branchName');
			const addedBranches = new Set(); // ✅ Track added names

			// Clear existing options
			$branchDropdown.empty();

			// Add default option
			$branchDropdown.append('<option value="">-- Select Branch --</option>');

			// Loop through and add only unique branch names
			if (Array.isArray(data.data)) {
				data.data.forEach(function(branch) {
					const branchName = branch.branchName;

					if (branchName && !addedBranches.has(branchName)) {
						$branchDropdown.append(
							$('<option>', {
								value: branchName,
								text: branchName
							})
						);
						addedBranches.add(branchName); // ✅ Mark as added
					}
				});
			} else {
				console.warn("Unexpected data format:", data);
			}
		},
		error: function(err) {
			console.error("Error fetching branches:", err);
		}
	});
});


document.addEventListener("DOMContentLoaded", function() {
	const paymentBy = document.getElementById("paymentBy");

	const chequeNoDiv = document.getElementById("chequeNoDiv");
	const chequeDateDiv = document.getElementById("chequeDateDiv");
	const depositAccountDiv = document.getElementById("depositAccountDiv");
	const refNoDiv = document.getElementById("refNoDiv");

	function resetAndHideAll() {
		chequeNoDiv.style.display = "none";
		chequeDateDiv.style.display = "none";
		depositAccountDiv.style.display = "none";
		refNoDiv.style.display = "none";

		// Optional: clear values
		document.getElementById("chequeNo").value = "";
		document.getElementById("chequeDate").value = "";
		document.getElementById("depositAccount").value = "";
		document.getElementById("referenceNo").value = "";
	}

	function handlePaymentChange() {
		const selected = paymentBy.value;
		resetAndHideAll();

		if (selected === "cheque") {
			chequeNoDiv.style.display = "block";
			chequeDateDiv.style.display = "block";
			depositAccountDiv.style.display = "block";
		} else if (selected === "neft" || selected === "online") {
			depositAccountDiv.style.display = "block";
			refNoDiv.style.display = "block";
		}
		// Cash: show nothing extra
	}

	paymentBy.addEventListener("change", handlePaymentChange);

	// Initialize (in case a value is pre-selected)
	handlePaymentChange();
});


document.addEventListener("DOMContentLoaded", function() {
	// Function to fetch and bind bank accounts
	function loadBankAccounts() {
		fetch("api/preference/getAllBankModule")
			.then(response => {
				if (!response.ok) {
					throw new Error("Network response was not ok");
				}
				return response.json();
			})
			.then(data => {
				const depositAccount = document.getElementById("depositAccount");
				// Clear existing options except first
				depositAccount.innerHTML = '<option value="">Select</option>';

				data.forEach(bank => {
					const option = document.createElement("option");
					option.value = bank.accountNo; // Value sent on form submit
					option.textContent = `${bank.accountNo} (${bank.bankName})`; // User-friendly label
					depositAccount.appendChild(option);
				});
			})
			.catch(error => {
				console.error("Error fetching bank accounts:", error);
			});
	}

	// Load on page load
	loadBankAccounts();
});


$(document).ready(function() {
	// Fetch all customers and populate the "select by code" dropdown
	$.ajax({
		url: "api/customermanagement/getAllCustomer",
		method: "GET",
		success: function(data) {
			console.log("Fetched Members:", data);
			data.forEach(function(customer) {
				const optionText = `${customer.memberCode} - ${customer.customerName}`;
				$('#selectMember').append(
					$('<option>', {
						value: customer.memberCode, // You can change this to customer.id or anything else if needed
						text: optionText
					})
				);
			});
		},
		error: function(err) {
			console.error("Error fetching customers:", err);
		}
	});
});



$(document).ready(function() {
	// If already selected on load
	if ($("#selectMember").val()) {
		fetchBySelectedCustomer();
	}

	// On dropdown change
	$("#selectMember").on("change", function() {
		if ($(this).val()) {
			fetchBySelectedCustomer();
		} else {
			clearCustomerFields();
		}
	});
});

function fetchBySelectedCustomer() {
	const memberCode = $("#selectMember").val();
	if (!memberCode) return;

	const input = { memberCode };

	$.ajax({
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify(input),
		url: 'fetchBySelectedCustomer',
		async: false,
		success: function(data) {
			if (data && data.length > 0) {
				const c = data[0];

				$("#customerName").val(c.customerName || "");
				$("#customerCode").val(c.memberCode || "");
				$("#contactNo").val(c.contactNo || "");
				$("#singupDate").val(c.signupDate || "");
				$("#aadharNo").val(c.aadharNo || "");
				$("#pan").val(c.panNo || "");
				$("#voterNo").val(c.voterNo || "");
				$("#rationCardNo").val(c.rationCardNo || "");
				$("#drivingLicenseNo").val(c.drivingLicenceNo || "");

				// Customer Photo
				if (c.customerPhoto) {
					const photoPath = `Uploads/${c.customerPhoto}`;
					$("#photoPreview").attr("src", photoPath);
					$("#photoHidden").val(photoPath);
				} else {
					$("#photoPreview").attr("src", 'Uploads/default-placeholder.jpg');
					$("#photoHidden").val('');
				}

				// Signature
				if (c.customerSignature) {
					const signaturePath = `Uploads/${c.customerSignature}`;
					$("#signaturePreview").attr("src", signaturePath);
					$("#signatureHidden").val(signaturePath);
				} else {
					$("#signaturePreview").attr("src", 'Uploads/default-placeholder.jpg');
					$("#signatureHidden").val('');
				}

			} else {
				alert("No data found for the selected member.");
				clearCustomerFields();
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert("Failed to fetch data: " + textStatus + ", " + errorThrown);
		}
	});
}

function ifMinor() {
	var minor = $("#minor").val();
	if (minor === 'Yes') {
		$("#guardianDetails").show();
		$("#guardianAccount").show();
	}
	else {
		$("#guardianDetails").hide();
		$("#guardianAccount").hide();
	}
}

// Auto-calculate Age and Minor detection
$(document).ready(function() {
	$('#dob').on('change', function() {
		const dobVal = $(this).val();
		if (!dobVal) return;

		const dob = new Date(dobVal);
		const today = new Date();

		let age = today.getFullYear() - dob.getFullYear();
		const m = today.getMonth() - dob.getMonth();
		if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
			age--;
		}

		$('#customerAge').val(age);

		if (age < 18) {
			$('#minor').val('Yes');
			$('#guardianDetails').show();
			$('#guardianAccount').show();
		} else {
			$('#minor').val('No');
			$('#guardianDetails').hide();
			$('#guardianAccount').hide();
		}
	});
});



$(document).ready(function() {
	// 1️⃣ Fetch all customers for dropdown
	$.ajax({
		url: "api/customersavings/getAllSavingAccountData",
		method: "GET",
		success: function(response) {
			console.log("Fetched Members:", response);

			const customers = response.data || response;

			// Clear old options except 'No'
			$('#guardianName').find("option:not([value='No'])").remove();

			// Populate dropdown
			customers.forEach(function(customer) {
				const optionText = `${customer.enterCustomerName} - ${customer.selectByCustomer}`;
				$('#guardianName').append(
					$('<option>', {
						value: customer.selectByCustomer.trim(),
						text: optionText
					})
				);
			});
		},
		error: function(err) {
			console.error("❌ Error fetching customers:", err);
		}
	});

	$('#guardianName').on('change', function() {
		const selectedCode = $(this).val().trim();

		if (selectedCode === "No") {
			$('#guardianAccount').hide();
			$('#guardianAccNo').prop('required', false).val('');
		} else {
			$('#guardianAccount').show();
			$('#guardianAccNo').prop('required', true);

			// Fetch account number from backend
			$.ajax({
				url: `/api/customersavings/getAccountNumbersByCode?selectByCustomer=${encodeURIComponent(selectedCode)}`,
				method: "GET",
				success: function(res) {
					console.log("Account number response:", res);

					// Access account number using the selected code as key
					if (res.data && res.data.length > 0) {
						$('#guardianAccNo').val(res.data[0].accountNumber);
					} else {
						$('#guardianAccNo').val('');
					}
				},
				error: function(err) {
					console.error("❌ Error fetching account number:", err);
					$('#guardianAccNo').val('');
				}
			});
		}
	}).trigger('change'); // trigger on load
	// trigger on load

	$.ajax({
		url: 'api/preference/getAllCategoryModule',
		method: "GET",
		success: function(response) {
			if (response.status==='FOUND') {
				console.log("Fetched Category:", response.data);
				response.data.forEach(function(category) {
					$('#category').append(
						$('<option>', {
							value: category.category,  // What will be saved to DB
							text: category.category,   // What user sees
							'data-id': category.stateId // Optional: internal use
						})
					);
				});
			} else {
				console.warn("No Category data available.");
			}
		},
		error: function(err) {
			console.error("Error fetching Categories:", err);
		}
	});
});
