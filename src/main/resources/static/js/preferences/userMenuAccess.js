
// Fetch all users on page load
function setUserName() {
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

}




function retriveINCheckBox() {
	const userName = document.getElementById("userName").value;

	$.ajax({
		type: "POST",
		url: 'api/userCreation/findTheUserIdByUserMasterService',
		contentType: "application/json",
		data: JSON.stringify({ userName: userName }),
		success: function(data) {

			if (!data || !data.service) {
				alert("No services found!");
				return;
			}

			const serviceArray = data.service.split(",");

			// STEP 1 ➜ Uncheck all checkboxes
			$("input[type='checkbox'][name='service']").prop("checked", false);

			// STEP 2 ➜ Check allowed services
			serviceArray.forEach(s => {
				const id = s.replace(/\s+/g, "_").trim();
				$("#" + id).prop("checked", true);
			});

			// STEP 3 ➜ Collect selected services
			const selectedServices = [];
			$("input[name='service']:checked").each(function() {
				selectedServices.push($(this).val());
			});

			// STEP 4 ➜ Call submit function WITH parameter
			submitUserServiceMap(selectedServices);
		},
		error: function() {
			alert("Device control failed");
		}
	});
}


function submitUserServiceMap() {

	const userName = $("#userName").val();
	const selectedServices = [];
	$("input[name='service']:checked").each(function() {
		selectedServices.push($(this).val());
	});
	alert(selectedServices);
	$.ajax({
		type: "POST",
		url: "api/userCreation/userToServiceMap",
		data: {
			userName: userName,
			service: selectedServices.toString()
		},
		success: function() {
			alert("Access Updated Successfully!");
		},
		error: function() {
			alert("Failed To Save Access!");
		}
	});
}



/*function loadSidebar(session) {
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
}*/

function loadSidebar(session) {

	if (!session || session.length === 0) {
		console.log("No Session Data Found");
		return;
	}

	// Hide everything first
	$(".sidebar-nav li, .nav-content li").hide();

	// PREFERENCES (NEW)
	if (session.includes("Company Administration")) $("#myCompanyAdministration").show();
	if (session.includes("Financial Year")) $("#myFinancialYear").show();
	if (session.includes("Create Branch")) $("#myCreateBranch").show();
	if (session.includes("Relative Module")) $("#myRelativeModule").show();
	if (session.includes("Category/Cast Module")) $("#myCategoryCastModule").show();
	if (session.includes("Executive Promoter")) $("#myExecutivePromoter").show();
	if (session.includes("User Creation")) $("#myUserCreation").show();
	if (session.includes("User Menu Access")) $("#myUserMenuAccess").show();

	// CUSTOMER MANAGEMENT (NEW)
	if (session.includes("Add Customer")) $("#myAddCustomerMenu").show();
	if (session.includes("Add Customer KYC")) $("#myAddCustomerKycMenu").show();
	if (session.includes("Customer Summary")) $("#myCustomerSummaryMenu").show();
	if (session.includes("Customer Report")) $("#myCustomerReportMenu").show();
	if (session.includes("Search Customer")) $("#mySearchCustomerMenu").show();

	// CUSTOMER SHAREHOLDING (NEW)
	if (session.includes("Transfer Sharesr")) $("#myTransferShares").show();
	if (session.includes("Unallotted Shares")) $("#myUnallotedShares").show();
	if (session.includes("Generate Share Certificate ")) $("#myAddCustomer").show();
	if (session.includes("Regenerate DNO")) $("#myRegenerateDNO").show();


}
