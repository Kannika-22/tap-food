package com.food.servlets.admin;

import java.io.IOException;
import java.math.BigDecimal;

import com.tap.DAOImpl.RestaurantDaoImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editRestaurant")
public class EditRestaurantServlet extends HttpServlet {

	private RestaurantDaoImpl dao = new RestaurantDaoImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		Restaurant restaurant = dao.getRestaurant(id);

		req.setAttribute("restaurant", restaurant);

		req.getRequestDispatcher("/admin/editRestaurant.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Restaurant restaurant = new Restaurant();

		restaurant.setRestaurantId(Integer.parseInt(req.getParameter("restaurantId")));

		restaurant.setName(req.getParameter("name"));

		restaurant.setCuisineType(req.getParameter("cuisineType"));

		restaurant.setDeliveryTime(Integer.parseInt(req.getParameter("deliveryTime")));

		restaurant.setAddress(req.getParameter("address"));

		restaurant.setAdminUserId(Integer.parseInt(req.getParameter("adminUserId")));

		restaurant.setRating(new BigDecimal(req.getParameter("rating")));

		restaurant.setIsActive(Boolean.parseBoolean(req.getParameter("isActive")));

		restaurant.setImagePath(req.getParameter("imagePath"));

		dao.updateRestaurant(restaurant);

		resp.sendRedirect("restaurants");
	}
}