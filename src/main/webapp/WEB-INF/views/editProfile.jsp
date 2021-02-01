<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ page import="java.util.*, com.Entity.Profile, com.Dao.ProfileDaoImpl"%>
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
button {
        display: inline-block;
        background-color: black;
        border-radius: 10px;
        border: 2px double #cccccc;
        color: #eeeeee;
        text-align: center;
        font-size: 14px;
        padding: 7px;
        width: 80px;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
        -o-transition: all 0.5s;
        transition: all 0.5s;
        cursor: pointer;
        margin: 5px;
      }
</style>
<meta charset="UTF-8">
<title>Edit Profile</title>
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
            	out.print("<a href='/editprofile' class='nav-iten nav-link active'>" + session.getAttribute("username") + "</a>");
            	out.print("<a href='/logout' class='nav-iten nav-link'>Logout</a>");
            }
            else{
            	out.print("<a href='/login' class='nav-iten nav-link active'>Login</a>");
            	out.print("<a href='/register' class='nav-iten nav-link'>Register</a>");
            }
            %>

        </nav>
        
        <%
        	ProfileDaoImpl pDao = new ProfileDaoImpl();
        	Profile p = pDao.getProfile((String) session.getAttribute("username")); 
        %>

<div class="container" style="position: center">
	<form:form action="editsuccess" method="post" modelAttribute="p">
		<input type=hidden name='id' value='<%out.print(p.getId());%>'>
		Username<br><input type="text" name="username" value='<%out.print(p.getUsername());%>'><br>
		Password<br><input type="text" name="password" value='<%out.print(p.getPassword());%>'><br>
		Email<br><input type="email" name="email" value='<%out.print(p.getEmail());%>'><br>
		Phone Number<br><input type="text" name="phoneNumber" value='<%out.print(p.getPhoneNumber());%>'><br>
		Billing Address<br><input type="text" name="billingAddress" value='<%out.print(p.getBillingAddress());%>'><br>
		City<br><input type="text" name="city" value='<%out.print(p.getCity());%>'><br>
		State<br><input type="text" name="state" value='<%out.print(p.getState());%>'><br>
		Zip Code<br><input type="text" name="zipCode" value='<%out.print(p.getZipCode());%>'><br>
		<button type="submit">Edit</button>
	</form:form>
</div>

</body>
</html>