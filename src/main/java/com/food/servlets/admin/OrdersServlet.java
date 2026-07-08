package com.food.servlets.admin;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrderTableDaoImpl;
import com.tap.model.OrderTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orders1")
public class OrdersServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		OrderTableDaoImpl orderDao = new OrderTableDaoImpl();

		List<OrderTable> orderList = orderDao.getAllOrderTable();

		req.setAttribute("orderList", orderList);

		req.getRequestDispatcher("/admin/orders.jsp").forward(req, resp);
	}
}