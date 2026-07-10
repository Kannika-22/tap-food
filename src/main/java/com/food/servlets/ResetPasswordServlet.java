package com.food.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImpl.UserDaoImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/resetpassword")
public class ResetPasswordServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String email = (String) session.getAttribute("resetEmail");

		if (email == null) {

			resp.sendRedirect("forgotPassword.jsp");
			return;

		}

		String newPassword = req.getParameter("newPassword");
		String confirmPassword = req.getParameter("confirmPassword");

		if (!newPassword.equals(confirmPassword)) {

			req.setAttribute("error", "Passwords do not match");

			req.getRequestDispatcher("resetPassword.jsp").forward(req, resp);

			return;

		}

		UserDaoImpl userDao = new UserDaoImpl();

		User user = userDao.getUserByEmail(email);

		if (user == null) {

			req.setAttribute("error", "User not found");

			req.getRequestDispatcher("forgotPassword.jsp").forward(req, resp);

			return;

		}

		String encryptedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

		user.setPassword(encryptedPassword);

		userDao.updateUser(user);

		session.removeAttribute("resetEmail");

		resp.sendRedirect("login.html");

	}

}