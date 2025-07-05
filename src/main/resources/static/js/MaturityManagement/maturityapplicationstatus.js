$(document).ready(function () {
    $('#searchBtn').on('click', function (event) {
        event.preventDefault();

        var branchName = $('#branchName').val();
        var fromDate = $('#fromDate').val();
        var toDate = $('#toDate').val();

        if (!branchName) {
            alert("Please select a branch.");
            return;
        }

        console.log("Searching:", { branchName, fromDate, toDate });

        $.ajax({
            url: "/api/Maturitymanagement/getMaturityByBranchAndDate",
            type: "GET",
            data: {
                branchName: branchName,
                fromDate: fromDate,
                toDate: toDate
            },
            success: function (response) {
                if (response.status === "OK" && response.data.length > 0) {
                    var tableBody = $("#table tbody");
                    tableBody.empty();

                    var matchCount = 0;

                    $.each(response.data, function (index, item) {
                        if (item.remark && item.remark.trim().toUpperCase() === "OK") {
                            var row = "<tr>" +
                                "<td>" + item.policyNo + "</td>" +
                                "<td>" + item.branchName + "</td>" +
                                "<td>" + item.maturityDate + "</td>" +
                                "<td>" + item.customerName + "</td>" +
                                "<td>" + item.schemeName + "</td>" +
                                "<td>" + item.schemeType + "</td>" +
                                "<td>" + item.policyAmount + "</td>" +
                                "<td>" + item.maturityAmount + "</td>" +
                                "<td>" + item.remark + "</td>" +
                                "</tr>";
                            tableBody.append(row);
                            matchCount++;
                        }
                    });

                    if (matchCount === 0) {
                        alert("No records found with remark 'OK'.");
                    }

                } else {
                    alert("No records found for the given filters.");
                }
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("Something went wrong while fetching data.");
            }
        });
    });
});
