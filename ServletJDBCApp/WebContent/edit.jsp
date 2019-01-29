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
		} else {
			user = (User) (session.getAttribute("User"));
		}
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("uname"))
					userName = cookie.getValue();
			}
		}
	%>
	<form action="edit" method="post">
		<h2>
			<center>Editing</center>
		</h2>
		<div align="center">
			<div>
				<label>Full Name</label> <input type="text" name="name"
					placeholder="<%=user.getName()%>">
			</div>
			<div>
				<label>E-mail</label>  :<%=user.getEmail()%>
			</div>
			<div>
				<label>Password </label> <input type="password" name="password"
					placeholder="<%=user.getPassword()%>">
			</div>
			<div>
				<label>Mobile number</label> <input type="text" name="number"
					placeholder="<%=user.getMobileNumber()%>">
			</div>
			<a href="<%=response.encodeURL("CheckoutPage.jsp") %>">Go Back</a>
			<div>
				<input type="submit" value="save">
			</div>
		</div>
	</form>
</body>
</html>