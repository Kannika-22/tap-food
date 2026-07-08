package com.food.servlets;

import java.io.IOException;

import com.tap.DAOImpl.MenuDaoImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callcartservlet")
public class CartServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		// If user clicked only "Cart", show the cart page
		if (req.getParameter("action") == null) {
			resp.sendRedirect("cart.jsp");
			return;
		}

		Cart cart = (Cart) session.getAttribute("cart");
		Integer restaurantId = (Integer) session.getAttribute("restaurantId");

		Integer newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));

		if (cart == null || restaurantId != newRestaurantId) {
			cart = new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("restaurantId", restaurantId);
		}

		String action = req.getParameter("action");

		if (action.equals("add")) {
			addItemToCart(req, cart);
		} else if (action.equals("update")) {
			updateCart(req, cart);
		} else if (action.equals("delete")) {
			removeItemFromCart(req, cart);
		}

		resp.sendRedirect("cart.jsp");
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {

		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));

		MenuDaoImpl menuDaoImpl = new MenuDaoImpl();
		Menu menu = menuDaoImpl.getMenu(menuId);

		HttpSession session = req.getSession();
		session.setAttribute("restaurantId", menu.getRestaurantId());

		if (menu != null) {
			CartItem cartItem = new CartItem(menuId, menu.getRestaurantId(), menu.getItemName(), menu.getImagePath(),
					menu.getPrice(), quantity);

			Cart.addItem(cartItem);
		}
	}

	private void updateCart(HttpServletRequest req, Cart cart) {

		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));

		cart.updateItem(menuId, quantity);

	}

	private void removeItemFromCart(HttpServletRequest req, Cart cart) {

		int menuId = Integer.parseInt(req.getParameter("menuId"));

		cart.removeItem(menuId);
	}

}
