$(document).ready(function () {
	$.ajax({
	        url: 'api/Policymangment/getaddinvestmentdetails',
	        type: 'GET',
	        dataType: 'json',
	        success: function (response) {
	            if (response.status === "OK" && response.data && response.data.length > 0) {
	                // Only get policyCodes starting with "FD"
	                const filteredData = response.data.filter(item =>
	                    item.policyCode && item.policyCode.startsWith("FD")
	                );

	                // Format for Select2
	                const policyOptions = filteredData.map(item => ({
	                    id: item.policyCode,
	                    text: item.policyCode
	                }));

	                // Load into dropdown
	                $('#policyCode').empty().select2({
	                    placeholder: '-- Search policy Code --',
	                    data: policyOptions,
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
	            alert("Failed to fetch policy codes.");
	        }
	    });

});