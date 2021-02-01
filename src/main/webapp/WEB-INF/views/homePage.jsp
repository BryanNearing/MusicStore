<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
  background-color: grey;
}
</style>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>

<%
Cart cart = (Cart) session.getAttribute("cart"); 
%>

	<nav class='nav nav-tabs navbar-dark bg-dark'>
			<h3 style="color: white">Bryan's Music Store</h3>
            <a href='/' class="nav-iten nav-link active">Home</a>
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
    <img src="homeBackground.jpeg" style="width: 100%; height: 1200px">

</body>
</html>