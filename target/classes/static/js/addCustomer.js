$(document).ready(function() {
	$('#saveBtn').click(function(event) {
		event.preventDefault();

		// Create FormData object to send data and files
		var formData = new FormData();

		// Append all form data (text values)
		formData.append("memberCode", $('#memberCode').val());
		formData.append("authenticateFor", $('#authenticateFor').val());
		formData.append("signupDate", $('#signupDate').val());
		formData.append("customerName", $('#customerName').val());
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

		// Nominee Details
		formData.append("nomineeName", $('#nomineeName').val());
		formData.append("nomineeRelationToApplicant", $('#nomineeRelationToApplicant').val());
		formData.append("nomineeAddress", $('#nomineeAddress').val());
		formData.append("nomineeKycNo", $('#nomineeKycNo').val());
		formData.append("nomineeMobileNo", $('#nomineeMobileNo').val());
		formData.append("nomineeAge", $('#nomineeAge').val());
		formData.append("nomineePanNo", $('#nomineePanNo').val());
		formData.append("nomineeKycType", $('#nomineeKycType').val());


        formData.append("memberFees", $('#memberFees').val());
        formData.append("chequeNo", $('#chequeNo').val());
        formData.append("chequeDate", $('#chequeDate').val());
        formData.append("depositAcNo", $('#depositAcNo').val());
        formData.append("referenceNo", $('#referenceNo').val());
        formData.append("remarks", $('#remarks').val());
        formData.append("paymentBy", $('#paymentBy').val());


		// Fees/Setting Details
		

		// Handle file uploads
		var photoWithAadhar = $('#customerPhoto')[0].files[0]; // Match 'photoWithAadhar' with backend
		if (photoWithAadhar) formData.append("customerPhoto", photoWithAadhar);
		
		// Handle file uploads
        var signature = $('#customerSignature')[0].files[0];
        if (signature) {
            formData.append("customerSignature", signature);
        }

		// Debugging: Log FormData to check entries
		for (var pair of formData.entries()) {
			console.log(pair[0] + ':', pair[1]);
		}
		console.log(formData);

		// Make the AJAX request to your API
		$.ajax({
			type: 'POST',
			url: '/saveOrUpdateCustomer', // Update URL if necessary
			data: formData,
			processData: false,
			contentType: false,
			success: function(response) {
				if (response.status === "OK" || response.status === "CREATED") {
					alert(response.message); // Message includes the Member Code
					location.reload(); // Reload the page
				} else {
					alert("Error: " + response.message);
				}
			},
			error: function(xhr, status, error) {
				console.error("Error: ", xhr.responseText); // Log the error details
				alert('An error occurred while saving the data. Please try again.');
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
			previewimg.style.overflow="hidden"
			previewimg.style.borderRadius="20px"
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
			previevimg.style.overflow="hidden"
			previevimg.style.borderRadius="20px"
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

$(document).ready(function () {
    // Load States
    $.ajax({
        url: "getAllStates",
        method: "GET",
        success: function (data) {
            console.log("Fetched states:", data);
            data.forEach(function (state) {
                $('#state').append(
                    $('<option>', {
                        value: state.stateId, // ✅ use stateId here
                        text: state.stateName
                    })
                );
            });
        },
        error: function (err) {
            console.error("Error fetching states:", err);
        }
    });

    // Load Districts when state is selected
    $('#state').on('change', function () {
        var selectedStateId = $(this).val();
        $('#district').empty().append('<option value="">Select District</option>');

        if (selectedStateId) {
            $.ajax({
                url: 'getAllDistrictsByStateId',
                method: 'GET',
                data: { stateId: selectedStateId },
                success: function (response) {
                    console.log("Fetched districts:", response);
                    var districts = response.allDistricts;
                    districts.forEach(function (district) {
                        $('#district').append(
                            $('<option>', {
                                value: district.districtName,
                                text: district.districtName
                            })
                        );
                    });
                },
                error: function (err) {
                    console.error("Error fetching districts:", err);
                }
            });
        }
    });
});


//Niraj Code 
window.onload = function() {
    fetch('getAllRelativeModule')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById("relationToApplicant");
            data.forEach(item => {
                const option = document.createElement("option");
                option.value = item.relation;  // Use item.id if needed
                option.text = item.relation;
                select.appendChild(option);
            });
        })
        .catch(error => {
            console.error("Error loading relations:", error);
        });
};


//Niraj Code 
window.onload = function() {
    fetch('getAllRelativeModule')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById("nomineeRelationToApplicant");
            data.forEach(item => {
                const option = document.createElement("option");
                option.value = item.relation;  // Use item.id if needed
                option.text = item.relation;
                select.appendChild(option);
            });
        })
        .catch(error => {
            console.error("Error loading relations:", error);
        });
};


$(document).ready(function () {
    // Fetch all branches and populate the dropdown
    $.ajax({
        url: "getAllBranchModule",
        method: "GET",
        success: function (data) {
            console.log("Fetched Branches:", data);
            data.forEach(function (branch) {
                $('#branchName').append(
                    $('<option>', {
                        value: branch.branchName,
                        text: branch.branchName
                    })
                );
            });
        },
        error: function (err) {
            console.error("Error fetching branches:", err);
        }
    });
});



document.addEventListener("DOMContentLoaded", function () {
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

document.addEventListener("DOMContentLoaded", function () {
	// Function to fetch and bind bank accounts
	function loadBankAccounts() {
		fetch("/getAllBankModule")
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


