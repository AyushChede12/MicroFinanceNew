$(document).ready(function() {

	// ✅ Load Customer Codes
	$.ajax({
		url: "/api/financialconsultant/getAllCustomerCodes",
		type: "POST",
		success: function(response) {
			if (response.status === "OK" && response.data) {
				$("#memberCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#memberCode").append(`<option value='${item.memberCode}'>${item.memberCode}</option>`);
				});
			} else {
				alert("No customer codes found.");
			}
		},
		error: function() {
			alert("Failed to load customer codes.");
		}
	});

	// ✅ Load Branches
	$.ajax({
		url: "/api/financialconsultant/getAllBranch",
		type: "POST",
		success: function(response) {
			if (response.status === "OK" && response.data) {
				$("#branchName").empty().append("<option value=''>-- Select Branch --</option>");
				response.data.forEach(function(item) {
					$("#branchName").append(`<option value='${item.branchName}'>${item.branchName}</option>`);
				});
			} else {
				alert("No branches found.");
			}
		},
		error: function() {
			alert("Failed to load branch names.");
		}
	});

	// ✅ Load Relation to Applicant
	$.ajax({
		url: "/api/financialconsultant/getAllRelationToApplicant",
		type: "POST",
		success: function(response) {
			if (response.status === "OK" && response.data) {
				$("#relationToApplicant").empty().append("<option value=''>-- Select Relation --</option>");
				response.data.forEach(function(item) {
					$("#relationToApplicant").append(`<option value='${item.relationToApplicant}'>${item.relationToApplicant}</option>`);
				});
			} else {
				alert("No relations found.");
			}
		},
		error: function() {
			alert("Failed to load relation.");
		}
	});

	// ✅ Set Today's Date
	let today = new Date().toISOString().split('T')[0];
	$("#joiningDate").val(today);

	// ✅ Auto-fill on Member Code Change
	$("#memberCode").change(function() {
		let memberCode = $(this).val();
		if (memberCode !== "") {
			$.ajax({
				type: "POST",
				url: "/api/financialconsultant/getFinancialConsultantByMemberCode",
				data: { memberCode: memberCode },
				success: function(response) {
					if (response.data && response.data.length > 0) {
						let data = response.data[0];
						$("#customerName").val(data.customerName);
						$("#dob").val(data.dob);
						$("#customerAge").val(data.customerAge);
						$("#guardianName").val(data.guardianName);
						$("#relationToApplicant").val(data.relationToApplicant);
						$("#contactNo").val(data.contactNo);
						$("#nomineeName").val(data.nomineeName);
						$("#branchName").val(data.branchName);
						$("#nomineeAge").val(data.nomineeAge);
						$("#customerAddress").val(data.customerAddress);
						$("#district").val(data.district);
						$("#state").val(data.state);
						$("#pinCode").val(data.pinCode);
						$("#profession").val(data.profession);
						$("#academicBackground").val(data.academicBackground);
						$("#referralCode").val(data.referralCode);
						$("#referralName").val(data.referralName);

						// Images
						$("#financialPhotoPreview").attr("src", data.customerPhoto ? `Uploads/${data.customerPhoto}` : "Uploads/default-placeholder.jpg");
						$("#financialSignaturePreview").attr("src", data.customerSignature ? `Uploads/${data.customerSignature}` : "Uploads/default-signature.jpg");
					} else {
						alert("No customer found for this member code.");
					}
				},
				error: function() {
					alert("Member not found or server error.");
				}
			});
		}
	});
});

// ✅ Global: Image Upload Preview – Photo
function photoUpload() {
	const file = document.getElementById("customerPhoto").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const preview = document.getElementById("financialPhotoPreview");
			preview.src = e.target.result;
			preview.style = "width: 100%; height: 100%; object-fit: cover; border-radius: 20px; overflow: hidden;";
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for photo.");
	}
}

// ✅ Global: Image Upload Preview – Signature
function signatureUpload() {
	const file = document.getElementById("customerSignature").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const preview = document.getElementById("financialSignaturePreview");
			preview.src = e.target.result;
			preview.style = "width: 100%; height: 100%; object-fit: cover; border-radius: 20px; overflow: hidden;";
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}








