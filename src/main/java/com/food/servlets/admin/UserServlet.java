package com.food.servlets.admin;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.UserDaoImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/users")
public class UserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		UserDaoImpl dao = new UserDaoImpl();

		List<User> users = dao.getAllUser();

		req.setAttribute("users", users);

		req.getRequestDispatcher("/admin/users.jsp").forward(req, resp);
	}

}