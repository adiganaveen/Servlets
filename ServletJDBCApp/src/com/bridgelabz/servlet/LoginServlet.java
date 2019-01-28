package com.bridgelabz.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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
		PrintWriter out = resp.getWriter();
		RequestDispatcher dis = null;
		resp.setContentType("text/html");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		if (email.equalsIgnoreCase("") || password.equalsIgnoreCase("")) {
			out.write("<p><center>Please fill up all the fields...!</center></p>");
			dis = req.getRequestDispatcher("login.html");
			dis.include(req, resp);
		} else {
			LoginUser loginUser = new LoginUser();
			loginUser.setEmail(req.getParameter("email"));
			loginUser.setPassword(req.getParameter("password"));
			try {
				User user = UserDatabase.login(loginUser);
				if (user != null) {
					HttpSession session = req.getSession();
					session.setAttribute("uname", user.getName());
					// setting session to expiry in 30 mins
					session.setMaxInactiveInterval(5);

					Cookie cookie = new Cookie("uname", user.getName());
					cookie.setMaxAge(5);
					resp.addCookie(cookie);
					String encodedURL = resp.encodeRedirectURL("welcome.jsp");
					resp.sendRedirect(encodedURL);
				} else {
					out.write("<p><center>Warning : Incorrect user name or password</center></p>");
					dis = req.getRequestDispatcher("login.html");
					dis.include(req, resp);
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

		}
	}
}
