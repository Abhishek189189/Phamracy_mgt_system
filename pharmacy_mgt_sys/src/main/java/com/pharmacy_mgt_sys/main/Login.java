package com.pharmacy_mgt_sys.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pharmacy_mgt_sys.dao.Connection_postgre;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		HttpSession session = request.getSession();

		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection_postgre app = new Connection_postgre();
		try {
			
			boolean check=app.check(username,email,pass);
			System.out.println(check);
			if(check==true)
			{
				// Store the relevant data in the HttpSession object
				session.setAttribute("username", username);
				session.setAttribute("email", email);
				
				response.sendRedirect("index.jsp");
				
			}
			else
			{
				response.sendRedirect("login.jsp?para=fail");

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
