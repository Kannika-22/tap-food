<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tap.model.OrderTable"%>

<%
List<OrderTable> orderList = (List<OrderTable>) request.getAttribute("orderList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Orders</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/orders.css">

</head>

<body>

	<jsp:include page="sidebar.jsp" />

	<div class="content">

		<div class="top">

			<h1>Orders</h1>

		</div>

		<table>

			<thead>

				<tr>

					<th>Order ID</th>

					<th>User</th>

					<th>Restaurant</th>

					<th>Amount</th>

					<th>Status</th>

					<th>Payment</th>

					<th>Date</th>

					<th>Items</th>

				</tr>

			</thead>

			<tbody>

				<%
				if (orderList != null && !orderList.isEmpty()) {

					for (OrderTable order : orderList) {
				%>

				<tr>
					<td><%=order.getOrderId()%></td>
					<td><%=order.getUserId()%></td>
					<td><%=order.getRestaurantId()%></td>
					<td>₹ <%=order.getTotalAmount()%></td>
					<td><span class="status"><%=order.getStatus()%></span></td>
					<td><%=order.getPaymentMethod()%></td>
					<td><%=order.getOrderDate()%></td>
					<td><a class="view-btn"
						href="orderItems?orderId=<%=order.getOrderId()%>"> View Items
					</a></td>
				</tr>

				<%
				}

				} else {
				%>

				<tr>
					<td colspan="8" style="text-align: center;">No Orders Found</td>
				</tr>

				<%
				}
				%>

			</tbody>

		</table>

	</div>

</body>

</html>