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

@WebServlet("/addRestaurant")
public class AddRestaurantServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Restaurant restaurant = new Restaurant();

		restaurant.setName(req.getParameter("name"));

		restaurant.setCuisineType(req.getParameter("cuisineType"));

		restaurant.setDeliveryTime(Integer.parseInt(req.getParameter("deliveryTime")));

		restaurant.setAddress(req.getParameter("address"));

		restaurant.setAdminUserId(Integer.parseInt(req.getParameter("adminUserId")));

		restaurant.setRating(new BigDecimal(req.getParameter("rating")));

		restaurant.setIsActive(Boolean.parseBoolean(req.getParameter("isActive")));

		restaurant.setImagePath(req.getParameter("imagePath"));

		RestaurantDaoImpl dao = new RestaurantDaoImpl();

		dao.addRestaurant(restaurant);

		resp.sendRedirect("restaurants");
	}
}