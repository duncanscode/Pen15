<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create an account</title>
</head>
<body>
	<h2>Create an account</h2>
	<%
		if (session.getAttribute("duplicateUser") != null) {
			out.println("<p style=\"color:red\">Username already exists</p>");
			session.setAttribute("duplicateUser", null);
		}
	%>
	<form class="login" action="CreateAccount.jsp" method="get">
		Name: <br> <input type="text" name="name"><br>
		<br> User Name: <br> <input type="text" name="id"><br>
		<br> Email: <br> <input type="text" name="email"><br>
		<br> Password: <br> <input type="password" name="password"><br>
		<br> Confirm Password: <br> <input type="password"
			name="conPass"><br>
		<br> Country: <br> <input type="text" name="country"><br>
		<br> Street: <br> <input type="text" name="street"><br>
		<br> Province: <br> <input type="text" name="province"><br>
		<br> PostalCode <br> <input type="text" name="postalcode"><br>
		<br> <input type="submit" value="Submit">
	</form>
</body>
</html>