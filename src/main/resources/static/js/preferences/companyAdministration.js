$(document).ready(function() {
	$.ajax({
		url: "api/preference/fetchAllCompanyAdministration",
		type: "GET",
		success: function(response) {
			if (response.status == "FOUND") {
				const admin = response.data[0]; // Access the first company record

				$("#id").val(admin.id);
				$("#companyName").val(admin.companyName);
				$("#shortName").val(admin.shortName);
				$("#signUpDate").val(admin.signUpDate);
				$("#cinNo").val(admin.cinNo);
				$("#pan").val(admin.pan);
				$("#tan").val(admin.tan);
				$("#gstin").val(admin.gstin);
				$("#declaredValue").val(admin.declaredValue);
				$("#address").val(admin.address);
				$("#state").val(admin.state);
				$("#city").val(admin.city);
				$("#pinCode").val(admin.pinCode);
				$("#emailId").val(admin.emailId);
				$("#authorizedShareCapital").val(admin.authorizedShareCapital);
				$("#paidUpCapital").val(admin.paidUpCapital);
				$("#nof").val(admin.nof);
				$("#helplineNo").val(admin.helplineNo);
				$("#tdsWithPan").val(admin.tdsWithPan);
				$("#tdsWithoutPan").val(admin.tdsWithoutPan);
				$("#taxDeduction").val(admin.taxDeduction);
				$("#branchManagerContactNo").val(admin.branchManagerContactNo);

			} else {
				alert("No company administration data found.");
			}
		},
		error: function() {
			alert("Error fetching company administration data.");
		}
	});

	$('#updateBtn').click(function(event) {
		event.preventDefault();

		// Convert text to uppercase
		$("#formid").find("input[type=text], textarea").each(function() {
			if ($(this).val()) {
				$(this).val($(this).val().toUpperCase());
			}
		});

		// Clear all error messages
		$('#chkcompanyname, #chkshortname, #chksignupdate, #chkcinno, #chkpan, #chktan, #chkgstin, #chkdeclaredvalue, #chkaddress, #chkstate, #chkcity, #chkpincode, #chkemailid, #chkauthorizedsharecapital, #chkpaidupcapital, #chknof, #chkhelplineNo, #chktdswithpan, #chktdswithoutpan, #chktaxdeduction, #chkbranchManagerContactNo').text('');

		// Get field values
		var companyName = $('#companyName').val().trim();
		var shortName = $('#shortName').val().trim();
		var signUpDate = $('#signUpDate').val().trim();
		var cinNo = $('#cinNo').val().trim();
		var pan = $('#pan').val().trim();
		var tan = $('#tan').val().trim();
		var gstin = $('#gstin').val().trim();
		var declaredValue = $('#declaredValue').val().trim();
		var address = $('#address').val().trim();
		var state = $('#state').val().trim();
		var city = $('#city').val().trim();
		var pinCode = $('#pinCode').val().trim();
		var emailId = $('#emailId').val().trim();
		var authorizedShareCapital = $('#authorizedShareCapital').val().trim();
		var paidUpCapital = $('#paidUpCapital').val().trim();
		var nof = $('#nof').val().trim();
		var helplineNo = $('#helplineNo').val().trim();
		var tdsWithPan = $('#tdsWithPan').val().trim();
		var tdsWithoutPan = $('#tdsWithoutPan').val().trim();
		var taxDeduction = $('#taxDeduction').val().trim();
		var branchManagerContactNo = $('#branchManagerContactNo').val().trim();

		// Regex patterns
		var contactPattern = /^[6-9][0-9]{9}$/;
		var panPattern = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
		var pinPattern = /^[1-9][0-9]{5}$/;
		var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		const cinPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[^A-Za-z0-9]).+$/; // Alpha + numeric + special char
		const tanPattern = /^[A-Za-z0-9]+$/; // Alphanumeric only

		let isValid = true;

		if (companyName === '') {
			$('#chkcompanyname').text('* This field is required');
			$('#companyName').focus();
			isValid = false;
		}
		if (shortName === '') {
			$('#chkshortname').text('* This field is required');
			$('#shortName').focus();
			isValid = false;
		}
		if (signUpDate === '') {
			$('#chksignupdate').text('* This field is required');
			$('#signUpDate').focus();
			isValid = false;
		}
		if (cinNo === '') {
			$('#chkcinno').text('* This field is required');
			$('#cinNo').focus();
			isValid = false;
		} else if (!cinPattern.test(cinNo)) {
			$('#chkcinno').text('CIN No must contain alphabets, numbers, and at least one special character.');
			$('#cinNo').focus();
			isValid = false;
		}
		if (pan === '') {
			$('#chkpan').text('* This field is required');
			$('#pan').focus();
			isValid = false;
		} else if (!panPattern.test(pan)) {
			alert("Please enter a valid PAN card number (e.g., ABCDE1234F).");
			$('#pan').focus();
			return false;
		}
		if (tan === '') {
			$('#chktan').text('* This field is required');
			if (isValid) $('#tan').focus();
			isValid = false;
		} else if (!tanPattern.test(tan)) {
			$('#chktan').text('TAN No must contain only alphabets and numbers (no special characters).');
			$('#tan').focus();
			isValid = false;
		}
		if (gstin === '') {
			$('#chkgstin').text('* This field is required');
			$('#gstin').focus();
			isValid = false;
		}
		if (declaredValue === '') {
			$('#chkdeclaredvalue').text('* This field is required');
			$('#declaredValue').focus();
			isValid = false;
		}
		if (address === '') {
			$('#chkaddress').text('* This field is required');
			$('#address').focus();
			isValid = false;
		}
		if (state === '') {
			$('#chkstate').text('* This field is required');
			$('#state').focus();
			isValid = false;
		}
		if (city === '') {
			$('#chkcity').text('* This field is required');
			$('#city').focus();
			isValid = false;
		}
		if (pinCode === '') {
			$('#chkpincode').text('* This field is required');
			$('#pinCode').focus();
			isValid = false;
		} else if (!pinPattern.test(pinCode)) {
			alert("Please enter a valid 6-digit PIN code (first digit cannot be 0).");
			$('#pinCode').focus();
			return false;
		}
		if (emailId === '') {
			$('#chkemailid').text('* This field is required');
			$('#emailId').focus();
			isValid = false;
		} else if (!emailPattern.test(emailId)) {
			alert('Please enter a valid email address (e.g., example@domain.com)');
			$('#emailId').focus();
			isValid = false;
		}
		if (authorizedShareCapital === '') {
			$('#chkauthorizedsharecapital').text('* This field is required');
			$('#authorizedShareCapital').focus();
			isValid = false;
		}
		if (paidUpCapital === '') {
			$('#chkpaidupcapital').text('* This field is required');
			$('#paidUpCapital').focus();
			isValid = false;
		}
		if (nof === '') {
			$('#chknof').text('* This field is required');
			$('#nof').focus();
			isValid = false;
		}
		if (helplineNo === '') {
			$('#chkhelplineno').text('* This field is required');
			$('#helplineNo').focus();
			isValid = false;
		} else if (!contactPattern.test(helplineNo)) {
			alert("Please enter a valid 10-digit mobile number.");
			$('#helplineNo').focus();
			return false;
		}
		if (tdsWithPan === '') {
			$('#chktdswithpan').text('* This field is required');
			$('#tdsWithPan').focus();
			isValid = false;
		}
		if (tdsWithoutPan === '') {
			$('#chktdswithoutpan').text('* This field is required');
			$('#tdsWithoutPan').focus();
			isValid = false;
		}
		if (taxDeduction === '') {
			$('#chktaxdeduction').text('* This field is required');
			$('#taxDeduction').focus();
			isValid = false;
		}
		if (branchManagerContactNo === '') {
			$('#chkbranchManagerContactNo').text('* This field is required');
			$('#branchManagerContactNo').focus();
			isValid = false;
		}

		if (!isValid) {
			return false;
		}

		var declaredValue = $("#declaredValue").val();
		var paidUpCapital = $("#paidUpCapital").val();
		var noOfShares = paidUpCapital / declaredValue;

		const companyData = {
			id: $("#id").val(),
			companyName: $("#companyName").val(),
			shortName: $("#shortName").val(),
			signUpDate: $("#signUpDate").val(),
			cinNo: $("#cinNo").val(),
			pan: $("#pan").val(),
			tan: $("#tan").val(),
			gstin: $("#gstin").val(),
			declaredValue: $("#declaredValue").val(),
			address: $("#address").val(),
			state: $("#state").val(),
			pinCode: $("#pinCode").val(),
			emailId: $("#emailId").val(),
			authorizedShareCapital: $("#authorizedShareCapital").val(),
			paidUpCapital: $("#paidUpCapital").val(),
			nof: noOfShares,
			contactNo: $("#contactNo").val(),
			tdsWithPan: $("#tdsWithPan").val(),
			tdsWithoutPan: $("#tdsWithoutPan").val(),
			taxDeduction: $("#taxDeduction").val(),
			seniorCitizenTaxDeduction: $("#seniorCitizenTaxDeduction").val()
		};

		$.ajax({
			url: "api/preference/updateDataOfCompanyAdministration",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(companyData),
			success: function(response) {
				if (response.status == "OK") {
					alert(response.message);
					location.reload();
				} else {
					alert(response.message);
				}
			},
			error: function(xhr, status, error) {
				alert("❌ Error: " + xhr.responseText);
			}
		});
	});
});

// Tooltip initialization
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
tooltipTriggerList.map(function(tooltipTriggerEl) {
	return new bootstrap.Tooltip(tooltipTriggerEl);
});

// Enable edit mode
document.addEventListener("DOMContentLoaded", function() {
	const editBtn = document.getElementById("editBtn");
	const updateBtn = document.getElementById("updateBtn");

	editBtn.addEventListener("click", function() {
		updateBtn.removeAttribute("disabled");
		$("#formid").find("input, textarea").prop("readonly", false);
	});
});
