package com.bridgelabz.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bridgelabz.dbutil.UserDatabase;
import com.bridgelabz.model.User;

public class RegistartionServlet extends HttpServlet {
	static List<User> users = new ArrayList<User>();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String mobileNumber = req.getParameter("number");
		if (name.equals("") || email.equals("") || password.equals("") || mobileNumber.equals("")) {
			RequestDispatcher dis = req.getRequestDispatcher("/registration.html");
			dis.include(req, resp);
		} else {
			User user = new User();
			user.setEmail(email);
			user.setMobileNumber(mobileNumber);
			user.setName(name);
			user.setPassword(password);
			try {
				UserDatabase.registration(user);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			users.add(user);
			RequestDispatcher dis = req.getRequestDispatcher("/login.html");
			dis.forward(req, resp);
		}

	}

	public void display(User user) {
		System.out.println("Full Name 		: " + user.getName());
		System.out.println("Email     		: " + user.getEmail());
		System.out.println("Password  		: " + user.getPassword());
		System.out.println("Mobile Number   	: " + user.getMobileNumber());
	}
}
