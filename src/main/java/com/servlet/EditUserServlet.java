package com.servlet;

import java.io.IOException;

 
import com.conn.DbConnect;
import com.dao.UserDAOImpl;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editprofile")
public class EditUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  try {
		    int id=Integer.parseInt(req.getParameter("id"));
			String fname = req.getParameter("fname");
			String lname = req.getParameter("lname");
			String contact = req.getParameter("contact");
			String email = req.getParameter("email");
			String branch = req.getParameter("branch");
			
			User u = new User();
			u.setId(id);
			u.setFname(fname);
			u.setLname(lname);
			u.setContact(contact);
			u.setEmail(email);
			u.setBranch(branch);
			
			UserDAOImpl dao = new UserDAOImpl(DbConnect.getConn());
			boolean f=dao.updateEditUser(u);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Profile Updated Successfully..");
				resp.sendRedirect("profile.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on server..!!!");
				resp.sendRedirect("profile.jsp");
			}		
	} catch (Exception e) {
		e.printStackTrace();
	}	
	}
}
