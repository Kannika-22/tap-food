<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page import="com.tap.model.User"%>

<%
User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit User</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/form.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="main">

		<h1 class="page-title">Edit User</h1>

		<div class="form-container">

			<form action="${pageContext.request.contextPath}/editUser"
				method="post">

				<input type="hidden" name="userId" value="<%=user.getUserId()%>">

				<label>Name</label> <input type="text" name="userName"
					value="<%=user.getUserName()%>" required> <label>Email</label>

				<input type="email" name="email" value="<%=user.getEmail()%>"
					required> <label>Password</label> <input type="text"
					name="password" value="<%=user.getPassword()%>" required> <label>Address</label>

				<textarea name="address" rows="3"><%=user.getAddress()%></textarea>

				<br>
				<br>

				<button class="btn">Update User</button>

				<a class="cancel-btn"
					href="${pageContext.request.contextPath}/users"> Cancel </a>

			</form>

		</div>

	</div>

</body>

</html>