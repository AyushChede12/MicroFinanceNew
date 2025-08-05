$(document).ready(function () {
	alert("hello");

	   var dropdown = $('#groupcodeid'); // ✅ matches your JSP now
	   console.log("Dropdown found? Length = ", dropdown.length);

	   if (dropdown.length === 0) {
	       alert("❌ Dropdown with id='groupcodeid' not found.");
	       return;
	   }

	   $.ajax({
	       url: "api/joinliability/viewgrouploans",
	       type: "GET",
	       success: function (response) {
	           console.log("API response:", response);
	           dropdown.empty();
	           dropdown.append('<option value="">Select</option>');

	           if (response.status === "OK" && response.data) {
	               $.each(response.data, function (index, customer) {
	                   dropdown.append('<option value="' + customer.groupCode + '">' + customer.groupCode + '</option>');
	               });
	           } else {
	               dropdown.append('<option value="">No groups found</option>');
	           }
	       },
	       error: function () {
	           alert("Failed to fetch group list.");
	       }
	   });
    // 2. On dropdown change, fetch group data
    $('#groupCodeid').on('change', function () {
        let selectedCode = $(this).val();

        if (selectedCode !== "") {
            $.ajax({
                url: 'api/joinliability/fetchByGroupCode?groupCode=' + selectedCode,
                type: 'POST',
                success: function (response) {
                    console.log("Fetch response:", response);
                    if (response.status === "FOUND" && response.data.length > 0) {
                        let customer = response.data[0];

                        // Set values to form fields
                        $('#openingDate').val(customer.openingDate);
                        $('#communityName').val(customer.communityName);
                        $('#branchName').val(customer.branchName);
                        $('#contactNumber').val(customer.contactNumber);
                        $('#loanPurpose').val(customer.loanPurpose);
                        $('#loanSchemeName').val(customer.loanSchemeName);
                        $('#communityAddress').val(customer.communityAddress);
                        $('#paymentMode').val(customer.paymentMode);
                        $('#term').val(customer.term);
                        $('#rateOfInterest').val(customer.rateOfInterest);
                        $('#interestType').val(customer.interestType);
                        $('#loanAmount').val(customer.loanAmount);
                        $('#emiAmount').val(customer.emiAmount);
                    } else {
                        alert('No customer data found!');
                        $('#openingDate').val('');
                    }
                },
                error: function () {
                    alert('Error while fetching customer data!');
                }
            });
        } else {
            // Clear fields if nothing is selected
            $('#openingDate').val('');
        }
    });
	
	// saving code
	$('#saveBtn').on('click', function (e) {
	    e.preventDefault();

	    // Optional basic validation
	    if (!$('#groupcodeid').val()) {
	        alert("Please select a Group Code.");
	        return;
	    }

	    const groupLoanData = {
	        groupCode: $('#groupcodeid').val(), // ✅ Corrected ID
	        openingDate: $('#openingDate').val(),
	        selectedMember: $('#selectedMember').val(),
	        customerName: $('#customerName').val(),
	        communityName: $('#communityName').val(),
	        allocatedStaff: $('#allocatedStaff').val(),
	        branchName: $('#branchName').val(),
	        collectionDays: $('#collectionDays').val(),
	        communityLeader: $('#communityLeader').val(),
	        contactNumber: $('#contactNumber').val(),
	        loanPurpose: $('#loanPurpose').val(),
	        planCode: $('#planCode').val(),
	        loanSchemeInformation: $('#loanSchemeName').val(),
	        processingFee: $('#processingFee').val(),
	        legalCharges: $('#legalCharges').val(),
	        gstPercentage: $('#gstPercentage').val(),
	        insuranceFee: $('#insuranceFee').val(),
	        valuationFee: $('#valuationFee').val(),
	        lateAllowanceDays: $('#lateAllowanceDays').val(),
	        penaltyMode: $('#penaltyMode').val(),
	        monthlyPenalty: $('#monthlyPenalty').val(),
	        emiFrequency: $('#emiFrequency').val(),
	        rateOfInterest: $('#rateOfInterest').val(),
	        interestType: $('#interestType').val(),
	        emiType: $('#emiType').val(),
	        approvalStatus: $('#approvalStatus').val(),
	        approvalDate: $('#approvalDate').val()
	    };

	    console.log("📤 Sending group loan data:", groupLoanData);

	    $.ajax({
	        url: 'api/joinliability/saveGroupLoan',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(groupLoanData),
	        success: function (response) {
	            console.log("✅ Saved successfully:", response);
	            alert(response.message || "Group Loan saved successfully!");
	            $('#formid')[0].reset(); // Reset form if form has id="formid"
	        },
	        error: function (xhr, status, error) {
	            console.error("❌ Save error:", xhr.responseText);
	            alert("Failed to save group loan data. Check inputs or server logs.");
	        }
	    });
	});
});
