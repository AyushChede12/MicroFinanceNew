$(document).ready(function() {
	$.ajax({
		url: "/api/preference/fetchAllCompanyAdministration",
		type: "GET",
		success: function(response) {
			if (response.success && response.data.length > 0) {
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
				$("#pinCode").val(admin.pinCode);
				$("#emailId").val(admin.emailId);
				$("#authorizedShareCapital").val(admin.authorizedShareCapital);
				$("#paidUpCapital").val(admin.paidUpCapital);
				$("#nof").val(admin.nof);
				$("#contactNo").val(admin.contactNo);
				$("#tdsWithPan").val(admin.tdsWithPan);
				$("#tdsWithoutPan").val(admin.tdsWithoutPan);
				$("#taxDeduction").val(admin.taxDeduction);
				$("#seniorCitizenTaxDeduction").val(admin.seniorCitizenTaxDeduction);
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
			nof: $("#nof").val(),
			contactNo: $("#contactNo").val(),
			tdsWithPan: $("#tdsWithPan").val(),
			tdsWithoutPan: $("#tdsWithoutPan").val(),
			taxDeduction: $("#taxDeduction").val(),
			seniorCitizenTaxDeduction: $("#seniorCitizenTaxDeduction").val()
		};

		$.ajax({
			url: "/api/preference/updateDataOfCompanyAdministration",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(companyData),
			success: function(response) {
				if (response.success) {
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

var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
tooltipTriggerList.map(function(tooltipTriggerEl) {
	return new bootstrap.Tooltip(tooltipTriggerEl);
});

document.addEventListener("DOMContentLoaded", function() {
	const editBtn = document.getElementById("editBtn");
	const updateBtn = document.getElementById("updateBtn");

	editBtn.addEventListener("click", function() {
		updateBtn.removeAttribute("disabled"); // Enable the Update button
		$("#formid")
			.find("input, textarea")
			.prop("readonly", false);
	});
});
