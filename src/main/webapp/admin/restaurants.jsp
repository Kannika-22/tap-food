<%@page language="java" contentType="text/html;charset=UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tap.model.Restaurant"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Restaurants</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/table.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="main">

		<h1 class="page-title">Restaurant Management</h1>

		<div class="top-bar">

			<a class="btn"
				href="${pageContext.request.contextPath}/admin/addRestaurant.jsp">
				+ Add Restaurant </a>

		</div>

		<br>

		<table>

			<thead>

				<tr>

					<th>ID</th>

					<th>Name</th>

					<th>Cuisine</th>

					<th>Delivery</th>

					<th>Rating</th>

					<th>Status</th>

					<th>Menu</th>

					<th>Edit</th>

					<th>Delete</th>

				</tr>

			</thead>

			<tbody>

				<%
				List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");

				for (Restaurant r : restaurants) {
				%>

				<tr>

					<td><%=r.getRestaurantId()%></td>

					<td><%=r.getName()%></td>

					<td><%=r.getCuisineType()%></td>

					<td><%=r.getDeliveryTime()%> min</td>

					<td>⭐ <%=r.getRating()%></td>

					<td><%=r.getIsActive() ? "Active" : "Inactive"%></td>

					<td><a class="small-btn"
						href="menu1?restaurantId=<%=r.getRestaurantId()%>"> View Menu </a>

					</td>

					<td><a class="edit-btn"
						href="editRestaurant?id=<%=r.getRestaurantId()%>"> Edit </a></td>

					<td><a class="delete-btn"
						href="deleteRestaurant?id=<%=r.getRestaurantId()%>"
						onclick="return confirm('Delete Restaurant?')"> Delete </a></td>

				</tr>

				<%
				}
				%>

			</tbody>

		</table>

	</div>

</body>

</html>