$(document).ready(function() {

	loadUserTable();  // Load table on page load

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

		$.ajax({
			url: "api/userCreation/saveUser",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(userData),

			success: function(res) {
				alert(res);
				$("#formid")[0].reset();
				$("#toggle-member-status").prop("checked", true);

				loadUserTable(); // reload table after save
			},

			error: function(xhr) {
				console.error(xhr);
				alert("❌ Error saving user!");
			}
		});
	});


	// 🚀 Load all users (WORKS WITH YOUR BACKEND)
	function loadUserTable() {
		$.ajax({
			url: "api/userCreation/getAllUsers",
			type: "GET",
			dataType: "json",

			success: function(users) {
				let rows = "";

				if (Array.isArray(users) && users.length > 0) {

					users.forEach(function(user, index) {
						rows += `
                            <tr>
                                <td>${index + 1}</td>
                                <td>${user.userId}</td>
                                <td>${user.fullName}</td>
                                <td>${user.emailId}</td>
                                <td>${user.contactNumber}</td>
                                <td>${user.singInBranch}</td>
                                <td>${user.pastDate}</td>
                                <td>${user.rePrint}</td>
                                <td>${user.deleteAccess}</td>
								<!-- ACTION BUTTONS -->
								                           <td class="d-flex" style="gap: 0.7rem;">
								                               <button class="iconbutton" onclick="deleteUser('${user.id}')" title="Delete">
								                                   <i class="fa-solid fa-trash text-danger"></i>
								                               </button>
															   <button class="iconbutton" onclick="editUser('${user.id}')" title="Edit">
															         <i class="fa-solid fa-pen-to-square text-success"></i>
															     </button>
								                           </td>
                            </tr>
                        `;
					});

				} else {
					rows = "<tr><td colspan='10'>No users found</td></tr>";
				}

				$("#userTable tbody").html(rows);
			},

			error: function(xhr) {
				console.error(xhr);
				alert("❌ Error loading user table!");
			}
		});
	}

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


