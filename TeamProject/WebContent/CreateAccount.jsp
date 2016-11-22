<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create an account</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		String conPass = request.getParameter("conPass");
		String country = request.getParameter("country");
		String street = request.getParameter("street");
		String postalcode = request.getParameter("postalcode");
		String province = request.getParameter("province");
		
		Connection con = null;
		String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dolychuc;";
		String uid = "dolychuc";
		String pw = "42686155";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		try {
			con = DriverManager.getConnection(url, uid, pw);
			String sql = "INSERT INTO Account VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, pass);
			pst.setString(3, street);
			pst.setString(4, province);
			pst.setString(5, country);
			pst.setString(6, name);
			pst.setString(7, email);
			pst.setString(8, postalcode);
			pst.execute();

			String redirectURL = "pen15.html";
			response.sendRedirect(redirectURL);
		} catch (SQLException e) {
			String duplicateUser = new String();
			session.setAttribute("duplicateUser", "");
			String redirectURL = "AccountFields.jsp";
			response.sendRedirect(redirectURL);
		}
	%>
</body>
</html>