package com.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

 

import com.conn.DbConnect;
import com.dao.NotesDAOImpl;
import com.entity.NotesDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@WebServlet("/uploadFile")
@MultipartConfig
public class NotesAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			email = email.trim();
		    String uploadingdate = req.getParameter("uploadingdate");
			String branch = req.getParameter("branch");
			String subject = req.getParameter("subject");
			String filetype = req.getParameter("filetype");
			String description = req.getParameter("descr");
			String status  = req.getParameter("status");
			
			Part part = req.getPart("notesfile");
			String fileName = part.getSubmittedFileName();

			NotesDtls n = new NotesDtls(email, uploadingdate, branch, subject, fileName,filetype, description, status);
                       		
            NotesDAOImpl dao = new NotesDAOImpl(DbConnect.getConn()); 

			
            //Save the image path in drive folder 			
			boolean f = dao.addNotes(n);

			HttpSession session = req.getSession();

			if (f) {

			    String path = "C:\\Users\\ASUS\\eclipse-workspace\\EnotesSharingSystem\\src\\main\\webapp\\notes";
		       
				File file = new File(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Notes Added Successfully...");
				resp.sendRedirect("uploadNotesUser.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on Server..!!");
				resp.sendRedirect("uploadNotesUser.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}