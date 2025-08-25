
$(document).ready(function () {
	$('#plantype').on('change', function () {
	        let plantype = $(this).val();

	        if (!plantype) {
	            alert("Please select a valid plan type.");
	            return;
	        }

	        $.ajax({
	            url: 'api/Policymangment/getaddinvestmentdetails',
	            type: 'GET',
	            data: { planType: plantype }, 
	            success: function (response) {
	                if (response.status === "OK" && response.data && response.data.length > 0) {
	                    // Filter policyCodes starting with selected planType (e.g., DD...)
	                    const filteredData = response.data.filter(item =>
	                        item.policyCode && item.policyCode.startsWith(plantype)
	                    );

	                    const transferOptions = filteredData.map(function (item) {
	                        return {
	                            id: item.policyCode,
	                            text: item.policyCode
	                        };
	                    });

	                    $('#policyCode').empty().select2({
	                        placeholder: '-- Search policy Code --',
	                        data: transferOptions,
	                        matcher: function (params, data) {
	                            if ($.trim(params.term) === '') return data;

	                            if (typeof data.text === 'undefined') return null;

	                            const term = params.term.toLowerCase();
	                            const text = data.text.toLowerCase();

	                            return text.includes(term) ? data : null;
	                        }
	                    });
	                } else {
	                    alert("No policy codes found.");
	                }
	            },
	            error: function () {
	                alert("Failed to load policy codes.");
	            }
	        });
	    });
		
		$('#policyCode').on('change', function () {
			    let policyCode = $(this).val();

			    if (policyCode !== "") {
			        $.ajax({
			            url: '/api/Policymangment/getPolicyByPolicyCode?policyCode=' + encodeURIComponent(policyCode),
			            type: 'GET',
			            success: function (response) {
			                console.log("Response:", response);

			                if (response.data) {
			                    let data = response.data;

			                    $('#planCode').val(data.schemeCode);
			                    $('#customerName').val(data.customerName);
			                    $('#policyName').val(data.schemeName);
			                    $('#schemeType').val(data.schemeType);
			                    $('#policyAmount').val(data.policyAmount);
			                    $('#maturityAmount').val(data.maturityAmount);
			                    $('#maturityDate').val(data.maturityDate);
								$('#Approvebranch').val(data.branchName);
			                    $('#duration').val(calDuration(data)); //function calDuration(data)
								$('#sysPayable').val(sysPayable(data)); //function sysPayable(data)
								$('#deduction').val(Deduction(data));	//function Deduction(data)					
								$('#netPayable').val(netPayment(data)); //function netpay(data)
								$('#panelty').val(Panelty(data));	//function Panelty(data)
								
								$("#amount").on("blur", function () {
									let modal = new bootstrap.Modal(document.getElementById('exampleModalLong'));
									modal.show();
									
								totalPayment();
								    });
									$("#Pay").on("click", function () {									
										let amount = parseFloat($('#amount').val()) || 0;
										let depositAmount = parseFloat(data.depositAmount); 
										let paidamount=amount+depositAmount;
										$('#depositAmount').val(paidamount);
											$('#dueAmount').val(DueAmount(data));	//function DueAmount(data)
										
									});

			                } else {
			                    alert("No data found for this policy.");
			                }
			            },
			            error: function () {
			                alert("Error fetching policy details.");
			            }
			        });
			    } else {
			        $('#customerName, #schemeMode, #schemeType, #policyAmount, #depositAmount, #maturityAmount, #maturityDate, #duration').val('');
			    }
			});
//getting team member name
			$.ajax({
				    url: "getAllteamMember",
				    type: "GET",
				    success: function (response) {
				        if (response && response.length > 0) {
				           
				            const teamOptions = response.map(function (team) {
				                return {
				                    id: team.teamMemberCode,
				                    text: team.teamMemberCode + " - " + team.teamMemberName
				                };
				            });

				            
				            $('#userApprover').empty().select2({
				                placeholder: '-- Select Team Member --',
				                data: teamOptions,
				                matcher: function (params, data) {
				                    if ($.trim(params.term) === '') return data;

				                    if (typeof data.text === 'undefined') return null;

				                    const term = params.term.toLowerCase();
				                    const text = data.text.toLowerCase();

				                    return text.includes(term) ? data : null;
				                }
				            });
				        } else {
				            alert("No team members found.");
				        }
				    },
				    error: function () {
				        alert("Failed to load team members.");
				    }
				});
				
});

