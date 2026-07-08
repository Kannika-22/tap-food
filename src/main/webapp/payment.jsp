<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.math.BigDecimal"%>

<%
String paymentMode = (String) session.getAttribute("paymentMode");
BigDecimal amount = (BigDecimal) session.getAttribute("paymentAmount");

if (paymentMode == null) {
	response.sendRedirect("checkout.jsp");
	return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Secure Payment</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<link rel="stylesheet" href="css/payment.css">

</head>

<body>

	<div class="payment-wrapper">

		<!-- ===========================
        LEFT SIDEBAR
=========================== -->

		<aside class="sidebar">

			<div class="logo">

				<i class="fa-solid fa-utensils"></i>

				<h1>FoodHub</h1>

			</div>

			<span class="sidebar-title"> PAYMENT METHODS </span>

			<div class="payment-list">

				<a href="payment?mode=credit_card"
					class="payment-item <%=paymentMode.equals("credit_card") ? "active" : ""%>">

					<div>

						<i class="fa-regular fa-credit-card"></i> <span>Credit Card</span>

					</div> <small>Visa • Mastercard • RuPay</small>

				</a> <a href="payment?mode=debit_card"
					class="payment-item <%=paymentMode.equals("debit_card") ? "active" : ""%>">

					<div>

						<i class="fa-solid fa-credit-card"></i> <span>Debit Card</span>

					</div> <small>All Indian Banks</small>

				</a> <a href="payment?mode=google_pay"
					class="payment-item <%=paymentMode.equals("google_pay") ? "active" : ""%>">

					<div>

						<img
							src="https://upload.wikimedia.org/wikipedia/commons/f/f2/Google_Pay_Logo.svg"
							alt="Google Pay"> <span>Google Pay</span>

					</div> <small>UPI Payment</small>

				</a> <a href="payment?mode=apple_pay"
					class="payment-item <%=paymentMode.equals("apple_pay") ? "active" : ""%>">

					<div>

						<img
							src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg">
						<span>Apple Pay</span>

					</div> <small>Face ID</small>

				</a> <a href="payment?mode=paypal"
					class="payment-item <%=paymentMode.equals("paypal") ? "active" : ""%>">

					<div>

						<img
							src="https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg">
						<span>PayPal</span>

					</div> <small>International</small>

				</a> <a href="payment?mode=bank_transfer"
					class="payment-item <%=paymentMode.equals("bank_transfer") ? "active" : ""%>">

					<div>

						<img src="https://cdn-icons-png.flaticon.com/512/2830/2830284.png">
						<span>Net Banking</span>

					</div> <small>50+ Banks</small>

				</a> <a href="payment?mode=cash_on_delivery"
					class="payment-item <%=paymentMode.equals("cash_on_delivery") ? "active" : ""%>">

					<div>

						<i class="fa-solid fa-money-bill-wave"></i> <span>Cash On
							Delivery</span>

					</div> <small>Pay after delivery</small>

				</a>

			</div>

			<div class="sidebar-bottom">

				<div class="secure-circle">

					<i class="fa-solid fa-shield-halved"></i>

				</div>

				<div>

					<h3>100% Secure</h3>

					<p>SSL Protected Payments</p>

				</div>

			</div>

		</aside>

		<!-- ===========================
      RIGHT CONTENT
=========================== -->

		<main class="payment-content">

			<header class="payment-header">

				<div>

					<h1>Complete Your Payment</h1>

					<p>Choose your preferred payment method and complete your order
						securely.</p>

				</div>

				<div class="header-security">

					<div class="security-box">

						<i class="fa-solid fa-shield"></i>

						<div>

							<h4>Secure</h4>

							<span>SSL Encrypted</span>

						</div>

					</div>

					<div class="security-box">

						<i class="fa-solid fa-lock"></i>

						<div>

							<h4>PCI DSS</h4>

							<span>Certified</span>

						</div>

					</div>

				</div>

			</header>

			<form action="processPayment" method="post">

				<input type="hidden" name="paymentMode" value="<%=paymentMode%>">

				<%
				if (paymentMode.equals("credit_card") || paymentMode.equals("debit_card")) {
				%>

				<div class="payment-card">

					<div class="card-left">

						<div
							class="real-card <%=paymentMode.equals("credit_card") ? "visa-card" : "master-card"%>">

							<div class="card-top">

								<img src="https://img.icons8.com/color/96/sim-card-chip.png"
									class="chip" alt="Chip"> <img
									src="<%=paymentMode.equals("credit_card") ? "https://img.icons8.com/color/480/visa.png"
		: "https://img.icons8.com/color/480/mastercard-logo.png"%>"
									class="brand" alt="Card Brand">

							</div>

							<div class="card-number">

								<%=paymentMode.equals("credit_card") ? "4242 4242 4242 4242" : "5299 9876 1234 5678"%>

							</div>

							<div class="card-bottom">

								<div>

									<span>CARD HOLDER</span>

									<h4>JOHN SMITH</h4>

								</div>

								<div>

									<span>VALID THRU</span>

									<h4>12/28</h4>

								</div>

							</div>

						</div>

					</div>

					<div class="card-right">

						<h2>

							<%=paymentMode.equals("credit_card") ? "Credit Card" : "Debit Card"%>

						</h2>

						<p>Enter your card details to complete payment securely.</p>

						<div class="input-group">

							<label> Card Holder Name </label> <input type="text"
								name="cardHolder" placeholder="John Smith" required>

						</div>

						<div class="input-group">

							<label> Card Number </label> <input type="text" name="cardNumber"
								maxlength="19" placeholder="1234 5678 9012 3456" required>

						</div>

						<div class="row">

							<div class="input-group">

								<label> Expiry Date </label> <input type="text" name="expiry"
									placeholder="MM / YY" required>

							</div>

							<div class="input-group">

								<label> CVV </label> <input type="password" name="cvv"
									maxlength="3" placeholder="123" required>

							</div>

						</div>

						<label class="save-card"> <input type="checkbox" checked>

							Save card for faster payments

						</label>

						<div class="secure-text">

							<i class="fa-solid fa-shield-halved"></i> Your card information
							is encrypted and securely processed.

						</div>

						<button type="submit" class="pay-button">

							Pay ₹
							<%=amount%>

						</button>

					</div>

				</div>

				<%
				}
				%>

				<%
				if (paymentMode.equals("google_pay")) {
				%>

				<div class="wallet-card">

					<div class="wallet-header">

						<img
							src="https://upload.wikimedia.org/wikipedia/commons/f/f2/Google_Pay_Logo.svg"
							class="wallet-logo" alt="Google Pay">

						<div>

							<h2>Google Pay</h2>

							<p>Pay instantly using any UPI ID</p>

						</div>

					</div>

					<div class="wallet-summary">

						<div class="amount-box">

							<span>Total Amount</span>

							<h1>
								₹
								<%=amount%></h1>

						</div>

					</div>

					<div class="input-group">

						<label>UPI ID</label> <input type="text" name="upiId"
							placeholder="example@okaxis" required>

					</div>

					<div class="upi-apps">

						<div class="upi-app">

							<img
								src="https://upload.wikimedia.org/wikipedia/commons/f/f2/Google_Pay_Logo.svg"
								alt="Google Pay"> <span>Google Pay</span>

						</div>

						<div class="upi-app">

							<img
								src="https://download.logo.wine/logo/PhonePe/PhonePe-Logo.wine.png"
								alt="PhonePe"> <span>PhonePe</span>

						</div>

						<div class="upi-app">

							<img
								src="https://download.logo.wine/logo/Paytm/Paytm-Logo.wine.png"
								alt="Paytm"> <span>Paytm</span>

						</div>

					</div>

					<button class="pay-button">Continue to Google Pay</button>

				</div>

				<%
				}
				%>


				<%
				if (paymentMode.equals("apple_pay")) {
				%>

				<div class="wallet-card">

					<div class="wallet-header">

						<img
							src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg"
							class="wallet-logo">

						<div>

							<h2>Apple Pay</h2>

							<p>Fast. Secure. Face ID.</p>

						</div>

					</div>

					<div class="wallet-summary">

						<div class="amount-box">

							<span>Total Amount</span>

							<h1>
								₹
								<%=amount%></h1>

						</div>

					</div>

					<div class="apple-face">

						<i class="fa-solid fa-face-smile"></i>

						<div>

							<h3>Authenticate with Face ID</h3>

							<p>Your payment will be securely verified.</p>

						</div>

					</div>

					<button class="pay-button">Continue with Apple Pay</button>

				</div>

				<%
				}
				%>


				<%
				if (paymentMode.equals("paypal")) {
				%>

				<div class="wallet-card">

					<div class="wallet-header">

						<img
							src="https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg"
							class="wallet-logo">

						<div>

							<h2>PayPal</h2>

							<p>International Secure Payments</p>

						</div>

					</div>

					<div class="wallet-summary">

						<div class="amount-box">

							<span>Total Amount</span>

							<h1>
								₹
								<%=amount%></h1>

						</div>

					</div>

					<div class="input-group">

						<label>Email Address</label> <input type="email"
							placeholder="example@gmail.com" required>

					</div>

					<div class="input-group">

						<label>Password</label> <input type="password"
							placeholder="********" required>

					</div>

					<button class="pay-button">Login & Continue</button>

				</div>

				<%
				}
				%>

				<%
				if (paymentMode.equals("bank_transfer")) {
				%>

				<div class="wallet-card">

					<div class="wallet-header">

						<img src="https://cdn-icons-png.flaticon.com/512/2830/2830284.png"
							class="wallet-logo">

						<div>

							<h2>Net Banking</h2>

							<p>Select your preferred bank</p>

						</div>

					</div>

					<div class="wallet-summary">

						<div class="amount-box">

							<span>Amount Payable</span>

							<h1>
								₹
								<%=amount%></h1>

						</div>

					</div>

					<div class="input-group">

						<label>Select Bank</label> <select name="bankName" required>

							<option value="">Choose your Bank</option>

							<option>SBI</option>

							<option>HDFC Bank</option>

							<option>ICICI Bank</option>

							<option>Axis Bank</option>

							<option>Kotak Mahindra Bank</option>

							<option>Canara Bank</option>

							<option>Union Bank</option>

							<option>Bank of Baroda</option>

						</select>

					</div>

					<button class="pay-button">Continue to Bank</button>

				</div>

				<%
				}
				%>


				<%
				if (paymentMode.equals("cash_on_delivery")) {
				%>

				<div class="wallet-card">

					<div class="wallet-header">

						<i class="fa-solid fa-money-bill-wave cod-logo"></i>

						<div>

							<h2>Cash On Delivery</h2>

							<p>Pay after receiving your order</p>

						</div>

					</div>

					<div class="wallet-summary">

						<div class="amount-box">

							<span>Total Amount</span>

							<h1>
								₹
								<%=amount%></h1>

						</div>

					</div>

					<div class="cod-info">

						<div class="cod-item">

							<i class="fa-solid fa-circle-check"></i> <span>No Advance
								Payment Required</span>

						</div>

						<div class="cod-item">

							<i class="fa-solid fa-clock"></i> <span>Estimated Delivery
								: 25 - 35 Minutes</span>

						</div>

						<div class="cod-item">

							<i class="fa-solid fa-wallet"></i> <span>Cash / UPI
								accepted at doorstep</span>

						</div>

					</div>

					<button class="pay-button">Confirm Order</button>

				</div>

				<%
				}
				%>

				<!--==========================
      TRUST SECTION
===========================-->

				<div class="trust-section">

					<div class="trust-box">

						<i class="fa-solid fa-shield-halved"></i>

						<div>

							<h4>100% Secure</h4>

							<p>PCI DSS Compliant</p>

						</div>

					</div>

					<div class="trust-box">

						<i class="fa-solid fa-lock"></i>

						<div>

							<h4>Encrypted</h4>

							<p>SSL Protected</p>

						</div>

					</div>

					<div class="trust-box">

						<i class="fa-solid fa-headset"></i>

						<div>

							<h4>24 × 7 Support</h4>

							<p>FoodHub Care</p>

						</div>

					</div>

				</div>

			</form>

		</main>

	</div>

</body>

</html>