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
				alert("Data Save successfully");
				loadIncentiveData();

            },
            error: function (xhr, status, error) {
                let errorResponse = xhr.responseText;
                console.error("Save failed:", errorResponse);
            }
        });
    });
});

// This function will run automatically when the page finishes loading
$(document).ready(function () {
    loadIncentiveData(); 
});

// Separated logic into a named function for reuse
function loadIncentiveData() {
    $.ajax({
        url: "/getAllIncentives",
        type: "GET",
        contentType: "application/json",
        success: function (data) {
            console.log(data);

            var tbody = $("#incentiveTableBody");
            tbody.empty();

            $.each(data, function (index, item) {
                var row = "<tr>" +
                    "<td>" + (index + 1) + "</td>" +
                    "<td>" + item.incentiveMonth + "</td>" +
                    "<td>" + item.dateFrom + "</td>" +
                    "<td>" + item.dateTo + "</td>" +
                    "<td>" + item.comments + "</td>" +
                    "</tr>";
                tbody.append(row);
            });
        },
        error: function (xhr, status, error) {
            alert("Error: " + xhr.status);
            console.error(xhr.responseText);
        }
    });
}

//date changes ajax
    $(document).ready(function () {

        // Set today's date initially
        let today = new Date().toISOString().split('T')[0];
        $("#dateFrom").val(today);
        $("#dateTo").val(today);

        // When month entered
        $("#incentiveMonth").on("change", function () {
            let monthName = $(this).val().trim();
            let year = new Date().getFullYear(); // Default to current year

            let monthIndex = new Date(Date.parse(monthName + " 1, " + year)).getMonth();

            if (!isNaN(monthIndex)) {
                let firstDay = new Date(year, monthIndex, 2);       // 1st day of month
                let lastDay = new Date(year, monthIndex + 1, 1);    // last day of month

                // Convert to YYYY-MM-DD
                function formatDate(date) {
                    return date.toISOString().split('T')[0];
                }

                $("#dateFrom").val(formatDate(firstDay));
                $("#dateTo").val(formatDate(lastDay));

                // OPTIONAL: Try to open calendar (works only on some browsers)
                $("#dateFrom")[0].showPicker && $("#dateFrom")[0].showPicker();
                $("#dateTo")[0].showPicker && $("#dateTo")[0].showPicker();

            } else {
                alert("Please enter a valid month name like ");
            }
        });
    });