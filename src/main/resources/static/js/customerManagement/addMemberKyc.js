function fetchBySelectedCustomer() {
	const memberCode = $("#selectByCode").val();
	if (!memberCode) return;

	const input = { memberCode };

	$.ajax({
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify(input),
		url: window.location.origin + "/api/customermanagement/fetchBySelectedCustomer",
		async: false,
		success: function(data) {
			if (data && data.length > 0) {
				const c = data[0];

				// 🔹 Text fields
				$("#customerName").val(c.customerName || "");
				$("#memberCode").val(c.memberCode || "");
				$("#contactNo").val(c.contactNo || "");
				$("#singupDate").val(c.signupDate || "");
				$("#aadharNo").val(c.aadharNo || "");
				$("#pan").val(c.panNo || "");
				$("#state").val(c.state || "");
				$("#drivingLicenceNo").val(c.drivingLicenceNo || "");
				$("#voterNo").val(c.voterNo || "");
				$("#guardianName").val(c.guardianName || "");
				$("#customerAddress").val(c.customerAddress || "");
				$("#pinCode").val(c.pinCode || "");
				$("#nomineeName").val(c.nomineeName || "");
				$("#emailId").val(c.emailId || "");
				$("#dob").val(c.dob || "");
				$("#customerAge").val(c.customerAge || "");
				$("#branchName").val(c.branchName || "");
				$("#customerGender").val(c.customerGender || "");

				// 🔹 Images (customer photo & signature)
				const baseUrl = window.location.origin + "/Uploads/";

				if (c.customerPhoto) {
					$("#photoPreview").attr("src", baseUrl + c.customerPhoto);
				} else {
					$("#photoPreview").attr("src", baseUrl + "default-placeholder.jpg");
				}

				if (c.customerSignature) {
					$("#signaturePreview").attr("src", baseUrl + c.customerSignature);
				} else {
					$("#signaturePreview").attr("src", baseUrl + "default-placeholder.jpg");
				}
				
				// Aadhar Front Photo
				if (c.aadharFrontPhoto) {
				    $("#aadharFrontPreview").attr("src", baseUrl + c.aadharFrontPhoto);
				} else {
				    $("#aadharFrontPreview").attr("src", baseUrl + "default-placeholder.jpg");
				}

				// Aadhar Back Photo
				if (c.aadharBackPhoto) {
				    $("#aadharBackPreview").attr("src", baseUrl + c.aadharBackPhoto);
				} else {
				    $("#aadharBackPreview").attr("src", baseUrl + "default-placeholder.jpg");
				}

				// PAN Photo
				if (c.panPhoto) {
				    $("#panPreview").attr("src", baseUrl + c.panPhoto);
				} else {
				    $("#panPreview").attr("src", baseUrl + "default-placeholder.jpg");
				}

				// ================== KYC Button Status Handling ==================
				if (c.isVerified) {
				    $("#saveBtn")
				        .css("background-color", "green")
				        .css("color", "white")
				        .text("Verified")
				        .prop("disabled", true);
				} else {
				    $("#saveBtn")
				        .css("background-color", "red")
				        .css("color", "white")
				        .text("Click Here to Authenticate Complete")
				        .prop("disabled", false);
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



$(document).ready(function() {
	// If already selected on load
	if ($("#selectByCode").val()) {
		fetchBySelectedCustomer();
	}

	// On dropdown change
	$("#selectByCode").on("change", function() {
		if ($(this).val()) {
			fetchBySelectedCustomer();
		} else {
			clearCustomerFields();
		}
	});
});


$(document).ready(function() {
	// Fetch all customers and populate the "select by code" dropdown
	/*$.ajax({
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
	});*/

	$.ajax({
		url: 'api/customermanagement/getAllCustomer',
		type: 'GET',
		success: function(response) {
			// response is a list of addCustomer objects
			let customerOptions = response.map(function(item) {
				return {
					id: item.memberCode,
					text: item.memberCode + " - " + item.customerName
				};
			});

			$('#selectByCode').select2({
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
		},
		error: function(xhr, status, error) {
			console.error("Error fetching customers:", error);
			alert("Failed to load customer codes.");
		}
	});


});





let verifiedMembers = new Set();

function verifyFetchedData() {
	const customerCode = document.getElementById("memberCode").value;

	if (verifiedMembers.has(customerCode)) {
		alert("This customer is already verified!");
		return;
	}

	const fetchedData = {
		memberCode: customerCode,
		customerName: document.getElementById("customerName").value,
		contactNo: document.getElementById("contactNo").value,
		signupDate: document.getElementById("singupDate").value,
		aadharNo: document.getElementById("aadharNo").value,
		pan: document.getElementById("pan").value,
		voterNo: document.getElementById("voterNo").value,
		drivingLicenceNo: document.getElementById("drivingLicenceNo").value
	};

	fetch("verifyFetchedData", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify(fetchedData)
	})
		.then(response => response.json())
		.then(data => {
			const button = document.getElementById("saveBtn");

			if (data.isVerified) {
			    alert(data.message);
			    verifiedMembers.add(customerCode);

			    $("#saveBtn")
			        .css("background-color", "green")
			        .css("color", "white")
			        .text("Verified")
			        .prop("disabled", true);

			} else {
			    alert(data.message);

			    $("#saveBtn")
			        .css("background-color", "red")
			        .css("color", "white")
			        .text("Not Verified")
			        .prop("disabled", false);
			}

		})
		.catch(error => {
			console.error("Error verifying data:", error);
			alert("Something went wrong while verifying.");
		});
}
