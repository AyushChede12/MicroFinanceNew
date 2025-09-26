$(document).ready(function() {
	$("#form1").submit(function(e) {
		e.preventDefault();

		let username = $("#userName").val().trim();
		let password = $("#password").val().trim();

		if (!username || !password) {
			$("#errorMsg").text("Username and password are required").show();
			return;
		}

		$.ajax({
			url: 'api/loginPage/loginValidate',  // Make sure endpoint matches Spring Boot
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({ username: username, password: password }),
			success: function(response) {
				// Assuming ApiResponse has integer status and message
				if (response.status === 'OK') {
					alert(response.data.username);
					sessionStorage.setItem("username", response.data.username);
					window.location.href = 'openDashboard'; // replace with your homepage
					
				} else {
					$("#errorMsg").text(response.message).show();
				}
			},
			error: function(xhr) {
				if (xhr.status === 401) {
					$("#errorMsg").text("Invalid username or password").show();
				} else {
					$("#errorMsg").text("Something went wrong. Try again!").show();
				}
			}
		});
	});
	
	

	/*$(document).ready(function() {
		$("#form1").submit(function(e) {
			e.preventDefault();

			let userData = {
				username: $("#username").val(),
				password: $("#password").val()
			};

			$.ajax({
				url: "api/loginPage/loginValidate",
				type: "POST",
				contentType: "application/json",
				data: JSON.stringify(userData),
				success: function(response) {
					if (response.status === "OK") {
						// Save username in sessionStorage
						sessionStorage.setItem("username", response.data.username);

						// Redirect to dashboard
						window.location.href = "/openDashboard";
					} else {
						alert(response.message);
					}
				},
				error: function() {
					alert("Login failed!");
				}
			});
		});
	});*/
});
