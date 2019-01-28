<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userName = null;
		if (session.getAttribute("uname") == null) {
			response.sendRedirect("login.html");
		} else
			userName = (String) session.getAttribute("uname");
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("uname"))
					userName = cookie.getValue();
			}
		}
	%>
	<h3>
		Hi
		<%=userName%>, do the checkout.
	</h3>
	<br>
	<form action="logout" method="post">
		<input type="submit" value="Logout">
	</form>
</body>
</html>