//Ayush
function saveExecutive() {
	alert("Function Called");

	const formData = new FormData();

	// Add each field from form
	formData.append('type', $('#type').val());
	formData.append('branchName', $('#branchName').val());
	formData.append('fullName', $('#fullName').val());
	formData.append('dateOfBirth', $('#dateOfBirth').val());
	formData.append('promoterNo', $('#promoterNo').val());
	formData.append('appointmentDate', $('#appointmentDate').val());
	formData.append('relationName', $('#relationName').val());
	formData.append('relationToApplicant', $('#relationToApplicant').val());
	formData.append('address', $('#address').val());
	formData.append('district', $('#district').val());
	formData.append('state', $('#state').val());
	formData.append('pinCode', $('#pinCode').val());
	formData.append('aadharNo', $('#aadharNo').val());
	formData.append('panNo', $('#panNo').val());
	formData.append('contactNo', $('#contactNo').val());
	formData.append('emailId', $('#emailId').val());
	formData.append('baseValue', $('#baseValue').val());
	formData.append('shareCount', $('#shareCount').val());
	formData.append('shareAmount', $('#shareAmount').val());
	formData.append('depositAcc', $('#depositAcc').val());

	// Add files
	const photoFile = $('#photoName')[0].files[0];
	const signatureFile = $('#signatureName')[0].files[0];

	if (photoFile) {
		formData.append('photoName', photoFile);
	}

	if (signatureFile) {
		formData.append('signatureName', signatureFile);
	}

	$.ajax({
		url: '/saveExecutiveFounder',
		type: 'POST',
		data: formData,
		contentType: false,
		processData: false,
		success: function(response) {
			alert('Data Saved Successfully!');
			location.reload(); // Or redirect as needed
		},
		error: function(xhr) {
			alert('Error occurred: ' + xhr.responseText);
		}
	});
}


//Ayush
function bike1Preview() {
	const file = document.getElementById("photoName").files[0];
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
	const file = document.getElementById("signatureName").files[0];
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
});