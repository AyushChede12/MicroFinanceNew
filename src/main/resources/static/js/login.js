/*$(document).ready(function() {
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
	
	
});
*/
$(document).ready(function() {
	$("#form1").submit(function(e) {
		e.preventDefault();

		let data = {
			userId: $("#userName").val(),
			password: $("#password").val()
		};

		$.ajax({
			url: "loginValidate",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(data),
			success: function(res) {
				if (res.status === "success") {
					window.location.href = "/openDashboard";
				} else {
					$("#errorMsg").html(res.message);
				}
			},
			error: function() {
				$("#errorMsg").html("Something went wrong, try again!");
			}
		});
	});

});
