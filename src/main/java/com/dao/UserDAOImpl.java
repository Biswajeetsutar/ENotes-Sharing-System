package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.NotesDtls;
import com.entity.User;

public class UserDAOImpl implements UserDAO {
	
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	// insert User Registration
	public boolean userRegister(User u) {
		boolean f = false;
		try {
			String sql = "insert into users(fname,lname,contact,email,password,branch,role) values(?,?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFname());
			ps.setString(2, u.getLname());
			ps.setString(3, u.getContact());
			ps.setString(4, u.getEmail());
			ps.setString(5, u.getPassword());
			ps.setString(6, u.getBranch());
			ps.setString(7, u.getRole());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// insert user login
	public User loginUser(String e, String p) {
		User user = null;
		try {
			String sql = "select * from users where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setFname(rs.getString(2));
				user.setLname(rs.getString(3));
				user.setContact(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setPassword(rs.getString(6));
				user.setBranch(rs.getString(7));
				user.setRole(rs.getString(8));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return user;
	}

	// insert admin login
	public User loginAdmin(String e, String p) {
		User user = null;
		try {
			String sql = "select * from admin where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new User();
				user.setEmail(rs.getString(1));
				user.setPassword(rs.getString(2));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex);
		}
		return user;
	}

	// Edit User Source Code here
	
	 public User getUserById(int id) {
		User u = null;
		
		try {
			String sql="select * from users where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setFname(rs.getString(2));
				u.setLname(rs.getString(3));
				u.setContact(rs.getString(4));
				u.setEmail(rs.getString(5));
				u.setPassword(rs.getString(6));
				u.setBranch(rs.getString(7));
				u.setRole(rs.getString(8));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	// Update edit books code here
		public boolean updateEditUser(User u) {
			boolean f=false;
			 try {
				String sql= "update users set fname=?, lname=?, contact=?, email=?, branch=? where id=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, u.getFname());
				ps.setString(2, u.getLname());
				ps.setString(3, u.getContact());
				ps.setString(4, u.getEmail());
				ps.setString(5, u.getBranch());
				ps.setInt(6, u.getId());
				
				int i=ps.executeUpdate();
				if(i==1) {
					f=true;
				}				
			} catch (Exception e) {
	          e.printStackTrace();
			}
			return f;
		}
		
		//Show view All User code here
		@Override
		public List<User> getViewAllUser() {
			
			List<User> list = new ArrayList<User>();
			User v =null;
			
		    try {
		          
			   String sql="select * from users";
			   PreparedStatement ps = conn.prepareStatement(sql);
			  
			   ResultSet rs = ps.executeQuery();
			   while(rs.next()) {
				   
				v=new User();
				v.setId(rs.getInt(1));
				v.setFname(rs.getString(2));
				v.setLname(rs.getString(3));
				v.setEmail(rs.getString(4));
				v.setContact(rs.getString(5));
				v.setBranch(rs.getString(6));
				v.setRole(rs.getString(7));
				list.add(v);			
			   }		   
			} catch (Exception e) {
				e.printStackTrace();
			}	
			return list;
		}


}
