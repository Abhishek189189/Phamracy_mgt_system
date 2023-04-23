<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Login</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}
		header {
			background-color: #4CAF50;
			color: white;
			padding: 3px;
			text-align: center;
			margin-bottom:80px;
		}
		form {
			margin: auto;
			width: 50%;
			padding: 20px;
			border: 1px solid #ddd;
			border-radius: 5px;
		}
		label, input {
			display: block;
			margin: 10px 0;
		}
		input[type="submit"] {
			background-color: #4CAF50;
			color: white;
			padding: 10px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
		}
		.error {
	font-size: 16px;
	background-color: red; /* Red color */
	padding: 10px; /* Add some padding to the message */
	color: white; /* Change the color to red or any equivalent color value */
	text-align: center; /* Center the text within the message */	
	
	

}



.log
{
	font-size: 16px;
	 background-color: #4CAF50; /* Green color */
  color: white; /* Text color */
  padding: 10px; /* Add some padding to the message */
  text-align: center; /* Center the text within the message */	

}
	</style>
	<link rel="icon" type="image/x-icon" href="hops_icon.png">
	
</head>
<body>
	<header>
		<h1>Admin Login</h1>
	</header>
		
	<form action="Admin_login" method="post">
		<label for="username">Username:</label>
		<input type="text" id="username" name="username" required>
		<label for="email">Email:</label>
		<input type="email" id="email" name="email" required>
		<label for="password">Password:</label>
		<input type="password" id="password" name="password" required>
		
		<input type="submit" value="Login">
	</form>
	
	<% String cmps = request.getParameter("valid"); %>
					<% if(cmps != null && cmps.equals("fails")) {%>
	<br>
	<br>
	<center><span class="error">Invalid Login,Please Try Again!</span></center>
	<% } else{} %>



<% String cmpx = request.getParameter("check"); %>
					<% if(cmpx != null && cmpx.equals("true")) {%>
	<br>
	<br>
	<center><span class="log">Log Out Sucessfully!</span></center>
	<% } else{} %>
</body>
</html>
