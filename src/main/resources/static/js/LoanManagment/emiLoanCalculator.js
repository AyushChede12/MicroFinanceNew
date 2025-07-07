function calculateEMI() {
    const roitype = document.getElementById("intrestType").value;
    const emicollection = document.getElementById("interestModeCalculater").value;
    const interestinyear = parseFloat(document.getElementById("yearlyIntrest").value);
    const loanamount = parseFloat(document.getElementById("loanAmount").value);
    const tensureinyear = parseInt(document.getElementById("monthlyTerm").value);

    let periods = tensureinyear;
    let monthlyRate;

    switch (emicollection) {
        case "Daily":
            monthlyRate = interestinyear / 365 / 100;
            break;
        case "Weekly":
            monthlyRate = interestinyear / 52 / 100;
            break;
        case "Fortnightly":
            monthlyRate = interestinyear / 24 / 100;
            break;
        case "Monthly":
            monthlyRate = interestinyear / 12 / 100;
            break;
        case "Quarterly":
            monthlyRate = interestinyear / 4 / 100;
            break;
    }

    if (roitype === "FlatInterest") {
        const totalInterest = loanamount * monthlyRate * periods;
        const totalAmount = loanamount + totalInterest;
        const emi = totalAmount / periods;

        document.getElementById("emi").value = emi.toFixed(2);

        // 👇 Add amortization table logic here
        let tabledata = '';
        let principal = loanamount;
        const interestAmount = totalInterest;
        const installment = emi;
        let currentDate = new Date();

        for (let m = 1; m <= periods; m++) {
            let interestComponent = (interestAmount / periods);
            let principalComponent = installment - interestComponent;
            let closingPrincipal = principal - installment;

            if (Math.abs(closingPrincipal) <= 0.001) {
                closingPrincipal = 0.00;
            }

            // Format date: DD-MM-YYYY
            let day = currentDate.getDate().toString().padStart(2, '0');
            let month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
            let year = currentDate.getFullYear();
            let formattedDate = `${day}-${month}-${year}`;

            let row = '<tr>';
            row += `<td>${m}</td>`;
            row += `<td>${formattedDate}</td>`;
            row += `<td>${installment.toFixed(2)}</td>`;
            row += `<td>${principalComponent.toFixed(2)}</td>`;
            row += `<td>${interestComponent.toFixed(2)}</td>`;
            row += `<td>${principal.toFixed(2)}</td>`;
            row += `<td>${closingPrincipal.toFixed(2)}</td>`;
            row += '</tr>';

            principal = closingPrincipal;
            tabledata += row;

            // Increment the date based on interest mode
            if (emicollection === "Daily")
                currentDate.setDate(currentDate.getDate() + 1);
            else if (emicollection === "Weekly")
                currentDate.setDate(currentDate.getDate() + 7);
            else if (emicollection === "Fortnightly")
                currentDate.setDate(currentDate.getDate() + 14);
            else if (emicollection === "Monthly")
                currentDate.setMonth(currentDate.getMonth() + 1);
            else if (emicollection === "Quarterly")
                currentDate.setMonth(currentDate.getMonth() + 3);
        }

        document.getElementById('emiTable').className = 'show';
        document.getElementById('tbl_body').innerHTML = tabledata;
    }

    // You can later add similar table logic for "reducinginterest" and "Rule78" if needed
}
