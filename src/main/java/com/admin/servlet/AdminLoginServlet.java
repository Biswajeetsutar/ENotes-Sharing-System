package com.admin.servlet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.dao.UserDAOImpl;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		
		UserDAOImpl dao = new UserDAOImpl(DbConnect.getConn());
		User u = dao.loginAdmin(email, pass);
		
		HttpSession session = req.getSession();
		
		if(u!=null) {
			session.setAttribute("email", email);
			session.setAttribute("validMsg", "Successfully Login...");
			resp.sendRedirect("adminlogin.jsp");
			
		}
		else {
			session.setAttribute("invalidMsg", "Invalid Email & Password");
			resp.sendRedirect("adminlogin.jsp");			
		}
	}
 
}
