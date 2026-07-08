package com.food.servlets;

import java.io.IOException;

import com.tap.DAOImpl.UserDaoImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgotpassword")
public class ForgotPasswordServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");

		UserDaoImpl dao = new UserDaoImpl();

		User user = dao.getUserByEmail(email);

		if (user != null) {

			HttpSession session = req.getSession();

			session.setAttribute("resetEmail", email);

			resp.sendRedirect("resetPassword.jsp");

		} else {

			req.setAttribute("error", "Email is not registered.");

			req.getRequestDispatcher("forgotPassword.jsp").forward(req, resp);

		}

	}

}