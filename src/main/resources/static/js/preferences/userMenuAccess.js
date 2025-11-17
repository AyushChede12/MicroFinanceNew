$(document).ready(function() {
	// Fetch all users on page load
	$.ajax({
		url: "api/userCreation/getAllUsers", // your GET API
		type: "GET",
		contentType: "application/json",
		success: function(users) {
			console.log("Fetched users:", users);
			var userSelect = $("#userName");
			userSelect.empty(); // clear existing options
			userSelect.append('<option value="">Select User</option>'); // default option

			// Populate dropdown with userIds
			users.forEach(function(user) {
				userSelect.append('<option value="' + user.userId + '">' + user.userId + '</option>');
			});
		},
		error: function(xhr) {
			console.error("Error fetching users:", xhr);
			alert("Failed to load users!");
		}
	});
});


function retriveINCheckBox() {
	alert("Function called");
	const userName = document.getElementById("userName").value;
	alert(userName);

	const obj = {
		userName: userName
	};

	$.ajax({
		type: "POST", // Use POST to send JSON body
		contentType: "application/json",
		url: "api/userCreation/findTheUserIdByUserMasterService",
		data: JSON.stringify(obj),
		async: false, // fixed typo
		success: function(data) {
			if (!data) {
				alert("No data found for this user");
				return;
			}

			alert("Success");

			// Split the service string into an array
			var serviceArray = data.service ? data.service.split(',') : [];

			// Function to set checkboxes based on serviceArray
			function setCheckbox(checkboxId, serviceName) {
				var checkbox = document.getElementById(checkboxId);
				if (checkbox) {
					checkbox.checked = serviceArray.includes(serviceName);
				}
			}

			// Set checkboxes based on serviceArray
			alert(setCheckbox("User_Create", "User Create"));
			setCheckbox("User_Menu_Access", "User Menu Access");
			setCheckbox("User_Manage", "User Manage");
			setCheckbox("Company_Master", "Company Master");
			setCheckbox("Item_Master", "Item Master");
			setCheckbox("Stock_Entry", "Stock Entry");
			setCheckbox("Entry_Report", "Entry Report");
			setCheckbox("Generate_DM_for_Client", "Generate DM for Client");
			setCheckbox("Client_DM_Report", "Client DM Report");
			setCheckbox("Generate_DM_for_Factory", "Generate DM for Factory");
			setCheckbox("Factory_DM_Report", "Factory DM Report");
			setCheckbox("Stock_Statement", "Stock Statement");
			setCheckbox("Factory_Stock_Statement", "Factory Stock Statement");
			setCheckbox("Factory_IN_DMs", "Factory IN DMs");
			setCheckbox("Generate_Factory_OUT", "Generate Factory OUT");
			setCheckbox("Factory_OUT_Report", "Factory OUT Report");
		},
		error: function() {
			alert("Device control failed");
		}
	});
}
