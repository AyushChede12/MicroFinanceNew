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
