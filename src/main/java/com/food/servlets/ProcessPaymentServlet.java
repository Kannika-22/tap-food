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

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("user");

		Cart cart = (Cart) session.getAttribute("cart");

		Integer restaurantId = (Integer) session.getAttribute("restaurantId");

		BigDecimal finalAmount = (BigDecimal) session.getAttribute("finalAmount");

		String paymentMode = (String) session.getAttribute("paymentMode");

		if (user == null || cart == null || cart.getItem().isEmpty()) {

			resp.sendRedirect("cart.jsp");
			return;

		}

		OrderTable order = new OrderTable();

		order.setUserId(user.getUserId());

		order.setRestaurantId(restaurantId);

		order.setTotalAmount(finalAmount);

		order.setStatus("pending");

		order.setPaymentMethod(paymentMode);

		OrderTableDaoImpl orderDao = new OrderTableDaoImpl();

		int orderId = orderDao.addOrderTable(order);

		OrderItemDaoImpl itemDao = new OrderItemDaoImpl();

		for (CartItem item : cart.getItem().values()) {

			OrderItem orderItem = new OrderItem();

			orderItem.setOrderId(orderId);

			orderItem.setMenuId(item.getMenuId());

			orderItem.setQuantity(item.getQuantity());

			orderItem.setItemTotal(item.getTotalPrice());

			itemDao.addOrderItem(orderItem);

		}

		session.removeAttribute("cart");

		session.removeAttribute("restaurantId");

		session.removeAttribute("finalAmount");

		session.removeAttribute("paymentMode");

		session.removeAttribute("paymentAmount");

		resp.sendRedirect("paymentSuccess.jsp");

	}

}