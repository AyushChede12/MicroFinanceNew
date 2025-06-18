/**
 * 
 */

// data save shraddha
$(document).ready(function () {
    $('#saveBtn').on('click', function (e) {
		alert("shraddha");
        e.preventDefault(); // Prevent form from submitting normally

        // Create JSON object from form fields
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

        // AJAX POST request
        $.ajax({
            url: '/saveLoanManagment',   
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(loanData),
            success: function (response) {
                console.log('Success:', response);
                alert("Loan Saved Successfully");
				
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
                alert("Something went wrong!");
            }
        });
    });
});

// update code sharddha

$(document).ready(function () {
    $("#updateBtn").click(function (e) {
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
            url: "/saveLoanManagment", // Spring Boot API URL
            type: "POST",          // Can be PUT too if your API uses PUT
            contentType: "application/json",
            data: JSON.stringify(loanData),
            success: function (response) {
                alert("Loan updated successfully!");
                // Optionally, refresh the table or show data
                loadLoanTable(); // You can define this function to reload the updated data
            },
            error: function (xhr, status, error) {
                alert("Update failed: " + error);
            }
        });
    });
});

// table show on data shraddha

function loadLoanTable() {
	alert("hello shraddha")
    $.ajax({
        url: "/saveLoanManagment", // API to get all loans
        method: "POST",
        success: function (data) {
            let rows = "";
            data.forEach(function (loan) {
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
						<td>${loan.minimumloanAmount}</td>
						<td>${loan.maximumloanAmount}</td>
						<td>${loan.rateIntrestType}</td>
						<td>${loan.typeIntrest}</td>
						<td>${loan.typesecurity}</td>
						<td>${loan.feeProcessing}</td>
						<td>${loan.chargesLegal}</td>
						<td>${loan.gst}</td>
						<td>${loan.feeInsurence}</td>
						<td>${loan.feeValuation}</td>
						<td>${loan.lateAllowanceday}</td>
						<td>${loan.modePanalty}</td>
						<td>${loan.pennaltyMonthly}</td>	
                        <td>
                            <button onclick='editLoan(${JSON.stringify(loan)})'>Edit</button>
                            <button onclick='deleteLoan(${loan.id})'>Delete</button>
                        </td>
                    </tr>
                `;
            });
            $("#loanTable").html(rows);
        }
    });
}
// print 
/*

    function printPage() {
        window.print();
    }

*/


$(document).ready(function () {
   
    
	printTableOnly();
    // Print button click
    $("#printBtn").on("click", function () {
       alert("hii");
	   
	   function printTableOnly() {
	       var printContents = document.getElementById("loanTable").outerHTML;
	       var originalContents = document.body.innerHTML;

	       document.body.innerHTML = printContents;
	       window.print();
	       document.body.innerHTML = originalContents;
	       location.reload();
	   }
    });
});