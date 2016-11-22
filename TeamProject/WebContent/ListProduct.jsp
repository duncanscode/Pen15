<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.NumberFormat"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Products</title>
</head>
<style>
p.name {
	text-align: center;
	font-size: 96px;
	font-family: "Amatic SC";
}
h1.title {
	font-family: "Amatic SC";
}
</style>
<body>
<div><p class="name">
		<span style="color: red">P</span> 
		<span style="color: green">E</span>
		<span style="color: blue">N</span> 
		<span style="color: red">*</span> 
		<span style="color: orange">1</span>
	    <span style="color: purple">5</span>
	</p></div>
	
	<h1 class= "title">Products List</h1>
<%
		Connection con = null;
		String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dolychuc;";
		String uid = "dolychuc";
		String pw = "42686155";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		NumberFormat currFormat = NumberFormat.getCurrencyInstance();
		try {
			con = DriverManager.getConnection(url, uid, pw);
				Statement st = con.createStatement();
				ResultSet rst = st.executeQuery("SELECT productID,name,price,description FROM Products");

				out.println("<table border=\"1\"><tr><th></th><th>Product Name</th><th>Price</th><th>Description</th></tr>");
				while (rst.next()) {
					out.println("<tr><td><a href=\"addcart.jsp?id=" + rst.getString(1) + "&name=" + rst.getString(2)
							+ "&price=" + rst.getDouble(3) + "\">Add to Cart</a></td><td>" + rst.getString(2)
							+ "</td><td>" + currFormat.format(rst.getDouble(3)) + "</td><td>" + rst.getString(4) + "</td></tr>");
					
				}
				out.println("</table>");
		} catch (SQLException e) {

		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {

			}
		}
	%>
</body>
</html>