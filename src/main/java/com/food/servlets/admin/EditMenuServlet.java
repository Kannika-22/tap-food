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

@WebServlet("/editMenu")
public class EditMenuServlet extends HttpServlet {

	private MenuDaoImpl dao = new MenuDaoImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		Menu menu = dao.getMenu(id);

		req.setAttribute("menu", menu);

		req.getRequestDispatcher("/admin/editMenu.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Menu menu = new Menu();

		menu.setMenuId(Integer.parseInt(req.getParameter("menuId")));

		menu.setRestaurantId(Integer.parseInt(req.getParameter("restaurantId")));

		menu.setItemName(req.getParameter("itemName"));

		menu.setDescription(req.getParameter("description"));

		menu.setPrice(new BigDecimal(req.getParameter("price")));

		menu.setCategory(req.getParameter("category"));

		dao.updateMenu(menu);

		resp.sendRedirect("menu1?restaurantId=" + menu.getRestaurantId());

	}

}