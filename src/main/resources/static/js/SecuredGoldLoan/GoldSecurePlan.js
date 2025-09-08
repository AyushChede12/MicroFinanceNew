$(document).ready(function() {

	// SAVE Button
	$("#saveBtn").on("click", function() {
		submitGoldLoanForm("save");
	});

	// UPDATE Button
	$("#updateBtn").on("click", function() {
		submitGoldLoanForm("update");
	});

	function submitGoldLoanForm(mode) {
		const id = $("#goldLoanId").val();

		const goldLoanData = {
			id: mode === "update" && id ? parseInt(id) : null,
			//loanSchemeCode: $("#loanSchemeCode").val(),
			loanPlanName: $("#loanPlanName").val(),
			typeOfLoan: $("#typeOfLoan").val(),
			loanMode: $("#loanMode").val(),
			interestType: $("#interestType").val(),
			emiType: $("#emiType").val(),
			minAge: $("#minAge").val(),
			maxAge: $("#maxAge").val(),
			minAmt: $("#minAmt").val(),
			maxAmt: $("#maxAmt").val(),
			minTerm: $("#minTerm").val(),


			maxTerm: $("#maxTerm").val(),
			rateInterestType: $("#rateInterestType").val(),
			securityType: $("#securityType").val(),
			planStatus: $("#toggle-plan-status").is(":checked") ? 1 : 0,
			procFee: $("#procFee").val(),

			// Late Penalty
			legalCharge: $("#legalCharge").val(),
			gst: $("#gst").val(),
			insuFee: $("#insuFee").val(),
			valuFee: $("#valuFee").val(),
			
			lateAllowanceDay: $("#lateAllowanceDay").val(),
			penaltyMode: $("#penaltyMode").val(),

			// ✅ Toggle value for Plan Status
			monthlyPenalty: $("#monthlyPenalty").val()
		};

		$.ajax({
			type: "POST",
			url: "api/securedGoldLoan/saveGoldSecurePlan",
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify(goldLoanData),
			success: function(response) {
				if (response.status === "OK") {
					alert("Gold Data Saved Successfully");
					loadLoanTable(); // refresh the table
				} else {
					alert("Failed: " + response.message);
				}
			},
			error: function(xhr) {
				alert("Error occurred: " + xhr.responseText);
			}
		});
	}

	loadLoanTable();
});