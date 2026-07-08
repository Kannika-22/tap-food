<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Order Confirmed</title>

<link rel="stylesheet" href="css/orderConfirmation.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

</head>

<body>

	<!-- NAVBAR -->

	<nav>

		<a href="home.jsp" class="logo"> 🍽 FoodHub </a>

		<ul>
			<li><a href="home.jsp">Home</a></li>
			<li><a href="home">Restaurants</a></li>
			<li><a href="orders">Orders</a></li>
			<li><a href="cart.jsp">Cart</a></li>
		</ul>

		<div class="right-nav">
			<a href="profile" class="nav-button"> 👤 Profile </a>
		</div>

	</nav>


	<!-- SUCCESS CARD -->

	<section class="confirmation-container">

		<div class="confirmation-card">

			<div class="success-icon">✅</div>

			<h1>Order Placed Successfully!</h1>

			<p>

				Thank you for ordering with <span>FoodHub</span>. Your delicious
				meal is being prepared.

			</p>

			<div class="order-status">

				<div class="status">

					<div class="circle active"></div>

					<span>Order Confirmed</span>

				</div>

				<div class="line"></div>

				<div class="status">

					<div class="circle active"></div>

					<span>Preparing Food</span>

				</div>

				<div class="line"></div>

				<div class="status">

					<div class="circle"></div>

					<span>Out for Delivery</span>

				</div>

				<div class="line"></div>

				<div class="status">

					<div class="circle"></div>

					<span>Delivered</span>

				</div>

			</div>

			<div class="button-group">

				<a href="orders" class="primary-btn"> View Orders </a> <a
					href="home" class="secondary-btn"> Continue Ordering </a>

			</div>

		</div>

	</section>

</body>

</html>