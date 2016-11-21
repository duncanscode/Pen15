<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery Order List</title>
</head>
<body>

<h1>Order List</h1>



<% 
//Useful code for formatting currency values:
//NumberFormat currFormat = NumberFormat.getCurrencyInstance();
//out.println(currFormat.format(5.0);  // Prints $5.00

//Make connection

//Write query to retrieve all order headers

//For each order in the ResultSet

	// Print out the order header information
	// Write a query to retrieve the products in the order
	//   - Use a PreparedStatement as will repeat this query many times
	// For each product in the order
		// Write out product information 

//Close connection
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con = null;
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dhamilto;";
String uid = "dhamilto";
String pw = "37158110";

NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try {
	con = DriverManager.getConnection(url,uid,pw);
	//First Query
	PreparedStatement ps = con.prepareStatement("SELECT Distinct OP.orderId, C.customerId, cname, totalAmount " +
	"FROM Orders O, Customer C, Product P, OrderedProduct OP WHERE O.orderId = OP.orderId AND C.customerId = O.customerId AND P.productId = OP.productId;");
	//PreparedStatement ps = con.prepareStatement("SELECT * FROM OrderedProduct");
	ResultSet rs = ps.executeQuery();
	
	//Second Query
	ps = con.prepareStatement("SELECT productId, quantity, price FROM orderedProduct WHERE orderId = ?"); 
	
	
	while(rs.next()){
		out.print("<table border=\"1\"> <tr> <th> orderID</th><th>customerID</th><th>customerName</th><th>Total Amount</th></tr>");
		out.print("<tr><td>"+rs.getInt(1)+"</td><td>" + rs.getInt(2) + "</td><td>" + rs.getString(3) + "</td><td>" + currFormat.format(rs.getDouble(4)) + "</td></tr>");
		//set value for second query
		ps.setInt(1, rs.getInt(1));
		ResultSet rs1 = ps.executeQuery();
		out.print("<tr align=\"right\"><td colspan=\"4\"><table border=\"1\"> <th>Product Id</th> <th>Quantity</th> <th>Price</th></tr>");
		while(rs1.next()){
			out.print("<tr><td>" + rs1.getInt(1) + "</td><td>" + rs1.getInt(2) + "</td><td>" + currFormat.format(rs1.getDouble(3)) + "</td></tr>");
		}
		out.print("</table></td></tr></table>");
		
	}
	con.close();
} catch (SQLException ex) {
	System.err.println("SQLException: " + ex);
}

%>

</body>
</html>

