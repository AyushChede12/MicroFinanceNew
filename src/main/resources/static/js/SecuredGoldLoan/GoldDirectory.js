$(document).ready(function() {

    function saveGoldDirectory(newData, successMsg) {
        let id = $("#goldDirectoryId").val(); // hidden field

        // Merge all current values
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
                    // First save → set ID
                    if (!id) {
                        $("#goldDirectoryId").val(response.data.id);
                    }
                    alert(successMsg);
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

    // ======= Button Events =======
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
});
