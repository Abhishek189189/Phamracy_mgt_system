package com.pharmacy_mgt_sys.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pharmacy_mgt_sys.dao.Connection_postgre;

/**
 * Servlet implementation class Edit_product
 */
@WebServlet("/Edit_product")
public class Edit_product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit_product() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
		    String productId = request.getParameter("productID");
		    out.println("<html>");
	        out.println("<head>");
	        out.println("<link rel=\"icon\" type=\"image/x-icon\" href=\"hops_icon.png\">");
	        out.println("<title>Edit Product</title>");
	        out.println("<style>");
	        out.println("body { margin: 0; padding: 0; font-family: Arial, sans-serif;}");
	        out.println("header { background-color: #333; color: #fff; padding: 3px; }");
	        out.println("nav { background-color: #f2f2f2; padding: 10px; }");
	        out.println("nav a { display: inline-block; margin: 0 10px; color: #333; }");
	        out.println("h1 { text-align: center; color: #66c2a5; }");
	        out.println("form { margin: 0px 0; padding: 10px; border: 1px solid #ddd; }");
	        out.println("input[type=text], input[type=number], input[type=date], select { display: block; margin: 10px 0; padding: 5px; border: 1px solid #ddd; }");
	        out.println("input[type=submit] { margin-top: 10px; padding: 5px 10px; background-color: #333; color: #fff; border: none; cursor: pointer; }");
	        out.println("</style>");
	        out.println("</head>");

	        // HTML content for the page
	        out.println("<body>");
	        out.println("<header>");
	        out.println("<h1>Edit Product</h1>");
	        out.println("</header>");
	        out.println("<nav>");
	        out.println("<center><a href=\"index.jsp\">Home</a>");
	        out.println("<a href=\"inventory.jsp\">View Inventory</a>");
	        out.println("<a href=\"Logout\">Logout</a></center>");
	        out.println("</nav>");

		    
		    try {
		        // Retrieve the product information from the database
				Connection_postgre cp = new Connection_postgre();
		        Connection conn = cp.connect();


		        String query = "SELECT * FROM products WHERE product_id=?";
		        PreparedStatement ps = conn.prepareStatement(query);
		        ps.setString(1, productId);
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            // Display the product information
		            out.println("<form action='Update_product' method='post'>");
		            out.println("<input type='hidden' name='productID' value='" + rs.getString("product_id") + "' />");
		            out.println("Product Name: <input type='text' name='productName' value='" + rs.getString("product_name") + "' /><br>");
		            out.println("Type: <select name=\"type\">\r\n"
		            		+ "          <option value=\"Generic\" selected>Generic</option>\r\n"
		            		+ "		  <option value=\"Prescription\">Prescription</option>\r\n"
		            		+ "		  <option value=\"OTC\">OTC</option>\r\n"
		            		+ "          <option value=\"Herbal\">Herbal</option>\r\n"
		            		+ "        </select> <br>");
		            out.println("Category: <select name=\"category\">\r\n"
		            		+ "          <option value=\"Tablets\" selected>Tablets</option>\r\n"
		            		+ "          <option value=\"Capsules\">Capsules</option>\r\n"
		            		+ "          <option value=\"Syrups\">Syrups</option>\r\n"
		            		+ "          <option value=\"Injections\">Injections</option>\r\n"
		            		+ "        </select> <br>");
		            out.println("Manufacturer: <input type='text' name='manufacturer' value='" + rs.getString("manufacturer") + "' /><br>");
		            out.println("Expiration Date: <input type='date' name='expirationDate' value='" + rs.getString("expiration_date") + "' /><br>");
		            out.println("Quantity: <input type='number' name='quantity' value='" + rs.getInt("quantity") + "' /><br>");
		            out.println("Cost: <input type='number' name='cost' value='" + rs.getDouble("cost") + "' /><br>");
		            out.println("<input type='submit' value='Update' />");
		            out.println("</form>");
		        } else {
		            // Display an error message if the product is not found
		            out.println("<h1>Error</h1>");
		            out.println("<p>The product with ID " + productId + " does not exist.</p>");
		        }
		        
		        rs.close();
		        ps.close();
		    } catch (SQLException e) {
		        out.println("<h1>Error</h1>");
		        out.println("<p>An error occurred while retrieving the product information from the database: " + e.getMessage() + "</p>");
		    }
		    String message = request.getParameter("message");

		    if (message != null && message.equals("success")) {
		        out.println("<script>alert('Product information updated successfully.');</script>");
		    } else if (message != null && message.equals("error")) {
		        out.println("<script>alert('Something went wrong while updating the product information.');</script>");
		    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
