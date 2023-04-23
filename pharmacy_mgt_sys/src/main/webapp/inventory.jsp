
<%@ page import="javax.servlet.http.HttpSession" %>
        <%
    if(session.getAttribute("username") == null) {
%>
        <script>
            alert("Please login to access this page.");
            window.location.href = "login.jsp";
        </script>
<%
    }
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pharmacy Inventory System</title>
	<link rel="icon" type="image/x-icon" href="hops_icon.png">

<style>
table {
  border-collapse: collapse;
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
}

th, td {
  text-align: left;
  padding: 8px;
  border: 1px solid #ddd;
}

th {
  background-color: #f2f2f2;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:nth-child(odd) {
  background-color: #f2f2f2;
}

@media only screen and (max-width: 600px) {
  table {
    font-size: 12px;
  }
}

input[type="text"], select, input[type="date"], input[type="number"] {
  width: 100px;
}
nav {
  background-color: #333;
  height: 50px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
}

nav ul {
  list-style: none;
  display: flex;
  margin: 0;
  padding: 0;
}

nav ul li {
  margin-left: 20px;
}

nav ul li:first-child {
  margin-left: 0;
}

nav ul li a {
  color: #fff;
  text-decoration: none;
  font-weight: bold;
  font-size: 18px;
  transition: color 0.2s ease;
}

nav ul li a:hover {
  color: #66c2a5;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #66c2a5;
}

 
</style>
</head>

<body>

<ul>
  <li><a class="active" href="index.jsp">Home</a></li>
  <li><a href="aboutus.jsp">About</a></li>
    <li><a href="Logout">Log Out</a></li>
  
</ul>





    <h1 style="text-align: center; color:#66c2a5;">Pharmacy Inventory System</h1>


<form action="Add_product" method="post">
  <table>
    <tr>
      <th>Product Name</th>
      <th>Product ID</th>
      <th>Type</th>
      <th>Category</th>
      <th>Manufacturer</th>
      <th>Expiration Date</th>
      <th>Quantity</th>
      <th>Cost</th>
    </tr>
    <tr>
      <td><input type="text" name="productName" required></td>
      <td><input type="text" name="productID" required></td>
      <td>
        <select name="type">
          <option value="Generic" selected>Generic</option>
		  <option value="Prescription">Prescription</option>
		  <option value="OTC">OTC</option>
          <option value="Herbal">Herbal</option>
        </select>
      </td>
      <td>
        <select name="category">
          <option value="Tablets" selected>Tablets</option>
          <option value="Capsules">Capsules</option>
          <option value="Syrups">Syrups</option>
          <option value="Injections">Injections</option>
        </select>
      </td>
      <td><input type="text" name="manufacturer" required></td>
      <td><input type="date" name="expirationDate" required></td>
      <td>
        <div>
          <input type="number" name="quantity" value="0" required>
        </div>
      </td>
      <td><input type="number" name="cost" required></td>
    </tr>
  </table>
<div style="text-align:center">
<br>
<br>
<input type="submit" name="addButton" value="Add" style="background-color: #66c2a5; color: white; font-size: 16px; font-weight: bold; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
</div>
</form>

<br>
<br>
<div style="text-align:center;">
  <h1 style="font-weight:bold; color:#66c2a5;">Pharmacy Stock</h1>
</div>


  <table>
    <tr>
      <th>Product Name</th>
      <th>Product ID</th>
      <th>Type</th>
      <th>Category</th>
      <th>Manufacturer</th>
      <th>Expiration Date</th>
      <th>Quantity</th>
      <th>Cost</th>
      <th></th>
      <th></th>
      
      
      
    </tr>

<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.text.SimpleDateFormat" 
 %>
 
 
 
 

<%
   // Load the PostgreSQL JDBC driver
   Class.forName("org.postgresql.Driver");

   // Establish a connection to the database
   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/pharma_mgt_sys", "postgres", "root");

   // Create a PreparedStatement with a SELECT query
   PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM products");

   // Execute the query and retrieve the result set
   ResultSet rs = pstmt.executeQuery();

   // Generate the HTML code for the table rows
   while (rs.next()) {
      out.println("<tr>");
      out.println("<td>" + rs.getString("product_name") + "</td>");
      out.println("<td>" + rs.getString("product_id") + "</td>");
      out.println("<td>" + rs.getString("type") + "</td>");
      out.println("<td>" + rs.getString("category") + "</td>");
      out.println("<td>" + rs.getString("manufacturer") + "</td>");
      out.println("<td>" + rs.getString("expiration_date") + "</td>");

      out.println("<td>" + rs.getInt("quantity") + "</td>");
      out.println("<td>" + rs.getDouble("cost") + "</td>");
      // Edit button
      out.println("<td><form method='GET' action='Edit_product'>");
      out.println("<input type='hidden' name='productID' value='" + rs.getString("product_id") + "' />");
      out.println("<button type='submit' class='btn btn-primary'>Edit</button>");
      out.println("</form></td>");

      // Delete button
      out.println("<td><form method='GET' action='Delete_product' onsubmit=\"return confirm('Are you sure you want to delete this product?');\">");
      out.println("<input type='hidden' name='productID' value='" + rs.getString("product_id") + "' />");
      out.println("<button type='submit' class='btn btn-danger'>Delete</button>");
      out.println("</form></td>");
      
      out.println("</tr>");
   }

   // Close the resources
   rs.close();
   pstmt.close();
   conn.close();
%>
</table>




<script>

</script>

</body>
</html>
