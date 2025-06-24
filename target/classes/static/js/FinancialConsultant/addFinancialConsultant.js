$(document).ready(function() {


	// Load Customer Codes
	$.ajax({
		url: "getAllCustomerCodes",
		type: "GET",
		success: function(data) {
			$("#memberCode").append("<option value=''>-- Select Code --</option>");
			for (let i = 0; i < data.length; i++) {
				let option = "<option value='" + data[i].memberCode + "'>" + data[i].memberCode + "</option>";
				$("#memberCode").append(option);
			}
		},
		error: function() {
			alert("Failed to load customer codes.");
		}
	});


	$.ajax({
		url: "getAllBranch",
		type: "GET",
		success: function(data) {
			$("#branchName").append("<option value=''>-- Select Branch --</option>");
			for (let i = 0; i < data.length; i++) {
				let option = "<option value='" + data[i].branchName + "'>" + data[i].branchName + "</option>";
				$("#branchName").append(option);
			}
		},
		error: function() {
			alert("Failed to load branch names.");
		}
	});
});





$(document).ready(function() {
	// Get today's date in YYYY-MM-DD format
	let today = new Date().toISOString().split('T')[0];
	// Set it to the input field
	$("#joiningDate").val(today);
});







$(document).ready(function() {
	$("#memberCode").change(function() {
		var memberCode = $(this).val();

		if (memberCode !== "") {
			$.ajax({
				type: "POST",
				url: "/getCustomerByMemberCode",
				data: { memberCode: memberCode },
				success: function(data) {
					// Fill form fields
					$("#customerName").val(data.customerName);
					$("#dob").val(data.dob);
					$("#age").val(data.customerAge);
					$("#guardianName").val(data.guardianName);
					$("#relationToApplicant").val(data.relationToApplicant);
					$("#contactNo").val(data.contactNo);
					$("#nomineeName").val(data.nomineeName);
					$("#branchName").val(data.branchName);
					$("#nomineeAge").val(data.nomineeAge);
					$("#address").val(data.customerAddress);
					$("#district").val(data.district);
					$("#state").val(data.state);
					$("#pinCode").val(data.pinCode);
					$("#profession").val(data.profession);
					$("#academicBackground").val(data.academicBackground);

					// Set customer photo
					if (data.customerPhoto) {
						const imagePath = `Uploads/${data.customerPhoto}`;
						document.getElementById("customerPhoto").src = imagePath;
						/* imagePath.style.width = "100%";
						imagePath.style.height = "100%";
						imagePath.style.objectFit = "cover"
						imagePath.style.overflow = "hidden"
						imagePath.style.borderRadius = "20px"*/
					} else {
						document.getElementById("customerPhoto").src = 'Uploads/default-placeholder.jpg';
					}

					// Set customer signature
					if (data.customerSignature) {
						const imagePath = `Uploads/${data.customerSignature}`;
						document.getElementById("customerSignature").src = imagePath;
						/*const previewimg2 = document.getElementById("customerSignature");
							document.getElementById("customerSignature").src = e.target.result;
							previewimg2.style.width = "100%";
							previewimg2.style.height = "100%";
							previewimg2.style.objectFit = "cover"
							previewimg2.style.overflow = "hidden"
							previewimg2.style.borderRadius = "20px"*/
					}
					$("#referralCode").val(data.referralCode);
					$("#referralName").val(data.referralName);

				},
				error: function(xhr) {
					alert("Member not found or server error.");
				}
			});
		}
	});
});

function photoUpload() {
	const file = document.getElementById("photo").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("customerPhoto").src = e.target.result;
			const previewimg = document.getElementById("customerPhoto");
			document.getElementById("customerPhoto").src = e.target.result;
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

function signatureUpload() {
	const file = document.getElementById("signature").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("customerSignature").src = e.target.result;
			const previewimg = document.getElementById("customerSignature");
			document.getElementById("customerSignature").src = e.target.result;
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
