package com.entity;

public class User {
	
	private int id;
	private String fname;
	private String lname;
	private String contact;
	private String email;
	private String password;
	private String branch;
	private String role;
	
	public User() {
		
	}

	public User(String fname, String lname, String contact, String email, String password, String branch, String role) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.contact = contact;
		this.email = email;
		this.password = password;
		this.branch = branch;
		this.role = role;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", fname=" + fname + ", lname=" + lname + ", contact=" + contact + ", email=" + email
				+ ", password=" + password + ", branch=" + branch + ", role=" + role + "]";
	}
}