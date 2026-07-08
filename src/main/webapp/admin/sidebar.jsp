<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<div class="sidebar">

	<div class="logo">

		🍽 <span>FoodHub</span>

	</div>

	<ul>

		<li><a href="${pageContext.request.contextPath}/adminDashboard">
				🏠 Dashboard </a></li>

		<li><a href="${pageContext.request.contextPath}/restaurants">
				🍴 Restaurants </a></li>

		<li><a href="${pageContext.request.contextPath}/users"> 👤
				Users </a></li>

		<li><a href="${pageContext.request.contextPath}/orders1"> 📦
				Orders </a></li>

		<li><a href="${pageContext.request.contextPath}/adminProfile">
				👤 My Profile </a></li>

		<li><a href="${pageContext.request.contextPath}/logout"> 🚪
				Logout </a></li>

	</ul>

</div>