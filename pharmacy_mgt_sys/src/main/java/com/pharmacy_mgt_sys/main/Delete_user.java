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
 * Servlet implementation class Delete_user
 */
@WebServlet("/Delete_user")
public class Delete_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_user() {
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

		int userID = Integer.parseInt(request.getParameter("userID"));

	    // Delete the record from the database
	    try {
	        Connection conn = cp.connect();
	        PreparedStatement pstmt = conn.prepareStatement("DELETE FROM users_info WHERE id=?");
	        pstmt.setInt(1, userID); 
	        pstmt.executeUpdate();
	        conn.close();
	    } catch (SQLException ex) {
	        out.println("Error: " + ex.getMessage());
	        return;
	    }

	    // Redirect to the inventory page
	    response.sendRedirect("emp.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
