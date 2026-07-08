package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDaoImpl;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

		MenuDaoImpl menuDaoImpl = new MenuDaoImpl();
		List<Menu> allMenuByRestaurant = menuDaoImpl.getAllMenuByRestaurant(restaurantId);

		for (Menu menu : allMenuByRestaurant) {
			System.out.println(menu);
		}

		req.setAttribute("allMenuByRestaurant", allMenuByRestaurant);

		RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
		rd.forward(req, resp);

	}

}