//calculate duration
function calDuration(data){
	let openingDate = new Date(data.policyStartDate);
	let maturityDate = new Date(data.maturityDate);
	let schemeMode = data.schemeMode; 

    let duration = 0;
	let durationText = "-";

		 if (schemeMode && openingDate && maturityDate) 
			{
		      if (schemeMode.toLowerCase() === "monthly") 
				{
		          duration = (maturityDate.getFullYear() - openingDate.getFullYear()) * 12 +(maturityDate.getMonth() - openingDate.getMonth());
				 durationText = duration + (duration === 1 ? " month" : " months");
				}
				 else
				   if (schemeMode.toLowerCase() === "yearly")
					 {
		                duration = maturityDate.getFullYear() - openingDate.getFullYear();
		                   if (
		                        maturityDate.getMonth() < openingDate.getMonth() ||
		                          (maturityDate.getMonth() === openingDate.getMonth() &&
		                           maturityDate.getDate() < openingDate.getDate())
		                              ) {
		                                duration--;
		                            }
							 durationText = duration + (duration === 1 ? " year" : " years");
		                }
		         }
				 return durationText;
}

function sysPayable(data){
	
		 let depositAmount = parseFloat(data.depositAmount);                    
		 let rateOfIntrest = parseFloat(data.roi);   
		 let syspayable=0;
		 let intrest=0;
		
		
		 intrest=(depositAmount*rateOfIntrest*1)/100;
		 syspayable=depositAmount+intrest;
		
		return syspayable;
	
		
}

function Deduction(data){
	let deduct=(200*18)/100;
	
	return deduct;
}

function netPayment(data){
	let sysPayable = parseFloat($('#sysPayable').val()) || 0;
	let deduction = parseFloat($('#deduction').val()) || 0;
	let netpay = 0;

	if (!isNaN(sysPayable) && !isNaN(deduction)) {
	    netpay = sysPayable - deduction;
	    alert("Net Payable: " + netpay);
	}
	return netpay;
}

function Panelty(data){
	let openingDate = new Date(data.policyStartDate);
	let lastTrans = new Date(data.lastPaymentDate);
	let paymentdate = new Date(document.getElementById("paymentDate").value); 
	let policyAmount = parseFloat(data.policyAmount);  
	
	let expected = new Date(lastTrans);
	    expected.setMonth(expected.getMonth() + 1);
	    expected.setDate(openingDate.getDate());  // keep same day as opening date

	    console.log("Opening Date:", openingDate.toDateString());
	    console.log("Last Transaction:", lastTrans.toDateString());
	    console.log("Expected Payment Date:", expected.toDateString());
	    console.log("Actual Payment Date:", paymentdate.toDateString());

	    // Months gap between last and actual payment
	    let monthsGap = (paymentdate.getFullYear() - lastTrans.getFullYear()) * 12 +
	                    (paymentdate.getMonth() - lastTrans.getMonth());
					

	    // If actual payment is after expected → late
	    let penalty = 0;
	    if (paymentdate > expected) {
	        penalty = monthsGap * (1.5 / 100) * policyAmount;
	    }

	    console.log("Months Gap:", monthsGap);
	    console.log("Penalty:", penalty.toFixed(2));

	    return penalty;
	
}

function DueAmount(data)
{
	let amount = parseFloat($('#amount').val()) || 0;
	let paidAmount = parseInt(data.depositAmount);             
	let policyAmount = parseInt(data.policyAmount);
	let dueamount=0;
	
	if (!isNaN(amount) && !isNaN(paidAmount) && !isNaN(policyAmount))
		{
			dueamount=policyAmount-(amount+paidAmount);
			alert(dueamount);
		}
		return dueamount;
		
}


