<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*, com.Entity.Product, com.Dao.ProductDaoImpl"%>
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

<meta charset="UTF-8">
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
<title>Products</title>
</head>
<body>

<%
Cart cart = (Cart) session.getAttribute("cart"); 
%>

	<nav class='nav nav-tabs navbar-dark bg-dark' style="background-color: grey">
		<h3 style="color: white">Bryan's Music Store</h3>
		<a href='/' class="nav-iten nav-link">Home</a> <a href='/products'
			class="nav-iten nav-link active">Products</a> 
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
	<div class='container' style='position: center'>
	<h1>All Of Our Products</h1>
	</div>
	<br>
	<div class="container" style="position: center">
	<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
	</div>
	<br>
	
	<div class='container' style='position: center; border: 2px; width: 100%'>
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
				ProductDaoImpl productDao = new ProductDaoImpl();
				List<Product> productList = productDao.getAllProducts();
		
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
	</div>
	
	<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("results");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
	
	


</body>
</html>