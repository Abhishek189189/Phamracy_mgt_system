<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hops Healthcare</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");
if(sds == null){alert("You are using a free package.\n You are not allowed to remove the tag.\n");}
}
</script> 

<%@ page import="javax.servlet.http.HttpSession" %>
	<link rel="icon" type="image/x-icon" href="hops_icon.png">

</head>

<body>
<div id="header">
	<div id="navigation">
    	<ul>
        	<li><a href="index.jsp">Home</a></li>
        	<li><a href="inventory.jsp">Inventory</a></li>
            <li><a href="aboutus.jsp">About Us</a></li>
            
              <% if(session.getAttribute("username") != null) { %>
        <li><a href="Logout">Log Out</a></li>
      <%  %>
      <% } else
    	  {%>
    	  <li><a href="login.jsp">Login</a></li>
    	  <% }%>
        </ul>	
    </div>
</div>

<table width="960" border="0" cellspacing="10" cellpadding="0" align="center">
<%if(request.getAttribute("order")!=null)
			{
			out.print("<table>");
			out.print("<div width='200' align='left'>");
			out.print("<font color='blue'><font size='10'>"+request.getAttribute("order"));
			
			out.print("</div>"); 
			out.print("<table>");
			}
			
			 %>
			 
			 

  <tr align="justify">
    <td valign="top" width="220px">
    	<img src="images/hioxindia-pharmacy_08.jpg" alt="" border="0" /> <br /> 
      <h1>Prescription Medicines</h1>
      	<p> These are medicines that require a prescription from a doctor or other licensed healthcare provider before they can be dispensed.</p>
    	<p align="right"><a href="category.jsp?name=pres" class="more">View More</a></p>
    </td>
    <td valign="top">
    	<img src="images/hioxindia-pharmacy_10.jpg" alt="" border="0" />
        <h1> OTC Medicines</h1>
      <p>These are medicines that can be purchased without a prescription, often at pharmacies or grocery stores</p>
      <br>
        <p align="right"><a href="category.jsp?name=otc" class="more">View More</a></p>
    </td>
    <td valign="top">
    	<img src="images/hioxindia-pharmacy_12.jpg" alt="" border="0" />
        <h1>Generic Medicines</h1>
      <p>These are medicines that are equivalent to brand-name medicines, but are sold under a different name and at a lower cost</p>
      <br>
        <p align="right"><a href="category.jsp?name=gen" class="more">View More</a></p>
    </td>
    <td valign="top">
    	<img src="images/hioxindia-pharmacy_14.jpg" alt="" border="0" />
        <h1>Herbal Medicines</h1>
      <p>These are medicines that are made from plants or plant extracts</p>
      <br><br>
        <p align="right"><a href="category.jsp?name=her" class="more">View More</a></p>
    </td>
  </tr>
  <tr><td colspan="4" style="border-bottom:1px solid #CCCCCC;"></td></tr>
</table>


<div id="content">
<table width="960" border="0" cellspacing="0" cellpadding="0">
  <tr align="justify">
    <td width="200" valign="top">
    	<img src="images/hioxindia-pharmacy_19.jpg" alt="" border="0" />    </td>
    <td width="760" valign="top">
    	<h1>Hops Healthcare </h1>
  <p>Hops Healthcare is a leading pharmacy management system that provides comprehensive and reliable solutions to the healthcare industry. Our team of experienced professionals is dedicated to helping our clients improve their operational efficiency and patient care by delivering innovative software and exceptional service.</p>
    <p>At Hops Healthcare, we are committed to making a positive impact on the healthcare industry by leveraging technology to solve complex problems and streamline processes. Our goal is to enable our clients to focus on what they do best - providing quality care to their patients - while we handle the rest.</p>
  
    </td>
  </tr>
</table>
</div>

<div id="footer">
  <div id="footer_1">
   		<ul>
        	<li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
        </ul>	<br />
    <span id="design">&copy;Hops Healthcare <a id="dum" href="https://hops.healthcare/" target="_blank">www.hopshealthcare.com</a></span>
    <script type="text/javascript">
    document.onload = ctck();
    </script>
  </div>
</div>
</body>
</html>
