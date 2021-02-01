<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, com.Entity.Product"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ page import="com.Entity.Cart"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<style>
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
<title>View Product</title>
</head>
<body>

<%
Cart cart = (Cart) session.getAttribute("cart"); 
%>

	<nav class='nav nav-tabs navbar-dark bg-dark' style="background-color: grey">
			<h3 style="color: white">Bryan's Music Store</h3>
            <a href='/' class="nav-iten nav-link">Home</a>
            <a href='/products' class="nav-iten nav-link">Products</a>
            <%
            if(cart != null){
            	out.print("<a href='/cart' class='nav-iten nav-link' style='float: right'>Cart</a>");
            }
            if(session.getAttribute("username") != null) {
            	out.print("<a href='/editprofile' class='nav-iten nav-link'>" + session.getAttribute("username") + "</a>");
            	out.print("<a href='/logout' class='nav-iten nav-link'>Logout</a>");
            }
            else{
            	out.print("<a href='/login' class='nav-iten nav-link'>Login</a>");
            	out.print("<a href='/register' class='nav-iten nav-link'>Register</a>");
            }
            %>

        </nav>
        <br>


	<%
	Product p = (Product) session.getAttribute("product"); 
	%>
	<div class='container'>
		<h1><%out.print(p.getName()); %></h1>
		<img src='<%out.print(p.getPhotoLink());%>'>
		<h2>Category: <%out.print(p.getCategory()); %></h2>
		<h3>Condition: <%out.print(p.getConditionStatus()); %></h3>
		<h3>Price: $ <%out.print(p.getPrice()); %></h3>
		<a href='/addToCart?id=<%out.print(p.getId());%>'  name='id'>Add to Cart</a>
	</div>



</body>
</html>