
<%
int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Add Menu</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/form.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="main">

		<h1 class="page-title">Add Menu Item</h1>

		<div class="form-container">

			<form action="${pageContext.request.contextPath}/addMenu"
				method="post">

				<input type="hidden" name="restaurantId" value="<%=restaurantId%>">

				<label>Item Name</label> <input type="text" name="itemName" required>

				<label>Description</label>

				<textarea name="description" rows="3" required></textarea>

				<label>Price</label> <input type="number" step="0.01" name="price"
					required> <label>Category</label> <input type="text"
					name="category" required> <label>Image Path</label> <input
					type="text" name="imagePath" placeholder="images/burger.jpg">

				<br>
				<br>

				<button class="btn">Save Menu</button>

				<a class="cancel-btn"
					href="${pageContext.request.contextPath}/menu1?restaurantId=<%=restaurantId%>">

					Cancel </a>

			</form>

		</div>

	</div>

</body>

</html>