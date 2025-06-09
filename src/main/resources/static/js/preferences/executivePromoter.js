//Ayush
function bike1Preview() {
	const file = document.getElementById("photo").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("photoPreview").src = e.target.result;
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for photo.");
	}
}


//Ayush
function bike2Preview() {
	const file = document.getElementById("signature").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("signaturePreview").src = e.target.result;
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

$(document).ready(function() {
	$.ajax({
		url: "getAllBranchModule", // Your backend URL here
		type: "GET",
		success: function(data) {
			// Add each option to the dropdown
			$("#branchName").append("<option value=''>-- Select Branch --</option>");
			for (let i = 0; i < data.length; i++) {
				let option = "<option value='" + data[i].branchName + "'>" + data[i].branchName + "</option>";
				$("#branchName").append(option);
			}
		},
		error: function() {
			alert("Failed to load dropdown data.");
		}
	});

	$.ajax({
		url: "getAllRelativeModule", // Your backend URL here
		type: "GET",
		success: function(data) {
			// Add each option to the dropdown
			$("#relationToApplicant").append("<option value=''>-- Select Relation To Applicant --</option>");
			for (let i = 0; i < data.length; i++) {
				let option = "<option value='" + data[i].relation + "'>" + data[i].relation + "</option>";
				$("#relationToApplicant").append(option);
			}
		},
		error: function() {
			alert("Failed to load dropdown data.");
		}
	});
	
	//Save Code - Ayush
	$('#saveBtn').click(function(event) {
			event.preventDefault();

			// Create FormData object to send data and files
			var formData = new FormData();

			// Append all form data (text values)
			formData.append("type", $('#type').val());
			formData.append("branchName", $('#branchName').val());
			formData.append("fullName", $('#fullName').val());
			formData.append("dateOfBirth", $('#dateOfBirth').val());
			formData.append("promoterNo", $('#promoterNo').val());
			formData.append("appointmentDate", $('#appointmentDate').val());
			formData.append("relationName", $('#relationName').val());
			formData.append("relationToApplicant", $('#relationToApplicant').val());
			formData.append("address", $('#address').val());
			formData.append("district", $('#district').val());
			formData.append("state", $('#state').val());
			formData.append("pinCode", $('#pinCode').val());
			formData.append("aadharNo", $('#aadharNo').val());
			formData.append("panNo", $('#panNo').val());
			formData.append("contactNo", $('#contactNo').val());
			formData.append("emailId", $('#emailId').val());
			formData.append("baseValue", $('#baseValue').val());
			formData.append("shareCount", $('#shareCount').val());
			formData.append("shareAmount", $('#shareAmount').val());
			formData.append("depositAcc", $('#depositAcc').val());
			
			// Handle file uploads
			var photo = $('#photo')[0].files[0]; // Match 'photoWithAadhar' with backend
			if (photo) formData.append("photo", photo);
			
			// Handle file uploads
	        var signature = $('#signature')[0].files[0];
	        if (signature) {
	            formData.append("signature", signature);
	        }

			// Debugging: Log FormData to check entries
			for (var pair of formData.entries()) {
				console.log(pair[0] + ':', pair[1]);
			}
			console.log(formData);

			// Make the AJAX request to your API
			$.ajax({
				type: 'POST',
				url: 'saveExecutiveFounder', // Update URL if necessary
				data: formData,
				processData: false,
				contentType: false,
				success: function(response) {
					if (response.status === "OK" || response.status === "CREATED") {
						alert("Data Saved Successfully"); // Message includes the Member Code
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


