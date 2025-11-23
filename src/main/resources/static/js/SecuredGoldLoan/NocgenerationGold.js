$(document).ready(function() {

	$.ajax({
		url: 'api/securedGoldLoan/getchAllApprovedGoldCustomer',
		type: 'GET',
		success: function(response) {
			// Check data
			if (!(response && response.data && Array.isArray(response.data))) {
				alert("No Gold Data found.");
				return;
			}

			// 👉 Step 1: Distinct Set banaye
			let distinctMap = new Map();
			// Map use kiya taaki GoldID ke hisab se latest/first customerName bhi mil jaye

			response.data.forEach(function(item) {
				let goldId = item.goldID || item.goldId;
				if (goldId && goldId.trim() !== "") {
					distinctMap.set(goldId.trim(), item.customerName);
				}
			});

			// 👉 Step 2: Select2 ke liye data convert
			let goldOptions = [];
			distinctMap.forEach((customerName, goldId) => {
				goldOptions.push({
					id: goldId,
					text: goldId + " - " + customerName
				});
			});

			// 👉 Step 3: Select2 Initialize (distinct data)
			$('#findByGoldLoanId').select2({
				placeholder: '-- Search Gold ID --',
				data: goldOptions,
				matcher: function(params, data) {
					if ($.trim(params.term) === '') return data;
					if (typeof data.text === 'undefined') return null;

					const term = params.term.toLowerCase();
					const text = data.text.toLowerCase();
					return text.includes(term) ? data : null;
				}
			});
		},
		error: function(xhr, status, error) {
			console.error("Error fetching Gold Data:", error);
			alert("Failed to load Gold ID.");
		}
	});
	
	$("#generateNoc").click(function(e) {
			e.preventDefault();

			const goldId = $("#findByGoldLoanId").val();

			if (!goldId) {
				alert("Please select a Gold ID");
				return;
			}

			$.ajax({
				url: "api/loanmanegment/getLoanClosuresByLoanId",
				method: "GET",
				data: { loanId: loanId },
				success: function(result) {
					if (result && result.data && result.data.length > 0) {
						const loanData = result.data[0]; // if data is an array
		let content = `
	    <div style="padding:30px; font-family:'Times New Roman', serif; border:2px solid #000; background:#fff; line-height:1.6;">
	        <h2 style="text-align:center; margin:0; color:#FFA500;">Microfinance Cooperative Bank Ltd.</h2>
	        <h4 style="text-align:center; margin:0;">Branch: ${loanData.branchName || "-"}</h4>
	        <h3 style="text-align:center; margin:15px 0; text-decoration:underline;">No Objection Certificate (NOC)</h3>

	        <p>Date: <b>${loanData.closureDate || new Date().toLocaleDateString()}</b></p>

	        <p>To,<br>
	           <b>${loanData.memberName || "-"}</b><br>
	           ${loanData.address || "-"}<br>
	           Contact: ${loanData.contactNo || "-"}
	        </p>

	        <p>Subject: <b>No Objection Certificate for Loan Closure</b></p>

	        <p>Dear <b>${loanData.memberName || "-"}</b>,</p>

	        <p>This is to certify that you had availed a loan from <b>Microfinance Cooperative Bank Ltd.</b> For the Loan Plan <b>${loanData.loanPlanName}</b>, 
	        under Loan Reference Number <b>${loanData.loanId}</b>, sanctioned on <b>${loanData.loanDate || "-"}</b> 
	        for an amount of <b>${loanData.loanAmount || "-"}</b>.</p>

	        <p>We hereby confirm that you have successfully repaid the entire loan amount along with all 
	        applicable interest and charges. Your loan account has been duly closed on <b>${loanData.closureDate || "-"}</b>, 
	        and as of this date, there are no outstanding dues payable to the bank under the said loan account.</p>

	        <p>Accordingly, we hereby issue this <b>No Objection Certificate (NOC)</b> to declare that 
	        <b>${loanData.memberName || "-"}</b> is released from all liabilities and obligations related 
	        to the above-mentioned loan account. The bank has no objection if you choose to avail financial 
	        facilities from any other institution in the future.</p>

	        <p style="margin-bottom:40px;">We thank you for your association with <b>Microfinance Cooperative Bank Ltd.</b> and look forward 
	        to serving you again.</p>

	        <p style="text-align:right; margin-top:20px;">
	            Authorized Signatory<br>
	            <b>Microfinance Cooperative Bank Ltd.</b>
	        </p>
	    </div>
	`;


						$("#receiptArea").html(content);

						// Show the print button after generating document
						document.getElementById("printBtn").style.display = "inline-block";
					} else {
						alert("No data found for this loan ID.");
					}
				},
				error: function(err) {
					console.error(err);
					alert("Error fetching loan data");
				}
			});
		});

});

//Js for printing the loan document(Vaibhav)
function printDocument() {

	var content = document.getElementById("receiptArea").innerHTML;

	var printWindow = window.open("", "", "height=700,width=900");
	printWindow.document.write("<html><head><title>Print Document</title>");
	printWindow.document.write("</head><body >");
	printWindow.document.write(content);
	printWindow.document.write("</body></html>");
	printWindow.document.close();

	printWindow.print();
}