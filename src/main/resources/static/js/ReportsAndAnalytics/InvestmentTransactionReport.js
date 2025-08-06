$(document).ready(function () {
	let allPolicies = [];

	// ✅ 1. Fetch all approved policies on page load
	$.ajax({
		url: "api/Policymangment/getApprovedPolicies",
		method: "GET",
		success: function (response) {
			console.log("API Response:", response);

			if (response && response.data && Array.isArray(response.data)) {
				allPolicies = response.data;

				// ✅ Fill branch dropdown
				let branches = new Set();
				allPolicies.forEach(policy => {
					if (policy.branchName) branches.add(policy.branchName);
				});
				branches.forEach(branch => {
					$('#branchName1').append(`<option value="${branch}">${branch}</option>`);
				});

				// ✅ Render full table initially
				renderTable(allPolicies);
			} else {
				$(".datatable tbody").html("<tr><td colspan='10'>No approved policies found.</td></tr>");
			}
		},
		error: function () {
			alert("Error while fetching data.");
		}
	});

	// ✅ 2. Filter on Find button click
	$('#findBtn').click(function (e) {
		e.preventDefault();

		const selectedBranch = $('#branchName1').val();
		const fromDate = $('#fromDate').val();
		const toDate = $('#toDate').val();

		if (!fromDate || !toDate) {
			alert("Please select both From and To dates.");
			return;
		}

		const filtered = allPolicies.filter(policy => {
			const policyDate = policy.policyStartDate;
			return (
				(!selectedBranch || policy.branchName === selectedBranch) &&
				policyDate >= fromDate &&
				policyDate <= toDate
			);
		});

		renderTable(filtered);
	});

	// ✅ 3. Render the table with print popup button
	function renderTable(data) {
		let tableBody = $(".datatable tbody");
		tableBody.empty();

		if (!data.length) {
			tableBody.append("<tr><td colspan='10'>No matching policies found.</td></tr>");
			return;
		}

		data.forEach((policy, index) => {
			let row = `
				<tr>
					<td>${index + 1}</td>
					<td>${policy.policyCode || ''}</td>
					<td>${policy.customerName || ''}</td>
					<td>${policy.schemeType || ''}</td>
					<td>${policy.policyStartDate || ''}</td>
					<td>${policy.policyAmount || ''}</td>
					<td>${policy.contactNo || ''}</td>
					<td>${policy.branchName || ''}</td>
					<td>${policy.approved ? 'Yes' : 'No'}</td>
					<td>
						<button class="iconbutton printPopupBtn" data-id="${policy.id}" data-bs-toggle="modal" data-bs-target="#printModal">
							<i class="bi bi-printer" style="color: green;"></i>
						</button>
					</td>
				</tr>
			`;
			tableBody.append(row);
		});

		// ✅ Bind print popup button
		$(".printPopupBtn").click(function () {
			const id = $(this).data("id");
			const selectedPolicy = allPolicies.find(p => p.id === id);

			if (selectedPolicy) {
				let html = `
					<h4 class="text-center mb-4">Investment Policy Full Details</h4>
					<div class="row">
						${createField("Policy Code", selectedPolicy.policyCode)}
						${createField("Policy Start Date", selectedPolicy.policyStartDate)}
						${createField("Member Selection", selectedPolicy.memberSelection)}
						${createField("Customer Name", selectedPolicy.customerName)}
						${createField("Date of Birth", selectedPolicy.dateofBirth)}
						${createField("Relation Details", selectedPolicy.relationDetails)}
						${createField("Contact No", selectedPolicy.contactNo)}
						${createField("Suggested Nominee", selectedPolicy.suggestedNominee)}
						${createField("Age of Nominee", selectedPolicy.ageOfNominee)}
						${createField("Relation", selectedPolicy.relation)}
						${createField("Address", selectedPolicy.address)}
						${createField("District", selectedPolicy.district)}
						${createField("State", selectedPolicy.state)}
						${createField("Pin Code", selectedPolicy.pinCode)}
						${createField("TDS", selectedPolicy.tds)}
						${createField("Branch Name", selectedPolicy.branchName)}
						${createField("Mode Of Operation", selectedPolicy.modeOfOperation)}
						${createField("Joint Mem Code", selectedPolicy.jointMemCode)}
						${createField("Joint Name", selectedPolicy.jointName)}
						${createField("Maturity Date", selectedPolicy.maturityDate)}
						${createField("Scheme Type", selectedPolicy.schemeType)}
						${createField("Scheme Term", selectedPolicy.schemeTerm)}
						${createField("Scheme Mode", selectedPolicy.schemeMode)}
						${createField("ROI", selectedPolicy.roi)}
						${createField("Policy Amount", selectedPolicy.policyAmount)}
						${createField("Deposit Amount", selectedPolicy.depositAmount)}
						${createField("Intro M Code", selectedPolicy.introMCode)}
						${createField("Maturity Amount", selectedPolicy.maturityAmount)}
						${createField("MIS Interest", selectedPolicy.mISInterest)}
						${createField("Payment By", selectedPolicy.paymentBy)}
						${createField("Scheme Code", selectedPolicy.schemeCode)}
						${createField("Scheme Name", selectedPolicy.schemeName)}
						${createField("Remark", selectedPolicy.remark)}
						${createField("Agent", selectedPolicy.agent)}
						${createField("SMS Sent", selectedPolicy.smsSend)}
						${createField("Approved", selectedPolicy.approved ? "Yes" : "No")}
						${createField("Paid Amount", selectedPolicy.paidAmount)}
						${createField("Amount Due", selectedPolicy.amountDue)}
						${createField("Last Installment Paid", selectedPolicy.lastInstPaid)}
						${createField("Last Payment Date", selectedPolicy.lastPaymentDate)}
						${createField("Due Date", selectedPolicy.dueDate)}
						${createField("No. of Installments", selectedPolicy.noOfInstallments)}
						${createField("Mode of Payment", selectedPolicy.modeOfPayment)}
					</div>
				`;

				$("#modalDataContainer").html(html);
			}

			// Helper function
			function createField(label, value) {
				return `
					<div class="col-md-6 mb-3">
						<strong>${label}:</strong> <span>${value || ''}</span>
					</div>
				`;
			}
		});


	}

	// ✅ Print the modal content
	$("#printBtn").click(function () {
		const content = document.getElementById("modalDataContainer").innerHTML;
		const printWindow = window.open('', '', 'width=900,height=700');

		printWindow.document.write(`
			<html>
			<head>
				<title>Print</title>
				<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
				<style>
					body {
						font-family: Arial, sans-serif;
						padding: 30px;
						color: #000;
						background: #fff;
					}
					.print-container {
						width: 100%;
						margin: auto;
					}
					.heading {
						text-align: center;
						margin-bottom: 30px;
						font-size: 24px;
						font-weight: bold;
						border-bottom: 2px solid #000;
						padding-bottom: 10px;
					}
					.row {
						display: flex;
						flex-wrap: wrap;
						margin-bottom: 0;
					}
					.col-md-6 {
						width: 50%;
						padding: 10px 15px;
						box-sizing: border-box;
					}
					.field {
						margin-bottom: 15px;
					}
					.label {
						font-weight: bold;
						display: block;
						color: #333;
						margin-bottom: 4px;
					}
					.value {
						display: block;
						border: 1px solid #ccc;
						padding: 8px;
						background: #f9f9f9;
						border-radius: 4px;
					}
				</style>
			</head>
			<body>
				<div class="print-container">
					<div class="heading">Investment Policy Full Details</div>
					${content}
				</div>
			</body>
			</html>
		`);

		printWindow.document.close();
		printWindow.focus();
		printWindow.print();
		printWindow.close();
	});




	// ✅ Download content as .txt
	$("#downloadBtn").click(function () {
	    const { jsPDF } = window.jspdf;

	    const doc = new jsPDF({
	        orientation: "portrait",
	        unit: "pt",
	        format: "a4"
	    });

	    const content = document.getElementById("modalDataContainer");

	    doc.html(content, {
	        callback: function (doc) {
	            doc.save("PolicyDetails.pdf"); // 🔒 Saves as valid PDF
	        },
	        x: 10,
	        y: 10,
	        autoPaging: 'text',
	        html2canvas: {
	            scale: 0.5 // reduce to avoid cropping
	        }
	    });
	});

});
