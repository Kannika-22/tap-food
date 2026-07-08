<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tap.DAOImpl.RestaurantDaoImpl"%>
<%@page import="com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Home</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/home.css">

</head>

<body>

	<!--==========================
        NAVBAR
===========================-->

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


	<!--==========================
        HERO
===========================-->

	<section class="hero">

		<video autoplay muted loop playsinline class="hero-video">

			<source src="<%=request.getContextPath()%>/images/video.mp4"
				type="video/mp4">

		</video>

		<div class="overlay"></div>

		<div class="hero-content">

			<span class="tag"> India's Favourite Food Delivery Platform </span>

			<h1>

				Delicious Food<br> Delivered To Your Door

			</h1>

			<p>Order from your favourite restaurants and enjoy fresh,
				delicious meals delivered in minutes.</p>

			<div class="hero-buttons">

				<a href="home" class="primary-btn"> Explore Restaurants </a> <a
					href="orders" class="secondary-btn"> My Orders </a>

			</div>

		</div>

	</section>



	<!--==========================
        CATEGORIES
===========================-->

	<section class="categories">

		<div class="section-title">

			<h2>Popular Categories</h2>

			<p>Choose your favourite food</p>

		</div>

		<div class="category-grid">

			<div class="category-card">

				<img
					src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400"
					alt="Pizza">

				<h3>Pizza</h3>

			</div>

			<div class="category-card">

				<img
					src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400"
					alt="Burger">

				<h3>Burger</h3>

			</div>

			<div class="category-card">

				<img
					src="https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=400"
					alt="Biryani">

				<h3>Biryani</h3>

			</div>

			<div class="category-card">

				<img
					src="https://images.unsplash.com/photo-1585032226651-759b368d7246?w=400"
					alt="Noodles">

				<h3>Noodles</h3>

			</div>

			<div class="category-card">

				<img
					src="https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=400"
					alt="South Indian">

				<h3>South Indian</h3>

			</div>

			<div class="category-card">

				<img
					src="https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400"
					alt="Desserts">

				<h3>Desserts</h3>

			</div>

		</div>

	</section>



	<!--==========================
    FEATURED RESTAURANTS
===========================-->

	<%
	RestaurantDaoImpl restaurantDao = new RestaurantDaoImpl();
	List<Restaurant> restaurantList = restaurantDao.getAllRestaurant();
	%>

	<section class="featured-restaurants">

		<div class="section-title">

			<h2>Featured Restaurants</h2>

			<p>Top rated restaurants near you</p>

		</div>

		<div class="restaurant-grid">

			<%
			int count = 0;

			for (Restaurant restaurant : restaurantList) {

				if (count == 3) {
					break;
				}
			%>

			<div class="restaurant-card">

				<img src="<%=restaurant.getImagePath()%>"
					alt="<%=restaurant.getName()%>">

				<div class="restaurant-content">

					<h3><%=restaurant.getName()%></h3>

					<p><%=restaurant.getCuisineType()%></p>

					<a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>"
						class="card-btn"> View Menu </a>

				</div>

			</div>

			<%
			count++;
			}
			%>

		</div>

	</section>



	<!--==========================
        WHY FOODHUB
===========================-->

	<section class="why-foodhub">

		<div class="section-title">

			<h2>Why Choose FoodHub?</h2>

			<p>We deliver happiness every day.</p>

		</div>

		<div class="why-grid">

			<div class="why-card">

				🚀

				<h3>Fast Delivery</h3>

				<p>Average delivery within 30 minutes.</p>

			</div>

			<div class="why-card">

				🥗

				<h3>Fresh Food</h3>

				<p>Prepared fresh by trusted restaurants.</p>

			</div>

			<div class="why-card">

				🔒

				<h3>Secure Payment</h3>

				<p>100% safe and encrypted payments.</p>

			</div>

			<div class="why-card">

				📍

				<h3>Live Tracking</h3>

				<p>Track your order in real time.</p>

			</div>

		</div>

	</section>



	<!--==========================
        FOOTER
===========================-->

	<footer>

		<div class="footer-container">

			<div>

				<h2>FoodHub</h2>

				<p>Delivering delicious meals from your favourite restaurants
					quickly and safely.</p>

			</div>

			<div>

				<h3>Quick Links</h3>

				<a href="home.jsp">Home</a> <a href="home">Restaurants</a> <a
					href="orders">Orders</a> <a href="profile">Profile</a>

			</div>

			<div>

				<h3>Support</h3>

				<a href="#">Help Center</a> <a href="#">Privacy Policy</a> <a
					href="#">Terms & Conditions</a>

			</div>

		</div>

		<div class="footer-bottom">© 2026 FoodHub. All Rights Reserved.

		</div>

	</footer>

</body>

</html>