<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
button {
        display: inline-block;
        background-color: black;
        border-radius: 10px;
        border: 2px double #cccccc;
        color: #eeeeee;
        text-align: center;
        font-size: 14px;
        padding: 7px;
        width: 160px;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
        -o-transition: all 0.5s;
        transition: all 0.5s;
        cursor: pointer;
        margin: 5px;
      }
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
<title>Enter Billing Info</title>
</head>
<body>

<nav class='nav nav-tabs navbar-dark bg-dark' style="background-color: grey">
		<h3 style="color: white">Bryan's Music Store</h3>
		<a href='/' class="nav-iten nav-link">Home</a> <a href='/products'
			class="nav-iten nav-link">Products</a>
		<%
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
	
	<div class="container" style="position: center">
	<form:form action="paymentSuccess" method="get">
		Credit Card #<br><input type="tel" inputmode="numeric" pattern="[0-9\s]{13,19}" autocomplete="cc-number" maxlength="19" placeholder="xxxx xxxx xxxx xxxx"><br>
		Name on Card<br><input type="text" name="name"><br>
		Billing Address<br><input type="text" name="billingAddress"><br>
		Expiration Date<br><input type="month" name="ccExpDate"><br>
		Card Security Code<br><input type="number" name="csc"><br>
		<button type="submit">Pay</button>
	</form:form>
</div>

</body>
</html>