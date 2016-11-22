<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PEN15</title>
</head>
<style>
p.name {
	text-align: center;
	font-size: 96px;
	font-family: "Amatic SC";
}

ul {
	list-style-type: none;
	margin: 3cm;
	padding: 0;
	overflow: hidden;
	background-color: teal;
	text-align: center;
	position: relative;
	top: -100px;
}

li {
	float: left;
}

li a {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: #111;
}
</style>
<body>
	<div>
		<p class="name">
			<span style="color: red">P</span> <span style="color: green">E</span>
			<span style="color: blue">N</span> <span style="color: red">*</span>
			<span style="color: orange">1</span> <span style="color: purple">5</span>
		</p>
	</div>
	<ul style="text-align: center">
		<li><a href="ListProduct.jsp">List All Products</a></li>
		<li><a href="Ratings.jsp">Reviews</a></li>
		<li><a href="#Category4">FUTURE BUTTON</a></li>
		<li style="float: right"><a href="#Category4">Contact us</a></li>
	</ul>
</body>
</html>