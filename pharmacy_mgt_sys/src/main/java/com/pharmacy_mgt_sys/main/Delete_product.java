package com.pharmacy_mgt_sys.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pharmacy_mgt_sys.dao.Connection_postgre;

/**
 * Servlet implementation class Delete_product
 */
@WebServlet("/Delete_product")
public class Delete_product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_product() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	response.setContentType("text/html");
		
		Connection_postgre cp = new Connection_postgre();

	      PrintWriter out = response.getWriter();

		String productId = request.getParameter("productID");

	    // Delete the record from the database
	    try {
	        Connection conn = cp.connect();
	        PreparedStatement pstmt = conn.prepareStatement("DELETE FROM products WHERE product_id=?");
	        pstmt.setString(1, productId);
	        pstmt.executeUpdate();
	        conn.close();
	    } catch (SQLException ex) {
	        out.println("Error: " + ex.getMessage());
	        return;
	    }

	    // Redirect to the inventory page
	    response.sendRedirect("inventory.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
