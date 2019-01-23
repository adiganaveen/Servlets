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
import com.bridgelabz.model.LoginUser;
import com.bridgelabz.model.User;

public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean flag=false;
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		if (email.equalsIgnoreCase("") || password.equalsIgnoreCase("")) {
			RequestDispatcher dis = req.getRequestDispatcher("/login.html");
			dis.include(req, resp);
		} else {
			LoginUser loginUser = new LoginUser();
			loginUser.setEmail(req.getParameter("email"));
			loginUser.setPassword(req.getParameter("password"));
			try {
				User user=UserDatabase.login(loginUser);
				if(user!=null)
				{
						RequestDispatcher dis = req.getRequestDispatcher("/welcome.html");
						req.setAttribute("user", user);
						dis.forward(req, resp);
				}
				else
				{
					RequestDispatcher dis = req.getRequestDispatcher("/login.html");
					dis.include(req, resp);
				}
				} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
}
