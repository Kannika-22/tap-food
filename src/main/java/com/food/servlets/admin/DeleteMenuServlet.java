package com.food.servlets.admin;

import java.io.IOException;

import com.tap.DAOImpl.MenuDaoImpl;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteMenu")
public class DeleteMenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		MenuDaoImpl dao = new MenuDaoImpl();

		Menu menu = dao.getMenu(id);

		int restaurantId = menu.getRestaurantId();

		dao.deleteMenu(id);

		resp.sendRedirect("menu1?restaurantId=" + restaurantId);

	}

}