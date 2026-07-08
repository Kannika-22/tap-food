package com.food.servlets.admin;

import java.io.IOException;
import java.math.BigDecimal;

import com.tap.DAOImpl.MenuDaoImpl;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addMenu")
public class AddMenuServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Menu menu = new Menu();

		menu.setRestaurantId(Integer.parseInt(req.getParameter("restaurantId")));

		menu.setItemName(req.getParameter("itemName"));

		menu.setDescription(req.getParameter("description"));

		menu.setPrice(new BigDecimal(req.getParameter("price")));

		menu.setCategory(req.getParameter("category"));

		menu.setImagePath(req.getParameter("imagePath"));

		MenuDaoImpl dao = new MenuDaoImpl();

		dao.addMenu(menu);

		resp.sendRedirect("menu1?restaurantId=" + menu.getRestaurantId());

	}

}