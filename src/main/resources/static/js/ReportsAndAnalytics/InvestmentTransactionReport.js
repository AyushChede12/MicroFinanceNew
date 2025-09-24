$(document).ready(function() {
	let allPolicies = [];

	// ✅ 1. Fetch all approved policies on page load
	$.ajax({
		url: "api/Policymangment/getApprovedPolicies",
		method: "GET",
		success: function(response) {
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
		error: function() {
			alert("Error while fetching data.");
		}
	});

	// ✅ 2. Filter on Find button click
	$('#findBtn').click(function(e) {
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

		$(".printPopupBtn").click(function() {
			const id = $(this).data("id");
			const selectedPolicy = allPolicies.find(p => p.id === id);

			if (selectedPolicy) {
				let html = `
					<div class="report-container">
						<h3 class="text-center report-title">Investment Policy Report</h3>
						<hr>
						<!-- Customer Info -->
						<h5 class="section-title">Customer Information</h5>
						<table class="table table-bordered table-sm">
							<tr><th>Customer Name</th><td>${selectedPolicy.customerName || ''}</td></tr>
							<tr><th>Date of Birth</th><td>${selectedPolicy.dateofBirth || ''}</td></tr>
							<tr><th>Relation Details</th><td>${selectedPolicy.relationDetails || ''}</td></tr>
							<tr><th>Contact No</th><td>${selectedPolicy.contactNo || ''}</td></tr>
							<tr><th>Address</th><td>${selectedPolicy.address || ''}, ${selectedPolicy.district || ''}, ${selectedPolicy.state || ''} - ${selectedPolicy.pinCode || ''}</td></tr>
							<tr><th>Suggested Nominee</th><td>${selectedPolicy.suggestedNominee || ''} (Age: ${selectedPolicy.ageOfNominee || ''}, Relation: ${selectedPolicy.relation || ''})</td></tr>
						</table>

						<!-- Policy Info -->
						<h5 class="section-title">Policy Information</h5>
						<table class="table table-bordered table-sm">
							<tr><th>Policy Code</th><td>${selectedPolicy.policyCode || ''}</td></tr>
							<tr><th>Policy Start Date</th><td>${selectedPolicy.policyStartDate || ''}</td></tr>
							<tr><th>Branch Name</th><td>${selectedPolicy.branchName || ''}</td></tr>
							<tr><th>Scheme Name</th><td>${selectedPolicy.schemeName || ''}</td></tr>
							<tr><th>Scheme Type</th><td>${selectedPolicy.schemeType || ''}</td></tr>
							<tr><th>Scheme Term</th><td>${selectedPolicy.schemeTerm || ''}</td></tr>
							<tr><th>Scheme Mode</th><td>${selectedPolicy.schemeMode || ''}</td></tr>
							<tr><th>ROI</th><td>${selectedPolicy.roi || ''}%</td></tr>
							<tr><th>Maturity Date</th><td>${selectedPolicy.maturityDate || ''}</td></tr>
							<tr><th>Maturity Amount</th><td>${selectedPolicy.maturityAmount || ''}</td></tr>
						</table>

						<!-- Payment Info -->
						<h5 class="section-title">Payment Information</h5>
						<table class="table table-bordered table-sm">
							<tr><th>Policy Amount</th><td>${selectedPolicy.policyAmount || ''}</td></tr>
							<tr><th>Deposit Amount</th><td>${selectedPolicy.depositAmount || ''}</td></tr>
							<tr><th>Paid Amount</th><td>${selectedPolicy.paidAmount || ''}</td></tr>
							<tr><th>Amount Due</th><td>${selectedPolicy.amountDue || ''}</td></tr>
							<tr><th>Last Installment Paid</th><td>${selectedPolicy.lastInstPaid || ''}</td></tr>
							<tr><th>Last Payment Date</th><td>${selectedPolicy.lastPaymentDate || ''}</td></tr>
							<tr><th>Due Date</th><td>${selectedPolicy.dueDate || ''}</td></tr>
							<tr><th>No. of Installments</th><td>${selectedPolicy.noOfInstallments || ''}</td></tr>
							<tr><th>Mode of Payment</th><td>${selectedPolicy.modeOfPayment || ''}</td></tr>
							<tr><th>Payment By</th><td>${selectedPolicy.paymentBy || ''}</td></tr>
						</table>

						<!-- Other Info -->
						<h5 class="section-title">Additional Details</h5>
						<table class="table table-bordered table-sm">
							<tr><th>Joint Member</th><td>${selectedPolicy.jointName || ''} (${selectedPolicy.jointMemCode || ''})</td></tr>
							<tr><th>Introducer Code</th><td>${selectedPolicy.introMCode || ''}</td></tr>
							<tr><th>Agent</th><td>${selectedPolicy.agent || ''}</td></tr>
							<tr><th>SMS Sent</th><td>${selectedPolicy.smsSend || ''}</td></tr>
							<tr><th>Approved</th><td>${selectedPolicy.approved ? "Yes" : "No"}</td></tr>
							<tr><th>Remark</th><td>${selectedPolicy.remark || ''}</td></tr>
						</table>
					</div>
				`;

				$("#modalDataContainer").html(html);
			}
		});

		// ✅ Print Function
		$("#printBtn").click(function() {
			const content = document.getElementById("modalDataContainer").innerHTML;
			const printWindow = window.open('', '', 'width=900,height=700');

			printWindow.document.write(`
				<html>
				<head>
					<title>Investment Policy Report</title>
					<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
					<style>
						body { font-family: Arial, sans-serif; padding: 20px; }
						.report-title { font-size: 22px; text-align: center; font-weight: bold; margin-bottom: 20px; }
						.section-title { font-size: 16px; margin-top: 20px; font-weight: bold; }
						table { width: 100%; border-collapse: collapse; }
						th { background: #f0f0f0; width: 30%; }
						th, td { padding: 8px; border: 1px solid #ddd; font-size: 13px; }
					</style>
				</head>
				<body>
					${content}
				</body>
				</html>
			`);

			printWindow.document.close();
			printWindow.focus();
			printWindow.print();
			printWindow.close();
		});

		// ✅ Download as PDF
		$("#downloadBtn").click(function() {
			const { jsPDF } = window.jspdf;

			const doc = new jsPDF({
				orientation: "portrait",
				unit: "pt",
				format: "a4"
			});

			const content = document.getElementById("modalDataContainer");

			doc.html(content, {
				callback: function(doc) {
					doc.save("InvestmentPolicyReport.pdf");
				},
				x: 20,
				y: 20,
				autoPaging: 'text',
				html2canvas: { scale: 0.7 }
			});
		});
	} // ✅ closes renderTable

}); // ✅ closes document.ready


