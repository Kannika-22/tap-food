package com.food.servlets.admin;

import java.io.IOException;

import com.tap.DAOImpl.MenuDaoImpl;
import com.tap.DAOImpl.OrderTableDaoImpl;
import com.tap.DAOImpl.RestaurantDaoImpl;
import com.tap.DAOImpl.UserDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminDashboard")
public class DashboardServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RestaurantDaoImpl restaurantDao = new RestaurantDaoImpl();

		UserDaoImpl userDao = new UserDaoImpl();

		MenuDaoImpl menuDao = new MenuDaoImpl();

		OrderTableDaoImpl orderDao = new OrderTableDaoImpl();

		req.setAttribute("restaurantCount", restaurantDao.getAllRestaurant().size());

		req.setAttribute("userCount", userDao.getAllUser().size());

		req.setAttribute("menuCount", menuDao.getAllMenu().size());

		req.setAttribute("orderCount", orderDao.getAllOrderTable().size());

		req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
	}
}