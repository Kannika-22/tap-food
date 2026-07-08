<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.tap.model.Cart"%>
<%@page import="com.tap.model.CartItem"%>
<%@page import="java.math.BigDecimal"%>

<%
Cart cart = (Cart) session.getAttribute("cart");

BigDecimal itemTotal = BigDecimal.ZERO;

if (cart != null) {

	for (CartItem item : cart.getItem().values()) {

		itemTotal = itemTotal.add(item.getTotalPrice());

	}

}

BigDecimal deliveryFee = new BigDecimal("40");
BigDecimal platformFee = new BigDecimal("10");
BigDecimal gst = itemTotal.multiply(new BigDecimal("0.05"));

BigDecimal finalAmount = itemTotal.add(deliveryFee).add(platformFee).add(gst);
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>FoodHub | Checkout</title>

<link rel="stylesheet" href="css/checkout.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

</head>

<body>

	<nav>

		<a href="home.jsp" class="logo">🍽 FoodHub</a>

		<ul>

			<li><a href="home.jsp">Home</a></li>
			<li><a href="home">Restaurants</a></li>
			<li><a href="orders">Orders</a></li>
			<li><a href="cart.jsp">Cart</a></li>

		</ul>

		<div class="right-nav">

			<a href="profile" class="nav-button">👤 Profile</a>

		</div>

	</nav>



	<section class="checkout-header">

		<h1>Checkout</h1>

		<p>Confirm your delivery details and place your order securely.</p>

	</section>



	<div class="checkout-container">

		<div class="delivery-card">

			<h2 class="card-title">📍 Delivery Details</h2>

			<p class="card-subtitle">Deliver your delicious meal to any
				address of your choice.</p>

			<form action="payment" method="post" id="checkoutForm">

				<div class="input-group">

					<label> 👤 Full Name </label> <input type="text" name="name"
						placeholder="Enter Full Name" required>

				</div>



				<div class="input-group">

					<label> 📞 Mobile Number </label> <input type="tel" name="mobile"
						placeholder="Enter Mobile Number" required>

				</div>



				<div class="input-group">

					<label> 📍 Delivery Address </label>

					<textarea name="address"
						placeholder="Enter Complete Delivery Address" required></textarea>

				</div>



				<div class="input-group">

					<label>💳 Payment Method</label> <select name="paymentMode"
						id="paymentMode" required>

						<option value="">Choose Payment Method</option>

						<option value="cash_on_delivery">Cash On Delivery</option>

						<option value="credit_card">Credit Card</option>

						<option value="debit_card">Debit Card</option>

						<option value="google_pay">Google Pay</option>

						<option value="apple_pay">Apple Pay</option>

						<option value="paypal">PayPal</option>

						<option value="bank_transfer">Bank Transfer</option>

					</select>

				</div>

				<div class="checkout-buttons">

					<button type="submit" class="place-order-btn">Place Order
					</button>

					<a href="cart.jsp" class="back-cart-btn"> &#8592; Back To Cart
					</a>

				</div>

				<input type="hidden" name="itemTotal" value="<%=itemTotal%>">

				<input type="hidden" name="deliveryFee" value="<%=deliveryFee%>">

				<input type="hidden" name="platformFee" value="<%=platformFee%>">

				<input type="hidden" name="gst"
					value="<%=gst.setScale(2, java.math.RoundingMode.HALF_UP)%>">

				<input type="hidden" name="finalAmount"
					value="<%=finalAmount.setScale(2, java.math.RoundingMode.HALF_UP)%>">

			</form>

		</div>


		<!-- ================= ORDER SUMMARY ================= -->

		<div class="summary-card">

			<h2 class="summary-title">🧾 Order Summary</h2>

			<%
			if (cart != null && !cart.getItem().isEmpty()) {

				for (CartItem item : cart.getItem().values()) {
			%>

			<div class="summary-item">

				<div>

					<h4><%=item.getName()%></h4>

					<span>Qty : <%=item.getQuantity()%></span>

				</div>

				<div class="price-details">

					<small style="color: #bdbdbd;"> &#8377;<%=item.getPrice()%>
						each
					</small> <br> <strong> &#8377;<%=item.getTotalPrice()%>
					</strong>

				</div>

			</div>

			<%
			}
			}
			%>

			<div class="summary-divider"></div>

			<div class="summary-row">

				<span>Item Total</span> <span>&#8377;<%=itemTotal%></span>

			</div>

			<div class="summary-row">

				<span>Delivery Fee</span> <span>&#8377;<%=deliveryFee%></span>

			</div>

			<div class="summary-row">

				<span>Platform Fee</span> <span>&#8377;<%=platformFee%></span>

			</div>

			<div class="summary-row">

				<span>GST (5%)</span> <span>&#8377;<%=gst.setScale(2, java.math.RoundingMode.HALF_UP)%></span>

			</div>

			<div class="summary-divider"></div>

			<div class="total-row">

				<span>Total</span> <span> &#8377;<%=finalAmount.setScale(2, java.math.RoundingMode.HALF_UP)%>

				</span>

			</div>

			<%
			session.setAttribute("finalAmount", finalAmount);
			%>


			<input type="hidden" name="totalAmount" value="<%=finalAmount%>">

			<div class="delivery-box">

				<h4>
					<i class="fa-solid fa-motorcycle"></i> Estimated Delivery
				</h4>

				<p>25 - 35 Minutes</p>

			</div>

		</div>

	</div>

	<script>
		const form = document.getElementById("checkoutForm");
		const payment = document.getElementById("paymentMode");

		const form = document.getElementById("checkoutForm");
		const payment = document.getElementById("paymentMode");

		form.addEventListener("submit", function() {

			if (payment.value === "cash_on_delivery") {

				form.action = "checkout";

			} else {

				form.action = "payment";

			}

		});
	</script>

</body>
</html>