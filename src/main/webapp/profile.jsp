<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>

<%
User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>FoodHub | Profile</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/profile.css">

</head>

<body>

	<nav>

		<a href="home" class="logo">🍽 FoodHub</a>

		<ul>

			<li><a href="home">Home</a></li>

			<li><a href="home">Restaurants</a></li>

			<li><a href="orders">Orders</a></li>

			<li><a href="callcartservlet">Cart</a></li>

		</ul>

	</nav>

	<%
	String successMessage = (String) request.getAttribute("successMessage");
	%>

	<%
	if (successMessage != null) {
	%>

	<div class="success-message">

		<%=successMessage%>

	</div>

	<%
	}
	%>

	<section class="profile-container">

		<div class="profile-card">

			<div class="avatar">

				<%=user.getUserName().substring(0, 1).toUpperCase()%>

			</div>

			<h2>

				<%=user.getUserName()%>

			</h2>

			<span class="role"> <%=user.getRole()%>

			</span>

		</div>

		<div class="details-card">

			<h3>Account Information</h3>

			<div class="row">

				<label>Username</label> <span><%=user.getUserName()%></span>

			</div>

			<div class="row">

				<label>Email</label> <span><%=user.getEmail()%></span>

			</div>

			<div class="row">

				<label>Address</label> <span><%=user.getAddress()%></span>

			</div>

			<div class="row">

				<label>Role</label> <span><%=user.getRole()%></span>

			</div>

			<div class="row">

				<label>Member Since</label> <span><%=user.getCreatedDate()%></span>

			</div>

			<div class="row">

				<label>Last Login</label> <span><%=user.getLastLoginDate()%></span>

			</div>

			<div class="buttons">

				<a href="editProfile" class="edit-btn"> Edit Profile </a> <a
					href="<%=request.getContextPath()%>/logout" class="logout-btn">Logout</a>

			</div>

		</div>

	</section>

</body>

</html>