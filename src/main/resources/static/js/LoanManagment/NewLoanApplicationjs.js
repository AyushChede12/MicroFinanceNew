/**
 * 
 */

$(document).ready(function () {
    console.log("Document ready");

    $.ajax({
        url: '/api/loanmanegment/allfetchdata',
        type: 'GET',
        success: function (response) {
            if (response.success) {
                let dropdown = $('#findMember');
                dropdown.empty(); // clear existing options
                dropdown.append('<option value="">Select Member</option>'); // default

                response.data.forEach(function (loan) {
                    dropdown.append(
                        $('<option></option>')
                            .attr('value', loan.id)
                            .text(loan.customerName + ' - ' + loan.memberCode)
                    );
                });
            } else {
                alert('No data found');
            }
        },
        error: function () {
            alert('Failed to fetch members');
        }
    });
});
