package com.food.servlets.admin;

import java.io.IOException;

import com.tap.DAOImpl.UserDaoImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminUpdateProfile")
public class AdminUpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("user") == null) {

			resp.sendRedirect("login.html");
			return;
		}

		User admin = (User) session.getAttribute("user");

		admin.setUserName(req.getParameter("userName"));
		admin.setEmail(req.getParameter("email"));
		admin.setAddress(req.getParameter("address"));

		UserDaoImpl dao = new UserDaoImpl();

		dao.updateUser(admin);

		session.setAttribute("user", admin);

		resp.sendRedirect("adminProfile");

	}

}