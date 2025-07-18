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
		$("#schemeTerm").val("");
		$("#roi").val("");
		$("#depositAmount").val("");
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
		success: function (response) {
			let data = response.data || response;

			if (data) {
				// Set term and ROI
				const term = data[termField] || "";
				const roi = data[interestRateField] || "";

				$("#schemeTerm").val(term);
				$("#roi").val(roi);

				// Update mode (e.g., Monthly/Yearly)
				updateSchemeMode();

				// ❗ Delay maturity calculation slightly to ensure fields are set
				setTimeout(() => {
					displayMaturityDate(); // ✅ Calculate maturity date based on current term and start date
					calculateDepositAndMaturity(); // ✅ Recalculate deposit + maturity amount
				}, 100);
			} else {
				alert("No scheme data found.");
			}
		},
		error: function (xhr, status, error) {
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

function displayMaturityDate() {
	const start = $("#policyStartDate").val();
	const mode = $("#schemeMode").val();
	const term = parseInt($("#schemeTerm").val()); // ✅ consistent with your field

	console.log("Maturity Calculation Triggered", { start, mode, term });

	if (!start || !mode || isNaN(term)) {
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
	$("#policyAmount, #schemeTerm, #schemeMode, #roi").on("change keyup", function () {
		calculateDepositAndMaturity();
	});

	function calculateDepositAndMaturity() {
		const policyAmount = parseFloat($("#policyAmount").val()); // This is per-installment amount
		const term = parseInt($("#schemeTerm").val());
		const schemeMode = $("#schemeMode").val();
		const roi = parseFloat($("#roi").val());

		if (isNaN(policyAmount) || isNaN(term) || !schemeMode || isNaN(roi)) {
			$("#depositAmount").val("");
			$("#maturityAmount").val("");
			return;
		}

		let installmentsPerYear = 0;

		switch (schemeMode) {
			case "Daily":
				installmentsPerYear = 1;
				break;
			case "Monthly":
				installmentsPerYear = 12;
				break;
			case "Quarterly":
				installmentsPerYear = 4;
				break;
			case "Half-Yearly":
				installmentsPerYear = 2;
				break;
			case "Yearly":
				installmentsPerYear = 1;
				break;
			default:
				alert("Unknown scheme mode selected.");
				return;
		}

		const totalInstallments = installmentsPerYear * term;
		const totalDepositAmount = policyAmount * totalInstallments;
		const r = roi / 100;
		const n = installmentsPerYear;
		const t = term;

		// Use Future Value of Ordinary Annuity Formula:
		// M = P × [((1 + r/n)^(nt) - 1) / (r/n)]
		const compoundRate = r / n;
		const maturityAmount = policyAmount * ((Math.pow(1 + compoundRate, n * t) - 1) / compoundRate);

		$("#depositAmount").val(totalDepositAmount.toFixed(2));
		$("#maturityAmount").val(maturityAmount.toFixed(2));
	}
});

$("#saveBtn").click(function (e) {
    e.preventDefault();

    const schemeType = $("#schemeType").val();

    if (!schemeType) {
        alert("Please select a Scheme Type first.");
        return;
    }

    // Step 1: Get next policy code from backend
    $.ajax({
        url: `/api/Policymangment/getNextPolicyCode`,
        type: "GET",
        data: { schemeType: schemeType },
        success: function (policyCode) {
            $("#policyCode").val(policyCode); // ✅ Set in form

            // Step 2: Gather form data
            const policyAmount = parseFloat($("#policyAmount").val()) || 0;
            const depositAmount = parseFloat($("#depositAmount").val()) || 0;
            const paidAmount = parseFloat($("#policyAmount").val()) || 0;
            const amountDue = depositAmount - policyAmount;

            alert("Amount Due: ₹" + amountDue.toFixed(2)); // Optional for confirmation

            const formData = {
                policyCode: policyCode,
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
                jointMemCode: $("#jointMemCode").val(),
                schemeType: $("#schemeType").val(),
                schemeTerm: $("#schemeTerm").val(),
                schemeName: $("#schemeName").val(),
                schemeMode: $("#schemeMode").val(),
                roi: $("#roi").val(),
                maturityDate: $("#maturityDate").val(),
                policyAmount: $("#policyAmount").val(),
                depositAmount: depositAmount.toFixed(2),   // ✅ correct deposit value
                paidAmount: paidAmount.toFixed(2),         // ✅ paid amount
                amountDue: amountDue.toFixed(2),           // ✅ calculated value
                introMCode: $("#introMCode").val(),
                maturityAmount: $("#maturityAmount").val(),
                MISInterest: $("#MISInterest").val(),
                paymentBy: $("#paymentBy").val(),
                remark: $("#remark").val(),
                agent: $("#Agent").val(),
                smsSend: $("#smsSend").val(),
                
                lastInstPaid: 1
            };

            // Step 3: Save data to backend
            $.ajax({
                url: "/api/Policymangment/saveInvestment",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(formData),
                success: function (response) {
                    alert("✅ " + response.message);
                    $("#formid")[0].reset();
                },
                error: function (xhr) {
                    alert("❌ Error: " + (xhr.responseJSON?.message || "Something went wrong."));
                }
            });
        },
        error: function () {
            alert("❌ Failed to generate policy code.");
        }
    });
});


$(document).ready(function () {
    $.ajax({
        url: "/api/financialconsultant/getAllFinancialConsultantDetails",
        type: "POST",
        success: function (response) {
            const consultants = response.data;
            const $agentDropdown = $("#Agent");

            $agentDropdown.empty(); // Clear any existing options
            $agentDropdown.append('<option value="">Select Payment By</option>');

            // Create a Set to avoid duplicate codes
            const addedCodes = new Set();

            consultants.forEach(consultant => {
                const code = consultant.financialCode;

                // Add only if it's not null/empty/"undefined"
                if (code && code.trim() !== "" && code.trim().toLowerCase() !== "undefined") {
                    if (!addedCodes.has(code)) {
                        $agentDropdown.append(`<option value="${code}">${code}</option>`);
                        addedCodes.add(code);
                    }
                }
            });
        },
        error: function (xhr, status, error) {
            console.error("Failed to fetch financial consultant details:", error);
        }
    });
});
