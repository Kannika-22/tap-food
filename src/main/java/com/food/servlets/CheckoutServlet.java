package com.food.servlets;

import java.io.IOException;
import java.math.BigDecimal;

import com.tap.DAOImpl.OrderItemDaoImpl;
import com.tap.DAOImpl.OrderTableDaoImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("cart");
		int restaurantId = (int) session.getAttribute("restaurantId");
		BigDecimal finalAmount = (BigDecimal) session.getAttribute("finalAmount");

		String paymentMode = req.getParameter("paymentMode");

		if (user == null) {

			session.setAttribute("redirectAfterLogin", "cart");

			resp.sendRedirect("login.html");

			return;

		}

		if (user != null && cart != null && !cart.getItem().isEmpty()) {
			OrderTable orderTable = new OrderTable();

			orderTable.setUserId(user.getUserId());
			orderTable.setRestaurantId(restaurantId);
			orderTable.setTotalAmount(finalAmount);
			orderTable.setStatus("pending");
			orderTable.setPaymentMethod(paymentMode);
//			orderTable.setOrderDate(new Timestamp(System.currentTimeMillis()));

			OrderTableDaoImpl orderTableDaoImpl = new OrderTableDaoImpl();
			int orderId = orderTableDaoImpl.addOrderTable(orderTable);

			OrderItem orderItem = new OrderItem();

			orderItem.setOrderId(orderId);

			for (CartItem item : cart.getItem().values()) {

				orderItem.setMenuId(item.getMenuId());
				orderItem.setQuantity(item.getQuantity());
				orderItem.setItemTotal(item.getTotalPrice());
			}

			OrderItemDaoImpl orderItemDaoImpl = new OrderItemDaoImpl();
			orderItemDaoImpl.addOrderItem(orderItem);

			session.removeAttribute("cart");
			session.removeAttribute("restaurantId");
			session.removeAttribute("finalAmount");

			resp.sendRedirect("orderConfirmation.jsp");

		} else {
			resp.sendRedirect("cart.jsp");
		}
	}
}
