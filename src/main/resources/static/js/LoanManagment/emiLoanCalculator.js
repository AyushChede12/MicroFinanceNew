/*function calculateEMI() {
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

			if (Math.abs(closingPrincipal) <= 0.001 || closingPrincipal < 0) {
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
			// row += `<td>${principal.toFixed(2)}</td>`;
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

		document.getElementsByClassName('datatable').className = 'show';
		document.getElementById('tbody').innerHTML = tabledata;
	} else
		if (roitype == "reducinginterest") {
			// Reducing balance method 
			const r = monthlyRate;
			const emi = (loanamount * r * Math.pow(1 + r, periods)) / (Math.pow(1 + r, periods) - 1);

			//alert(Reduce Balance EMI: ${emi.toFixed(2)}); 
			document.getElementById("emi").value = emi.toFixed(2);

			var tabledata = '';
			var principal = loanamount;
			const installment = emi;
			var currentDate = new Date();  // Get current date

			for (let m = 1; m <= periods; m++) {
				let interestComponent = principal * r;
				let principalComponent = emi - interestComponent;
				let closingPrincipal = principal - principalComponent;

				if (Math.abs(closingPrincipal) <= 0.001 || closingPrincipal < 0) {
							        closingPrincipal = 0.00;
							    }

				// Format the current date (you can modify the format as needed)
				// var formattedDate = currentDate.toISOString().split('T')[0]; // Format as YYYY-MM-DD 

				// Get day, month, and year
				var day = currentDate.getDate().toString().padStart(2, '0');  // Add leading 0 for single digit days
				var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');  // Add leading 0 for single digit months
				var year = currentDate.getFullYear();

				// Format date as DD-MM-YYYY
				var formattedDate = day + '-' + month + '-' + year;

				var row = '<tr>';
				row += '<td>' + m + '</td>';
				row += '<td>' + formattedDate + '</td>'; // Add current date to the table
				row += '<td>' + installment.toFixed(2) + '</td>';
				row += '<td>' + principalComponent.toFixed(2) + '</td>';
				row += '<td>' + interestComponent.toFixed(2) + '</td>';
				//row += '<td>' + principal.toFixed(2) + '</td>';
				row += '<td>' + closingPrincipal.toFixed(2) + '</td>';
				row += '</tr>';

				principal = closingPrincipal;
				tabledata += row;

				// Increment the date by one month for each iteration (optional, if you want each payment to be shown on different dates)
				if (emicollection == "Daily")
					currentDate.setDate(currentDate.getDate() + 1);
				else if (emicollection == "Weekly")
					currentDate.setDate(currentDate.getDate() + 7);
				else if (emicollection == "Fortnightly")
					currentDate.setDate(currentDate.getDate() + 14);
				else if (emicollection == "Monthly")
					currentDate.setMonth(currentDate.getMonth() + 1);
				else if (emicollection == "Quarterly")
					currentDate.setMonth(currentDate.getMonth() + 3);
			}

			document.getElementsByClassName('datatable').className = 'show';
			document.getElementById('tbody').innerHTML = tabledata;


		} else
			if (roitype == "Rule78") {
				// Calculate total interest using the flat interest method
				//const totalInterest = loanamount * (interestinyear / 100) * monthlyRate;
				const totalInterest = loanamount * monthlyRate * periods;

				// Calculate sum of digits (Rule of 78)
				let sumOfDigits = 0;
				for (let i = 1; i <= periods; i++) {
					sumOfDigits += i;

				}

				// Calculate interest for each period
				let interestPerPeriod = [];
				for (let i = periods; i >= 1; i--) {
					interestPerPeriod.push((i / sumOfDigits) * totalInterest);
				}

				// Calculate total amount to be repaid
				const totalAmount = loanamount + totalInterest;


				// Calculate EMI
				const emi = totalAmount / periods;

				// Display the EMI result
				//alert(Rule of 78 EMI: ${emi.toFixed(2)}); 
				document.getElementById("emi").value = emi.toFixed(2);

				// Initialize variables for table data
				let tabledata = "";
				let principal = loanamount;
				var currentDate = new Date();  // Get current date

				// Generate amortization table using Rule of 78
				for (let m = 1; m <= periods; m++) {
					let weight = periods - (m - 1);
					let interestComponent = interestPerPeriod[m - 1]; // Get precomputed interest component
					let principalComponent = principal / periods;   //emi - interestComponent;
					let installment = principalComponent + interestComponent;
					let closingPrincipal = principal - principalComponent;

					// Handle rounding errors
					if (Math.abs(closingPrincipal) <= 0.001 || closingPrincipal < 0) {
								        closingPrincipal = 0.00;
								    }

					// Get day, month, and year
					var day = currentDate.getDate().toString().padStart(2, '0');  // Add leading 0 for single digit days
					var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');  // Add leading 0 for single digit months
					var year = currentDate.getFullYear();

					// Format date as DD-MM-YYYY
					var formattedDate = day + '-' + month + '-' + year;

					// Construct table row
					var row = '<tr>';
					row += '<td>' + m + '</td>';
					row += '<td>' + formattedDate + '</td>'; // Add current date to the table
					row += '<td>' + installment.toFixed(2) + '</td>';
					row += '<td>' + principalComponent.toFixed(2) + '</td>';
					row += '<td>' + interestComponent.toFixed(2) + '</td>';
					//row += '<td>' + principal.toFixed(2) + '</td>';
					row += '<td>' + closingPrincipal.toFixed(2) + '</td>';
					row += '</tr>';

					//principal = closingPrincipal;
					tabledata += row;

					// Increment the date by one month for each iteration (optional, if you want each payment to be shown on different dates)
					if (emicollection == "Daily")
						currentDate.setDate(currentDate.getDate() + 1);
					else if (emicollection == "Weekly")
						currentDate.setDate(currentDate.getDate() + 7);
					else if (emicollection == "Fortnightly")
						currentDate.setDate(currentDate.getDate() + 14);
					else if (emicollection == "Monthly")
						currentDate.setMonth(currentDate.getMonth() + 1);
					else if (emicollection == "Quarterly")
						currentDate.setMonth(currentDate.getMonth() + 3);
				}

				// Append the constructed table rows to  the HTML table
				document.getElementsByClassName('datatable').className = 'show';
				document.getElementById('tbody').innerHTML = tabledata;

			}


}*/

