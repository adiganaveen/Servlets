<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@page import="com.bridgelabz.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<style>
body {
	width: 100%;
	height: 100%;
	font-family: Arial, Helvetica, sans-serif;
	background: black;
	color: #fff;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.container {
	position: absolute;
	right: 450px;
	margin: 20px;
	max-width: 300px;
	padding: 16px;
	background-color: black;
}
/* Set a style for all buttons */
button {
	background-color: #4CAF58;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

</style>
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
	Session ID :<%=sessionID%>
	<div class="container">
	<h3>
		Hi
		<%=userName%>, Login successful.
	</h3>
	<br>
	<br>
	<br>
	<br><b> User : <%=userName%></b>
	<br>
	<div align="center">
		<form action="<%=response.encodeURL("CheckoutPage.jsp")%>"
			method="post">
			<button type="submit" value="submit">Details</button>
		</form>
		<form action="<%=response.encodeURL("LogoutServlet")%>" method="post">
			<button type="submit" value="submit">Logout</button>
		</form>
	</div>
	</div>
</body>
</html>