<%@page import="com.tap.model.Menu"%>

<%
Menu menu = (Menu) request.getAttribute("menu");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Menu</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/form.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="main">

		<h1 class="page-title">Edit Menu</h1>

		<div class="form-container">

			<form action="${pageContext.request.contextPath}/editMenu"
				method="post">

				<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">

				<input type="hidden" name="restaurantId"
					value="<%=menu.getRestaurantId()%>"> <label>Item
					Name</label> <input type="text" name="itemName"
					value="<%=menu.getItemName()%>" required> <label>Description</label>

				<textarea name="description" rows="3"><%=menu.getDescription()%></textarea>

				<label>Price</label> <input type="number" step="0.01" name="price"
					value="<%=menu.getPrice()%>" required> <label>Category</label>

				<input type="text" name="category" value="<%=menu.getCategory()%>"
					required> <br> <br>

				<button class="btn">Update Menu</button>

				<a class="cancel-btn"
					href="${pageContext.request.contextPath}/menu1?restaurantId=<%=menu.getRestaurantId()%>">

					Cancel </a>

			</form>

		</div>

	</div>

</body>

</html>