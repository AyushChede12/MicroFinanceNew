$(document).ready(function() {
	$.ajax({
		url: "/api/financialconsultant/getAllCustomerCodes",
		type: "POST",
		success: function(response) {
			if (response.status === "FOUND") {
				$("#customerCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#customerCode").append(`<option value='${item.memberCode}'>${item.memberCode}-${item.customerName}</option>`);
				});
			} else {
				alert("No customer codes found.");
			}
		},
		error: function() {
			alert("Failed to load customer codes.");
		}
	});

	$("#customerCode").change(function() {
		let customerCode = $(this).val();
		if (customerCode !== "") {
			$.ajax({
				type: "POST",
				url: "/api/financialconsultant/getFinancialConsultantByMemberCode",
				data: { memberCode: customerCode },
				success: function(response) {
					if (response.data && response.data.length > 0) {
						let data = response.data[0];
						$("#signupDate").val(data.signupDate);
						$("#major").val(data.major);
						$("#customerName").val(data.customerName);
						$("#familyMemberName").val(data.guardianName);
						$("#relationToApplicant").val(data.relationToApplicant);
						$("#customerGender").val(data.customerGender);
						$("#dob").val(data.dob);
						$("#customerAge").val(data.customerAge);
						$("#relationshipStatus").val(data.relationshipStatus);
						$("#customerAddress").val(data.customerAddress);
						$("#district").val(data.district);
						$("#state").val(data.state);
						$("#pinCode").val(data.pinCode);
						$("#aadharNo").val(data.aadharNo);
						$("#panNo").val(data.panNo);
						$("#voterNo").val(data.voterNo);
						$("#contactNo").val(data.contactNo);
						$("#emailId").val(data.emailId);
						$("#profession").val(data.profession);
						$("#academicBackground").val(data.academicBackground);
						$("#referralCode").val(data.referralCode);
						$("#referralName").val(data.referralName);
						$("#minor").val(data.minor);
						$("#photoPreview").attr("src", data.customerPhoto ? `Uploads/${data.customerPhoto}` : "Uploads/default-placeholder.jpg");

						//Nominee 
						$("#nomineeName").val(data.nomineeName);
						$("#nomineeRelationToApplicant").val(data.nomineeRelationToApplicant);
						$("#nomineeAddress").val(data.nomineeAddress);
						$("#nomineeKycNo").val(data.nomineeKycNo);
						$("#nomineeMobileNo").val(data.nomineeMobileNo);
						$("#nomineeAge").val(data.nomineeAge);
						$("#nomineePanNo").val(data.nomineePanNo);
						$("#nomineeKycType").val(data.nomineeKycType);

						restFieldsBind(customerCode);

						if (parseInt(data.memberStatus) === 1) {
							$('#toggle-member-status').prop('checked', true);
						} else {
							$('#toggle-member-status').prop('checked', false);
						}

						if (parseInt(data.memberBanking) === 1) {
							$('#toggle-mobile-banking').prop('checked', true);
						} else {
							$('#toggle-mobile-banking').prop('checked', false);
						}

						if (parseInt(data.netBanking) === 1) {
							$('#toggle-net-banking').prop('checked', true);
						} else {
							$('#toggle-net-banking').prop('checked', false);
						}

						if (parseInt(data.smsSend) === 1) {
							$('#toggle-sms-send').prop('checked', true);
						} else {
							$('#toggle-sms-send').prop('checked', false);
						}

						updateToggleColor(document.getElementById('toggle-member-status'));
						updateToggleColor(document.getElementById('toggle-mobile-banking'));
						updateToggleColor(document.getElementById('toggle-net-banking'));
						updateToggleColor(document.getElementById('toggle-sms-send'));

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

	$.ajax({
		url: "/api/preference/getAllRelativeModule", // Add base path if needed like /api/preference/getAllBranchModule
		type: "GET",
		success: function(response) {
			if (response.status == "FOUND") {
				const relativeList = response.data;
				$("#nomineeRelationToApplicant").empty(); // Clear existing options
				$("#nomineeRelationToApplicant").append("<option value=''>-- Select Relative --</option>");

				for (let i = 0; i < relativeList.length; i++) {
					let relative = relativeList[i];
					let option = `<option value="${relative.relation}">${relative.relation}</option>`;
					$("#nomineeRelationToApplicant").append(option);
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


});

function restFieldsBind(customerCode) {
	$.ajax({
		type: "POST",
		url: "/api/customershareholdingcontroller/fetchByFindByCode",
		data: { findByCode: customerCode },
		success: function(response) {
			if (response.status == "FOUND") {
				let data = response.data[0];
				$("#previousAccountBalance").val(data.previousAccountBalance);
				$("#shareIssuedBy").val(data.shareIssuedBy);
				$("#noOfShare").val(data.noOfShare);
				$("#baseValue").val(data.baseValue);
				$("#modeOfPayment").val(data.modeOfPayment);
				$("#comments").val(data.comments);


			} else {
				alert("No customer found for this Customer code.");
			}
		},
		error: function() {
			alert("Customer not found or server error.");
		}
	});
}

document.addEventListener('DOMContentLoaded', function() {
	const toggles = document.querySelectorAll('.toggle__input');

	toggles.forEach((toggle) => {
		updateToggleColor(toggle);

		toggle.addEventListener('change', () => {
			updateToggleColor(toggle);
			console.log(`${toggle.dataset.toggleType} is now ${toggle.checked}`);
		});
	});

	function updateToggleColor(input) {
		const label = input.nextElementSibling;
		if (label) {
			label.style.backgroundColor = input.checked ? '#28a745' : '#ccc';
		}
	}
});

function updateToggleColor(input) {
	const label = input.nextElementSibling;
	if (input.checked) {
		label.style.backgroundColor = "#4caf50";  // green
		label.style.borderColor = "#4caf50";
	} else {
		label.style.backgroundColor = "#ccc";  // gray
		label.style.borderColor = "#ccc";
	}
}

document.addEventListener('DOMContentLoaded', function() {
	const toggles = document.querySelectorAll('.toggle__input');

	toggles.forEach((toggle) => {
		updateToggleColor(toggle); // initial state
		toggle.addEventListener('change', function() {
			updateToggleColor(this);
		});
	});
});

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