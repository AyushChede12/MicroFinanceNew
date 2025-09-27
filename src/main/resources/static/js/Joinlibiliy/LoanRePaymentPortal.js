// ✅ Js for populating the approved loanid in the dropdown (Vaibhav)
$(document).ready(function() {
	populateDropdown();
});

function populateDropdown() {

	$.ajax({
		url: "api/joinliability/getApprovedGroupLoanIds",
		type: "GET",
		dataType: "json",
		success: function(response) {
			console.log("Loan ID response:", response); // for debugging

			if (response.status === "OK" && Array.isArray(response.data)) {
				const $dropdown = $("#groupid"); // Make sure this matches your HTML ID exactly
				$dropdown.empty(); // Clear existing options

				// ✅ Wrap your <option> in quotes!
				$dropdown.append('<option value="" disabled selected>Select Loan ID</option>');

				response.data.forEach(function(id) {
					$dropdown.append(`<option value="${id}">${id}</option>`);
				});
			} else {
				console.warn("No Loan IDs found in response.");
			}
		},
		error: function(xhr, status, error) {
			console.error("Error fetching Loan IDs:", error);
		}
	});
}

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
						$('#loanschemename').val(customer.loanSchemeName);
						$('#communityaddress').val(customer.communityaddress);
						$('#contactno').val(customer.contactNumber);
						$('#loanpurpose').val(customer.loanPurpose);
						
						
						
						
						// ✅ PHOTO block
						if (customer.photo) {

							const fileName = customer.photo;
							const photoPath = `/Uploads/${encodeURIComponent(fileName)}`;

							$("#photoPreview").attr("src", photoPath);  // ✅ Shows preview
							$("#photoHidden").val(fileName);            // ✅ Save only the filename, not full path
							photoSizeEdit({ target: { result: photoPath } }); // ✅ Resizes preview
						} else {
							$("#photoPreview").attr("src", "/Uploads/default-placeholder.jpg");
							$("#photoHidden").val("");
							photoSizeEdit({ target: { result: "/Uploads/default-placeholder.jpg" } });
						}

						// ✅ SIGNATURE block
						if (customer.signature) {

							const fileName = customer.signature;
							const signPath = `/Uploads/${encodeURIComponent(fileName)}`;

							$('#signaturePreview').attr('src', signPath);
							$('#signatureHidden').val(fileName);
							signatureSizeEdit({ target: { result: signPath } }); // ✅ Resize preview
						} else {
							$('#signaturePreview').attr('src', '/Uploads/default-placeholder.jpg');
							$('#signatureHidden').val("");
							signatureSizeEdit({ target: { result: "/Uploads/default-placeholder.jpg" } });
						}
						
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



// Js for binding data in textfields (Vaibhav)
$(document).ready(function() {
	$("#findByLoanId").on("change", function() {
		const selectedLoanId = $(this).val();

		if (selectedLoanId) {
			$.ajax({
				url: "api/loanmanegment/getLoanById", // your GET API
				type: "GET",
				data: { loanId: selectedLoanId }, // sending as query param
				dataType: "json",
				success: function(response) {
					if (response.status === "OK" && response.data) {
						const data = response.data;

						// Now populate the form fields with received data
						$("#memberId").val(`${data.memberId} - ${data.memberName || "-"}`);
						$("#relativeDetails").val(data.relativeDetails);
						$("#dateOfBirth").val(data.dateOfBirth);
						$("#age").val(data.age);
						$("#contactNo").val(data.contactNo);
						$("#messageStatus").val(data.messageStatus);
						$("#address").val(data.address);
						$("#pinCode").val(data.pinCode);
						$("#branchName").val(data.branchName);

						$("#loanPlanName").val(data.loanPlanName);
						$("#typeOfLoan").val(data.typeOfLoan);
						$("#loanMode").val(data.loanMode);
						$("#loanTerm").val(data.loanTerm);
						$("#rateOfInterest").val(data.rateOfInterest);
						$("#loanAmount").val(data.loanAmount);
						$("#interestType").val(data.interestType);
						$("#emiPayment").val(data.emiPayment);
						$("#purposeOfLoan").val(data.purposeOfLoan);

						// Guarantor Details
						$("#guarantorMemberId").val(data.guarantorMemberId);
						$("#guarantorIdentity").val(data.guarantorIdentity);
						$("#guarantorAddress").val(data.guarantorAddress);
						$("#guarantorPinCode").val(data.guarantorPinCode);
						$("#guarantorContactNo").val(data.guarantorContactNo);
						$("#guarantorSecurityType").val(data.guarantorSecurityType);

						// Co-Applicant Details
						$("#coApplicantMemberId").val(data.coApplicantMemberId);
						$("#coApplicantIdentity").val(data.coApplicantIdentity);
						$("#coApplicantAddress").val(data.coApplicantAddress);
						$("#coApplicantPinCode").val(data.coApplicantPinCode);
						$("#coApplicantContactNo").val(data.coApplicantContactNo);
						$("#coApplicantSecurityType").val(data.coApplicantSecurityType);

						// Deductions
						$("#processingFee").val(data.processingFee);
						$("#legalCharges").val(data.legalCharges);
						$("#insuranceFee").val(data.insuranceFee);
						$("#financialConsultantId").val(data.financialConsultantId);
						$("#financialConsultantName").val(data.financialConsultantName);

						if (data.approvalStatus === true || data.approvalStatus === 1 || data.approvalStatus === "1") {
							$('#approvalStatus').val("Approved").css('color', 'red');
						} else {
							$('#approvalStatus').val("Not Approved").css('color', 'green');
						}

						// ✅ PHOTO block
						if (data.photo) {

							const fileName = data.photo;
							const photoPath = `/Uploads/${encodeURIComponent(fileName)}`;

							$("#photoPreview").attr("src", photoPath);  // ✅ Shows preview
							$("#photoHidden").val(fileName);            // ✅ Save only the filename, not full path
							photoSizeEdit({ target: { result: photoPath } }); // ✅ Resizes preview
						} else {
							$("#photoPreview").attr("src", "/Uploads/default-placeholder.jpg");
							$("#photoHidden").val("");
							photoSizeEdit({ target: { result: "/Uploads/default-placeholder.jpg" } });
						}

						// ✅ SIGNATURE block
						if (data.signature) {

							const fileName = data.signature;
							const signPath = `/Uploads/${encodeURIComponent(fileName)}`;

							$('#signaturePreview').attr('src', signPath);
							$('#signatureHidden').val(fileName);
							signatureSizeEdit({ target: { result: signPath } }); // ✅ Resize preview
						} else {
							$('#signaturePreview').attr('src', '/Uploads/default-placeholder.jpg');
							$('#signatureHidden').val("");
							signatureSizeEdit({ target: { result: "/Uploads/default-placeholder.jpg" } });
						}


					} else {
						alert("Loan data not found.");
					}
				},
				error: function(xhr) {
					alert("Error fetching data: " + xhr.responseText);
				}
			});
		}
	});
});




