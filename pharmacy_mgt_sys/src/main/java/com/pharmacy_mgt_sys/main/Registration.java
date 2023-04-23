package com.pharmacy_mgt_sys.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pharmacy_mgt.entity.Employee;
import com.pharmacy_mgt_sys.dao.Connection_postgre;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/reg")
public class Registration extends HttpServlet {
    private final String url = "jdbc:postgresql://localhost/pharma_mgt_sys";
    private final String user = "postgres";
    private final String password = "root";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init()
    {

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
	    PrintWriter out=response.getWriter();
	    
	    String uname = request.getParameter("username");
	    String email = request.getParameter("email");
	    String pass_og = request.getParameter("password");
	    String pass = request.getParameter("confirm-password");
	    String captcha = request.getParameter("csp");
	    String check_captcha = request.getParameter("captcha");
	    
//	    System.out.println("captcha:"+captcha);
//	    System.out.println("captcha:"+check_captcha);
//	    
//	    System.out.println("password:"+pass_og);
//	    System.out.println("password:"+pass);

	    // Password validation
	    if (pass.length() < 8 || !pass.matches(".*[A-Z].*") || !pass.matches(".*[a-z].*") || !pass.matches(".*[0-9].*")  ) {
	        response.sendRedirect("registration.jsp?param1=value1");
	        return;
	    }
	    if(!pass_og.equals(pass))
	    {
	        response.sendRedirect("registration.jsp?confirm=no");
	        return;
	    }
	    //captcha Validatation
	    
	    if(!captcha.equals(check_captcha))
	    {
	    	 response.sendRedirect("registration.jsp?captcha=no");
		     return;
	    }



	    try {
	        Connection_postgre es = new Connection_postgre();
	        es.insert(uname,email,pass);
	        response.sendRedirect("login.jsp");
	    } catch(Exception e) {
	        out.println("<h1>Something went wrong</h1>");
	        response.sendRedirect("login.jsp");
	    }
	    out.println("<h1>"+uname+"</h1>");
	}

	
	
	
	
	
	
	
	
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.setContentType("text/html");
//		PrintWriter out=response.getWriter();
//		
//		String uname = request.getParameter("username");
//		String email = request.getParameter("email");
//		String pass_og = request.getParameter("password");
//		String pass = request.getParameter("confirm-password");
//		
//	    // Password validation
//	    if (pass.length() < 8 || !pass.matches(".*[A-Z].*") || !pass.matches(".*[a-z].*") || !pass.matches(".*[0-9].*")) {
//	    	response.sendRedirect("registration.jsp?param1=value1");
//
//	        
//	        return;
//
//	    }
//	    if(!pass_og.equals(pass))
//	    {
//response.sendRedirect("registration.jsp?confirm=no");
//
//	        
//	        return;
//	    }
//
//		try
//		{
//			
//			Connection_postgre es = new Connection_postgre();
//			es.insert(uname,email,pass);
//
//			response.sendRedirect("login.jsp");
//		}
//		catch(Exception e)
//		{
//			out.println("<h1>Something went Wrong");
//			response.sendRedirect("login.jsp");
//
//			
//		}
//		out.println("<h1>"+uname+"</h1>");
//		
//	}

}
