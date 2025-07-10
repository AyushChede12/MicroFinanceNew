// Get All Customers
$(document).ready(function() {
	// Fetch all customers and populate the "select by code" dropdown
	$.ajax({
		url: "approved",
		method: "GET",
		success: function(data) {
			console.log("Fetched Members:", data);
			data.forEach(function(customer) {
				const optionText = `${customer.memberCode} - ${customer.customerName}`;
				$('#selectCustomer').append(
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


// Get Data By Selected Customer

function fetchBySelectedCustomer() {
	const memberCode = $("#selectCustomer").val();
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
				$("#memberCode").val(c.memberCode || "");
				$("#contactNo").val(c.contactNo || "");
				$("#singupDate").val(c.signupDate || "");
				$("#aadharNo").val(c.aadharNo || "");
				$("#pan").val(c.panNo || "");
				$("#state").val(c.state || "");
				$("#district").val(c.district || "");
				$("#drivingLicenceNo").val(c.drivingLicenceNo || "");
				$("#voterNo").val(c.voterNo || "");
				$("#relationDetails").val(c.guardianName || "");
				$("#address").val(c.customerAddress || "");
				$("#pinCode").val(c.pinCode || "");
				$("#suggestedNominee").val(c.nomineeName || "");
				$("#emailId").val(c.emailId || "");
				$("#dateofBirth").val(c.dob || "");
				$("#ageOfNominee").val(c.nomineeAge || "");
				$("#branchName").val(c.branchName || "");
				$("#relation").val(c.relationToApplicant || "");
				
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

$(document).ready(function() {
	// If already selected on load
	if ($("#selectCustomer").val()) {
		fetchBySelectedCustomer();
	}

	// On dropdown change
	$("#selectCustomer").on("change", function() {
		if ($(this).val()) {
			fetchBySelectedCustomer();
		} else {
			clearCustomerFields();
		}
	});
});


$(document).ready(function () {
	// Trigger the function when schemeType dropdown value changes
	$("#schemeType").on("change", function () {
		getSchemeNameBySchemeType();
	});

	// Optional: Trigger it on page load if a value is already selected
	if ($("#schemeType").val()) {
		getSchemeNameBySchemeType();
	}
});

$(document).ready(function () {
	$("#schemeType").on("change", function () {
		getSchemeNameBySchemeType();
	});

	if ($("#schemeType").val()) {
		getSchemeNameBySchemeType();
	}
});

function getSchemeNameBySchemeType() {
	var selectedSchemeType = $("#schemeType").val();
	console.log("Selected Scheme Type:", selectedSchemeType);

	var requestData = {};
	if (selectedSchemeType === "DRD") {
		requestData.drd = selectedSchemeType;
	} else if (selectedSchemeType === "RD") {
		requestData.rd = selectedSchemeType;
	} else if (selectedSchemeType === "FD") {
		requestData.fd = selectedSchemeType;
	} else if (selectedSchemeType === "MIS") {
		requestData.mis = selectedSchemeType;
	}

	$.ajax({
		type: "GET",
		url: "api/Policymangment/getSchemeNameBySchemeType",
 // ✅ Include prefix if controller uses @RequestMapping("/api")
		data: requestData,
		success: function (response) {
			console.log("Response received:", response);
			$("#schemeName").empty().append(`<option value="">Select Scheme Name</option>`);

			if (response.allBrands) {
				response.allBrands.forEach(function (planNameDD) {
					$("#schemeName").append(`<option value="${planNameDD}">${planNameDD}</option>`);
				});
			}
			if (response.allRds) {
				response.allRds.forEach(function (planNameRD) {
					$("#schemeName").append(`<option value="${planNameRD}">${planNameRD}</option>`);
				});
			}
			if (response.allFRDs) {
				response.allFRDs.forEach(function (planNameFD) {
					$("#schemeName").append(`<option value="${planNameFD}">${planNameFD}</option>`);
				});
			}
			if (response.allMISRDs) {
				response.allMISRDs.forEach(function (planNameMD) {
					$("#schemeName").append(`<option value="${planNameMD}">${planNameMD}</option>`);
				});
			}
		},
		error: function (xhr, status, error) {
			console.error(`Error fetching schemes (Status: ${status}):`, error);
			alert("An error occurred while fetching scheme data. Please try again.");
		}
	});
}


function updateSchemeMode() {
	var schemeType = $("#schemeType").val(); // the schemeType you selected
	var schemeModeDropdown = $("#schemeMode"); // your target dropdown

	// Define the scheme modes based on type
	var schemeModes = {
		"RD": "Monthly",
		"MIS": "N/A",
		"FD": "Yearly",
		"DRD": "Daily"
	};

	// Clear existing options
	schemeModeDropdown.empty();

	// Populate based on schemeType
	if (schemeType && schemeModes[schemeType]) {
		schemeModeDropdown.append(new Option(schemeModes[schemeType], schemeModes[schemeType]));
	} else {
		schemeModeDropdown.append(new Option("Select", ""));
	}
}

$(document).ready(function () {
	$("#schemeType").on("change", function () {
		updateSchemeMode();
	});
});


$(document).ready(function () {
	// Auto-set policy start date to today
	const today = new Date();
	const formattedToday = today.toISOString().split("T")[0];
	$("#policyStartDate").val(formattedToday);

	// Trigger on schemeName change
	$("#schemeName").on("change", function () {
		fetchTermBySchemeName();
	});

	// Trigger recalculation when policyStartDate is changed manually
	$("#policyStartDate").on("change", function () {
		displayMaturityDate();
	});
});

function fetchTermBySchemeName() {
	const selectedSchemeName = $("#schemeName").val();
	const schemeType = $("#schemeType").val();

	if (!selectedSchemeName) {
		$("#term").val("");
		$("#roi").val("");
		$("#totalDeposit").val("");
		$("#maturityAmount").val("");
		$("#maturityDate").val("");
		return;
	}

	let apiUrl = "";
	let dataParam = {};
	let termField = "";
	let interestRateField = "";

	switch (schemeType) {
		case "DRD":
			apiUrl = "/api/Policymangment/ddterm";
			dataParam = { planNameDD: selectedSchemeName };
			termField = "ddterm";
			interestRateField = "rateOfInterest";
			break;
		case "RD":
			apiUrl = "/api/Policymangment/rdterm";
			dataParam = { planNameRD: selectedSchemeName };
			termField = "rdterm";
			interestRateField = "rateOfInterestRD";
			break;
		case "FD":
			apiUrl = "/api/Policymangment/fdterm";
			dataParam = { planNameFD: selectedSchemeName };
			termField = "fdterm";
			interestRateField = "rateOfInterestFD";
			break;
		case "MIS":
			apiUrl = "/api/Policymangment/misterm";
			dataParam = { planNameMD: selectedSchemeName };
			termField = "misterm";
			interestRateField = "rateOfInterestMD";
			break;
		default:
			alert("Invalid scheme type selected.");
			return;
	}

	$.ajax({
		type: "GET",
		url: apiUrl,
		data: dataParam,
		dataType: "json",
		success: function(response) {
			let data = response.data || response;

			if (data) {
				$("#schemeTerm").val(data[termField] || "");
				$("#roi").val(data[interestRateField] || "");

				updateSchemeMode();
				calculateAmounts();
				displayMaturityDate();
			} else {
				alert("No scheme data found.");
			}
		},
		error: function(xhr, status, error) {
			console.error("Error fetching scheme data:", error);
			alert("Error fetching scheme data. Please try again.");
		}
	});
}



// Determine schemeMode from schemeType
function getSchemeMode(schemeType) {
	switch (schemeType) {
		case "DRD": return "Daily";
		case "RD": return "Monthly";
		case "FD": return "Yearly";
		case "MIS": return "Yearly";
		default: return "";
	}
}

// Display maturity date in the input field
function displayMaturityDate() {
	const start = $("#policyStartDate").val();
	const mode = $("#schemeMode").val();
	const term = parseInt($("#schemeTerm").val());

	if (!start || !mode || isNaN(term)) {
		console.warn("Missing maturity date inputs");
		$("#maturityDate").val("");
		return;
	}

	const startDate = new Date(start);
	let maturityDate = new Date(startDate);

	if (mode === "Daily") {
		maturityDate.setDate(maturityDate.getDate() + term);
	} else if (mode === "Monthly") {
		maturityDate.setMonth(maturityDate.getMonth() + term);
	} else if (mode === "Yearly") {
		maturityDate.setFullYear(maturityDate.getFullYear() + term);
	}

	const yyyy = maturityDate.getFullYear();
	const mm = String(maturityDate.getMonth() + 1).padStart(2, '0');
	const dd = String(maturityDate.getDate()).padStart(2, '0');

	const finalDate = `${yyyy}-${mm}-${dd}`;
	$("#maturityDate").val(finalDate);
}

$(document).ready(function () {
	// Trigger calculation when any input changes
	$("#policyAmount, #schemeTerm, #schemeMode, #roi").on("change keyup", function () {
		calculateDepositAndMaturity();
	});

	function calculateDepositAndMaturity() {
		const policyAmount = parseFloat($("#policyAmount").val());
		const term = parseInt($("#schemeTerm").val());
		const schemeMode = $("#schemeMode").val();
		const roi = parseFloat($("#roi").val()); // Interest rate %

		// Basic validations
		if (isNaN(policyAmount) || isNaN(term) || !schemeMode || isNaN(roi)) {
			$("#depositAmount").val("");
			$("#maturityAmount").val("");
			return;
		}

		let totalInstallments = 0;
		let termInYears = 0;

		// Calculate total installments and duration in years
		switch (schemeMode) {
			case "Daily":
				totalInstallments = term;
				termInYears = term / 365;
				break;
			case "Monthly":
				totalInstallments = term;
				termInYears = term / 12;
				break;
			case "Quarterly":
				totalInstallments = term * 3;
				termInYears = (term * 3) / 12;
				break;
			case "Half-Yearly":
				totalInstallments = term * 6;
				termInYears = (term * 6) / 12;
				break;
			case "Yearly":
				totalInstallments = term * 12;
				termInYears = term;
				break;
			default:
				alert("Unknown scheme mode selected.");
				return;
		}

		const depositAmount = policyAmount * totalInstallments;
		const interest = (depositAmount * roi * termInYears) / 100;
		const maturityAmount = depositAmount + interest;

		// Optional alert for verification
		//alert("Calculated Deposit: ₹" + depositAmount.toFixed(2) + "\nMaturity Amount: ₹" + maturityAmount.toFixed(2));

		// Set calculated values in inputs
		$("#depositAmount").val(depositAmount.toFixed(2));
		$("#maturityAmount").val(maturityAmount.toFixed(2));
	}
});


$(document).ready(function () {
    $("#saveBtn").click(function (e) {
        e.preventDefault(); // Prevent default form submission

        const formData = {
			policyCode: $("#policyCode").val(),
            policyStartDate: $("#policyStartDate").val(),
            memberSelection: $("#selectCustomer").val(),
            customerName: $("#customerName").val(),
            dateofBirth: $("#dateofBirth").val(),
            relationDetails: $("#relationDetails").val(),
            contactNo: $("#contactNo").val(),
            suggestedNominee: $("#suggestedNominee").val(),
            ageOfNominee: $("#ageOfNominee").val(),
            relation: $("#relation").val(),
            address: $("#address").val(),
            district: $("#district").val(),
            state: $("#state").val(),
            pinCode: $("#pinCode").val(),
            tds: $("#tds").val(),
            branchName: $("#branchName").val(),
            modeOfOperation: $("#ModeOfOperation").val(),
            jointName: $("#jointName").val(),
            jointMemCode: $("#jointMemCode").val(), // if exists, else skip
            schemeType: $("#schemeType").val(),
            schemeTerm: $("#schemeTerm").val(),
            schemeMode: $("#schemeMode").val(),
            roi: $("#roi").val(), // optional if stored
            maturityDate: $("#maturityDate").val(),
            policyAmount: $("#policyAmount").val(),
            depositAmount: $("#depositAmount").val(),
            introMCode: $("#introMCode").val(),
            maturityAmount: $("#maturityAmount").val(),
            MISInterest: $("#MISInterest").val(),
            paymentBy: $("#paymentBy").val(),
            remark: $("#remark").val(),
            agent: $("#Agent").val(),
            smsSend: $("#smsSend").val(),
            
        };

        $.ajax({
            url: "/api/Policymangment/saveInvestment",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (response) {
                alert("✅ " + response.message);
                $("#formid")[0].reset(); // clear form
            },
            error: function (xhr) {
                alert("❌ Error: " + (xhr.responseJSON?.message || "Something went wrong."));
            }
        });
    });
});

