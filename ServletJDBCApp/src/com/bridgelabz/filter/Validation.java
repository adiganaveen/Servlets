package com.bridgelabz.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Validation implements Filter {
	static final String REGEX_EMAIL_ID = "^[a-z0-9._%-]+@[a-z0-9.-]+\\.[a-z]{2,4}$";
	//static final String REGEX_PASSWORD = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
	static final String REGEX_CONTACT = "^[0-9]{10}$";

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chainObj)
			throws IOException, ServletException {
		RequestDispatcher requestDispatcher = null;
		HttpServletResponse response = (HttpServletResponse) res;
		PrintWriter out=response.getWriter();
		HttpServletRequest request = (HttpServletRequest) req;
		String emailid = request.getParameter("email");
		String number = request.getParameter("number");		 
		if (emailid.matches(REGEX_EMAIL_ID) &&(number.matches(REGEX_CONTACT))) {
			chainObj.doFilter(request, response);
		} else {
			out.write("<p><center><b>Please enter the valid details...!!!</b></center></p>");
			requestDispatcher = request.getRequestDispatcher("/registration.html");
			requestDispatcher.include(request, response);
		}
	}

	@Override
	public void destroy() {
	}
}
