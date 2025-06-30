/**
 * 
 */

// data save shraddha
$(document).ready(function () {
    loadLoanTable(); // If defined elsewhere

    $('#saveBtn').on('click', function (e) {
        e.preventDefault();
        alert("shradha");

        const loanData = {
            loanSchemeCode: $('#loanSchemeCode').val(),   // ✅ fixed here
            loanPlaneName: $('#loanPlaneName').val(),
            typeloan: $('#typeloan').val(),
            minimumAge: $('#minimumAge').val(),
            maximumAge: $('#maximumAge').val(),
            minloanDuration: $('#minloanDuration').val(),
            mixloanDuration: $('#mixloanDuration').val(),
            emiFrequency: $('#emiFrequency').val(),
            emiType: $('#emiType').val(),
            minimumloanAmount: $('#minimumloanAmount').val(),
            maximumloanAmount: $('#maximumloanAmount').val(),
            rateIntrestType: $('#rateIntrestType').val(),
            typeIntrest: $('#typeIntrest').val(),
            typesecurity: $('#typesecurity').val(),
            feeProcessing: $('#feeProcessing').val(),
            chargesLegal: $('#chargesLegal').val(),
            gst: $('#gst').val(),
            feeInsurence: $('#feeInsurence').val(),
            feeValuation: $('#feeValuation').val(),
            lateAllowanceday: $('#lateAllowanceday').val(),
            modePanalty: $('#modePanalty').val(),
            pennaltyMonthly: $('#pennaltyMonthly').val()
        };

        $.ajax({
            url: '/api/loanmanegment/saveLoanManagment',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(loanData),
            success: function (response) {
                console.log("✅ Success:", response);
                alert(response.message || "Loan saved successfully");
                fetchLoanTable(); // Update table if defined
            },
            error: function (xhr, status, error) {
                console.error("❌ Error:", xhr.responseText);
                alert("Save failed. Server error or incorrect request.");
            }
        });
    });
});


// update code sharddha

$(document).ready(function() {
	$("#updateBtn").click(function(e) {
		alert("hill sharddha");
		e.preventDefault();

		var loanData = {
			loanPlaneName: $('#loanPlaneName').val(),
			typeloan: $('#typeloan').val(),
			minimumAge: $('#minimumAge').val(),
			maximumAge: $('#maximumAge').val(),
			minloanDuration: $('#minloanDuration').val(),
			mixloanDuration: $('#mixloanDuration').val(),
			emiFrequency: $('#emiFrequency').val(),
			emiType: $('#emiType').val(),
			minimumloanAmount: $('#minimumloanAmount').val(),
			maximumloanAmount: $('#maximumloanAmount').val(),
			rateIntrestType: $('#rateIntrestType').val(),
			typeIntrest: $('#typeIntrest').val(),
			typesecurity: $('#typesecurity').val(),
			feeProcessing: $('#feeProcessing').val(),
			chargesLegal: $('#chargesLegal').val(),
			gst: $('#gst').val(),
			feeInsurence: $('#feeInsurence').val(),
			feeValuation: $('#feeValuation').val(),
			lateAllowanceday: $('#lateAllowanceday').val(),
			modePanalty: $('#modePanalty').val(),
			pennaltyMonthly: $('#pennaltyMonthly').val(),
		};

		$.ajax({
			url: "/api/loanmanegment/saveLoanManagment", // Spring Boot API URL
			type: "POST",          // Can be PUT too if your API uses PUT
			contentType: "application/json",
			data: JSON.stringify(loanData),
			success: function(response) {
				alert("Loan updated successfully!");
				// Optionally, refresh the table or show data
				loadLoanTable(); // You can define this function to reload the updated data
			},
			error: function(xhr, status, error) {
				alert("Update failed: " + error);
			}
		});
	});
});

// table show on data shraddha

function loadLoanTable() {
	alert("hello shraddha");

	$.ajax({
		url: "/api/loanmanegment/allDataFetchLoanSchemCatelog",
		type: "GET", // ✅ Use GET to fetch data
		success: function(response) {
			//alert("data loaded");

			let rows = "";
			// ✅ Check if response has data (in ApiResponse wrapper)
			if (response.success && Array.isArray(response.data)) {
				response.data.forEach(function(loan) {
					rows += `
                        <tr>
                            <td>${loan.id}</td>
                            <td>${loan.loanPlaneName}</td>
                            <td>${loan.typeloan}</td>
                            <td>${loan.minimumAge}</td>
                            <td>${loan.maximumAge}</td>
                            <td>${loan.minloanDuration}</td>
                            <td>${loan.mixloanDuration}</td>
                            <td>${loan.emiFrequency}</td>
                            <td>${loan.emiType}</td>
                           
                            
							<td><button class="iconbutton" onclick="editLoanById(${loan.id})" title="View"><i class="fa-solid fa-pen-to-square text-primary"></i></button></td>
														<td><button class="iconbutton" onclick="deleteLoan(${loan.id})" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
                        </tr>
                    `;
				});
			} else {
				rows = "<tr><td colspan='23'>No data found</td></tr>";
			}

			$("#loanTableBody").html(rows); // ✅ Update tbody only
		},
		error: function() {
			alert("Error fetching data from server");
		}
	});
}

// edit by Id


function editLoanById(id) {
   
	
	
	$.ajax({
	    url: "api/loanmanegment/getLoanByIdEdite",
	    type: "GET",
	    data: { id: id }, // Send ID as query param
	    success: function(response) {
	        if (response.success) {
	            const loan = response.data; // ✅ correct variable name

	            $('#loanId').val(loan.id); // Hidden field for ID
	            $('#loanPlaneName').val(loan.loanPlaneName);
	            $('#typeloan').val(loan.typeloan);
	            $('#minimumAge').val(loan.minimumAge);
	            $('#maximumAge').val(loan.maximumAge);
	            $('#minloanDuration').val(loan.minloanDuration);
	            $('#mixloanDuration').val(loan.mixloanDuration);
	            $('#emiFrequency').val(loan.emiFrequency);
	            $('#emiType').val(loan.emiType);
	            $('#minimumloanAmount').val(loan.minimumloanAmount);
	            $('#maximumloanAmount').val(loan.maximumloanAmount);
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





/*// print 

$(document).ready(function () {
    $('#printBtn').click(function () {
        let printContents = document.getElementById('loanTableWrapper').innerHTML;
        let originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;

        window.print(); // Open print dialog

        document.body.innerHTML = originalContents;
        location.reload(); // Optional: reload to restore functionality
    });
});
*/


//Delete By Id

function deleteLoan(id) {
    if (confirm("Are you sure you want to delete this loan?")) {
        $.ajax({
            url: `/api/loanmanegment/deleteLoanById`,  
            type: 'POST',                               
            data: { id: id },                           
            success: function(response) {
                if (response.success) {
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


