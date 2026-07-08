<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Forgot Password</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/forgotPassword.css">

</head>

<body>

	<div class="background-circle circle1"></div>
	<div class="background-circle circle2"></div>
	<div class="background-circle circle3"></div>

	<div class="container">

		<!-- Left Panel -->

		<div class="left-panel">

			<div class="overlay"></div>

			<div class="content">

				<h1 class="logo">🍽 FoodHub</h1>

				<h2>Forgot Password?</h2>

				<p>Enter your registered email address to reset your password
					securely.</p>

				<a href="login.html" class="outline-btn"> Back To Login </a>

			</div>

		</div>

		<!-- Right Panel -->

		<div class="right-panel">

			<div class="forgot-card">

				<h2>Reset Password</h2>

				<p>Enter your registered email</p>

				<form action="forgotpassword" method="post">

					<div class="input-box">

						<label>Email</label> <input type="email" name="email"
							placeholder="Enter registered email" required>

					</div>

					<button class="reset-btn">Continue</button>

				</form>

				<div class="bottom-text">

					Remember Password? <a href="login.html"> Login </a>

				</div>

			</div>

		</div>

	</div>

</body>
</html>