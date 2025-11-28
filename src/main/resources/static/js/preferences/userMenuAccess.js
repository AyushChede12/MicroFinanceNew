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
	const userName = document.getElementById("userName").value;
	alert(userName);

	const obj = {
		userName: userName
	};
	alert(obj.userName);

	$
		.ajax({
			type: "POST",
			contentType: "application/json",
			url: 'api/userCreation/findTheUserIdByUserMasterService',
			data: JSON.stringify(obj),
			asynch: false,
			success: function(data) {
				alert("success");

				// Split the service string into an array
				var serviceArray = data.service.split(',');

				// Function to set checkboxes based on serviceArray
				function setCheckbox(checkboxId, serviceName) {
					var checkbox = document.getElementById(checkboxId);
					checkbox.checked = serviceArray
						.includes(serviceName);
				}

				// Set checkboxes based on serviceArray
				setCheckbox("Company_Administration", "Company Administration");
				setCheckbox("Financial_Year", "Financial Year");
				setCheckbox("myAddCustomer", "Add Customer");
				setCheckbox("myAddCustomerKyc", "Add Customer KYC");
				setCheckbox("myTransferShares", "Transfer Shares");
				setCheckbox("myUnallotedShares", "Unallotted Shares");

			},
			error: function() {
				alert("Device control failed");
			}
		});
}

function setUserName() {
	const select = document.getElementById("userName");
	$.ajax({
		type: "get",
		contentType: "application/json",
		url: 'api/userCreation/getAllUsers',
		asynch: false,
		success: function(data) {
			data.forEach(value => {
				const option = document.createElement('option');
				option.setAttribute('value', value.userName);
				option.innerHTML = value.userName;
				select.appendChild(option);
			});
		},
		error: function() {
			alert("Device control failed");
		}
	});
}

function submitUserServiceMap() {
	document.userToServiceMap.submit();
	return true;
}


function loadSidebar(session) {
	console.log("Session: ", session);

	// Example sidebar elements
	const customerManagement = document.getElementById('customerManagement');

	const addCustomer = document.getElementById('addCustomer');
	const addCustomerKyc = document.getElementById('addCustomerKyc');
	const transferShares = document.getElementById('transferShares');
	const unalottedShares = document.getElementById('unalottedShares');

	// Check if session is null or empty
	if (!session || session.length === 0) {
		console.log("Session is null or empty.");
		alert("Session is null or empty.");
		return;
	}

	// Initially hide all elements
	preferences.style.display = 'none';
	customerManagement.style.display = 'none';
	customerShareholding.style.display = 'none';
	companyAdministration.style.display = 'none';
	financialYear.style.display = 'none';
	addCustomer.style.display = 'none';
	addCustomerKyc.style.display = 'none';
	transferShares.style.display = 'none';
	unalottedShares.style.display = 'none';

	if (session.includes("Company Administration")) {
		admin.style.display = 'block';
		UserCreate.style.display = 'block';
	}

	if (session.includes("Financial Year")) {
		admin.style.display = 'block';
		UserMenuAccess.style.display = 'block';
	}

	if (session.includes("Add Customer")) {
		admin.style.display = 'block';
		UserManage.style.display = 'block';
	}

	if (session.includes("Add Customer KYC")) {
		masters.style.display = 'block';
		itemMaster.style.display = 'block';
	}

	if (session.includes("Transfer Shares")) {
		masters.style.display = 'block';
		companyMaster.style.display = 'block';
	}

	if (session.includes("Unalloted Shares")) {
		entry.style.display = 'block';
		stockEntry.style.display = 'block';
	}
}