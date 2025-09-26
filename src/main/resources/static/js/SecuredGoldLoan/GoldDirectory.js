$(document).ready(function() {

    // ====== FETCH & POPULATE TABLES ======
    function fetchGoldDirectoryData() {
        $.ajax({
            url: "/api/securedGoldLoan/getAllGoldDirectories",
            type: "GET",
            success: function(response) {
                if (response && response.data) {
                    let data = response.data;

                    // Clear existing rows
                    $("#todaysRateTable").empty();
                    $("#itemMasterTable").empty();
                    $("#lockerMasterTable").empty();
                    $("#purityMasterTable").empty();

                    // Loop and append rows
                    data.forEach(function(row) {
                        // Today's Rate table
                        if (row.karat || row.silverRate || row.goldRate) {
                            $("#todaysRateTable").append(
                                `<tr>
                                    <td>${row.karat || "-"}</td>
                                    <td>${row.silverRate || "-"}</td>
                                    <td>${row.goldRate || "-"}</td>
                                </tr>`
                            );
                        }

                        // Item Master table
                        if (row.itemMasterType || row.itemName) {
                            $("#itemMasterTable").append(
                                `<tr>
                                    <td>${row.id}</td>
                                    <td>${row.itemMasterType || "-"}</td>
                                    <td>${row.itemName || "-"}</td>
                                </tr>`
                            );
                        }

                        // Locker Master table
                        if (row.lockerLocation || row.lockerAddress) {
                            $("#lockerMasterTable").append(
                                `<tr>
                                    <td>${row.id}</td>
                                    <td>${row.lockerLocation || "-"}</td>
                                    <td>${row.lockerAddress || "-"}</td>
                                </tr>`
                            );
                        }

                        // Purity Master table
                        if (row.purityName || row.purity || row.itemPurityType) {
                            $("#purityMasterTable").append(
                                `<tr>
                                    <td>${row.id}</td>
                                    <td>${row.purityName || "-"}</td>
                                    <td>${row.itemPurityType || "-"}</td>
                                </tr>`
                            );
                        }
                    });
                }
            },
            error: function(xhr) {
                console.error("Error fetching data:", xhr);
                alert("Failed to fetch data!");
            }
        });
    }

    // ====== SAVE GOLD DIRECTORY ======
    function saveGoldDirectory(newData, successMsg) {
        let id = $("#goldDirectoryId").val(); // hidden field

        let payload = {
            id: id || null,
            karat: newData.karat || $("#karat").val() || "",
            silverRate: newData.silverRate || $("#silverRate").val() || "",
            goldRate: newData.goldRate || $("#goldRate").val() || "",
            itemMasterType: newData.itemMasterType || $("#itemMasterType").val() || "",
            itemName: newData.itemName || $("#ItemName").val() || "",
            lockerLocation: newData.lockerLocation || $("#lockerLocation").val() || "",
            lockerAddress: newData.lockerAddress || $("#lockerAddress").val() || "",
            purityName: newData.purityName || $("#purityName").val() || "",
            purity: newData.purity || $("#purity").val() || "",
            itemPurityType: newData.itemPurityType || $("#itemPurityType").val() || ""
        };

        $.ajax({
            url: "/api/securedGoldLoan/saveGoldDirectory",
            type: "POST",
            data: payload,
            success: function(response) {
                if (response && response.data) {
                    if (!id) {
                        $("#goldDirectoryId").val(response.data.id);
                    }
                    alert(successMsg);

                    // Refresh tables after save
                    fetchGoldDirectoryData();
                } else {
                    alert("Error: Invalid response from server");
                }
            },
            error: function(xhr) {
                console.error("Error Response:", xhr);
                alert("Something went wrong! " + xhr.status + " " + xhr.statusText);
            }
        });
    }

    // ====== BUTTON EVENTS ======
    $("#saveTodaysRateBtn").on("click", function(e) {
        e.preventDefault();
        let idExists = $("#goldDirectoryId").val();
        saveGoldDirectory({
            karat: $("#karat").val(),
            silverRate: $("#silverRate").val(),
            goldRate: $("#goldRate").val()
        }, idExists ? "Today's Rate updated successfully!" : "Today's Rate saved successfully!");
    });

    $("#saveItemMasterBtn").on("click", function(e) {
        e.preventDefault();
        let idExists = $("#goldDirectoryId").val();
        saveGoldDirectory({
            itemMasterType: $("#itemMasterType").val(),
            itemName: $("#ItemName").val()
        }, idExists ? "Item Master updated successfully!" : "Item Master saved successfully!");
    });

    $("#saveLockerMasterBtn").on("click", function(e) {
        e.preventDefault();
        let idExists = $("#goldDirectoryId").val();
        saveGoldDirectory({
            lockerLocation: $("#lockerLocation").val(),
            lockerAddress: $("#lockerAddress").val()
        }, idExists ? "Locker Master updated successfully!" : "Locker Master saved successfully!");
    });

    $("#savePurityMasterBtn").on("click", function(e) {
        e.preventDefault();
        let idExists = $("#goldDirectoryId").val();
        saveGoldDirectory({
            purityName: $("#purityName").val(),
            purity: $("#purity").val(),
            itemPurityType: $("#itemPurityType").val()
        }, idExists ? "Purity Master updated successfully!" : "Purity Master saved successfully!");
    });

    // ====== INITIAL LOAD ======
    fetchGoldDirectoryData();

});
