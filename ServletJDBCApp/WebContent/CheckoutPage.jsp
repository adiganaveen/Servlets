<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bridgelabz.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		User user = new User();
		String userName = null;
		String sessionID = null;
		if (session.getAttribute("User") == null) {
			response.sendRedirect("login.html");
		} else
		{
				user =(User)(session.getAttribute("User"));
		}
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("uname"))
					userName = cookie.getValue();
			}
		}
	%>
	<h3>
		Hi, your details are :.
	</h3>
	<br>
	<div>
		Name :
		<%=user.getName()%></div>
	<div>
		Email :
		<%=user.getEmail()%></div>
	<div>
		Password :<%=user.getPassword()%></div>
	<div>
		Mobile Number :
		<%=user.getMobileNumber()%></div>
	<a href="<%=response.encodeURL("welcome.jsp") %>">Go Back</a>
	<form action="<%=response.encodeURL("edit.jsp")%>" method="post">
	<input type="submit" value="Edit">
	</form>
</body>
</html>