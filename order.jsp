<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery Order Processing</title>
</head>
<body>

<% 
// Get customer id
String custId = request.getParameter("customerId");
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con = null;
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dhamilto;";
String uid = "dhamilto";
String pw = "37158110";
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
double total = 0;

try {
	con = DriverManager.getConnection(url,uid,pw);
	PreparedStatement ps = con.prepareStatement("SELECT customerId FROM Customer;");
	ResultSet rs = ps.executeQuery();
	Boolean exist = false;
	while (rs.next()){
		if (custId == rs.getString(1)){
			exist = true;
		}
	}
	if (exist = false){
		out.print("INVALID CUSTOMER ID");
	} else {
		if (productList.isEmpty()){
			out.print("NO PRODUCTS IN CART");
		} else{
			//display order
			Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
			out.println("<h1>Your Order</h1>");
			out.print("<table><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
			out.println("<th>Price</th><th>Subtotal</th></tr>");
			while (iterator.hasNext())
			{ 
				Map.Entry<String, ArrayList<Object>> entry = iterator.next();
				ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
				out.print("<tr><td>"+product.get(0)+"</td>");
				out.print("<td>"+product.get(1)+"</td>");

				out.print("<td align=\"center\">"+product.get(3)+"</td>");
				double pr = Double.parseDouble( (String) product.get(2));
				int qty = ( (Integer)product.get(3)).intValue();

				out.print("<td align=\"right\">"+currFormat.format(pr)+"</td>");
				out.print("<td align=\"right\">"+currFormat.format(pr*qty)+"</td></tr>");
				out.println("</tr>");
				total = total +pr*qty;
				
				
			}
			out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
					+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
			out.println("</table>");
		
					
					
			PreparedStatement pstmt = con.prepareStatement("INSERT INTO Orders (productId, quantity) VALUES(custId, orderID, total)", Statement.RETURN_GENERATED_KEYS);			
			ResultSet keys = pstmt.getGeneratedKeys();
			keys.next();
			int orderId = keys.getInt(1);
			
			//add to orderedPRoduct
			Iterator<Map.Entry<String, ArrayList<Object>>> iterator1 = productList.entrySet().iterator();
			while (iterator1.hasNext()) { 
				Map.Entry<String, ArrayList<Object>> entry = iterator1.next();
				ArrayList<Object> product1 = (ArrayList<Object>) entry.getValue();
				String pId = (String) product1.get(0);
       			String price1 = (String) product1.get(2);
				double pr = Double.parseDouble(price1);
				int qty1 = ( (Integer)product1.get(3)).intValue();
				
				PreparedStatement ps4 = con.prepareStatement("INSERT INTO orderedProduct VALUES(orderId, pId, qty1, price1)");
	}
		}
		
		
	} 
} catch (SQLException ex){
	out.print("Error: couldn't get this to work. Great effort though, 10/10.");
}


// Determine if valid customer id was entered
// Determine if there are products in the shopping cart
// If either are not true, display an error message

// Make connection

// Save order information to database


	/*
	// Use retrieval of auto-generated keys.
	PreparedStatement pstmt = con.prepareStatement(, Statement.RETURN_GENERATED_KEYS);			
	ResultSet keys = pstmt.getGeneratedKeys();
	keys.next();
	int orderId = keys.getInt(1);
	*/

// Insert each item into OrderedProduct table using OrderId from previous INSERT

// Update total amount for order record

// Here is the code to traverse through a HashMap
// Each entry in the HashMap is an ArrayList with item 0-id, 1-name, 2-quantity, 3-price

/*
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext())
	{ 
		Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		String productId = (String) product.get(0);
        String price = (String) product.get(2);
		double pr = Double.parseDouble(price);
		int qty = ( (Integer)product.get(3)).intValue();
            ...
	}
*/

// Print out order summary
%>
</BODY>
</HTML>

