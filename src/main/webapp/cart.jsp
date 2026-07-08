<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.math.BigDecimal"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Cart</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/cart.css">

</head>

<body>

	<!-- ================= NAVBAR ================= -->

	<nav>

		<a href="home.jsp" class="logo">🍽 FoodHub</a>

		<ul>

			<li><a href="home.jsp">Home</a></li>

			<li><a href="home">Restaurants</a></li>

			<li><a href="orders">Orders</a></li>

			<li><a href="callcartservlet">Cart</a></li>

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

		<h1>Your Shopping Cart</h1>

		<p>Review your selected delicious meals before checkout.</p>

	</section>

	<!-- ================= CART ================= -->

	<%
	Cart cart = (Cart) session.getAttribute("cart");
	Integer restaurantId = (Integer) session.getAttribute("restaurantId");

	BigDecimal grandTotal = BigDecimal.ZERO;
	%>

	<section class="cart-container">

		<div class="cart-items">

			<%
			if (cart != null && !cart.getItem().isEmpty()) {
			%>

			<h2>Cart Items</h2>

			<%
			}
			%>

			<%
			if (cart != null && !cart.getItem().isEmpty()) {

				for (CartItem item : cart.getItem().values()) {

					grandTotal = grandTotal.add(item.getTotalPrice());
			%>

			<div class="cart-card">

				<div class="cart-image">

					<img src="<%=item.getImage()%>" alt="<%=item.getName()%>">

				</div>

				<div class="cart-details">

					<h3><%=item.getName()%></h3>

					<p class="category">
						Quantity :
						<%=item.getQuantity()%>
					</p>

					<p class="price">
						₹<%=item.getPrice()%>
					</p>

					<p class="total-price">
						Total : ₹<%=item.getTotalPrice()%>
					</p>

				</div>

				<div class="cart-actions">

					<div class="quantity">

						<form action="callcartservlet" method="post">
							<input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
							<input type="hidden" name="restaurantId"
								value="<%=restaurantId%>">

							<%
							if (item.getQuantity() - 1 <= 0) {
							%>
							<input type="hidden" name="action" value="delete">
							<%
							} else {
							%>
							<input type="hidden" name="action" value="update"> <input
								type="hidden" name="quantity"
								value="<%=item.getQuantity() - 1%>">
							<%
							}
							%>

							<button class="qty-btn" type="submit">-</button>
						</form>

						<span><%=item.getQuantity()%></span>

						<form action="callcartservlet" method="post">
							<input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
							<input type="hidden" name="restaurantId"
								value="<%=restaurantId%>"> <input type="hidden"
								name="action" value="update"> <input type="hidden"
								name="quantity" value="<%=item.getQuantity() + 1%>">
							<button class="qty-btn" type="submit">+</button>
						</form>

					</div>

					<form action="callcartservlet">
						<input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
						<input type="hidden" name="restaurantId" value="<%=restaurantId%>">
						<input type="hidden" name="action" value="delete">
						<button class="remove-btn">Remove</button>
					</form>

				</div>

			</div>

			<%
			} // end for loop
			%>

			<!-- ================= GRAND TOTAL ================= -->

			<div class="cart-summary">

				<div class="summary-left">

					<h2>Grand Total</h2>

				</div>

				<div class="summary-right">

					<span class="grand-total"> ₹<%=grandTotal%>
					</span>

					<form action="checkout.jsp" method="get">

						<button type="submit" class="checkout-btn">Proceed To
							Checkout</button>

					</form>

				</div>

			</div>

			<%
			} else {
			%>

			<div class="empty-cart">

				<div class="empty-icon">🛒</div>

				<h2>Your Cart is Empty</h2>

				<p>Looks like you haven't added any delicious food yet. Start
					exploring restaurants and order your favourite meals.</p>

				<a href="home" class="browse-btn"> Browse Restaurants → </a>

			</div>

			<%
			}
			%>

		</div>

	</section>

	<!-- ==========================================
        		 ADD MORE ITEMS
	      ========================================== -->

	<%
	if (cart != null && !cart.getItem().isEmpty() && restaurantId != null) {
	%>

	<div class="add-more-container">

		<div class="add-more-box">

			<div class="add-more-left">

				<h2>🍽 Still Hungry?</h2>

				<p>Explore more delicious dishes from this restaurant and
					complete your meal.</p>

			</div>

			<div class="add-more-right">

				<a href="menu?restaurantId=<%=restaurantId%>" class="browse-btn">

					Add More Items → </a>

			</div>

		</div>

	</div>

	<%
	}
	%>
	<!-- ================= DELIVERY BENEFITS ================= -->

	<section class="benefits">

		<div class="benefit">

			<div class="icon">🚚</div>

			<h3>Fast Delivery</h3>

			<p>Fresh food delivered to your doorstep in less than 30 minutes.
			</p>

		</div>

		<div class="benefit">

			<div class="icon">🛡</div>

			<h3>Safe Packaging</h3>

			<p>Hygienic and tamper-proof packaging for every order.</p>

		</div>

		<div class="benefit">

			<div class="icon">💳</div>

			<h3>Secure Payment</h3>

			<p>Multiple secure payment options with complete safety.</p>

		</div>

		<div class="benefit">

			<div class="icon">⭐</div>

			<h3>Top Rated Restaurants</h3>

			<p>Order from the highest-rated restaurants near you.</p>

		</div>

	</section>



	<!-- ================= FOOTER ================= -->

	<footer>

		<div class="footer-container">

			<div class="footer-column">

				<h2>🍽 FoodHub</h2>

				<p>FoodHub brings delicious food from your favourite restaurants
					directly to your doorstep with fast, secure and reliable delivery.

				</p>

			</div>

			<div class="footer-column">

				<h3>Quick Links</h3>

				<a href="home.jsp">Home</a> <a href="home">Restaurants</a> <a
					href="cart.jsp">Cart</a> <a href="orders">Orders</a>

			</div>

			<div class="footer-column">

				<h3>Support</h3>

				<a href="#">Help Center</a> <a href="#">Privacy Policy</a> <a
					href="#">Terms & Conditions</a> <a href="#">Refund Policy</a>

			</div>

			<div class="footer-column">

				<h3>Contact</h3>

				<p>📍 Bengaluru, Karnataka</p>

				<p>📞 +91 9876543210</p>

				<p>✉ support@foodhub.com</p>

			</div>

		</div>

		<div class="footer-bottom">© 2026 FoodHub. All Rights Reserved.

		</div>

	</footer>

</body>

</html>
