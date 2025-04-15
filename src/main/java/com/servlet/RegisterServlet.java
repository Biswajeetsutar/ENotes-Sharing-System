package com.servlet;

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

@WebServlet("/signup")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String contact = req.getParameter("contact");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String branch = req.getParameter("branch");
		String role = req.getParameter("role");
		
		User u = new User(fname,lname,contact,email,password,branch,role);
		
		UserDAOImpl dao = new UserDAOImpl(DbConnect.getConn());
		boolean f = dao.userRegister(u);
		
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("successMsg", "User Register Successfully...");
			resp.sendRedirect("signup.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something went Wrong..!!");
			resp.sendRedirect("signup.jsp");
		}	
	}
}