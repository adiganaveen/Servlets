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
	<form action="edit" method="post">
		<h2>
			<center>Editing</center>
		</h2>
		<div align="center">
			<div>
				<label>Full Name :</label> <input type="text" name="name"
					placeholder="<%=user.getName()%>">
			</div>
			<div>
				<label>Password :</label> <input type="password" name="password"
					placeholder="<%=user.getPassword()%>">
			</div>
			<div>
				<label>Mobile number :</label> <input type="text" name="number"
					placeholder="<%=user.getMobileNumber()%>">
			</div>
		

			<div align="center">
				<button type="submit" value="submit">Save</button>
			</div>
		</div>
	</form>
	<div align="center">
		<form action="<%=response.encodeURL("CheckoutPage.jsp")%>"
			method="post">
			<button type="submit" value="submit">Back</button>
		</form>
	</div>
		</div>
</body>
</html>