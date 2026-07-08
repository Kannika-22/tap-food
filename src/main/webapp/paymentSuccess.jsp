<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Payment Successful</title>

<link rel="stylesheet" href="css/paymentSuccess.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

</head>

<body>

	<div class="container">

		<!-- Loading Section -->

		<div id="loadingSection">

			<div class="loader"></div>

			<h2>Processing Payment...</h2>

			<p>Please wait while we securely process your payment.</p>

		</div>

		<!-- Success Section -->

		<div id="successSection" style="display: none;">

			<div class="checkmark">✓</div>

			<h1>Payment Successful!</h1>

			<p>Your payment has been completed successfully.</p>

			<p>Redirecting to Order Confirmation...</p>

		</div>

	</div>

	<script>
		setTimeout(function() {

			document.getElementById("loadingSection").style.display = "none";

			document.getElementById("successSection").style.display = "block";

		}, 2500);

		setTimeout(function() {

			window.location.href = "orderConfirmation.jsp";

		}, 5000);
	</script>

</body>

</html>