$(document).ready(function() {

	// Initially hide conditional fields
	$('#displayCheque').hide();
	$('#displaycheqdate').hide();
	$('#displaydeposit').hide();
	$('#displayRef').hide();



	$('#saveBtnFinacial').click(function(event) {
		event.preventDefault();
		const financialCode = $('#financialCode').val();

		// ✅ Extract image file names from preview
		const financialPhotoSrc = $('#financialPhotoPreview').attr('src') || '';
		const financialSignatureSrc = $('#financialSignaturePreview').attr('src') || '';
		const customerPhoto = financialPhotoSrc.split('/').pop();
		const customerSignature = financialSignatureSrc.split('/').pop();

		// Create FormData
		const formData = new FormData();

		// Append standard fields
		formData.append("financialCode", $('#financialCode').val());
		formData.append("joiningDate", $('#joiningDate').val());
		formData.append("memberCode", $('#memberCode').val());
		formData.append("customerName", $('#customerName').val());
		formData.append("dob", $('#dob').val());
		formData.append("customerAge", $('#customerAge').val());
		formData.append("guardianName", $('#guardianName').val());
		formData.append("relationToApplicant", $('#relationToApplicant').val());
		formData.append("contactNo", $('#contactNo').val());
		formData.append("nomineeName", $('#nomineeName').val());
		formData.append("branchName", $('#branchName').val());
		formData.append("nomineeAge", $('#nomineeAge').val());
		formData.append("customerAddress", $('#customerAddress').val());
		formData.append("district", $('#district').val());
		formData.append("state", $('#state').val());
		formData.append("pinCode", $('#pinCode').val());
		formData.append("profession", $('#profession').val());
		formData.append("academicBackground", $('#academicBackground').val());
		formData.append("selectPosition", $('#selectPosition').val());
		formData.append("referralCode", $('#referralCode').val());
		formData.append("referralName", $('#referralName').val());
		formData.append("fees", $('#fees').val());
		formData.append("modeofPayment", $('#modeofPayment').val());
		formData.append("chequeNo", $('#chequeNo').val());
		formData.append("chequeDate", $('#chequeDate').val());
		formData.append("depositAccount", $('#depositAccount').val());
		formData.append("refNo", $('#refNo').val());
		formData.append("comments", $('#comments').val());
		formData.append("financialStatus", $('#financialStatus').is(':checked') ? 1 : 0);
		formData.append("smsSend", $('#smsSend').is(':checked') ? 1 : 0);

		// Append conditional payment fields


		// Append photo/signature filenames
		formData.append("customerPhoto", customerPhoto);
		formData.append("customerSignature", customerSignature);

		// AJAX form submit
		$.ajax({
			type: 'POST',
			url: '/api/financialconsultant/saveOrUpdateFinancialConsultant',
			data: formData,
			processData: false,
			contentType: false,
			success: function(response) {
				if (response.status === "OK" || response.status === "CREATED") {
					alert("Saved Successfully \n Financial Code : " + financialCode);
					location.reload();
				} else {
					alert("Error: " + response.message);
				}
			},
			error: function(xhr) {
				console.error("Error:", xhr.responseText);
				alert("❌ An error occurred while saving the data.");
			}
		});
	});
});

function displayDetails() {
	const paymentMode = $('#modeofPayment').val();
	if (paymentMode === 'Cash') {
		$('#displayCheque').hide();
		$('#displaycheqdate').hide();
		$('#displaydeposit').hide();
		$('#displayRef').hide();
	}
	else if (paymentMode === 'Cheque') {
		$('#displayCheque').show();
		$('#displaycheqdate').show();
		$('#displaydeposit').show();
		$('#displayRef').hide();
	} else if (paymentMode === 'Online') {
		$('#displayCheque').hide();
		$('#displaycheqdate').hide();
		$('#displaydeposit').show();
		$('#displayRef').show();
	}
	else if (paymentMode === 'NEFT') {
		$('#displayCheque').hide();
		$('#displaycheqdate').hide();
		$('#displaydeposit').show();
		$('#displayRef').show();

	}


}


// ✅ UPI ID verification logic
$('#verifyUpiBtn').click(function () {
	const upi = $('#refNo').val().trim();
	const upiPattern = /^[\w.\-]{2,256}@[a-zA-Z]{2,64}$/;

	if (upiPattern.test(upi)) {
		$('#refNo').css('border', '2px solid green');
		$('#upiStatus').text('✅ Valid UPI ID').css('color', 'green');
	} else {
		$('#refNo').css('border', '2px solid red');
		$('#upiStatus').text('❌ Invalid UPI ID format').css('color', 'red');
	}
});

