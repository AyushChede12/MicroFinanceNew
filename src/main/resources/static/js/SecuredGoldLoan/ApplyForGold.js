$(document).ready(function() {
    // Call API to get member details
    $.ajax({
        url: "/api/securedGoldLoan/getAllMembersForGoldLoan",
        type: 'GET',
        data: { memberCode: '' }, // pass empty if backend supports fetching all members
        success: function(response) {
            var select = $('#memberCode');
            select.empty(); // clear existing options
            select.append('<option value="">Select member Code</option>'); // default option

            if(response && response.data && response.data.length > 0) {
                response.data.forEach(function(customer) {
                    // Format: MemberCode-CustomerName
                    var optionText = customer.memberCode + '-' + customer.customerName;
                    var optionValue = customer.memberCode; // value can be just memberCode
                    select.append('<option value="'+ optionValue +'">'+ optionText +'</option>');
                });
            } else {
                console.log("No members found");
            }
        },
        error: function(err) {
            console.error("Error fetching members", err);
        }
    });
});
