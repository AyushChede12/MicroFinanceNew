function calculateEMI() {
    const roitype = document.getElementById("intrestType").value.trim();
	alert(roitype);
    const loanamount = parseFloat(document.getElementById("loanAmount").value);
	alert(loanamount);
    const interestinyear = parseFloat(document.getElementById("yearlyIntrest").value);
	alert(interestinyear);
    const emicollection = document.getElementById("interestModeCalculater").value;
	alert(emicollection);
    const periods = parseInt(document.getElementById("monthlyTerm").value);
	alert(periods);

    if (!roitype || isNaN(loanamount) || isNaN(interestinyear) || !emicollection || isNaN(periods)) {
        alert("Please fill all fields correctly.");
        return;
    }

    let monthlyRate = 0;
    switch (emicollection) {
        case "Daily": monthlyRate = interestinyear / 365 / 100; break;
        case "Weekly": monthlyRate = interestinyear / 52 / 100; break;
        case "Fortnightly": monthlyRate = interestinyear / 24 / 100; break;
        case "Monthaly": monthlyRate = interestinyear / 12 / 100; break;
        case "halfYearly": monthlyRate = interestinyear / 2 / 100; break;
        default: alert("Invalid Interest Mode"); return;
    }

    let tabledata = '';
    let principal = loanamount;
    let currentDate = new Date();

    if (roitype === "Flat Interest") {
        const totalInterest = loanamount * monthlyRate * periods;
        const totalAmount = loanamount + totalInterest;
        const emi = totalAmount / periods;
        document.getElementById("emi").value = emi.toFixed(2);

        for (let m = 1; m <= periods; m++) {
            let interestComponent = totalInterest / periods;
            let principalComponent = emi - interestComponent;
            let closingPrincipal = principal - emi;
            if (Math.abs(closingPrincipal) <= 0.001) closingPrincipal = 0.00;

            let formattedDate = formatDate(currentDate);
            tabledata += createRow(m, formattedDate, emi, principalComponent, interestComponent, principal, closingPrincipal);
            principal = closingPrincipal;
            incrementDate(currentDate, emicollection);
        }
    } else if (roitype === "Redused Interest") {
        const r = monthlyRate;
        const emi = (loanamount * r * Math.pow(1 + r, periods)) / (Math.pow(1 + r, periods) - 1);
        document.getElementById("emi").value = emi.toFixed(2);

        for (let m = 1; m <= periods; m++) {
            let interestComponent = principal * r;
            let principalComponent = emi - interestComponent;
            let closingPrincipal = principal - principalComponent;
            if (Math.abs(closingPrincipal) < 0.001) closingPrincipal = 0.00;

            let formattedDate = formatDate(currentDate);
            tabledata += createRow(m, formattedDate, emi, principalComponent, interestComponent, principal, closingPrincipal);
            principal = closingPrincipal;
            incrementDate(currentDate, emicollection);
        }
    } else if (roitype === "Rule 78") {
        const totalInterest = loanamount * monthlyRate * periods;
        let sumOfDigits = (periods * (periods + 1)) / 2;
        const totalAmount = loanamount + totalInterest;
        const emi = totalAmount / periods;
        document.getElementById("emi").value = emi.toFixed(2);

        for (let m = 1; m <= periods; m++) {
            let weight = periods - (m - 1);
            let interestComponent = (weight / sumOfDigits) * totalInterest;
            let principalComponent = loanamount / periods;
            let installment = principalComponent + interestComponent;
            let closingPrincipal = principal - installment;
            if (Math.abs(closingPrincipal) < 0.001) closingPrincipal = 0.00;

            let formattedDate = formatDate(currentDate);
            tabledata += createRow(m, formattedDate, installment, principalComponent, interestComponent, principal, closingPrincipal);
            principal = closingPrincipal;
            incrementDate(currentDate, emicollection);
        }
    }

    // Show EMI table (assumes you have a div/table with id="emiTable" and tbody id="tbl_body")
    document.getElementById('emiTable')?.classList.add('show');
    document.getElementById('tbl_body').innerHTML = tabledata;
}

function formatDate(date) {
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const year = date.getFullYear();
    return `${day}-${month}-${year}`;
}

function incrementDate(date, mode) {
    if (mode === "Daily") date.setDate(date.getDate() + 1);
    else if (mode === "Weekly") date.setDate(date.getDate() + 7);
    else if (mode === "Fortnightly") date.setDate(date.getDate() + 14);
    else if (mode === "Monthaly") date.setMonth(date.getMonth() + 1);
    else if (mode === "halfYearly") date.setMonth(date.getMonth() + 6);
}

function createRow(m, date, emi, principal, interest, opening, closing) {
    return `
        <tr>
            <td>${m}</td>
            <td>${date}</td>
            <td>${emi.toFixed(2)}</td>
            <td>${principal.toFixed(2)}</td>
            <td>${interest.toFixed(2)}</td>
            <td>${opening.toFixed(2)}</td>
            <td>${closing.toFixed(2)}</td>
        </tr>`;
}
