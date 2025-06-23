//Ayush
function photoUpload() {
	const file = document.getElementById("photo").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("photoPreview").src = e.target.result;
			const previewimg = document.getElementById("photoPreview");
			document.getElementById("photoPreview").src = e.target.result;
			previewimg.style.width = "100%";
			previewimg.style.height = "100%";
			previewimg.style.objectFit = "cover"
			previewimg.style.overflow = "hidden"
			previewimg.style.borderRadius = "20px"
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for photo.");
	}
}


//Ayush
function signatureUpload() {
	const file = document.getElementById("signature").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("signaturePreview").src = e.target.result;
			const previewimg = document.getElementById("signaturePreview");
			document.getElementById("signaturePreview").src = e.target.result;
			previewimg.style.width = "100%";
			previewimg.style.height = "100%";
			previewimg.style.objectFit = "cover"
			previewimg.style.overflow = "hidden"
			previewimg.style.borderRadius = "20px"
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

$(document).ready(function() {
	$("#tableBody").hide();
	$("#updateBtn").hide();
	$.ajax({
		url: "/api/preference/getAllBranchModule", // Add base path if needed like /api/preference/getAllBranchModule
		type: "GET",
		success: function(response) {
			if (response.success) {
				const branchList = response.data;
				$("#branchName").empty(); // Clear existing options
				$("#branchName").append("<option value=''>-- Select Branch --</option>");

				for (let i = 0; i < branchList.length; i++) {
					let branch = branchList[i];
					let option = `<option value="${branch.branchName}">${branch.branchName}</option>`;
					$("#branchName").append(option);
				}
			} else {
				alert("Error: " + response.message);
			}
		},
		error: function(xhr) {
			console.error("Error loading branches:", xhr.responseText);
			alert("Failed to load dropdown data.");
		}
	});

	$.ajax({
		url: "/api/preference/getAllRelativeModule", // Add base path if needed like /api/preference/getAllBranchModule
		type: "GET",
		success: function(response) {
			if (response.success) {
				const relativeList = response.data;
				$("#relationToApplicant").empty(); // Clear existing options
				$("#relationToApplicant").append("<option value=''>-- Select Relative --</option>");

				for (let i = 0; i < relativeList.length; i++) {
					let relative = relativeList[i];
					let option = `<option value="${relative.relation}">${relative.relation}</option>`;
					$("#relationToApplicant").append(option);
				}
			} else {
				alert("Error: " + response.message);
			}
		},
		error: function(xhr) {
			console.error("Error loading branches:", xhr.responseText);
			alert("Failed to load dropdown data.");
		}
	});

	//Save Code - Ayush
	$('#saveBtn').click(function(event) {
		event.preventDefault();

		const formData = new FormData();

		// Append form fields
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

		// File upload: photo
		const photo = $('#photo')[0].files[0];
		if (photo) {
			formData.append("photo", photo);
		}

		// File upload: signature
		const signature = $('#signature')[0].files[0];
		if (signature) {
			formData.append("signature", signature);
		}

		// Debug log
		for (let pair of formData.entries()) {
			console.log(pair[0] + ':', pair[1]);
		}

		$.ajax({
			type: 'POST',
			url: '/api/preference/saveExecutiveFounder',
			data: formData,
			processData: false,  // Don't process the files
			contentType: false,  // Let browser set correct content type
			success: function(response) {
				if (response.success) {
					alert("Executive Founder Saved Successfully");
					location.reload();
				} else {
					alert("Failed to save executive/founder data.");
				}
			},
			error: function(xhr, status, error) {
				console.error("Error: ", xhr.responseText);
				alert('An error occurred while saving the data. Please try again.');
			}
		});
	});

	$.ajax({
		url: "/api/preference/fetchAllExecutiveFounder", // Updated path
		type: "GET",
		contentType: "application/json",
		success: function(response) {
			if (response.success) {
				var data = response.data;
				var tbody = $(".datatable tbody");
				tbody.empty();

				$.each(data, function(index, item) {
					var row = `<tr style="font-family: 'Poppins', sans-serif;">
		                    <th scope="row"><a href="#">${index + 1}</a></th>
		                    <td>${item.fullName || ''}</td>
		                    <td>${item.branchName || ''}</td>
		                    <td>${item.appointmentDate || ''}</td>
		                    <td>${item.address || ''}</td>
		                    <td>${item.emailId || ''}</td>
		                    <td>${item.contactNo || ''}</td>
		                    <td>
		                        <button class="iconbutton" onclick="viewData(${item.id})" title="View">
		                            <i class="fa-solid fa-pen-to-square text-primary"></i>
		                        </button>
		                    </td>
		                    <td>
		                        <button class="iconbutton" onclick="deleteData(${item.id})" title="Delete">
		                            <i class="fa-solid fa-trash text-danger"></i>
		                        </button>
		                    </td>
		                </tr>`;
					tbody.append(row);
				});
			} else {
				alert("⚠️ " + response.message);
			}
		},
		error: function(xhr, status, error) {
			console.error("❌ Error fetching data:", error);
			alert("Failed to load executive founder data.");
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
	$("#updateBtn").show();
	$("#saveBtn").hide();
	$("#hideBtn").hide();
	$("#showBtn").hide();

	$.ajax({
		url: "/api/preference/fetchExecutiveFounderById",
		type: "GET",
		data: { id: id },
		success: function(response) {
			if (response.success) {
				const branch = response.data;

				$("#id").val(branch.id);
				$("#type").val(branch.type);
				$("#branchName").val(branch.branchName);
				$("#fullName").val(branch.fullName);
				$("#dateOfBirth").val(branch.dateOfBirth);
				$("#promoterNo").val(branch.promoterNo);
				$("#appointmentDate").val(branch.appointmentDate);
				$("#relationName").val(branch.relationName);
				$("#relationToApplicant").val(branch.relationToApplicant);
				$("#address").val(branch.address);
				$("#district").val(branch.district);
				$("#state").val(branch.state);
				$("#pinCode").val(branch.pinCode);
				$("#aadharNo").val(branch.aadharNo);
				$("#panNo").val(branch.panNo);
				$("#contactNo").val(branch.contactNo);
				$("#emailId").val(branch.emailId);
				$("#baseValue").val(branch.baseValue);
				$("#shareCount").val(branch.shareCount);
				$("#shareAmount").val(branch.shareAmount);
				$("#depositAcc").val(branch.depositAcc); // You forgot this in your latest version

				// Image: Photo
				if (branch.photo) {
					const photoPath = `Uploads/${branch.photo}`;
					$("#photoPreview").attr("src", photoPath);
					$("#photoHidden").val(photoPath);
				} else {
					$("#photoPreview").attr("src", "Uploads/default-placeholder.jpg");
					$("#photoHidden").val("");
				}

				// Image: Signature
				if (branch.signature) {
					const signPath = `Uploads/${branch.signature}`;
					$("#signaturePreview").attr("src", signPath);
					$("#signatureHidden").val(signPath);
				} else {
					$("#signaturePreview").attr("src", "Uploads/default-placeholder.jpg");
					$("#signatureHidden").val("");
				}

			} else {
				alert("Executive founder not found: " + response.message);
			}
		},
		error: function(xhr) {
			alert("Request failed: " + xhr.responseText);
		}
	});
}


function updateBranch() {
	let formData = new FormData();

	// Append all fields from the form
	formData.append("id", $("#id").val()); // Hidden input for update
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
}

function deleteData(id) {
	if (confirm("Are you sure you want to delete this Data?")) {
		$.ajax({
			url: "/api/preference/deleteExecutiveFounder",
			type: "POST",
			data: { id: id },
			success: function(response) {
				if (response.success) {
					alert(response.message);
					location.reload();
				} else {
					alert("Delete failed: " + response.message);
				}
			},
			error: function(xhr, status, error) {
				alert("Failed to delete Executive Founder.");
				console.error("Error:", error);
			}
		});
	}
}
