
<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("login.html");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tap.model.OrderTable"%>
<%@page import="com.tap.model.Restaurant"%>
<%@page import="com.tap.model.Menu"%>

<%
List<OrderTable> orders = (List<OrderTable>) request.getAttribute("orders");

List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");

List<Menu> menus = (List<Menu>) request.getAttribute("menus");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | My Orders</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/orders.css">

</head>

<body>

	<!-- ================= NAVBAR ================= -->

	<nav>

		<a href="home.jsp" class="logo">🍽 FoodHub</a>

		<ul>
			<li><a href="home.jsp">Home</a></li>
			<li><a href="home">Restaurants</a></li>
			<li><a href="orders">Orders</a></li>
			<li><a href="cart.jsp">Cart</a></li>
		</ul>

		<div class="right-nav">

			<form action="search" method="get" class="search">

				<input type="search" name="keyword"
					placeholder="Search restaurants or food..." autocomplete="off"
					spellcheck="false" autocorrect="off" autocapitalize="off" required>

				<button type="submit">🔍</button>

			</form>

			<a href="profile" class="nav-button">👤 Profile</a>

		</div>

	</nav>

	<!-- ================= HERO ================= -->

	<section class="hero">

		<h1>My Orders</h1>

		<p>View all your recent food orders and track their current
			status.</p>

	</section>

	<!-- ================= ORDERS ================= -->

	<section class="orders-container">

		<%
		if (orders != null && !orders.isEmpty()) {

			for (int i = 0; i < orders.size(); i++) {

				OrderTable order = orders.get(i);

				Restaurant restaurant = restaurants.get(i);

				Menu menu = menus.get(i);
		%>

		<div class="order-card">

			<div class="restaurant-image">

				<img src="<%=menu.getImagePath()%>" alt="<%=restaurant.getName()%>">

			</div>

			<div class="order-content">

				<div class="top-row">

					<div>

						<h2><%=menu.getItemName()%></h2>


						<p class="cuisine">
							<%=menu.getCategory()%>
						</p>

					</div>

					<div class="status">

						<%
						String status = order.getStatus();

						if (status.equalsIgnoreCase("pending")) {
						%>

						<span class="pending"> Pending </span>

						<%
						} else if (status.equalsIgnoreCase("preparing")) {
						%>

						<span class="preparing"> Preparing </span>

						<%
						} else if (status.equalsIgnoreCase("delivered")) {
						%>

						<span class="delivered"> Delivered </span>

						<%
						} else {
						%>

						<span class="cancelled"> Cancelled </span>

						<%
						}
						%>

					</div>

				</div>

				<div class="restaurant-details">

					<p>
						🍽 Restaurant :
						<%=restaurant.getName()%>
					</p>

					<p>
						📝
						<%=menu.getDescription()%>
					</p>

					<p>
						📅
						<%=new java.text.SimpleDateFormat("MMM dd, yyyy").format(order.getOrderDate())%>
					</p>

				</div>

				<div class="bottom-row">

					<div class="amount">

						₹<%=order.getTotalAmount()%>

					</div>

					<div class="order-actions">

						<a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>"
							class="order-btn"> Order Again </a>

					</div>

				</div>

			</div>

		</div>

		<%
		}
		} else {
		%>

		<div class="empty-orders">

			<div class="empty-icon">🍽</div>

			<h2>No Orders Yet</h2>

			<p>Looks like you haven't placed any orders yet. Explore our
				restaurants and enjoy delicious food.</p>

			<a href="home" class="browse-btn"> Browse Restaurants → </a>

		</div>

		<%
		}
		%>

	</section>

	<!-- ================= BENEFITS ================= -->

	<section class="benefits">

		<div class="benefit">

			<div class="icon">🚚</div>

			<h3>Fast Delivery</h3>

			<p>Delivered within 30 minutes.</p>

		</div>

		<div class="benefit">

			<div class="icon">⭐</div>

			<h3>Top Rated</h3>

			<p>Trusted by thousands of customers.</p>

		</div>

		<div class="benefit">

			<div class="icon">🔒</div>

			<h3>Secure Payment</h3>

			<p>Safe and encrypted transactions.</p>

		</div>

	</section>

	<!-- ================= FOOTER ================= -->

	<footer>

		<div class="footer-container">

			<div class="footer-column">

				<h2>🍽 FoodHub</h2>

				<p>Delicious food delivered to your doorstep.</p>

			</div>

			<div class="footer-column">

				<h3>Quick Links</h3>

				<a href="home.jsp"> Home </a> <a href="home"> Restaurants </a> <a
					href="orders"> Orders </a> <a href="cart.jsp"> Cart </a>

			</div>

			<div class="footer-column">

				<h3>Contact</h3>

				<p>📍 Bengaluru</p>

				<p>📞 +91 9876543210</p>

				<p>✉ support@foodhub.com</p>

			</div>

		</div>

		<div class="footer-bottom">© 2026 FoodHub. All Rights Reserved.

		</div>

	</footer>

</body>

</html>