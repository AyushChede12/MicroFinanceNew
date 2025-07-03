$(document).ready(function() {
	$.ajax({
		url: "/api/financialconsultant/getAllFinancialConsultantDetails",
		type: "POST",
		success: function(response) {
			if (response.status === "OK") {
				$("#financialCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#financialCode").append(`<option value='${item.financialCode}'>${item.financialCode}-${item.customerName}</option>`);
				});
			} else {
				alert("No Financial codes found.");
			}
		},
		error: function() {
			alert("Failed to load Financial codes.");
		}
	});

	$.ajax({
		url: "/api/financialconsultant/getAllFinancialConsultantDetails",
		type: "POST",
		success: function(response) {
			if (response.status === "OK") {
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

	$("#financialCode").change(function() {
		let financialCode = $("#financialCode").val();
		$.ajax({
			type: "POST",
			url: "api/financialconsultant/getfinancialHierarchyByFinancialCode",
			data: { financialCode: financialCode },
			success: function(response) {
				alert("success");
				if (response.status == "OK") {
					let data = response.data[0];
					alert(data.relationToApplicant);
					$("#joiningDate").val(data.joiningDate);
					$("#memberCode").val(data.memberCode);
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
					$("#photoPreview").attr("src", data.customerPhoto ? `Uploads/${data.customerPhoto}` : "Uploads/default-placeholder.jpg");
					$("#signaturePreview").attr("src", data.customerSignature ? `Uploads/${data.customerSignature}` : "Uploads/default-placeholder.jpg");

					$("#selectPosition").val(data.selectPosition);
					$("#referralCode").val(data.referralCode);
					$("#referralName").val(data.referralName);

					$("#fees").val(data.fees);
					$("#modeofPayment").val(data.modeofPayment);
					$("#comments").val(data.comments);

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


				} else {
					alert("Transfer Share Details Not Found For Customer");
				}
			},
			error: function() {
				alert("Shares not found or server error");
			}
		});

	});
});