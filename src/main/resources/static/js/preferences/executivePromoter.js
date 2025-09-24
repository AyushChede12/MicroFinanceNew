//Ayush
function photoUpload() {
	const file = document.getElementById("photo").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			photoSizeEdit(e);
			$("#photoHidden").val("");
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
			signatureSizeEdit(e);
			$("#signatureHidden").val("");
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

function exephotoUpload() {
	const file = document.getElementById("executivePhoto").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			exephotoSizeEdit(e);
			$("#exephotoHidden").val("");
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for photo.");
	}
}

function exesignatureUpload() {
	alert("hi");
	const file = document.getElementById("executiveSignature").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			exesignatureSizeEdit(e);
			$("#exesignatureHidden").val("");
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

$(document).ready(function() {
	$("#tableBody").hide();
	$("#updateBtn").hide();

	//Save Code - Ayush
	$('#saveBtn').click(function(event) {

		$('#chkexetype').text('');
		$('#chkbranchname').text('');
		$('#chkfullname').text('');
		$('#chkdateofbirth').text('');
		$('#chkpromoterno').text('');
		$('#chkappointmentdate').text('');
		$('#chkrelationname').text('');
		$('#chkrelationtoapplicant').text('');
		$('#chkaddress').text('');
		$('#chkdistrict').text('');
		$('#chkstate').text('');
		$('#chkpincode').text('');
		$('#chkaadharno').text('');
		$('#chkpanno').text('');
		$('#chkcontactno').text('');
		$('#chkemailid').text('');
		$('#chkphoto').text('');
		$('#chksignature').text('');
		$('#chkdepositacc').text('');

		var type = $('#type').val().trim();
		var branchName = $('#branchName').val().trim();
		var fullName = $('#fullName').val().trim();
		var dateOfBirth = $('#dateOfBirth').val().trim();
		var promoterNo = $('#promoterNo').val().trim();
		var appointmentDate = $('#appointmentDate').val().trim();
		var relationName = $('#relationName').val().trim();
		var relationToApplicant = $('#relationToApplicant').val().trim();
		var address = $('#address').val().trim();
		var district = $('#district').val().trim();
		var state = $('#state').val().trim();
		var pinCode = $('#pinCode').val().trim();
		var aadharNo = $('#aadharNo').val().trim();
		var panNo = $('#panNo').val().trim();
		var contactNo = $('#contactNo').val().trim();
		var emailId = $('#emailId').val().trim();
		var depositAcc = $('#depositAcc').val().trim();

		const photo = $('#photo')[0].files[0];
		const signature = $('#signature')[0].files[0];


		//Validations
		var pinPattern = /^[1-9][0-9]{5}$/;
		var panPattern = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
		var contactPattern = /^[6-9][0-9]{9}$/;
		var aadharPattern = /^\d{12}$/;
		var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

		let isValid = true;

		if (type === '') {
			$('#chkexetype').text('* This field is required');
			$('#type').focus();
			isValid = false;
		}

		if (branchName === '') {
			$('#chkbranchname').text('* This field is required');
			$('#branchName').focus();
			isValid = false;
		}

		if (fullName === '') {
			$('#chkfullname').text('* This field is required');
			$('#fullName').focus();
			isValid = false;
		}

		if (fullName === '') {
			$('#chkopeningdate').text('* This field is required');
			$('#fullName').focus();
			isValid = false;
		}

		if (dateOfBirth === '') {
			$('#chkdateofbirth').text('* This field is required');
			$('#dateOfBirth').focus();
			isValid = false;
		}

		if (promoterNo === '') {
			$('#chkpromoterno').text('* This field is required');
			$('#promoterNo').focus();
			isValid = false;
		}

		if (appointmentDate === '') {
			$('#chkappointmentdate').text('* This field is required');
			$('#appointmentDate').focus();
			isValid = false;
		}
		if (relationName === '') {
			$('#chkrelationname').text('* This field is required');
			$('#relationName').focus();
			isValid = false;
		}
		if (relationToApplicant === '') {
			$('#chkrelationtoapplicant').text('* This field is required');
			$('#relationToApplicant').focus();
			isValid = false;
		}
		if (address === '') {
			$('#chkaddress').text('* This field is required');
			$('#address').focus();
			isValid = false;
		}
		if (district === '') {
			$('#chkdistrict').text('* This field is required');
			$('#district').focus();
			isValid = false;
		}
		if (state === '') {
			$('#chkstate').text('* This field is required');
			$('#state').focus();
			isValid = false;
		}
		if (pinCode === '') {
			$('#chkpincode').text('* This field is required');
			$('#pinCode').focus();
			isValid = false;
		}
		else if (!pinPattern.test(pinCode)) {
			alert("Please enter a valid 6-digit PIN code (first digit cannot be 0).");
			pinCode.focus();
			isValid = false;
		}
		if (aadharNo === '') {
			$('#chkaadharno').text('* This field is required');
			$('#aadharNo').focus();
			isValid = false;
		}
		else if (!aadharPattern.test(aadharNo)) {
			alert("Please enter a valid 12-digit Aadhar number.");
			$('#aadharNo').focus();
			isValid = false;
		}
		if (panNo === '') {
			$('#chkpanno').text('* This field is required');
			$('#panNo').focus();
			isValid = false;
		}
		else if (!panPattern.test(panNo)) {
			alert("Please enter a valid PAN card number (e.g., ABCDE1234F).");
			panNo.focus();
			isValid = false;
		}
		if (contactNo === '') {
			$('#chkcontactno').text('* This field is required');
			$('#contactNo').focus();
			isValid = false;
		}
		else if (!contactPattern.test(contactNo)) {
			alert("Please enter a valid 10-digit mobile number.");
			contactNo.focus();
			isValid = false;
		}
		if (emailId === '') {
			$('#chkemailid').text('* This field is required');
			$('#emailId').focus();
			isValid = false;
		}
		else if (!emailPattern.test(emailId)) {
			alert('Please enter a valid email address (e.g., example@domain.com)');
			$('#emailId').focus();
			isValid = false;
		}

		if (!photo) {
			$('#chkphoto').text('* Photo is required');
			$('#photo').focus();
			isValid = false;
		}
		if (!signature) {
			$('#chksignature').text('* Signature is required');
			$('#signature').focus();
			isValid = false;
		}

		if (depositAcc === '') {
			$('#chkdepositacc').text('* This field is required');
			$('#depositAcc').focus();
			isValid = false;
		}

		if (!isValid) {
			return false; // Stop AJAX call
		}

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
		if (photo) {
			formData.append("photo", photo);
		}

		// File upload: signature
		if (signature) {
			formData.append("signature", signature);
		}

		// Debug log
		for (let pair of formData.entries()) {
			console.log(pair[0] + ':', pair[1]);
		}

		$.ajax({
			type: 'POST',
			url: 'api/preference/saveExecutiveFounder',
			data: formData,
			processData: false,  // Don't process the files
			contentType: false,  // Let browser set correct content type
			success: function(response) {
				if (response.status == 'OK') {
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

	/*$.ajax({
		url: "api/preference/fetchAllExecutiveFounder", // Updated path
		type: "GET",
		contentType: "application/json",
		success: function(response) {
			if (response.status = "FOUND") {
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
	});*/


});

function deleteData(id) {

	if (confirm("Are you sure you want to delete this Executive Data?")) {
		$.ajax({
			url: "api/preference/deleteExecutiveFounder",
			type: "POST",
			data: { id: id },
			success: function(response) {
				if (response.status == "OK") {
					alert("Executive Data Deleted Successfully");
					location.reload();
				} else {
					alert("Delete failed: " + response.message);
				}
			},
			error: function(xhr, status, error) {
				alert("Failed to delete Executive.");
				console.error("Error:", error);
			}
		});
	}
}

function showTableData() {
	$("#tableBody").show();
	$("#prevBtn").show();
	$("#nextBtn").show();
	$("#pageInfo").show();
}

function hideTableData() {
	$("#tableBody").hide();
	$("#prevBtn").hide();
	$("#nextBtn").hide();
	$("#pageInfo").hide();
}

function viewData(id) {
	$("#updateBtn").show();
	$("#saveBtn").hide();
	$("#hideBtn").hide();
	$("#showBtn").hide();

	$.ajax({
		url: "api/preference/fetchExecutiveFounderById",
		type: "GET",
		data: { id: id },
		success: function(response) {
			if (response.status == "FOUND") {
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

				if (branch.photo) {
					const photoPath = `Uploads/${branch.photo}`;
					$("#photoPreview").attr("src", photoPath);
					$("#photoHidden").val(photoPath);
					const fakePhotoEvent = { target: { result: photoPath } };
					photoSizeEdit(fakePhotoEvent);

				} else {
					$("#photoPreview").attr("src", "Uploads/default-placeholder.jpg");
					$("#photoHidden").val("");
				}

				// Image: Signature
				if (branch.signature) {
					const signPath = `Uploads/${branch.signature}`;
					$("#signaturePreview").attr("src", signPath);
					$("#signatureHidden").val(signPath);
					const fakeSignEvent = { target: { result: signPath } };
					signatureSizeEdit(fakeSignEvent);

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
		url: "api/preference/saveExecutiveFounder",
		type: "POST",
		data: formData,
		processData: false,
		contentType: false,
		success: function(response) {
			if (response.status == "OK") {
				alert("Executive Founder Updated Successfully");
				location.reload();
			} else {
				alert(response.message);
			}
		},
		error: function(xhr) {
			alert("Error: " + xhr.responseText);
		}
	});
}

function photoSizeEdit(e) {
	const previewimg = document.getElementById("photoPreview");
	previewimg.src = e.target.result;
	previewimg.style.width = "100%";
	previewimg.style.height = "100%";
	previewimg.style.objectFit = "cover";
	previewimg.style.overflow = "hidden";
	previewimg.style.borderRadius = "20px";
}

function signatureSizeEdit(e) {
	const previewimg = document.getElementById("signaturePreview");
	previewimg.src = e.target.result;
	previewimg.style.width = "100%";
	previewimg.style.height = "100%";
	previewimg.style.objectFit = "cover";
	previewimg.style.overflow = "hidden";
	previewimg.style.borderRadius = "20px";
}

function exephotoSizeEdit(e) {
	const previewimg = document.getElementById("exephotoPreview");
	previewimg.src = e.target.result;
	previewimg.style.width = "100%";
	previewimg.style.height = "100%";
	previewimg.style.objectFit = "cover";
	previewimg.style.overflow = "hidden";
	previewimg.style.borderRadius = "20px";
}

function exesignatureSizeEdit(e) {
	const previewimg = document.getElementById("exesignaturePreview");
	previewimg.src = e.target.result;
	previewimg.style.width = "100%";
	previewimg.style.height = "100%";
	previewimg.style.objectFit = "cover";
	previewimg.style.overflow = "hidden";
	previewimg.style.borderRadius = "20px";
}

var totalDataExecutive = [];
var currentPageExecutive = 1;
var pageSizeExecutive = 5;

// Load data once
function loadExecutiveData() {
	$.ajax({
		type: "GET",
		url: "api/preference/fetchAllExecutiveFounder",
		contentType: "application/json",
		success: function(response) {
			if (response.status === "FOUND") {
				totalDataExecutive = response.data;
				renderTable(currentPageExecutive);
				togglePageNavigationExecutive();
			} else {
				alert("Failed to fetch data: " + response.message);
			}
		},
		error: function() {
			alert("Error while calling the API.");
		}
	});
}

// Render paginated table
function renderTable(page) {
	let tableBody = $(".datatable tbody");
	tableBody.empty();

	let startIndex = (page - 1) * pageSizeExecutive;
	let endIndex = Math.min(startIndex + pageSizeExecutive, totalDataExecutive.length);

	for (let i = startIndex; i < endIndex; i++) {
		let person = totalDataExecutive[i];
		let row = `<tr>
				<td>${i + 1}</td>
                <td>${person.fullName}</td>
                <td>${person.branchName}</td>
                <td>${person.appointmentDate}</td>
                <td>${person.address}</td>
                <td>${person.emailId}</td>
                <td>${person.contactNo}</td>
                <td>
                  <button class="iconbutton" onclick="viewData(${person.id})" title="View">
                    <i class="fa-solid fa-pen-to-square text-primary"></i>
                  </button>
                </td>
                <td>
                  <button class="iconbutton" onclick="deleteData(${person.id})" title="Delete">
                    <i class="fa-solid fa-trash text-danger"></i>
                  </button>
                </td>
              </tr>`;
		tableBody.append(row);
	}

	// Update page info
	$("#pageInfo").text(`Page ${currentPageExecutive} of ${Math.ceil(totalDataExecutive.length / pageSizeExecutive)}`);
}

// Button state toggling
function togglePageNavigationExecutive() {
	let totalPages = Math.ceil(totalDataExecutive.length / pageSizeExecutive);
	$("#prevBtn").prop("disabled", currentPageExecutive === 1);
	$("#nextBtn").prop("disabled", currentPageExecutive === totalPages || totalPages === 0);
}

// Button click handlers
$("#prevBtn").click(function() {
	if (currentPageExecutive > 1) {
		currentPageExecutive--;
		renderTable(currentPageExecutive);
		togglePageNavigationExecutive();
	}
});

$("#nextBtn").click(function() {
	let totalPages = Math.ceil(totalDataExecutive.length / pageSizeExecutive);
	if (currentPageExecutive < totalPages) {
		currentPageExecutive++;
		renderTable(currentPageExecutive);
		togglePageNavigationExecutive();
	}
});

// Call on page load
$(document).ready(function() {
	$("#prevBtn").hide();
	$("#nextBtn").hide();
	$("#pageInfo").hide();
	loadExecutiveData();
});

// Function to calculate Share Amount
function calculateShareAmount() {
	let baseValue = parseFloat(document.getElementById("baseValue").value) || 0;
	let shareCount = parseFloat(document.getElementById("shareCount").value) || 0;
	let shareAmount = baseValue * shareCount;

	document.getElementById("shareAmount").value = shareAmount.toFixed(2); // 2 decimal places
}

// Event listeners for real-time calculation
document.getElementById("baseValue").addEventListener("input", calculateShareAmount);
document.getElementById("shareCount").addEventListener("input", calculateShareAmount);

