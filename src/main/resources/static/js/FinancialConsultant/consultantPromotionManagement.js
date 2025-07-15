$(document).ready(function () {
    $.ajax({
        url: "/api/financialconsultant/getAllFinancialConsultantDetails",
        type: "POST",
        success: function (response) {
			alert("hello");
            if (response && response.data) {
                // Find first entry where selectPosition is MANAGER
                const manager = response.data.find(item => item.selectPosition === "MANAGER");

                if (manager) {
                    $('#newseniorCode').val(manager.financialCode);
                    $('#newseniorname').val(manager.financialName);
                    $('#newseniorposition').val(manager.selectPosition); // Always "MANAGER"
                } else {
                    alert("No manager found.");
                }
            }
        },
        error: function () {
            alert("Error fetching data.");
        }
    });
});

