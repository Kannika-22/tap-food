<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="com.tap.model.User"%>

<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("login.html");
	return;
}

User admin = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>FoodHub | Edit Profile</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/profileForm.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="content">

		<section class="profile-section">

			<div class="profile-card">

				<div class="avatar">

					<%=admin.getUserName().substring(0, 1).toUpperCase()%>

				</div>

				<h2>Edit Profile</h2>

				<p>Update your administrator information.</p>

				<form action="${pageContext.request.contextPath}/adminUpdateProfile"
					method="post">

					<input type="hidden" name="userId" value="<%=admin.getUserId()%>">

					<div class="input-group">

						<label>Username</label> <input type="text" name="userName"
							value="<%=admin.getUserName()%>" required>

					</div>

					<div class="input-group">

						<label>Email</label> <input type="email" name="email"
							value="<%=admin.getEmail()%>" required>

					</div>

					<div class="input-group">

						<label>Address</label>

						<textarea name="address" rows="4" required><%=admin.getAddress()%></textarea>

					</div>

					<div class="input-group">

						<label>Role</label> <input type="text"
							value="<%=admin.getRole()%>" readonly>

					</div>

					<div class="button-group">

						<button type="submit" class="save-btn">Update Profile</button>

						<a href="${pageContext.request.contextPath}/adminProfile"
							class="cancel-btn"> Cancel </a>

					</div>

				</form>

			</div>

		</section>

	</div>

</body>

</html>