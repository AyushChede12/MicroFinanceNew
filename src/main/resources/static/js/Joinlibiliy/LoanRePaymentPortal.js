$(document).ready(function () {
	//alert("oshin");
	$.ajax({
		url: "api/joinliability/viewgrouploans",
		type: "GET",
		success: function (response) {
			console.log("API response:", response);
			var dropdown1 = $('#groupid');
			dropdown1.empty();
			dropdown1.append('<option value="">Select GroupID</option>');

			let approvedCount = 0;

			if (response.status === "OK" && response.data) {
				$.each(response.data, function (index, customer) {
				
					let status = (customer.approvalStatus || "").trim().toLowerCase();
					
					if (status === "approved") {
						dropdown1.append('<option value="' + customer.groupCode + '">' + customer.groupCode + '</option>');
						approvedCount++;
					}
				});

				if (approvedCount === 0) {
					dropdown1.append('<option disabled>No approved groups available</option>');
				}
			} else {
				dropdown1.append('<option disabled>No groups found</option>');
			}
		},
		error: function () {
			alert("Failed to fetch group list.");
		}
	});
	
	$('#groupid').on('change', function() {
		let selectedCode = $(this).val();

		if (selectedCode !== "") {
			$.ajax({
				url: 'api/joinliability/fetchBygroupCode?groupCode=' + selectedCode, // ✅ fixed here
				type: 'POST',
				success: function(response) {
					if (response.status === "FOUND") {
						let customer = response.data[0];
						$('#openingdate').val(customer.openingDate);
						$('#communityname').val(customer.communityName);
						$('#branchname').val(customer.branchName);
						$('#loanschemename').val(customer.loanSchemeName);/** */
						$('#communityAddress').val(customer.communityaddress);/** */
						$('#contactno').val(customer.contactNumber);
						$('#loanpurpose').val(customer.loanPurpose);
						const emicollection = $('#emimode').val(customer.emiType).val();
						const tensure =  $('#term').val(customer.term).val();
						const interestinyear =  $('#rateofinterest').val(customer.rateOfInterest).val();
						const roitype =  $('#interest').val(customer.interestType).val();
						const loanamount =  $('#loanamount').val(customer.totalAmount).val();
						//$('#emiamount').val(customer.loanPurpose);
						$('#Processingfee').val(customer.processingFee);
						$('#gstvalue').val(customer.gstPercentage);
						$('#legalfee').val(customer.legalCharges);
						$('#insurencefee').val(customer.insuranceFee);
						$('#Valuationfee').val(customer.valuationFee);
						alert(emicollection);
						
						calculateEMI(emicollection, tensure, interestinyear, loanamount, roitype);

						
					} else {
						alert('No customer data found!');
						$('#communityname').val('');
					}
				},
				error: function() {
					alert('Error while fetching customer data!');
				}
			});
		} else {
			$('#communityname').val('');
		}
	});

});

$(document).ready(function() {
	alert("oshin");
	$.ajax({
		url: 'api/financialconsultant/getAllFinancialConsultantDetails',
		type: 'POST',
		success: function(response) {
			console.log("API Response:", response);

			const consultantDropdown = $('#financialconsultantcode');
			consultantDropdown.empty();
			consultantDropdown.append('<option value="">Select Consultant</option>');

			response.data.forEach(function(customer) {
				const option = `<option value="${customer.financialCode}">${customer.financialCode}</option>`;
				consultantDropdown.append(option);
			});
		},
		error: function(xhr, status, error) {
			console.error('AJAX Error:', status, error);
			alert('Failed to fetch consultant data.');
		}
	});
	
	
	$('#financialconsultantcode').on('change', function() {
			const selectedCode = $(this).val();
			console.log("Selected Financial Code:", selectedCode);

			if (selectedCode) {
				$.ajax({
					url: 'api/financialconsultant/getfinancialHierarchyByFinancialCode',
					type: 'GET',
					data: { financialCode: selectedCode },
					success: function(response) {
						console.log("API Response:", response);

						// ✅ If your API returns an ARRAY
						const consultant = Array.isArray(response.data) ? response.data[0] : response.data;

						if (consultant && consultant.financialName) {
							$('#financialconsultantname').val(consultant.financialName);
						} else {
							$('#financialconsultantname').val('');
							alert('No consultant name found for this code.');
						}
					},
					error: function(xhr, status, error) {
						console.error('AJAX Error:', status, error);
						alert('Error fetching consultant name.');
					}
				});
			} else {
				$('#financialconsultantname').val('');
			}
		});
	
});




//EMI Calculation 
function calculateEMI(emicollection, tensure, interestinyear, loanamount, roitype) {
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

	let emi;

	if (roitype === "Flat Interest") {
		const totalInterest = loanamount * periodicRate * periods;
		const totalAmount = loanamount + totalInterest;
		emi = totalAmount / periods;

		document.getElementById("emiPayment").value = emi.toFixed(2);

	}

	else if (roitype === "Reducing Interest") {
		const r = periodicRate;
		emi = (loanamount * r * Math.pow(1 + r, periods)) / (Math.pow(1 + r, periods) - 1);

		document.getElementById("emiPayment").value = emi.toFixed(2);
	}

	else if (roitype === "Rule 78") {
		const totalInterest = loanamount * periodicRate * periods;
		const sumOfDigits = (periods * (periods + 1)) / 2;

		let interestPerPeriod = [];
		for (let i = periods; i >= 1; i--) {
			interestPerPeriod.push((i / sumOfDigits) * totalInterest);
		}

		const totalAmount = loanamount + totalInterest;
		emi = totalAmount / periods;

		document.getElementById("emiPayment").value = emi.toFixed(2);
	}
}


function calculateCharges(feeProcessing,chargesLegal,gst,feeInsurence,feeValuation,loanamount){
	
	const processingFee = (loanamount * feeProcessing) / 100;
	 const legalCharges = (loanamount * chargesLegal) / 100;
	 const feeInsurence1 = (loanamount * feeInsurence) / 100;
	 const feeValuation1 = (loanamount * feeValuation) / 100;
	 const statinaryCharges = 50;
	 const gsst = ((processingFee + legalCharges + feeValuation1) * gst)/ 100;
	 
	 $('#processingFee').val(processingFee.toFixed(2));
	 $('#legalCharges').val(legalCharges.toFixed(2));
	 $('#gst').val(gsst.toFixed(2));
	 $('#insuranceFee').val(feeInsurence1.toFixed(2));
	 $('#valuationFees').val(feeValuation1.toFixed(2));
	 $('#stationaryFee').val(statinaryCharges.toFixed(2));
	 
}


