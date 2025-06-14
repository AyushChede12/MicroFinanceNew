//Ayush
<<<<<<< HEAD
function photoUpload() {
=======
function bike1Preview() {
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
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
<<<<<<< HEAD
function signatureUpload() {
=======
function bike2Preview() {
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
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
				alert("Data Saved Successfully"); // Message includes the Member Code
				location.reload(); // Reload the page
			},
			error: function(xhr, status, error) {
				console.error("Error: ", xhr.responseText); // Log the error details
				alert('An error occurred while saving the data. Please try again.');
			}
		});
	});

});


$(document).ready(function() {
	$("#tableBody").hide();
<<<<<<< HEAD
	$("#updateBtn").hide();
=======
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
	$.ajax({
		url: "fetchAllExecutiveFounder",
		type: "POST",
		contentType: "application/json",
		success: function(data) {
			var tbody = $(".datatable tbody");
			tbody.empty(); // Clear existing rows

			$.each(data, function(index, item) {
				var row = `<tr style="font-family: 'Poppins', sans-serif;">
              <th scope="row"><a href="#">${index + 1}</a></th>
              <td>${item.fullName || ''}</td>
              <td>${item.branchName || ''}</td>
              <td>${item.appointmentDate || ''}</td>
              <td>${item.address || ''}</td>
              <td>${item.emailId || ''}</td>
			  <td>${item.contactNo || ''}</td>
<<<<<<< HEAD
=======
              <td><button class="iconbutton" onclick="editData(${item.id})" title="Edit"><i class="fa-solid fa-pen-to-square text-success"></i></button></td>
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
			  <td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="fa-solid fa-eye text-primary"></i></button></td>
			  <td><button class="iconbutton" onclick="deleteData(${item.id})" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
            </tr>`;
				tbody.append(row);
			});
		},
		error: function(xhr, status, error) {
			console.error("Error fetching data:", error);
			alert("Failed to load branch module data.");
		}
	});
});

function deleteData(id) {
	$.ajax({
		url: 'deleteExecutiveFounder',
		type: 'POST',
		data: { id: id }, // Sends id as request param
		success: function(response) {
			alert("Data Deleted Successfully: ");
			location.reload();
			// Optionally refresh table or remove row
		},
		error: function(xhr) {
			alert("Error: " + xhr.responseText);
		}
	});
}

function showTableData() {
	$("#tableBody").show();
}

function hideTableData() {
	$("#tableBody").hide();
}

function viewData(id) {
<<<<<<< HEAD
	$("#updateBtn").show();
	$("#saveBtn").hide();
	$("#hideBtn").hide();
	$("#showBtn").hide();
=======
	
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
	$.ajax({
		url: '/fetchExecutiveFounderById',
		type: 'POST',
		data: { id: id },
		success: function(response) {
			// Example: populate form fields with the fetched data
<<<<<<< HEAD
			$('#id').val(response.id);
=======
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
			$('#type').val(response.type);
			$('#branchName').val(response.branchName);
			$('#fullName').val(response.fullName);
			$('#dateOfBirth').val(response.dateOfBirth);
			$('#promoterNo').val(response.promoterNo);
			$('#appointmentDate').val(response.appointmentDate);
			$('#relationName').val(response.relationName);
			$('#relationToApplicant').val(response.relationToApplicant);
			$('#address').val(response.address);
			$('#district').val(response.district);
			$('#state').val(response.state);
			$('#pinCode').val(response.pinCode);
			$('#aadharNo').val(response.aadharNo);
			$('#panNo').val(response.panNo);
			$('#contactNo').val(response.contactNo);
			$('#emailId').val(response.emailId);
			$('#baseValue').val(response.baseValue);
			$('#shareCount').val(response.shareCount);
			$('#shareAmount').val(response.shareAmount);
			//Images
			if (response.photo) {
				const imagePath = `Uploads/${response.photo}`;
				document.getElementById("photoPreview").src = imagePath; // Update preview
				document.getElementById("photoHidden").value = imagePath; // Set hidden field value
			} else {
				document.getElementById("photoPreview").src = 'Uploads/default-placeholder.jpg'; // Fallback
				document.getElementById("photoHidden").value = ''; // Clear hidden field
			}
			if (response.signature) {
				const imagePath = `Uploads/${response.signature}`;
				document.getElementById("signaturePreview").src = imagePath; // Update preview
				document.getElementById("signatureHidden").value = imagePath; // Set hidden field value
			} else {
				document.getElementById("signaturePreview").src = 'Uploads/default-placeholder.jpg'; // Fallback
				document.getElementById("signatureHidden").value = ''; // Clear hidden field
			}
			// Add other fields accordingly
		},
		error: function(xhr) {
			alert("Failed to fetch data: " + xhr.responseText);
		}
	});
}

<<<<<<< HEAD

function updateBranch() {
	let formData = new FormData();

	// Append all fields from the form
	formData.append("id", $("#id").val()); // Hidden input for update
=======
function editData(id) {

	let formData = new FormData();

	// Append all fields from the form
	formData.append("id", id); // Hidden input for update
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
	formData.append("type", $("#type").val());
	formData.append("branchName", $("#branchName").val());
	formData.append("fullName", $("#fullName").val());
	formData.append("dateOfBirth", $("#dateOfBirth").val());
	formData.append("promoterNo", $("#promoterNo").val());
	formData.append("appointmentDate", $("#appointmentDate").val());
	formData.append("relationName", $("#relationName").val());
	formData.append("relationToApplicant", $("#relationToApplicant").val());
	formData.append("address", $("#address").val());
	formData.append("district", $("#district").val());
	formData.append("state", $("#state").val());
	formData.append("pinCode", $("#pinCode").val());
	formData.append("aadharNo", $("#aadharNo").val());
	formData.append("panNo", $("#panNo").val());
	formData.append("contactNo", $("#contactNo").val());
	formData.append("emailId", $("#emailId").val());
	formData.append("baseValue", $("#baseValue").val());
	formData.append("shareCount", $("#shareCount").val());
	formData.append("shareAmount", $("#shareAmount").val());
	formData.append("depositAcc", $("#depositAcc").val());

	// Handle file uploads
	const photo = $("#photo")[0].files[0];
	const signature = $("#signature")[0].files[0];

	if (photo) {
		formData.append("photo", photo);
	}

	if (signature) {
		formData.append("signature", signature);
	}

	// Send the data via AJAX
	$.ajax({
		url: "/saveExecutiveFounder",
		type: "POST",
		data: formData,
		processData: false,
		contentType: false,
		success: function(response) {
			alert("Updated Data Successfully");
			location.reload();
			// Optionally reset form or refresh table
		},
		error: function(xhr) {
			alert("Error: " + xhr.responseText);
		}
	});
<<<<<<< HEAD
}

const previewimg = document.getElementById("photoPreview");

document.getElementById("photoPreview").src = e.target.result;

previewimg.style.width = "100%";

previewimg.style.height = "100%";

previewimg.style.objectFit = "cover"

previewimg.style.overflow = "hidden"

previewimg.style.borderRadius = "20px"
=======

}
>>>>>>> e3773a7de865847a8e8e075ec8c9439c2869a181
