<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.tap.model.Menu"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Menu</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/menu.css">

</head>

<body>

	<!-- ================= NAVBAR ================= -->

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

	<!-- ================= HERO ================= -->

	<section class="hero">

		<h1>Explore Delicious Food</h1>

		<p>Discover hundreds of freshly prepared dishes from our best
			restaurants.</p>

	</section>

	<!-- ================= MENU ================= -->

	<section class="menu-container">

		<!-- CARD 1 -->

		<%
		List<Menu> allMenuByRestaurant = (List<Menu>) request.getAttribute("allMenuByRestaurant");
		for (Menu menu : allMenuByRestaurant) {
		%>
		<div class="menu-card">

			<div class="menu-image">
				<img src="<%=menu.getImagePath()%>" alt="<%=menu.getItemName()%>">
			</div>

			<div class="menu-content">

				<div class="title-price">

					<h2><%=menu.getItemName()%>
					</h2>

					<span>₹<%=menu.getPrice()%></span>

				</div>

				<p class="description"><%=menu.getDescription()%></p>

				<div class="details">

					<p><%=menu.getCategory()%></p>

					<p class="<%=menu.isAvailable() ? "available" : "unavailable"%>">

						<%=menu.isAvailable() ? "🟢 Available" : "🔴 Not Available"%>

					</p>

				</div>

				<form action="callcartservlet">
					<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">
					<input type="hidden" name="restaurantId"
						value="<%=menu.getRestaurantId()%>"> <input type="hidden"
						name="quantity" value="1"> <input type="hidden"
						name="action" value="add">
					<button>Add To Cart</button>
				</form>

			</div>

		</div>
		<%
		}
		%>

	</section>

</body>
</html>