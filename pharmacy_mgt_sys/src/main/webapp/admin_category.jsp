<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hops Healthcare</title>
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

/*select tag*/
select {
	width: 200px;
  padding: 8px;
  border-radius: 4px;
  border: none;
  background-color: #f2f2f2;
  color: #333;
  font-size: 18px;
  font-weight: bold;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 10 5'%3E%3Cpath d='M0 0 L5 5 L10 0'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: right 10px center;
  cursor: pointer;
    
}

select:hover, select:focus {
  outline: none;
  box-shadow: 0 0 3px #66c2a5;
}




</style>
	<link rel="icon" type="image/x-icon" href="hops_icon.png">
</head>
<body>

<ul>
  <li><a class="active" href="admin.jsp">Home</a></li>
  <li><a href="#about">About</a></li>
    <li><a href="Admin_logout">Log Out</a></li>

	
	  
</ul>

<br>
<br>
<br>
<br>

<div style="text-align: center;">
    <select id="category-select" onchange="location = this.value;">
      <option value="#">Select a category</option>
      <option value="admin_category.jsp?cat=otc">OTC</option>
      <option value="admin_category.jsp?cat=pres">Prescribed</option>
      <option value="admin_category.jsp?cat=her">Herbal</option>
      <option value="admin_category.jsp?cat=gen">Generic</option>
    </select>
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
      
      
      
    </tr>
    
    <br>
    <br>
    
    
    
    <%@ page import="java.sql.*,java.text.SimpleDateFormat,java.text.SimpleDateFormat" 
 %>
 
 
 <%
	String name = request.getParameter("cat");
	if (name != null && name.equals("pres")) {
	%>
	
<div style="text-align:center;">
  <h1 style="font-weight:bold; color:#66c2a5;">Prescription Medicines</h1>
</div>	
 

<%
   // Load the PostgreSQL JDBC driver
   Class.forName("org.postgresql.Driver");

   // Establish a connection to the database
   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/pharma_mgt_sys", "postgres", "root");

   String query = "SELECT * FROM products WHERE type = 'Prescription'";

   // Create a PreparedStatement with a SELECT query
   PreparedStatement pstmt = conn.prepareStatement(query);

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

<%} %>

<!-- type OTC -->

 <%
	String name1 = request.getParameter("cat");
	if (name1 != null && name1.equals("otc")) {
	%>
	
	<div style="text-align:center;">
  <h1 style="font-weight:bold; color:#66c2a5;">OTC</h1>
</div>
	
	
 

<%
   // Load the PostgreSQL JDBC driver
   Class.forName("org.postgresql.Driver");

   // Establish a connection to the database
   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/pharma_mgt_sys", "postgres", "root");

   String query = "SELECT * FROM products WHERE type = 'OTC'";

   // Create a PreparedStatement with a SELECT query
   PreparedStatement pstmt = conn.prepareStatement(query);

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

<%} %>

<!-- type Generic -->
 <%
	String name2 = request.getParameter("cat");
	if (name2 != null && name2.equals("gen")) {
	%>
	
	<div style="text-align:center;">
  <h1 style="font-weight:bold; color:#66c2a5;">Generic</h1>
</div>
 

<%
   // Load the PostgreSQL JDBC driver
   Class.forName("org.postgresql.Driver");

   // Establish a connection to the database
   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/pharma_mgt_sys", "postgres", "root");

   String query = "SELECT * FROM products WHERE type = 'Generic'";

   // Create a PreparedStatement with a SELECT query
   PreparedStatement pstmt = conn.prepareStatement(query);

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

<%} %>


<!-- type Herbal -->
 <%
	String name3 = request.getParameter("cat");
	if (name3 != null && name3.equals("her")) {
	%>
	
	<div style="text-align:center;">
  <h1 style="font-weight:bold; color:#66c2a5;">Herbal Medicine</h1>
</div>
	
	
 

<%
   // Load the PostgreSQL JDBC driver
   Class.forName("org.postgresql.Driver");

   // Establish a connection to the database
   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/pharma_mgt_sys", "postgres", "root");

   String query = "SELECT * FROM products WHERE type = 'Herbal'";

   // Create a PreparedStatement with a SELECT query
   PreparedStatement pstmt = conn.prepareStatement(query);

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

<%} %>

</table>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</div>
</body>
</html>