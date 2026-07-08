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

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("user") == null) {

			resp.sendRedirect("login.html");
			return;
		}

		// Logged-in user from session
		User sessionUser = (User) session.getAttribute("user");

		// Updated values from form
		String userName = req.getParameter("userName");
		String email = req.getParameter("email");
		String address = req.getParameter("address");

		// Update only editable fields
		sessionUser.setUserName(userName);
		sessionUser.setEmail(email);
		sessionUser.setAddress(address);

		// Update database
		UserDaoImpl userDao = new UserDaoImpl();
		userDao.updateUser(sessionUser);

		// Update session
		session.setAttribute("user", sessionUser);

		// Success message
		session.setAttribute("successMessage", "Profile updated successfully!");

		// Redirect
		resp.sendRedirect("profile");
	}
}