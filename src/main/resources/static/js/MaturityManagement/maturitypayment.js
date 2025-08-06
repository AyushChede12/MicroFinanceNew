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
			                    $('#depositAmount').val(data.depositAmount);
			                    $('#maturityAmount').val(data.maturityAmount);
			                    $('#maturityDate').val(data.maturityDate);
								$('#Approvebranch').val(data.branchName);
			                    $('#duration').val(calDuration(data)); //function calDuration(data)
								$('#sysPayable').val(sysPayable(data)); //function sysPayable(data)
								$('#deduction').val(Deduction(data));	//function Deduction(data)					
								$('#netPayable').val(netPayment(data)); //dunction netpay(data)
							$('#amount').off('blur').on('blur', function () {
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
		 syspayable=syspayable+intrest;
		
		return syspayable;
		
		
		
}








