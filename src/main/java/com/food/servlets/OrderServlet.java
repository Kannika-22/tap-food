package com.food.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAOImpl.MenuDaoImpl;
import com.tap.DAOImpl.OrderItemDaoImpl;
import com.tap.DAOImpl.OrderTableDaoImpl;
import com.tap.DAOImpl.RestaurantDaoImpl;
import com.tap.model.Menu;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.model.Restaurant;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("user");

		if (user == null) {

			resp.sendRedirect("login.html");
			return;

		}

		OrderTableDaoImpl orderDao = new OrderTableDaoImpl();
		RestaurantDaoImpl restaurantDao = new RestaurantDaoImpl();
		OrderItemDaoImpl orderItemDao = new OrderItemDaoImpl();
		MenuDaoImpl menuDao = new MenuDaoImpl();

		List<OrderTable> orders = orderDao.getOrdersByUserId(user.getUserId());

		List<Restaurant> restaurants = new ArrayList<>();
		List<Menu> menus = new ArrayList<>();

		List<OrderItem> allOrderItems = orderItemDao.getAllOrderItem();

		for (OrderTable order : orders) {

			Restaurant restaurant = restaurantDao.getRestaurant(order.getRestaurantId());

			restaurants.add(restaurant);

			Menu menu = null;

			for (OrderItem item : allOrderItems) {

				if (item.getOrderId() == order.getOrderId()) {

					menu = menuDao.getMenu(item.getMenuId());

					break;

				}

			}

			menus.add(menu);

		}

		req.setAttribute("orders", orders);
		req.setAttribute("restaurants", restaurants);
		req.setAttribute("menus", menus);

		RequestDispatcher rd = req.getRequestDispatcher("orders.jsp");
		rd.forward(req, resp);

	}

}