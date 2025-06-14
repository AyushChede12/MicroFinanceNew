$(document).ready(function () {
    $("#formid").submit(function (e) {
        e.preventDefault();

        // Collect form data
        var incentiveData = {
            incentiveMonth: $("#incentiveMonth").val(),
            dateFrom: $("#dateFrom").val(),
            dateTo: $("#dateTo").val(),
            comments: $("#comments").val()
        };

        $.ajax({
            url: "/saveIncentive",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(incentiveData),
            success: function (response) {
                // Save the response in a variable
                let saveResponse = response;

                // Show alert with the response
                alert("✅ Data saved successfully: " + saveResponse);
                
                // You can also use the response in other logic here
                console.log("Response saved:", saveResponse);
            },
            error: function (xhr, status, error) {
                let errorResponse = xhr.responseText;
                alert("❌ Error saving data: " + errorResponse);
                console.error("Save failed:", errorResponse);
            }
        });
    });
});
