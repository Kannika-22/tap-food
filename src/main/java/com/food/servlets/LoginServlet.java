package com.food.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImpl.UserDaoImpl;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();

		UserDaoImpl userDaoImpl = new UserDaoImpl();
		User user = userDaoImpl.getUserByEmail(email);

		String dbpassword = user.getPassword();
		String name = user.getUserName();

		if (BCrypt.checkpw(password, dbpassword)) {

			session.setAttribute("user", user);

			String role = user.getRole();

			if ("Customer".equals(role)) {

				String redirect = (String) session.getAttribute("redirectAfterLogin");

				if (redirect != null) {

					session.removeAttribute("redirectAfterLogin");

					if ("cart".equals(redirect)) {

						resp.sendRedirect("cart.jsp");
						return;

					}

				}

				resp.sendRedirect("home.jsp");

			} else if ("DeliveryAgent".equals(role)) {

				resp.sendRedirect("deliveryDashboard.jsp");

			} else if ("Restaurant".equals(role)) {

				resp.sendRedirect("restaurantDashboard.jsp");

			} else if ("SuperAdmin".equals(role)) {

				resp.sendRedirect("adminDashboard");

			} else {

				resp.sendRedirect("login.html");

			}

		} else {

			PrintWriter out = resp.getWriter();
			out.println("<h3 style='color:red;text-align:center;'>Invalid Username or Password</h3>");

			RequestDispatcher rd = req.getRequestDispatcher("login.html");
			rd.forward(req, resp);
		}
	}
}