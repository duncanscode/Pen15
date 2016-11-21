<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery</title>
</head>
<body>

<h1>Search for the products you want to buy:</h1>

<form method="get" action="listprod.jsp">
<input type="text" name="productName" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all products)
</form>

<% // Get product name to search for
String name = request.getParameter("productName");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con = null;
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dhamilto;";
String uid = "dhamilto";
String pw = "37158110";
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
		
try{
	con = DriverManager.getConnection(url, uid, pw);
	out.print(name);
	PreparedStatement ps = null;
	if (name != null){
		ps = con.prepareStatement("SELECT productName, price, productId FROM Product WHERE productName LIKE ?;");
		name = "%" + name + "%";
		ps.setString(1, name);
	} else {
		ps = con.prepareStatement("SELECT productName, price, productId FROM Product");
	}
	ResultSet rs = ps.executeQuery();
	out.print("<table><tr><th></th><th>Product Name</th><th>Price</th></tr>");
	while(rs.next()){
		out.print("<tr><td><a href=\"addcart.jsp?id="+ rs.getInt(3) + "&name=" + rs.getString(1) + "&price=" + rs.getDouble(2) + "\">Add to Cart</a></td><td>" + rs.getString(1) + "</td><td>" + currFormat.format(rs.getDouble(2)) + "</td></tr>");
	}
	out.print("</table>");
	con.close();
} catch (SQLException ex){
	System.err.println("SQLException: " + ex);
}

		
// Variable name now contains the search string the user entered
// Use it to build a query and print out the resultset.  Make sure to use PreparedStatement!

// Make the connection

// Print out the ResultSet

// For each product create a link of the form
// addcart.jsp?id=<productId>&name=<productName>&price=<productPrice>

// Close connection

// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0);	// Prints $5.00
%>

</body>
</html>
