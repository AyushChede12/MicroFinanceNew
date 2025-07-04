// Get All Customers
$(document).ready(function() {
	// Fetch all customers and populate the "select by code" dropdown
	$.ajax({
		url: "getAllCustomer",
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
				$("#branch").val(c.branchName || "");
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


// Janvi Sonkusare 29/01/2025
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
				response.allMISRDs.forEach(function (planNameMIS) {
					$("#schemeName").append(`<option value="${planNameMIS}">${planNameMIS}</option>`);
				});
			}
		},
		error: function (xhr, status, error) {
			console.error(`Error fetching schemes (Status: ${status}):`, error);
			alert("An error occurred while fetching scheme data. Please try again.");
		}
	});
}
