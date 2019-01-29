<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@page import="com.bridgelabz.model.User"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login Success Page</title>
</head>
<body>
	<%
		String userName = null;
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("uname"))
					userName = cookie.getValue();
				if (cookie.getName().equals("JSESSIONID")) {
					sessionID = cookie.getValue();
				} else {
					sessionID = session.getId();
				}
			}
		}
		if (userName == null)
			response.sendRedirect("login.html");
	%>
	<h3>
		Hi
		<%=userName%>, Login successful.
	</h3><br>
	Your Session ID=<%=sessionID%>
	<br><br><br>
	<br> User=<%=userName%>
	<br>
	<a href="<%=response.encodeURL("CheckoutPage.jsp") %>">User Details</a>
	<form action="<%=response.encodeURL("LogoutServlet") %>" method="post">
		<input type="submit" value="Logout">
	</form>
</body>
</html>