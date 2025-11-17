	$(document).ready(function() {
	    $("#saveBtn").click(function(e) {
	        e.preventDefault();
			
	
	        var userData = {
	            userId: $("#UserId").val(),
	            password: $("#password").val(),
	            fullName: $("#fullName").val(),
	            emailId: $("#emailId").val(),
	            contactNumber: $("#contactNumber").val(),
	            singInBranch: $("#branchName1").val(),
	            pastDate: $("#pastDate").val(),
	            rePrint: $("#rePrint").val(),
	            deleteAccess: $("#deleteAccess").val(),
	            userStatus: $("#toggle-member-status").is(":checked") ? "Active" : "Inactive"
	        };
	
	        // ✅ Validation
	        if (!userData.userId || !userData.password || !userData.fullName || !userData.singInBranch || !userData.pastDate || !userData.rePrint || !userData.deleteAccess) {
	            alert(" Please fill all required fields!");
	            return;
	        }
	
	        $.ajax({
	            url: "api/userCreation/saveUser",
	            type: "POST",
	            contentType: "application/json",
	            data: JSON.stringify(userData),
	            success: function(res) {
	                alert(res);
	                $("#formid")[0].reset();
	                $("#toggle-member-status").prop("checked", true);
	            },
	            error: function(xhr) {
	                console.error(xhr);
	                alert("❌ Error saving user!");
	            }
	        });
	    });
		
		$.ajax({
				url: "api/preference/getAllBranchModule", // Add base path if needed like /api/preference/getAllBranchModule
				type: "GET",
				success: function(response) {
					if (response.status == "FOUND") {
						const branchList = response.data;
						$("#branchName1").empty(); // Clear existing options
						$("#branchName1").append("<option value=''>-- Select Branch --</option>");
						for (let i = 0; i < branchList.length; i++) {
							let branch = branchList[i];
							let option = `<option value="${branch.branchName}">${branch.branchName}</option>`;
							$("#branchName1").append(option);

						}
					} else {
						alert("Error: " + response.message);
					}
				},
				error: function(xhr) {
					console.error("Error loading branches:", xhr.responseText);
					alert("Failed to load dropdown data.");
				}
			});
	});
