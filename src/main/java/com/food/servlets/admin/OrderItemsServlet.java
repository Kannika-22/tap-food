package com.food.servlets.admin;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrderItemDaoImpl;
import com.tap.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderItems")
public class OrderItemsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int orderId = Integer.parseInt(req.getParameter("orderId"));

		OrderItemDaoImpl dao = new OrderItemDaoImpl();

		List<OrderItem> allItems = dao.getAllOrderItem();

		req.setAttribute("orderId", orderId);
		req.setAttribute("orderItems", allItems);

		req.getRequestDispatcher("/admin/orderItems.jsp").forward(req, resp);

	}

}