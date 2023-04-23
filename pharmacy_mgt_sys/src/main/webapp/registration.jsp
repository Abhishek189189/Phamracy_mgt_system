<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration Form</title>
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
	margin-bottom: 4px;
	
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
	color: red; /* Change the color to red or any equivalent color value */
}
</style>
<link rel="icon" type="image/x-icon" href="hops_icon.png">

</head>
<body>
<%@ page import="java.util.*" %>
<%! 
String randomchar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcefghijklmnopqrstuvwxyz0123456789";
StringBuilder s = new StringBuilder();


%>

<%
for(int i=0;i<5;i++)
{
	int ch = (int)(randomchar.length()* Math.random());
	s.append(randomchar.charAt(ch));
}

%>
	<header>
		<h1>Employee Sign Up</h1>
	</header>
	<form action="reg" method="post">
		<label for="username">Username:</label> <input type="text"
			id="username" name="username" required> <label for="email">Email:</label>
		<input type="email" id="email" name="email" required> <label
			for="password">Password:</label> <input type="password" id="password"
			name="password" required> <label for="confirm-password">Confirm
			Password:</label> <input type="password" id="confirm-password"
			name="confirm-password" required> 
			
			<font size="+3">
			<input type="hidden" name="csp" value="<%=s %>">
			<%
			out.println(s);
			%>
			</input>
			
			<% s.setLength(0); %>
			</font>
			<label for="captcha">Captcha:</label>
			<input type="text"
			id="captcha" name="captcha" required>
			<input type="submit"
			value="Register"> 
			
			
			
			<a href="login.jsp">Already Have an
			Account?</a>
	</form>


	<%
	String param1 = request.getParameter("param1");
	if (param1 != null && param1.equals("value1")) {
	%>
	<center>
		<p class="error">password must be atleast 8 characters,include
			atleast one Capital and Small latter.</p>
	</center>

	<%
	}
	%>
	
		<%
	String confirm = request.getParameter("confirm");
	if (confirm != null && confirm.equals("no")) {
	%>
	<center>
		<p class="error">Password and Confirm password must be same</p>
	</center>

	<%
	}
	%>
	
			<%
	String check = request.getParameter("captcha");
	if (check != null && check.equals("no")) {
	%>
	<center>
		<p class="error">Invalid Captcha please Try Again!</p>
	</center>

	<%
	}
	%>




</body>
</html>
