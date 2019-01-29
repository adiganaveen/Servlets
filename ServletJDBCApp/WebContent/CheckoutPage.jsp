<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bridgelabz.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	right: 500px;
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
	<div class="container">
	<h3>Hi, your details are :.</h3>
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
	<div align="center">
		<form action="<%=response.encodeURL("edit.jsp")%>" method="post">
			<button type="submit" value="submit">Edit</button>
		</form>
		<form action="<%=response.encodeURL("welcome.jsp")%>" method="post">
			<button type="submit" value="submit">Back</button>
		</form>
	</div>
	</div>
</body>
</html>