<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>FoodHub | Admin Dashboard</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="main">

		<h1 class="page-title">Dashboard</h1>

		<!-- Statistics -->

		<div class="cards">

			<div class="card">

				<h4>Total Restaurants</h4>

				<h2>${restaurantCount}</h2>

				<p>Registered Restaurants</p>

			</div>

			<div class="card">

				<h4>Total Users</h4>

				<h2>${userCount}</h2>

				<p>Registered Customers</p>

			</div>

			<div class="card">

				<h4>Total Menu Items</h4>

				<h2>${menuCount}</h2>

				<p>Available Food Items</p>

			</div>

			<div class="card">

				<h4>Total Orders</h4>

				<h2>${orderCount}</h2>

				<p>Orders Received</p>

			</div>

		</div>

		<br>
		<br>

		<!-- Quick Actions -->

		<h2>Quick Actions</h2>

		<br>

		<div class="cards">

			<div class="card">

				<h4>Restaurant Management</h4>

				<p>Add, Edit and Delete Restaurants.</p>

				<br> <a class="btn"
					href="${pageContext.request.contextPath}/restaurants"> Open </a>

			</div>

			<div class="card">

				<h4>User Management</h4>

				<p>Manage all registered users.</p>

				<br> <a class="btn"
					href="${pageContext.request.contextPath}/users"> Open </a>

			</div>

			<div class="card">

				<h4>Order Management</h4>

				<p>Track every customer order.</p>

				<br> <a class="btn"
					href="${pageContext.request.contextPath}/orders1"> Open </a>

			</div>

			<div class="card">

				<h4>Menu Management</h4>

				<p>Manage all menu items.</p>

				<br> <a class="btn"
					href="${pageContext.request.contextPath}/restaurants"> Open </a>

			</div>

		</div>

	</div>

</body>

</html>