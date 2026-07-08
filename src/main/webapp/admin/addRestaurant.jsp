<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Add Restaurant</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/form.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="main">

		<h1 class="page-title">Add Restaurant</h1>

		<div class="form-container">

			<form action="${pageContext.request.contextPath}/addRestaurant"
				method="post">

				<label>Restaurant Name</label> <input type="text" name="name"
					required> <label>Cuisine Type</label> <input type="text"
					name="cuisineType" required> <label>Delivery Time
					(Minutes)</label> <input type="number" name="deliveryTime" required>

				<label>Address</label>

				<textarea name="address" rows="3" required></textarea>

				<label>Admin User ID</label> <input type="number" name="adminUserId"
					required> <label>Rating</label> <input type="number"
					step="0.1" name="rating" required> <label>Status</label> <select
					name="isActive">

					<option value="true">Active</option>

					<option value="false">Inactive</option>

				</select> <label>Image Path</label> <input type="text" name="imagePath"
					placeholder="images/kfc.jpg"> <br>
				<br>

				<button class="btn" type="submit">Save Restaurant</button>

				<a class="cancel-btn"
					href="${pageContext.request.contextPath}/restaurants"> Cancel </a>

			</form>

		</div>

	</div>

</body>

</html>