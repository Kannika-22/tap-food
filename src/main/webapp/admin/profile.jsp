<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="com.tap.model.User"%>

<%
User admin = (User) request.getAttribute("admin");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>FoodHub | Admin Profile</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/profile.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="content">

		<section class="profile-container">

			<div class="profile-card">

				<div class="avatar">

					<%=admin.getUserName().substring(0, 1).toUpperCase()%>

				</div>

				<h2><%=admin.getUserName()%></h2>

				<span class="role"> <%=admin.getRole()%>

				</span>

			</div>

			<div class="details-card">

				<h3>Administrator Information</h3>

				<div class="row">

					<label>Username</label> <span><%=admin.getUserName()%></span>

				</div>

				<div class="row">

					<label>Email</label> <span><%=admin.getEmail()%></span>

				</div>

				<div class="row">

					<label>Address</label> <span><%=admin.getAddress()%></span>

				</div>

				<div class="row">

					<label>Role</label> <span><%=admin.getRole()%></span>

				</div>

				<div class="row">

					<label>Created Date</label> <span><%=admin.getCreatedDate()%></span>

				</div>

				<div class="row">

					<label>Last Login</label> <span><%=admin.getLastLoginDate()%></span>

				</div>

				<div class="buttons">

					<a class="edit-btn"
						href="${pageContext.request.contextPath}/adminEditProfile">

						Edit Profile </a> <a href="logout" class="logout-btn"> Logout </a>

				</div>

			</div>

		</section>

	</div>

</body>

</html>