function calculateEMI() {
  const roitype = document.getElementById("intrestType").value;
  const emicollection = document.getElementById("interestModeCalculater").value;
  const interestinyear = parseFloat(document.getElementById("yearlyIntrest").value);
  const loanamount = parseFloat(document.getElementById("loanAmount").value);
  const tensure = parseInt(document.getElementById("monthlyTerm").value);

  const periods = tensure; // ✅ ALWAYS use entered term — no conversion!
  let periodicRate;

  // ✅ Only adjust the rate — periods stays fixed
  switch (emicollection) {
    case "Daily":
      periodicRate = interestinyear / 365 / 100;
      break;
    case "Weekly":
      periodicRate = interestinyear / 52 / 100;
      break;
    case "Fortnightly":
      periodicRate = interestinyear / 24 / 100;
      break;
    case "Monthly":
      periodicRate = interestinyear / 12 / 100;
      break;
    case "Quarterly":
      periodicRate = interestinyear / 4 / 100;
      break;
  }

  let emi, tabledata = '', principal, currentDate = new Date();

  if (roitype === "FlatInterest") {
    const totalInterest = loanamount * periodicRate * periods;
    const totalAmount = loanamount + totalInterest;
    emi = totalAmount / periods;

    document.getElementById("emi").value = emi.toFixed(2);

    principal = loanamount;

    for (let m = 1; m <= periods; m++) {
      const interestComponent = totalInterest / periods;
      const principalComponent = emi - interestComponent;
      let closingPrincipal = principal - principalComponent;

      if (Math.abs(closingPrincipal) < 0.01) closingPrincipal = 0.00;

      tabledata += buildRow(m, currentDate, emi, principalComponent, interestComponent, closingPrincipal);

      principal = closingPrincipal;
      currentDate = incrementDate(currentDate, emicollection);
    }
  }

  else if (roitype === "reducinginterest") {
    const r = periodicRate;
    emi = (loanamount * r * Math.pow(1 + r, periods)) / (Math.pow(1 + r, periods) - 1);

    document.getElementById("emi").value = emi.toFixed(2);

    principal = loanamount;

    for (let m = 1; m <= periods; m++) {
      const interestComponent = principal * r;
      const principalComponent = emi - interestComponent;
      let closingPrincipal = principal - principalComponent;

      if (Math.abs(closingPrincipal) < 0.01) closingPrincipal = 0.00;

      tabledata += buildRow(m, currentDate, emi, principalComponent, interestComponent, closingPrincipal);

      principal = closingPrincipal;
      currentDate = incrementDate(currentDate, emicollection);
    }
  }

  else if (roitype === "Rule78") {
    const totalInterest = loanamount * periodicRate * periods;
    const sumOfDigits = (periods * (periods + 1)) / 2;

    let interestPerPeriod = [];
    for (let i = periods; i >= 1; i--) {
      interestPerPeriod.push((i / sumOfDigits) * totalInterest);
    }

    const totalAmount = loanamount + totalInterest;
    emi = totalAmount / periods;

    document.getElementById("emi").value = emi.toFixed(2);

    principal = loanamount;
    const principalComponent = loanamount / periods;

    for (let m = 1; m <= periods; m++) {
      const interestComponent = interestPerPeriod[m - 1];
      const installment = principalComponent + interestComponent;
      let closingPrincipal = principal - principalComponent;

      if (Math.abs(closingPrincipal) < 0.01) closingPrincipal = 0.00;

      tabledata += buildRow(m, currentDate, installment, principalComponent, interestComponent, closingPrincipal);

      principal = closingPrincipal;
      currentDate = incrementDate(currentDate, emicollection);
    }
  }

  document.querySelector('.datatable').classList.add('show');
  document.getElementById('tbody').innerHTML = tabledata;
}

// ✅ Helper: Format row
function buildRow(m, dateObj, installment, principalComponent, interestComponent, closingPrincipal) {
  const day = String(dateObj.getDate()).padStart(2, '0');
  const month = String(dateObj.getMonth() + 1).padStart(2, '0');
  const year = dateObj.getFullYear();
  const formattedDate = `${day}-${month}-${year}`;

  return `
    <tr>
      <td>${m}</td>
      <td>${formattedDate}</td>
      <td>${installment.toFixed(2)}</td>
      <td>${principalComponent.toFixed(2)}</td>
      <td>${interestComponent.toFixed(2)}</td>
      <td>${closingPrincipal.toFixed(2)}</td>
    </tr>`;
}

// ✅ Helper: Increment date for next payment
function incrementDate(date, mode) {
  const newDate = new Date(date);
  if (mode === "Daily") newDate.setDate(newDate.getDate() + 1);
  else if (mode === "Weekly") newDate.setDate(newDate.getDate() + 7);
  else if (mode === "Fortnightly") newDate.setDate(newDate.getDate() + 14);
  else if (mode === "Monthly") newDate.setMonth(newDate.getMonth() + 1);
  else if (mode === "Quarterly") newDate.setMonth(newDate.getMonth() + 3);
  return newDate;
}
