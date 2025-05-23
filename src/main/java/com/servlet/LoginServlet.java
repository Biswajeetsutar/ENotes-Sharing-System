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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		
		UserDAOImpl dao = new UserDAOImpl(DbConnect.getConn());
		User u = dao.loginUser(email, pass);
		
		HttpSession session = req.getSession();
		if(u!=null) {
			session.setAttribute("email", email);
			session.setAttribute("userId", u.getId());
			session.setAttribute("validMsg", "Successfully Login...");
			resp.sendRedirect("login.jsp");
			
		}
		else {
			session.setAttribute("invalidMsg", "Invalid Email & Password");
			resp.sendRedirect("login.jsp");
			
		}
	}

}