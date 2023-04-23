package com.pharmacy_mgt_sys.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Admin_login
 */
@WebServlet("/Admin_login")
public class Admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_login() {
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
		
		
		
		String adminname = request.getParameter("username");
		System.out.println(adminname);
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		HttpSession session = request.getSession();

		
		if(adminname.equals("Abhishek") && email.equals("abhishekkadiya674@gmail.com") && pass.equals("ABCabc@123"))
		{
			// Store the relevant data in the HttpSession object
			session.setAttribute("admin_user", adminname);
			session.setAttribute("admin_email", email);
			
			
			response.sendRedirect("admin.jsp");
		}
		else
		{
			response.sendRedirect("admin_login.jsp?valid=fails");
		}
	}

}
