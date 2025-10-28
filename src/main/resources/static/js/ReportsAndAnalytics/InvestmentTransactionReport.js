$(document).ready(function() {
    let allPolicies = [];

    // ✅ 1. Fetch all approved policies on page load
    $.ajax({
        url: "api/Policymangment/getApprovedPolicies",
        method: "GET",
        success: function(response) {
            if (response && response.data && Array.isArray(response.data)) {
                allPolicies = response.data;

                // Fill branch dropdown
                let branches = new Set();
                allPolicies.forEach(policy => {
                    if (policy.branchName) branches.add(policy.branchName);
                });
                branches.forEach(branch => {
                    $('#branchName1').append(`<option value="${branch}">${branch}</option>`);
                });

                // Render table initially
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

    // ✅ 3. Render the table
    function renderTable(data) {
        let tableBody = $(".datatable tbody");
        tableBody.empty();

        if (!data.length) {
            tableBody.append("<tr><td colspan='10'>No matching policies found.</td></tr>");
            return;
        }

        data.forEach((policy, index) => {
            tableBody.append(`
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
                        <!-- Bank Report Button -->
                        <button class="btn btn-outline-success btn-sm bankReportBtn no-bg" data-id="${policy.id}" data-bs-toggle="modal" data-bs-target="#bankReportModal" title="Bank Report">
                            <i class="bi bi-printer" style="color: green;"></i>
                        </button>
                    </td>
                </tr>
            `);
        });

        // ✅ Policy Report Modal
        $(".printPolicyBtn").click(function() {
            const id = $(this).data("id");
            const policy = allPolicies.find(p => p.id === id);
            if (!policy) return;

            const html = `
                <div class="report-container">
                    <h3 class="text-center">Investment Policy Report</h3>
                    <hr>

                    <h5 class="section-title">Customer Information</h5>
                    <table class="table table-bordered table-sm">
                        <tr><th>Customer Name</th><td>${policy.customerName || ''}</td></tr>
                        <tr><th>Contact No</th><td>${policy.contactNo || ''}</td></tr>
                        <tr><th>Address</th><td>${policy.address || ''}</td></tr>
                        <tr><th>Nominee</th><td>${policy.suggestedNominee || ''}</td></tr>
                    </table>

                    <h5 class="section-title">Policy Information</h5>
                    <table class="table table-bordered table-sm">
                        <tr><th>Policy Code</th><td>${policy.policyCode || ''}</td></tr>
                        <tr><th>Start Date</th><td>${policy.policyStartDate || ''}</td></tr>
                        <tr><th>Branch Name</th><td>${policy.branchName || ''}</td></tr>
                        <tr><th>Scheme Name</th><td>${policy.schemeName || ''}</td></tr>
                        <tr><th>Policy Amount</th><td>₹ ${policy.policyAmount || 0}</td></tr>
                        <tr><th>Maturity Amount</th><td>₹ ${policy.maturityAmount || 0}</td></tr>
                    </table>

                    <h5 class="section-title">Payment Information</h5>
                    <table class="table table-bordered table-sm">
                        <tr><th>Paid Amount</th><td>₹ ${policy.paidAmount || 0}</td></tr>
                        <tr><th>Amount Due</th><td>₹ ${policy.amountDue || 0}</td></tr>
                        <tr><th>Installments Paid</th><td>${policy.installmentsPaid || 0}</td></tr>
                    </table>

                    <div class="signature-section" style="text-align:right;">
                        <hr style="width:200px; border-top:2px solid #000;">
                        <p>Authorized Signature</p>
                    </div>
                </div>
            `;

            $("#modalDataContainer").html(html);
        });

        // ✅ Bank Report Modal
        $(".bankReportBtn").click(function() {
            const id = $(this).data("id");
            const policy = allPolicies.find(p => p.id === id);
            if (!policy) return;

            const html = `
                <h2>Microfinance Services</h2>
                <h3>Investment Transaction Report</h3>
                <hr>
                <div class="report-section">
                    <table class="table table-bordered table-sm">
                        <tr><th>Branch Name</th><td>${policy.branchName}</td></tr>
                        <tr><th>Start Date</th><td>${policy.policyStartDate}</td></tr>
                        <tr><th>Policy Code</th><td>${policy.policyCode}</td></tr>
                        <tr><th>Customer Code</th><td>${policy.memberSelection}</td></tr>
                        <tr><th>Customer Name</th><td>${policy.customerName}</td></tr>
                        <tr><th>Contact No</th><td>${policy.contactNo}</td></tr>
                        <tr><th>Policy Type</th><td>${policy.schemeType}</td></tr>
                        <tr><th>Policy Term</th><td>${policy.schemeTerm}</td></tr>
                        <tr><th>Approved</th><td>${policy.approved ? 'Yes' : 'No'}</td></tr>
                    </table>
                </div>

                <div class="report-section">
                    <table class="table table-bordered table-sm">
                        <tr><th>Policy Amount</th><td class="amount">${policy.policyAmount}</td></tr>
                        <tr><th>Total Deposit</th><td class="amount">${policy.depositAmount}</td></tr>
                        <tr><th>Payment Due</th><td class="amount">${policy.amountDue}</td></tr>
                        <tr><th>Maturity Amount</th><td class="amount">${policy.maturityAmount}</td></tr>
                        <tr><th>Maturity Date</th><td>${policy.maturityDate}</td></tr>
                        <tr><th>No. of Installments Paid</th><td>${policy.noOfInstallments}</td></tr>
                    </table>
                </div>

                <div class="signature-section" style="text-align:right; margin-top:20px;">
                    <hr style="width:200px; border-top:2px solid #000;">
                    <p>Authorized Signature</p>
                </div>
            `;

            $('#bankReportContent').html(html);
        });
    }

    // ✅ Print & PDF Functions

    $("#printBtn").click(function() {
        const content = document.getElementById("modalDataContainer").innerHTML;
        const printWindow = window.open('', '', 'width=900,height=700');
        printWindow.document.write(`
            <html>
            <head>
                <title>Policy Report</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <style>body{font-family:Arial,sans-serif;padding:20px;} table{width:100%;border-collapse:collapse;} th,td{padding:6px 10px;border:1px solid #ddd;} th{background:#f2f2f2;} </style>
            </head>
            <body>${content}</body>
            </html>
        `);
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
    });

    $("#downloadBtn").click(function() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF('p', 'pt', 'a4');
        doc.html(document.getElementById("modalDataContainer"), {
            callback: function(pdf) { pdf.save("Policy_Report.pdf"); },
            x: 20, y: 20, html2canvas: { scale: 0.7 }
        });
    });

    $('#printBankReportBtn').click(function() {
        const content = document.getElementById('bankReportContent').innerHTML;
        const printWindow = window.open('', '', 'width=900,height=700');
        printWindow.document.write('<html><head><title>Print</title><style>body{font-family:Arial,sans-serif;padding:20px;} table{width:100%;border-collapse:collapse;} th, td{padding:6px 10px;border:1px solid #ddd;} th{background:#f2f2f2;} td.amount{text-align:right;} hr{border-top:2px solid #000;}</style></head><body>');
        printWindow.document.write(content);
        printWindow.document.write('</body></html>');
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();
    });

    $('#pdfBankReportBtn').click(function() {
        const element = document.getElementById('bankReportContent');
        html2pdf().set({ margin: 10, filename: 'TransactionReport.pdf', html2canvas: { scale: 2 } }).from(element).save();
    });
});
