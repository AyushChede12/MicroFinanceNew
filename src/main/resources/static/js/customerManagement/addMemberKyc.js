function fetchBySelectedCustomer() {
    const memberCode = $("#selectMember").val();
    if (!memberCode) return;

    const input = { memberCode };

    $.ajax({
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(input),
        url: window.location.origin + "/api/customermanagement/fetchBySelectedCustomer",
        async: false,
        success: function (data) {
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

            } else {
                alert("No data found for the selected member.");
                clearCustomerFields();
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Failed to fetch data: " + textStatus + ", " + errorThrown);
        }
    });
}



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
			button.style.backgroundColor = "green";
			button.style.color = "white"; // Optional: make text readable
			button.innerText = "Verified";
			button.disabled = true;
		} else {
			alert(data.message);
			button.style.backgroundColor = "red";
			button.style.color = "white";
			button.innerText = "Not Verified";
		}
	})
	.catch(error => {
		console.error("Error verifying data:", error);
		alert("Something went wrong while verifying.");
	});
}
