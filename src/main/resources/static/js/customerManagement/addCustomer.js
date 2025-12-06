$(document).ready(function() {
    $('#saveBtn').click(function(e) {
        e.preventDefault();

        // ✅ Create FormData
        var formData = new FormData();

        // 🔹 Append all text fields (from your model)
        const fields = [
            // --- Customer Basic Details ---
            "memberCode", "authenticateFor", "signupDate", "major", "customerName",
            "minor", "customerGender", "guardianName", "relationToApplicant", "dob",
            "customerAge", "relationshipStatus", "customerAddress", "state", "district",
            "aadharNo", "pinCode", "branchName", "panNo", "voterNo", "drivingLicenceNo",
            "referralCode", "referralName", "contactNo", "emailId", "profession",
            "lightBill", "shareAmount", "noOfShare", "taxBill", "academicBackground",

            // --- Nominee Details ---
            "nomineeName", "nomineeRelationToApplicant", "nomineeAge", "nomineeAddress",
            "nomineePanNo", "nomineeKycNo", "nomineeKycType", "nomineeMobileNo", "nomineeDOB",

            // --- Fees & Payment Details ---
            "memberFees", "buildingFund", "adminCharge", "documentCharge", "otherCharge",
            "entryFee", "chequeNo", "chequeDate", "depositAcNo", "referenceNo", "remarks", "paymentBy",

            // --- Optional Filters / Flags ---
            "fDate", "tDate", "isVerified", "isApproved"
        ];

        // Append all text inputs
        fields.forEach(id => {
            const value = $('#' + id).val();
            if (value !== undefined && value !== null && value !== '') {
                formData.append(id, value);
            }
        });

        // 🔹 Append file fields
        const files = {
            "customerPhoto": $('#customerPhoto')[0]?.files[0],
            "customerSignature": $('#customerSignature')[0]?.files[0],
            "customerVoter": $('#customerVoter')[0]?.files[0],
            "customerDriving": $('#customerDriving')[0]?.files[0]
        };

        Object.entries(files).forEach(([key, file]) => {
            if (file) formData.append(key, file);
        });

        // 🔹 Append toggle switches (boolean flags)
        formData.append("memberStatus", $('#toggle-member-status').is(":checked") ? "1" : "0");
        formData.append("memberBanking", $('#toggle-banking-status').is(":checked") ? "1" : "0");
        formData.append("netBanking", $('#toggle-netbanking-status').is(":checked") ? "1" : "0");
        formData.append("smsSend", $('#toggle-sms-status').is(":checked") ? "1" : "0");

        // 🪵 Debug log
        console.log("📦 FormData prepared:");
        for (let [key, value] of formData.entries()) {
            console.log(`${key}:`, value);
        }

        // ✅ AJAX request
        $.ajax({
            url: "http://localhost:8090/api/customermanagement/saveOrUpdateCustomer",
            type: "POST",
            data: formData,
            processData: false,  // Don't let jQuery convert FormData
            contentType: false,  // Let browser set correct Content-Type
            success: function(response) {
                console.log("✅ Success:", response);
                alert(response.message || "Customer saved successfully!");
                $('#customerForm')[0].reset(); // optional: clear form
            },
            error: function(xhr) {
                console.error("❌ Error:", xhr.responseText);
                alert("❌ Something went wrong while saving data!");
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
				url: `/api/customersavings/getAccountNumbers?selectByCustomer=${encodeURIComponent(selectedCode)}`,
				method: "GET",
				success: function(res) {
					console.log("Account number response:", res);

					// Access account number using the selected code as key
					if (res.data && res.data[selectedCode] && res.data[selectedCode].length > 0) {
						$('#guardianAccNo').val(res.data[selectedCode][0]); // use first account number
					} else {
						$('#guardianAccNo').val(''); // no account found
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
});
