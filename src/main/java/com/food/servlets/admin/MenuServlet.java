package com.food.servlets.admin;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDaoImpl;
import com.tap.DAOImpl.RestaurantDaoImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu1")
public class MenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

		MenuDaoImpl menuDao = new MenuDaoImpl();

		RestaurantDaoImpl restaurantDao = new RestaurantDaoImpl();

		Restaurant restaurant = restaurantDao.getRestaurant(restaurantId);

		List<Menu> menuList = menuDao.getAllMenuByRestaurant(restaurantId);

		req.setAttribute("restaurant", restaurant);

		req.setAttribute("menuList", menuList);

		req.getRequestDispatcher("/admin/menu.jsp").forward(req, resp);

	}

}