package com.pharmacy_mgt_sys.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pharmacy_mgt_sys.dao.Connection_postgre;


/**
 * Servlet implementation class Update_product
 */
@WebServlet("/Update_product")
public class Update_product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_product() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		

		/**
		 * Servlet implementation class Update_product
		 */

		        // TODO Auto-generated method stub
		        response.setContentType("text/html");
		        PrintWriter out = response.getWriter();
		        out.println("<style>");
		        out.println("h1 { text-align: center; color:#66c2a5 }");
		        out.println("</style>");

		        String productId = null;
		        try {
		            // Retrieve the product information from the request
		            productId = request.getParameter("productID");
		            String productName = request.getParameter("productName");
		            String type = request.getParameter("type");
		            String category = request.getParameter("category");
		            String manufacturer = request.getParameter("manufacturer");
		            String expirationDateStr = request.getParameter("expirationDate");
		            int quantity = Integer.parseInt(request.getParameter("quantity"));
		            double cost = Double.parseDouble(request.getParameter("cost"));
		            
		            // Convert the expiration date string to a Date object
		            Date expirationDate = null;
		            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		            try {
		                expirationDate = dateFormat.parse(expirationDateStr);
		            } catch (ParseException e) {
		                e.printStackTrace();
		            }

		            // Update the product information in the database
		            Connection_postgre cp = new Connection_postgre();
		            Connection conn = cp.connect();

		            String query = "UPDATE products SET product_name=?, type=?, category=?, manufacturer=?, expiration_date=?, quantity=?, cost=? WHERE product_id=?";
		            PreparedStatement ps = conn.prepareStatement(query);
		            ps.setString(1, productName);
		            ps.setString(2, type);
		            ps.setString(3, category);
		            ps.setString(4, manufacturer);
		            ps.setDate(5, new java.sql.Date(expirationDate.getTime()));
		            ps.setInt(6, quantity);
		            ps.setDouble(7, cost);
		            ps.setString(8, productId);
		            int result = ps.executeUpdate();

		            
		         // Check if the update was successful
		            if (result == 1) {
		                // Redirect the user to the Edit_product page with a success message
		                response.sendRedirect("Edit_product?productID=" + productId + "&message=success");
		            } else {
		                // Redirect the user to the Edit_product page with an error message
		                response.sendRedirect("Edit_product?productID=" + productId + "&message=error");
		            }
		            
		        } catch (Exception e) {
		            // Redirect the user to the Edit_product page with an error message
		            response.sendRedirect("Edit_product?productID=" + productId + "&message=error");
		        }

		    /**
		     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		     */
	

		

		        
	}
}


