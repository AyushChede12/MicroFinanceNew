// js for saving and updating the data 
$(document).ready(function() {

	// SAVE Button
	$("#saveBtn").on("click", function() {
		submitLoanForm("save");
	});

	// UPDATE Button
	$("#updateBtn").on("click", function() {
		submitLoanForm("update");
	});

	function submitLoanForm(mode) {
		const id = $("#loanId").val();

		const loanData = {
			id: mode === "update" && id ? parseInt(id) : null,
			loanPlaneName: $("#loanPlaneName").val(),
			typeLoan: $("#typeLoan").val(),
			age: $("#age").val(),
			loanDuration: $("#loanDuration").val(),
			emiType: $("#emiType").val(),
			loanAmount: $("#loanAmount").val(),
			loanMode: $("#loanMode").val(),
			rateIntrestType: $("#rateIntrestType").val(),
			typeIntrest: $("#typeIntrest").val(),
			typesecurity: $("#typesecurity").val(),

			// Deductions
			feeProcessing: $("#feeProcessing").val(),
			chargesLegal: $("#chargesLegal").val(),
			gst: $("#gst").val(),
			feeInsurence: $("#feeInsurence").val(),
			feeValuation: $("#feeValuation").val(),

			// Late Penalty
			lateAllowanceday: $("#lateAllowanceday").val(),
			modePanalty: $("#modePanalty").val(),
			pennaltyMonthly: $("#pennaltyMonthly").val()
		};

		$.ajax({
			type: "POST",
			url: "/api/loanmanegment/saveLoanManagment",
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify(loanData),
			success: function(response) {
				if (response.status === "OK") {
					alert(response.message);

					loadLoanTable();
					

					// Reload table after BOTH save and update

				} else {
					alert("Failed: " + response.message);
				}
			}
			,
			error: function(xhr) {
				alert("Error occurred: " + xhr.responseText);
			}
		});
	}
	loadLoanTable();
});


// Js for fetching the data on the tabel
function loadLoanTable() {
	$.ajax({
		url: "/api/loanmanegment/allDataFetchLoanSchemCatelog",
		type: "GET",
		dataType: "json",
		success: function(response) {
			let rows = "";

			if (response.status === "OK" && Array.isArray(response.data)) {
				response.data.forEach(function(loan) {
					rows += `
                        <tr>
                            <td>${loan.id}</td>
                            <td>${loan.loanPlaneName || "-"}</td>
                            <td>${loan.typeLoan || "-"}</td>
                            <td>${loan.age || "-"}</td>
                            <td>${loan.loanDuration || "-"}</td>
                            <td>${loan.emiType || "-"}</td>
                            <td>
								<button class="btn btn-sm btn-warning" onclick="editLoanById(${loan.id})">
                                 <i class="fa fa-edit"></i>
                            </button>                            
                            </td>
                            

                            <td>
                                <button class="btn btn-sm btn-danger" onclick="deleteLoan(${loan.id})">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    `;
				});
			} else {
				rows = "<tr><td colspan='9'>No data found</td></tr>";
			}

			$("#loanTableBody").html(rows);
		},
		error: function(xhr) {
			console.error("Error loading table:", xhr.statusText);
			$("#loanTableBody").html("<tr><td colspan='9'>Error loading data</td></tr>");
		}
	});
}

// js for fething the details on the textfields
function editLoanById(id) {
	$.ajax({
		url: "api/loanmanegment/getLoanByIdEdite",
		type: "GET",
		data: { id: id }, // Send ID as query param
		success: function(response) {
			if (response.status === "OK") {
				const loan = response.data; // ✅ correct variable name

				$('#loanId').val(loan.id); // Hidden field for ID
				$('#loanPlaneName').val(loan.loanPlaneName);
				$('#typeLoan').val(loan.typeLoan);
				$('#age').val(loan.age);
				$('#loanDuration').val(loan.loanDuration);


				$('#emiType').val(loan.emiType);
				$('#loanAmount').val(loan.loanAmount);
				$('#loanMode').val(loan.loanMode);
				$('#rateIntrestType').val(loan.rateIntrestType);
				$('#typeIntrest').val(loan.typeIntrest);
				$('#typesecurity').val(loan.typesecurity);
				$('#feeProcessing').val(loan.feeProcessing);
				$('#chargesLegal').val(loan.chargesLegal);
				$('#gst').val(loan.gst);
				$('#feeInsurence').val(loan.feeInsurence);
				$('#feeValuation').val(loan.feeValuation);
				$('#lateAllowanceday').val(loan.lateAllowanceday);
				$('#modePanalty').val(loan.modePanalty);
				$('#pennaltyMonthly').val(loan.pennaltyMonthly);
			} else {
				alert("Loan not found: " + response.message);
			}
		},
		error: function(xhr) {
			alert("Error fetching loan details: " + xhr.responseText);
		}
	});

}

// js function for deleting the record

function deleteLoan(id) {
	if (confirm("Are you sure you want to delete this loan?")) {
		$.ajax({
			url: "/api/loanmanegment/deleteLoanById", // ✅ FIXED: Added quotes
			type: 'POST',
			data: { id: id },
			success: function(response) {
				if (response.status == "OK") {
					alert("Loan deleted successfully");
					loadLoanTable(); // Refresh table
				} else {
					alert("Failed to delete: " + response.message);
				}
			},
			error: function(xhr, status, error) {
				alert("Error while deleting loan: " + error);
			}
		});
	}
}
