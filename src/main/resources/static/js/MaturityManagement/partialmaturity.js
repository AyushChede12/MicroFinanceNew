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
            data: { planType: plantype }, // sending planType as a query parameter
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
	                alert("Policy Code: " + policyCode);

	                if (response.data) {
	                    let data = response.data;

	                    $('#planCode').val(data.schemeCode);
	                    $('#clientName').val(data.customerName);
	                    $('#policyName').val(data.schemeName);
	                    $('#schemeType').val(data.schemeType);
	                    $('#policyAmount').val(data.policyAmount);
	                    $('#paidAmount').val(data.depositAmount);
	                    $('#actualMaturity').val(data.maturityAmount);
	                    $('#maturityDate').val(data.maturityDate);
	                    $('#duration').val(calDuration(data));
						$('#syspayable').val(sysPayable(data));
						
						
						
						

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

function calDuration(data){
	let openingDate = new Date(data.policyStartDate);
	let maturityDate = new Date(data.maturityDate);
	let schemeMode = data.schemeMode; // e.g., "Monthly" or "Yearly"

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
	
	
	// System Payable = (Total Deposit Amount × (Completed Period / Total Period)) + Interest for that period

}
