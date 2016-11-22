<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import= "java.util.concurrent.TimeUnit"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("username");
	String pass = request.getParameter("password");
	
	Connection con = null;
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dolychuc;";
	String uid = "dolychuc";
	String pw = "42686155";
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	
	try {
		con = DriverManager.getConnection(url, uid, pw);
		String sql = "SELECT * FROM Account WHERE id = ? AND password= ?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,id);
		pst.setString(2,pass);
		ResultSet r = pst.executeQuery();
		if(r.next()) {
			String redirectURL = "Shopping.jsp";
		    response.sendRedirect(redirectURL);
		}
		else {
			String redirectURL = "FrontPage2.html";
		    response.sendRedirect(redirectURL);
			
		}
	}
		catch(SQLException e) {
			
		}
			
		
	%>

</body>
</html>