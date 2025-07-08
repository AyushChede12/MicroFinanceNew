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
            typeLoan: $('#typeLoan').val(),
            age: $('#age').val(),    
            loanDuration: $('#loanDuration').val(),
            
            emiType: $('#emiType').val(),
            loanAmount: $('#loanAmount').val(),
			loanMode:$('#loanMode').val(),
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
		alert("hill update alert");
		e.preventDefault();

		var loanData = {
			loanPlaneName: $('#loanPlaneName').val(),
			typeLoan: $('#typeLoan').val(),
			age: $('#age').val(),
			loanDuration: $('#loanDuration').val(),
			emiType: $('#emiType').val(),
			loanAmount: $('#loanAmount').val(),			
			loanMode: $('#loanMode').val(),
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
    console.log("Fetching loan data...");
    alert("Hi Shradha, loading data...");

    $.ajax({
        url: "/api/loanmanegment/allDataFetchLoanSchemCatelog", // API should return JSON
        type: "GET",
        dataType: "json",
        success: function(response) {
            console.log("API response:", response);

            let rows = "";

            // Check if response is successful and contains an array
            if (response.status=="OK") {
                response.data.forEach(function(loan) {
                    rows += `
                        <tr>
                            <td>${loan.id}</td>
                            <td>${loan.loanSchemeCode || "-"}</td>
                            <td>${loan.loanPlaneName || "-"}</td>
                            <td>${loan.typeLoan || "-"}</td>
                            <td>${loan.age || "-"}</td>
                            <td>${loan.loanDuration || "-"}</td>
							<td>${loan.emiType || "-"}</td>
                            <td><button onclick="editLoanById(${loan.id})"><i class="fa fa-edit text-primary"></i></button></td>
                            <td><button onclick="deleteLoan(${loan.id})"><i class="fa fa-trash text-danger"></i></button></td>
                        </tr>
                    `;
                });
            } else {
                rows = "<tr><td colspan='12'>No data found</td></tr>";
            }

            $("#loanTableBody").html(rows);
        },
        error: function(xhr, status, error) {
            console.error("XHR Status:", xhr.status);
            console.error("Error:", error);
            console.error("Response Text:", xhr.responseText);
            alert("Error loading data. See browser console for details.");
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
	        if (response.status==="OK") {
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
                if (response.status=="OK") {
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

function validateAge() {
    const ageInput = document.getElementById("age").value.trim();
    const age = parseInt(ageInput, 10); // parse age to integer
    const messageBox = document.getElementById("message");

    // Clear old message
    messageBox.innerHTML = "";
    messageBox.style.color = "red";
    messageBox.style.fontSize = "12px"; // 👈 Font size reduced here

    // Check for empty or invalid input
    if (ageInput === "" || isNaN(age)) {
        messageBox.innerHTML = "Please enter a valid age.";
        return;
    }

    // Eligibility conditions
    if (age < 18) {
        messageBox.innerHTML = "You are not eligible for loan (below 18).";
    } else if (age > 60) {
        messageBox.innerHTML = "You are not eligible for loan (above 60).";
    } else {
        messageBox.innerHTML = "You are eligible for loan.";
        messageBox.style.color = "green";
    }
}
// duration validation

function validateLoanDuration() {
    const loanType = document.getElementById("typeloan").value;
	alert("loanType");
    const durationInput = document.getElementById("loanDuration").value.trim();
    const duration = parseInt(durationInput, 10);
    const message = document.getElementById("durationMsg");

    message.innerHTML = "";
    message.style.color = "red";
    message.style.fontSize = "12px";

    if (loanType === "") {
        message.innerHTML = "Please select loan type.";
        return false;
    }

    if (durationInput === "" || isNaN(duration)) {
        message.innerHTML = "Please enter loan duration.";
        return false;
    }

    // Define limits based on loan type
    let min = 1;
    let max = 30;

    if (loanType === "personal") {
        max = 5;
    } else if (loanType === "home") {
        max = 30;
    } else if (loanType === "gold") {
        max = 2;
    }

    // Validation
    if (duration < min) {
        message.innerHTML = `Loan duration must be at least ${min} year.`;
        return false;
    }

    if (duration > max) {
        message.innerHTML = `Loan duration cannot exceed ${max} years for ${loanType} loan.`;
        return false;
    }

    message.innerHTML = "Valid loan duration.";
    message.style.color = "green";
    return true;
}
