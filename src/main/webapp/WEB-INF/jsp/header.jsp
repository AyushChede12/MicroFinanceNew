<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header id="header" class="header fixed-top d-flex align-items-center">
		<!-- Logo Section -->
		<div class="d-flex align-items-center justify-content-between">
			<a href="/" class="logo d-flex align-items-center">
				<p id="bindUserName"
					style="color: white; margin: 0; font-size: 25px; font-weight: 600; margin-left: 10px;">
				</p>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>

		<!-- Search Bar -->
		<!-- <div class="search-bar">
			<form action="" method="POST"
				class="search-form d-flex align-items-center">
				<input type="text" name="query" id="" placeholder="Search..."
					title="Enter Search Keyword" />
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div> -->
	</header>
	<script src="./js/adminscript.js"></script>
	<script src="./js/login.js"></script>

	<script>
		$(document).ready(function() {
			// ✅ Get username from sessionStorage
			let username = sessionStorage.getItem("username");

			if (username) {
				$("#bindUserName").text(username);
			} else {
				// ❌ If user tries to open dashboard without login, go back to login page
				window.location.href = "index";
			}
		});
	</script>

</body>
</html>