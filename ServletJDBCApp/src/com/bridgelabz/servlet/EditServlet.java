package com.bridgelabz.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bridgelabz.dbutil.UserDatabase;
import com.bridgelabz.model.User;

public class EditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		User user = (User) session.getAttribute("User");
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String mobileNumber = req.getParameter("number");
		if (name.equals("") || password.equals("") || mobileNumber.equals("")) {
			resp.sendRedirect("edit.jsp");
		} else {
			user.setMobileNumber(mobileNumber);
			user.setName(name);
			user.setPassword(password);
			try {
				UserDatabase.edit(user);
				resp.sendRedirect("CheckoutPage.jsp");
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
	}
}