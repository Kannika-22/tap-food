package com.food.servlets.admin;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.RestaurantDaoImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RestaurantDaoImpl dao = new RestaurantDaoImpl();

		List<Restaurant> restaurants = dao.getAllRestaurant();

		req.setAttribute("restaurants", restaurants);

		req.getRequestDispatcher("/admin/restaurants.jsp").forward(req, resp);

	}

}