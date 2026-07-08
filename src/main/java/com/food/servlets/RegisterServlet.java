package com.food.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImpl.UserDaoImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String role = req.getParameter("role");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");

		if (!password.equals(confirmPassword)) {

			resp.getWriter().println("Passwords do not match");
			return;

		}

		String hashpw = BCrypt.hashpw(password, BCrypt.gensalt(12));

		User user = new User(name, hashpw, email, address, role);

		UserDaoImpl userDaoImpl = new UserDaoImpl();
		int res = userDaoImpl.addUser(user);

		if (res == 1) {
			resp.sendRedirect("login.html");
		} else {
			PrintWriter out = resp.getWriter();
			out.println("registration Failed");

			resp.sendRedirect("register.html");
		}

	}

}
