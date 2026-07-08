<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@page import="java.util.List"%>
<%@page import="com.tap.model.User"%>

<%
List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Users</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/table.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="main">

		<h1 class="page-title">User Management</h1>

		<table>

			<thead>

				<tr>

					<th>ID</th>

					<th>Name</th>

					<th>Email</th>

					<th>Role</th>

					<th>Address</th>

					<th>Last Login</th>

					<th>Edit</th>

					<th>Delete</th>

				</tr>

			</thead>

			<tbody>

				<%
				for (User user : users) {
				%>

				<tr>

					<td><%=user.getUserId()%></td>

					<td><%=user.getUserName()%></td>

					<td><%=user.getEmail()%></td>

					<td><%=user.getRole()%></td>

					<td><%=user.getAddress()%></td>

					<td><%=user.getLastLoginDate()%></td>

					<td><a class="edit-btn"
						href="editUser?id=<%=user.getUserId()%>"> Edit </a></td>

					<td><a class="delete-btn"
						href="deleteUser?id=<%=user.getUserId()%>"
						onclick="return confirm('Delete this user?')"> Delete </a></td>

				</tr>

				<%
				}
				%>

			</tbody>

		</table>

	</div>

</body>

</html>