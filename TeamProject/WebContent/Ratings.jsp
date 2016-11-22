<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Dustin's Grocery</title>
</head>
<body>

	<h1>Search for Ratings by Product</h1>
	<form method="get" action="Ratings.jsp">
		<input type="text" name="rating" size="50"> <input
			type="submit" value="Submit"><input type="reset"
			value="Reset">
	</form>

	<%
		// Get product name to search for
		String name = request.getParameter("rating");
		Connection con = null;
		String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dolychuc;";
		String uid = "dolychuc";
		String pw = "42686155";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		NumberFormat currFormat = NumberFormat.getCurrencyInstance();
		try {
			con = DriverManager.getConnection(url, uid, pw);
			if (name != null) {
				out.print("<h2 style=\"color:red\">Product Review</h2>");
				out.print("<table border=\"1\"><tr><th>Product Name</th><th>Product ID</th><th>Username</th><th>Date</th><th>Comment</th></tr>");
				String sql = "SELECT R.productID,accountID,date,comment,name FROM Ratings AS R,Products AS P "
						+"WHERE R.productID = P.productID AND name LIKE ?";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1,'%'+name+'%');
				ResultSet search = pst.executeQuery();
				while (search.next()) {
					out.print("<tr><td>"+search.getString("name")+"</td><td>"+search.getInt(1) +"</td><td>"+search.getString(2)+"</td><td>"+ search.getDate(3)+"</td><td>"+search.getString(4) +"</td></tr>");
				}
				out.print("</table>");
			}

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