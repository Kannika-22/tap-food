<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Reset Password</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/resetPassword.css">

</head>

<body>

	<div class="background-circle circle1"></div>
	<div class="background-circle circle2"></div>
	<div class="background-circle circle3"></div>

	<div class="container">

		<div class="left-panel">

			<div class="overlay"></div>

			<div class="content">

				<h1 class="logo">🍽 FoodHub</h1>

				<h2>Create New Password</h2>

				<p>Your new password must be different from the old password.</p>

			</div>

		</div>

		<div class="right-panel">

			<div class="reset-card">

				<h2>Reset Password</h2>

				<p>Enter your new password below.</p>

				<form action="resetpassword" method="post">

					<div class="input-box">

						<label> New Password </label> <input type="password"
							name="newPassword" placeholder="Enter New Password" required>

					</div>

					<div class="input-box">

						<label> Confirm Password </label> <input type="password"
							name="confirmPassword" placeholder="Confirm Password" required>

					</div>

					<button class="reset-btn">Update Password</button>

				</form>

			</div>

		</div>

	</div>

</body>

</html>