package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpSession;

import com.entity.NotesDtls;

public class NotesDAOImpl implements NotesDAO{

    private Connection conn;

    public NotesDAOImpl(Connection conn) {
	  super();
	  this.conn = conn;
    }
    
   //Add Notes Source code here
  	public boolean addNotes(NotesDtls n) {
  		boolean f=false;
  		
  		try {
  			String sql="insert into notes(email,branch,subject,notesfile,filetype,description,status) values(?,?,?,?,?,?,?)";
  			PreparedStatement ps=conn.prepareStatement(sql);
  			ps.setString(1, n.getEmail().trim());
  			//ps.setString(2, n.getUploadingdate());
  			ps.setString(2, n.getBranch());
  			ps.setString(3, n.getSubject());
  			ps.setString(4, n.getNotesfile());
  			ps.setString(5, n.getFiletype());
  			ps.setString(6, n.getDescription());
  			ps.setString(7, "Pending"); 			
  			
  			int i=ps.executeUpdate();
  			
  			if(i==1) {
  				f=true;
  			}			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return f;
  	}

    //Show all Notes in Tabular form code here
  	public List<NotesDtls> getAllNotes(String email) {
  		
  		List<NotesDtls> list = new ArrayList<NotesDtls>();
		NotesDtls b=null;
		
	    try {
	    	
	       //String email = session.getAttribute("email").toString();
		   String sql="select * from notes where email='" + email +"'";
		   PreparedStatement ps = conn.prepareStatement(sql);
		   //System.out.println(email);
		   ResultSet rs = ps.executeQuery();
		   //System.out.println(rs);
		   while(rs.next()) {
			   
			b=new NotesDtls();
			b.setId(rs.getInt(1));
			b.setEmail(rs.getString(2));
			b.setUploadingdate(rs.getString(3));
			b.setBranch(rs.getString(4));
			b.setSubject(rs.getString(5));
			b.setNotesfile(rs.getString(6));
			b.setFiletype(rs.getString(7));
			b.setDescription(rs.getString(8));
			b.setStatus(rs.getString(9));
			list.add(b);			
		   }		   
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;

  	}
  	
  	
    //Show View All Notes source code here
  	@Override
	public List<NotesDtls> getViewAllNotes() {
		List<NotesDtls> list = new ArrayList<NotesDtls>();
		NotesDtls n = null;
		
		try {
			String sql = "select * from notes where status='accept'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
	  			n=new NotesDtls();
	  			n.setId(rs.getInt(1));
	  			n.setEmail(rs.getString(2));
	  			n.setUploadingdate(rs.getString(3));
	  			n.setBranch(rs.getString(4));
	  			n.setSubject(rs.getString(5));
	  			n.setNotesfile(rs.getString(6));
	  			n.setFiletype(rs.getString(7));
	  			n.setDescription(rs.getString(8));
	  			list.add(n);  
			}
		 } catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
  
  	//Delete Notes Source Code Here
  	@Override
	public boolean deleteNotes(int id) {
  		boolean f = false;
		try {
			
			String sql = "delete from notes where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return f;
	}
}
