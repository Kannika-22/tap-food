package com.food.servlets;

import java.io.IOException;
import java.math.BigDecimal;

import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("user");

		if (user == null) {

			session.setAttribute("redirectAfterLogin", "cart");

			System.out.println(session.getAttribute("redirectAfterLogin"));

			resp.sendRedirect("login.html");
			return;

		}

		String paymentMode = req.getParameter("paymentMode");

		BigDecimal finalAmount = (BigDecimal) session.getAttribute("finalAmount");

		session.setAttribute("paymentMode", paymentMode);
		session.setAttribute("paymentAmount", finalAmount);

		RequestDispatcher rd = req.getRequestDispatcher("payment.jsp");

		rd.forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String mode = req.getParameter("mode");

		if (mode != null) {

			session.setAttribute("paymentMode", mode);

		}

		RequestDispatcher rd = req.getRequestDispatcher("payment.jsp");

		rd.forward(req, resp);

	}

}