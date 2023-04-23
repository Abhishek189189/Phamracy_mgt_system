<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
            <%
    if(session.getAttribute("admin_user") == null) {
%>
        <script>
            alert("Please login to access this page.");
            window.location.href = "admin_login.jsp";
        </script>
<%
    }
%>
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



</style>
	<link rel="icon" type="image/x-icon" href="hops_icon.png">

</head>
<body>
<ul>
  <li><a class="active" href="admin.jsp">Home</a></li>
  <li><a href="#about">About</a></li>
    <li><a href="Logout">Log Out</a></li>
  
</ul>
<div style="text-align:center;">
  <h1 style="font-weight:bold; color:#66c2a5;">Employee Info</h1>
</div>


  <table>
    <tr>
      <th>ID</th>
      <th>User Name</th>
      <th>Email</th>
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
   PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM users_info");

   // Execute the query and retrieve the result set
   ResultSet rs = pstmt.executeQuery();

   // Generate the HTML code for the table rows
   while (rs.next()) {
      out.println("<tr>");
      out.println("<td>" + rs.getString("id") + "</td>");
      out.println("<td>" + rs.getString("name") + "</td>");
      out.println("<td>" + rs.getString("email") + "</td>");

     

      // Delete button
      out.println("<td><form method='GET' action='Delete_user' onsubmit=\"return confirm('Are you sure you want to delete this user?');\">");
      out.println("<input type='hidden' name='userID' value='" + rs.getString("id") + "' />");
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

</body>
</html>