/*$(document).ready(function () {
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
						$('#loanschemename').val(customer.loanSchemeName);* 
						$('#communityAddress').val(customer.communityaddress);* 
						$('#contactno').val(customer.contactNumber);
						$('#loanpurpose').val(customer.loanPurpose);
						const emicollection = $('#emimode').val(customer.emiType).val();
						const tensure =  $('#term').val(customer.term).val();
						const interestinyear =  $('#rateofinterest').val(customer.rateOfInterest).val();
						const roitype =  $('#interest').val(customer.interestType).val();
						const loanamount =  $('#loanamount').val(customer.totalAmount).val();
						//$('#emiamount').val(customer.loanPurpose);
						const feeProcessing =  $('#Processingfee').val(customer.processingFee).val();
						const gst = $('#gstvalue').val(customer.gstPercentage).val();
						const chargesLegal =  $('#legalfee').val(customer.legalCharges).val();
						const feeInsurence =  $('#insurencefee').val(customer.insuranceFee).val();
						const feeValuation =  $('#Valuationfee').val(customer.valuationFee).val();
						//alert(emicollection); alert(tensure);  alert(interestinyear);  alert(roitype);  alert(loanamount); 
						alert(feeProcessing); alert(chargesLegal);  alert(gst);  alert(feeInsurence);  alert(feeValuation); 
												
						calculateEMI(emicollection, tensure, interestinyear, loanamount, roitype);
						calculateCharges(feeProcessing,chargesLegal,gst,feeInsurence,feeValuation,loanamount)
							
						
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




//EMI Calculation 
function calculateEMI(emicollection, tensure, interestinyear, loanamount, roitype) {
	const periods = tensure; // ✅ ALWAYS use entered term — no conversion!
	let periodicRate;

	//alert(emicollection); alert(tensure);  alert(interestinyear);  alert(roitype);  alert(loanamount); 
	
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

		document.getElementById("emiamount").value = emi.toFixed(2);

	}

	else if (roitype === "Reducing Interest") {
		const r = periodicRate;
		emi = (loanamount * r * Math.pow(1 + r, periods)) / (Math.pow(1 + r, periods) - 1);

		document.getElementById("emiamount").value = emi.toFixed(2);
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

		document.getElementById("emiamount").value = emi.toFixed(2);
	}
}

function calculateCharges(feeProcessing,chargesLegal,gst,feeInsurence,feeValuation,loanamount){
	
	const processingFee = (loanamount * feeProcessing) / 100;
	 const legalCharges = (loanamount * chargesLegal) / 100;
	 const feeInsurence1 = (loanamount * feeInsurence) / 100;
	 const feeValuation1 = (loanamount * feeValuation) / 100;
	 //const statinaryCharges = 50;
	 const gsst = ((processingFee + legalCharges + feeValuation1) * gst)/ 100;
	 
	 $('#Processingfee').val(processingFee.toFixed(2));
	 $('#legalfee').val(legalCharges.toFixed(2));
	 $('#gstvalue').val(gsst.toFixed(2));
	 $('#insurencefee').val(feeInsurence1.toFixed(2));
	 $('#Valuationfee').val(feeValuation1.toFixed(2));
	 //$('#stationaryFee').val(statinaryCharges.toFixed(2));
	 
}



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
*/




