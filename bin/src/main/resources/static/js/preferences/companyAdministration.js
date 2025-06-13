$(document).ready(function() {
	$.ajax({
		url: "/fetchAllCompanyAdministration",
		type: "POST",
		success: function(data) {
			if (data.length > 0) {
				// Example: bind the first record to text fields
				const admin = data[0];
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
				alert("No data found!");
			}
		},
		error: function() {
			alert("Error fetching company administration data.");
		}
	});

	//Update the Data - Ayush
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
			url: "/updateDataOfCompanyAdministration",
			type: "POST",
			data: JSON.stringify(companyData),
			contentType: "application/json",
			success: function(response) {
				alert("Update successfully!");
			},
			error: function(xhr) {
				alert("Update failed: " + xhr.responseText);
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
