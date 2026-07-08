<%@page language="java" contentType="text/html;charset=UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tap.model.Menu"%>
<%@page import="com.tap.model.Restaurant"%>

<%
Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");

List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Restaurant Menu</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/table.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="main">

		<h1 class="page-title">

			<%=restaurant.getName()%>
			Menu

		</h1>

		<div class="top-bar">

			<a class="btn"
				href="${pageContext.request.contextPath}/admin/addMenu.jsp?restaurantId=<%=restaurant.getRestaurantId()%>">

				+ Add Menu </a>

		</div>

		<br>

		<table>

			<thead>

				<tr>

					<th>ID</th>

					<th>Image</th>

					<th>Item</th>

					<th>Description</th>

					<th>Category</th>

					<th>Price</th>

					<th>Status</th>

					<th>Edit</th>

					<th>Delete</th>

				</tr>

			</thead>

			<tbody>

				<%
				for (Menu menu : menuList) {
				%>

				<tr>

					<td><%=menu.getMenuId()%></td>

					<td><img src="<%=menu.getImagePath()%>" width="70" height="60"
						style="border-radius: 10px; object-fit: cover;"></td>

					<td><%=menu.getItemName()%></td>

					<td><%=menu.getDescription()%></td>

					<td><%=menu.getCategory()%></td>

					<td>₹ <%=menu.getPrice()%>

					</td>

					<td><%=menu.isAvailable() ? "Available" : "Unavailable"%></td>

					<td><a class="edit-btn"
						href="editMenu?id=<%=menu.getMenuId()%>"> Edit </a></td>

					<td><a class="delete-btn"
						href="deleteMenu?id=<%=menu.getMenuId()%>"
						onclick="return confirm('Delete Menu Item?')"> Delete </a></td>

				</tr>

				<%
				}
				%>

			</tbody>

		</table>

	</div>

</body>

</html>