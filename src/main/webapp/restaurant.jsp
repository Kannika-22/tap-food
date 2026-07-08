<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub Restaurants</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/restaurant.css">

</head>

<body>

	<nav>

		<a href="home.jsp" class="logo"> 🍽 FoodHub </a>

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

			<a href="login.html" class="nav-button">Login</a> <a
				href="register.html" class="nav-button">Sign Up</a> <a
				href="profile" class="nav-button">👤 Profile</a>

		</div>

	</nav>

	<section class="hero">

		<h1>Discover Amazing Restaurants</h1>

		<p>Fresh food delivered to your doorstep.</p>

	</section>

	<section class="restaurants">

		<%
		List<Restaurant> allRestaurant = (List<Restaurant>) request.getAttribute("allRestaurant");
		for (Restaurant restaurant : allRestaurant) {
		%>

		<a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>"
			class="restaurant-link">

			<div class="restaurant-card">

				<div class="restaurant-image">
					<img src="<%=restaurant.getImagePath()%>"
						alt="<%=restaurant.getName()%>">
				</div>

				<div class="content">

					<div class="top">

						<h2><%=restaurant.getName()%></h2>

						<span class="rating">⭐ <%=restaurant.getRating()%></span>

					</div>

					<p class="cuisine"><%=restaurant.getCuisineType()%></p>

					<p class="time">
						🕒
						<%=restaurant.getDeliveryTime()%>
						min delivery
					</p>

					<p class="address">
						📍<%=restaurant.getAddress()%></p>

					<div class="bottom">

						<span class="<%=restaurant.getIsActive() ? "open" : "closed"%>">

							<%=restaurant.getIsActive() ? "🟢 Open" : "🔴 Closed"%>

						</span>

					</div>

				</div>

			</div>
		</a>
		<%
		}
		%>

	</section>

</body>
</html>