<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.Entity.Product, com.Dao.OrderInfoDaoImpl, java.util.*"%>
    <%@ page import="com.Entity.Cart"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
	
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
a:link, a:visited {
  background-color: #343a40;
  border-radius: 8px;
  border: 2px double #cccccc;
  color: white;
  padding: 8px 17px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: #343a40;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Cart cart = (Cart) session.getAttribute("cart"); 
%>

	<nav class='nav nav-tabs navbar-dark bg-dark' style="background-color: grey">
		<h3 style="color: white">Bryan's Music Store</h3>
		<a href='/' class="nav-iten nav-link">Home</a> <a href='/products'
			class="nav-iten nav-link">Products</a>
		<%
		if(cart != null){
        	out.print("<a href='/cart' class='nav-iten nav-link' style='float: right'>Cart</a>");
        }
		if (session.getAttribute("username") != null) {
			out.print("<a href='/editprofile' class='nav-iten nav-link'>" + session.getAttribute("username") + "</a>");
			out.print("<a href='/logout' class='nav-iten nav-link'>Logout</a>");
		} else {
			out.print("<a href='/login' class='nav-iten nav-link'>Login</a>");
			out.print("<a href='/register' class='nav-iten nav-link'>Register</a>");
		}
		%>

	</nav>
	<br>
	
	<div class='container' style='position: center; border: 2px; width: 100%'>
		<h1>Your Order</h1>
		<table id="results">
			<tr>
				<th>Name</th>
				<th>Photo</th>
				<th>Category</th>
				<th>Condition</th>
				<th>Price</th>
				<th>More Information</th>
			</tr>
			<% 
				int id = (int) session.getAttribute("currentOrderId");
				OrderInfoDaoImpl orderDao = new OrderInfoDaoImpl();
				List<Product> productList = orderDao.getOrderById(id);
		
				for( Product p : productList ) {
			%>
			<tr>
				<td><% out.print(p.getName());%></td>
				<td><img src="<% out.print(p.getPhotoLink()); %>" width="100" height="100"></td>
				<td><% out.print(p.getCategory());%></td>
				<td><% out.print(p.getConditionStatus());%></td>
				<td>$<% out.print(p.getPrice());%></td>
				<td><a href='/viewProduct?id=<%out.print(p.getId());%>'  name='id'>Link</a></td>
			</tr>
				<%
				} 
				%>
		</table>
		<a href='/enterBillingInfo'>Enter Billing Info</a>
	</div>
	
	

</body>
</html>