package com.food.servlets.admin;

import java.io.IOException;

import com.tap.DAOImpl.RestaurantDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteRestaurant")
public class DeleteRestaurantServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		RestaurantDaoImpl dao = new RestaurantDaoImpl();

		dao.deleteRestaurant(id);

		resp.sendRedirect("restaurants");
	}

}