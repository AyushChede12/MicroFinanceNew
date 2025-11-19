function fetchBySelectedCustomer() {
    const memberCode = $("#selectByCode").val();

    if (!memberCode) return;

    $.ajax({
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ memberCode }),
        url: window.location.origin + "/api/customermanagement/fetchBySelectedCustomer",
        async: false,
        success: function(data) {

            if (data && data.length > 0) {
                const c = data[0];

                // Fill fields
				const fullName = [
				    c.firstName || "",
				    c.middleName || "",
				    c.lastName || ""
				].filter(Boolean).join(" ");

				$("#customerName").val(fullName);

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

                // Image preview
                const baseUrl = window.location.origin + "/Uploads/";
                $("#photoPreview").attr("src", c.customerPhoto ? baseUrl + c.customerPhoto : baseUrl + "default-placeholder.jpg");
                $("#signaturePreview").attr("src", c.customerSignature ? baseUrl + c.customerSignature : baseUrl + "default-placeholder.jpg");


                // ⭐ BUTTON STATUS ⭐
                if (c.verified === true) {

                    $("#saveBtn").css({
                        "background-color": "green",
                        "color": "white",
                        "border": "none",
                        "outline": "none",
                        "font-weight": "600",
                        "padding": "8px 15px",
                        "border-radius": "6px",
                        "cursor": "not-allowed"
                    }).text("Verified")
                      .prop("disabled", true);

                } else {

                    $("#saveBtn").css({
                        "background-color": "red",
                        "color": "white",
                        "border": "none",
                        "outline": "none",
                        "font-weight": "600",
                        "padding": "8px 15px",
                        "border-radius": "6px",
                        "cursor": "pointer"
                    }).text("Click Here to Authenticate Complete")
                      .prop("disabled", false);
                }  // ← THIS CLOSING BRACE WAS MISSING!!

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
		url: 'api/customermanagement/approved',
		type: 'GET',
		success: function(response) {
			// response is a list of addCustomer objects
			let customerOptions = response.data.map(function(item) {
				let fullName = [
				        item.firstName,
				        item.middleName,
				        item.lastName
				    ].filter(Boolean).join(" ");
				
				return {
					id: item.memberCode,
					text: item.memberCode + " - " + fullName
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





function verifyFetchedData() {
    const customerCode = $("#memberCode").val();

    const fetchedData = {
        memberCode: customerCode,
        customerName: $("#customerName").val(),
        contactNo: $("#contactNo").val(),
        signupDate: $("#singupDate").val(),
        aadharNo: $("#aadharNo").val(),
        pan: $("#pan").val(),
        voterNo: $("#voterNo").val(),
        drivingLicenceNo: $("#drivingLicenceNo").val()
    };

    fetch("/api/customermanagement/verifyFetchedData", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(fetchedData)
    })
    .then(response => response.json())
    .then(data => {

        if (data.isVerified) {
            alert(data.message);

            $("#saveBtn").css({
                "background-color": "green",
                "color": "white",
                "border": "none",
                "outline": "none",
                "font-weight": "600",
                "padding": "8px 15px",
                "border-radius": "6px",
                "cursor": "not-allowed"
            })
            .text("Verified")
            .prop("disabled", true);

        } else {

            alert(data.message);

            $("#saveBtn").css({
                "background-color": "red",
                "color": "white",
                "border": "none",
                "outline": "none",
                "font-weight": "600",
                "padding": "8px 15px",
                "border-radius": "6px",
                "cursor": "pointer"
            })
            .text("Not Verified")
            .prop("disabled", false);
        }

    })
    .catch(error => {
        console.error("Error verifying data:", error);
        alert("Something went wrong while verifying.");
    });
}
