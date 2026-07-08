<%@page import="com.tap.model.Restaurant"%>

<%
Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Restaurant</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/form.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="main">

		<h1 class="page-title">Edit Restaurant</h1>

		<div class="form-container">

			<form action="${pageContext.request.contextPath}/editRestaurant"
				method="post">

				<input type="hidden" name="restaurantId"
					value="<%=restaurant.getRestaurantId()%>"> <label>Restaurant
					Name</label> <input type="text" name="name"
					value="<%=restaurant.getName()%>" required> <label>Cuisine
					Type</label> <input type="text" name="cuisineType"
					value="<%=restaurant.getCuisineType()%>" required> <label>Delivery
					Time</label> <input type="number" name="deliveryTime"
					value="<%=restaurant.getDeliveryTime()%>" required> <label>Address</label>

				<textarea name="address" rows="3"><%=restaurant.getAddress()%></textarea>

				<label>Admin User ID</label> <input type="number" name="adminUserId"
					value="<%=restaurant.getAdminUserId()%>" required> <label>Rating</label>

				<input type="number" step="0.1" name="rating"
					value="<%=restaurant.getRating()%>" required> <label>Status</label>

				<select name="isActive">

					<option value="true" <%=restaurant.getIsActive() ? "selected" : ""%>>

						Active</option>

					<option value="false" <%=!restaurant.getIsActive() ? "selected" : ""%>>

						Inactive</option>

				</select> <label>Image Path</label> <input type="text" name="imagePath"
					value="<%=restaurant.getImagePath()%>"> <br>
				<br>

				<button class="btn">Update Restaurant</button>

				<a class="cancel-btn"
					href="${pageContext.request.contextPath}/restaurants"> Cancel </a>

			</form>

		</div>

	</div>

</body>

</html>