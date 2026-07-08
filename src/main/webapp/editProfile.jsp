<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>

<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("login.html");
	return;
}

User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Edit Profile | FoodHub</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/editProfile.css">

</head>

<body>

	<!-- ================= NAVBAR ================= -->

	<nav>

		<a href="home" class="logo">🍽 FoodHub</a>

		<ul>

			<li><a href="home">Home</a></li>

			<li><a href="home">Restaurants</a></li>

			<li><a href="orders">Orders</a></li>

			<li><a href="callcartservlet">Cart</a></li>

		</ul>

	</nav>

	<!-- ================= PROFILE ================= -->

	<section class="profile-section">

		<div class="profile-card">

			<div class="avatar">

				<%=user.getUserName().substring(0, 1).toUpperCase()%>

			</div>

			<h2>Edit Profile</h2>

			<p>Update your personal information.</p>

			<form action="updateProfile" method="post">

				<input type="hidden" name="userId" value="<%=user.getUserId()%>">

				<!-- Username -->

				<div class="input-group">

					<label>Username</label> <input type="text" name="userName"
						value="<%=user.getUserName()%>" required>

				</div>

				<!-- Email -->

				<div class="input-group">

					<label>Email</label> <input type="email" name="email"
						value="<%=user.getEmail()%>" required>

				</div>

				<!-- Address -->

				<div class="input-group">

					<label>Address</label>

					<textarea name="address" rows="4" required><%=user.getAddress()%></textarea>

				</div>

				<!-- Role -->

				<div class="input-group">

					<label>Role</label> <input type="text" value="<%=user.getRole()%>"
						readonly>

				</div>

				<div class="button-group">

					<button type="submit" class="save-btn">Update Profile</button>

					<a href="profile" class="cancel-btn"> Cancel </a>

				</div>

			</form>

		</div>

	</section>

</body>

</html>