package com.food.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDao;
import com.tap.DAO.RestaurantDao;
import com.tap.DAOImpl.MenuDaoImpl;
import com.tap.DAOImpl.RestaurantDaoImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String keyword = request.getParameter("keyword");

		if (keyword == null || keyword.trim().isEmpty()) {

			response.sendRedirect("home");
			return;
		}

		keyword = keyword.trim().toLowerCase().replaceAll("\\s+", "");

		RestaurantDao restaurantDao = new RestaurantDaoImpl();
		MenuDao menuDao = new MenuDaoImpl();

		// Get all restaurants
		List<Restaurant> allRestaurants = restaurantDao.getAllRestaurant();

		List<Restaurant> matchedRestaurants = new ArrayList<>();

		for (Restaurant restaurant : allRestaurants) {

			String name = restaurant.getName().toLowerCase().replaceAll("\\s+", "");
			String cuisine = restaurant.getCuisineType().toLowerCase().replaceAll("\\s+", "");
			String address = restaurant.getAddress().toLowerCase().replaceAll("\\s+", "");

			if (name.contains(keyword) || cuisine.contains(keyword) || address.contains(keyword)) {

				matchedRestaurants.add(restaurant);
			}
		}

		// Restaurant found
		if (!matchedRestaurants.isEmpty()) {

			request.setAttribute("allRestaurant", matchedRestaurants);

			request.getRequestDispatcher("restaurant.jsp").forward(request, response);

			return;
		}

		// Search Menu
		List<Menu> allMenus = menuDao.getAllMenu();

		for (Menu menu : allMenus) {

			String itemName = menu.getItemName().toLowerCase().replaceAll("\\s+", "");
			String category = menu.getCategory().toLowerCase().replaceAll("\\s+", "");
			String description = menu.getDescription().toLowerCase().replaceAll("\\s+", "");

			if (itemName.contains(keyword) || category.contains(keyword) || description.contains(keyword)) {

				response.sendRedirect(request.getContextPath() + "/menu?restaurantId=" + menu.getRestaurantId());

				return;
			}
		}

		// Nothing found
		request.setAttribute("allRestaurant", new ArrayList<Restaurant>());
		request.setAttribute("message", "No Restaurant or Menu Item Found");

		request.getRequestDispatcher("restaurant.jsp").forward(request, response);
	}
}