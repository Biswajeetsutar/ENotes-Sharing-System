 package com.entity;

import java.sql.Date;

public class NotesDtls {
	
	private int id;
	private String email;
	private String uploadingdate;
	private String branch;
	private String subject;
	private String notesfile;
	private String filetype;
	private String description;
	private String status;
	
	public NotesDtls(){
	}

	public NotesDtls(String email, String uploadingdate, String branch, String subject, String notesfile, String filetype,
			String description,String status) {
		super();
		this.email = email.trim();
		this.uploadingdate = uploadingdate;
		this.branch = branch;
		this.subject = subject;
		this.notesfile = notesfile;
		this.filetype = filetype;
		this.description = description;
		this.status = status;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUploadingdate() {
		return uploadingdate;
	}
	public void setUploadingdate(String uploadingdate) {
		this.uploadingdate = uploadingdate;
	}

	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getNotesfile() {
		return notesfile;
	}
	public void setNotesfile(String notesfile) {
		this.notesfile = notesfile;
	}

	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	@Override
	public String toString() {
		return "NotesDtls [id=" + id + ", email=" + email + ", uploadingdate=" + uploadingdate + ", branch=" + branch
				+ ", subject=" + subject + ", notesfile=" + notesfile + ", filetype=" + filetype + ", description="
				+ description + ", status=" + status + "]";
	}
	
}