<%@page language="java" contentType="text/html;charset=UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="com.tap.model.OrderItem"%>

<%
int orderId = (Integer) request.getAttribute("orderId");

List<OrderItem> list = (List<OrderItem>) request.getAttribute("orderItems");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Order Items</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/orderItems.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="content">

		<div class="page-header">

			<h1>

				Order #<%=orderId%>

			</h1>

			<a href="orders1" class="back-btn"> ← Back </a>

		</div>

		<table>

			<thead>

				<tr>

					<th>Order Item ID</th>

					<th>Menu ID</th>

					<th>Quantity</th>

					<th>Item Total</th>

				</tr>

			</thead>

			<tbody>

				<%
				for (OrderItem item : list) {

					if (item.getOrderId() == orderId) {
				%>

				<tr>

					<td><%=item.getOrderItemId()%></td>

					<td><%=item.getMenuId()%></td>

					<td><%=item.getQuantity()%></td>

					<td>₹ <%=item.getItemTotal()%>

					</td>

				</tr>

				<%
				}

				}
				%>

			</tbody>

		</table>

	</div>

</body>

</html>