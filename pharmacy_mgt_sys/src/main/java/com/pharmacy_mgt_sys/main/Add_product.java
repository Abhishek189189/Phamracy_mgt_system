package com.pharmacy_mgt_sys.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pharmacy_mgt.entity.Product;

/**
 * Servlet implementation class Add_product
 */
@WebServlet("/Add_product")
public class Add_product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_product() {
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
		response.setContentType("text/html");

	      // Actual logic goes here.
	      PrintWriter out = response.getWriter();
	      
		
		String productName = request.getParameter("productName");
	    String productID = request.getParameter("productID");
	    String category = request.getParameter("category");
	    String type = request.getParameter("type");
	    String manufacturer = request.getParameter("manufacturer");
	    String expirationDate = request.getParameter("expirationDate");
	    int quantity = Integer.parseInt(request.getParameter("quantity"));
	    BigDecimal cost = new BigDecimal(request.getParameter("cost"));
	    



	    System.out.println(productName + " " + productID + " " + type + " " + category + " " + manufacturer + " " + expirationDate +" " + quantity + " " + cost );
	    
	    Product pd =new Product();
	    try {
			pd.insert(productName, productID, type, category, manufacturer, expirationDate, quantity, cost);
			System.out.println("Data Inserted Sucessfully");
			response.sendRedirect("inventory.jsp");
		} catch (Exception e ) {
			// TODO Auto-generated catch block
			System.out.println("Exception in insert Query");
			e.printStackTrace();
		}

	}

}
