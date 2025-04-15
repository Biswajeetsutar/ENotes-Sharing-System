package com.dao;

import java.util.List;

import com.entity.NotesDtls;
import com.entity.User;

public interface UserDAO {

	//insert User Registration 
    public boolean userRegister(User u);
    
    // insert user login	
 	public User loginUser(String e,String p);
 
    // insert admin login	
	public User loginAdmin(String e,String p);
	
	//Edit User Source Code here
	public User getUserById(int id);
	
	//Update Edit Book Source Code Here
	public boolean updateEditUser(User u);
	
	// View All User  code here
	public List<User> getViewAllUser();
	
}