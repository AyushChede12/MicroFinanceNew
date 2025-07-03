$(document).ready(function () {
    $('#branchName').on('change', function () {
        let branchName = $(this).val();
	
        if (branchName !== "") {
            $.ajax({
                url: '/api/Policymangment/getinvestmentdetails?branchName=' + encodeURIComponent(branchName),
                type: 'GET',
                success: function (response) {
                    var dropdown = $('#policyId');
                    dropdown.empty();
                    dropdown.append('<option value="">Select Policy No</option>');

                    if (response.data && response.data.length > 0) {
                        $.each(response.data, function (index, policyNo) {
                            dropdown.append('<option value="' + policyNo.id+'">'+ policyNo.id+'</option>');
                        });
                    } else {
                        dropdown.append('<option value="">No policies found</option>');
                    }
                },
                error: function () {
                    alert("Error fetching policy numbers.");
                }
            });
        }
    });
	
	$('#policyId').on('change', function () {
	       let policyId = $(this).val(); // Long ID

	       if (policyId !== "") {
	           $.ajax({
	               url: '/api/Policymangment/getDetailsById/' + policyId,
	               type: 'GET',
	               success: function (response) {
					
	                   if (response.data) {
	                       $('#customerName').val(response.data.customerName);
	                       $('#schemeMode').val(response.data.schemeMode);
	                       $('#schemeType').val(response.data.schemeType);
	                       $('#policyAmount').val(response.data.policyAmount);
	                       $('#depositAmount').val(response.data.depositAmount);
	                       $('#maturityAmount').val(response.data.maturityAmount);
	                       $('#maturityDate').val(response.data.maturityDate);
						   
	                   } else {
	                       alert("No data found for this policy.");
	                   }
	               },
	               error: function () {
	                   alert("Error fetching policy details.");
	               }
	           });
	       } else {
	           // Clear fields
	           $('#customerName, #schemeName, #schemeType, #policyAmount, #depositAmount, #maturityAmount, #maturityDate').val('');
	       }
	   });
});
