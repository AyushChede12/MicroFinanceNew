//Designation Dropdown
function DesignationDropdown() {
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: 'getDesignationList', // Update the URL if necessary
        async: true, // Correct spelling
        success: function(data) {
            console.log(data); // Debug the response
            var appenddata1 = "<option value=''>Select</option>";
            for (var i = 0; i < data.length; i++) {
                appenddata1 += "<option value='" + data[i].designationName + "'>" + data[i].designationName + "</option>";
            }
            $("#designation").html(appenddata1); // Clear and populate
        },
        error: function() {
            alert("Failed to load designations");
        }
    });   
}

//Department Dropdown
function DepartmentDropdown() {
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: 'getDepartmentList', // Update the URL if necessary
        async: true, // Correct spelling
        success: function(data) {
            console.log(data); // Debug the response
            var appenddata1 = "<option value=''>Select</option>";
            for (var i = 0; i < data.length; i++) {
                appenddata1 += "<option value='" + data[i].departmentName + "'>" + data[i].departmentName + "</option>";
            }
            $("#department").html(appenddata1); // Clear and populate
        },
        error: function() {
            alert("Failed to load departments");
        }
    });   
}

//BranchName Dropdown
function BranchNameDropdown() {
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: 'getAllBranchModule', // Update the URL if necessary
        async: true, // Correct spelling
        success: function(data) {
            console.log(data); // Debug the response
            var appenddata1 = "<option value=''>Select</option>";
            for (var i = 0; i < data.length; i++) {
                appenddata1 += "<option value='" + data[i].branchName + "'>" + data[i].branchName + "</option>";
            }
            $("#branchName").html(appenddata1); // Clear and populate
        },
        error: function() {
            alert("Failed to load departments");
        }
    });   
}

//Relation Dropdown
function RelationDropdown() {
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: 'getAllRelativeModule', // Update the URL if necessary
        async: true, // Correct spelling
        success: function(data) {
            console.log(data); // Debug the response
            var appenddata1 = "<option value=''>Select</option>";
            for (var i = 0; i < data.length; i++) {
                appenddata1 += "<option value='" + data[i].relation + "'>" + data[i].relation + "</option>";
            }
            $("#relationWithNominee").html(appenddata1); // Clear and populate
            $("#relationToApplicant").html(appenddata1); // Clear and populate
        },
        error: function() {
            alert("Failed to load departments");
        }
    });   
}

