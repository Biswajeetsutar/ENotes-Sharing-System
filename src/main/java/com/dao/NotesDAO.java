package com.dao;

import java.util.List;

import com.entity.NotesDtls;

public interface NotesDAO {
	// Add Notes Source code here
	public boolean addNotes(NotesDtls n);

	// Show View My Notes code here
	public List<NotesDtls> getAllNotes(String email);
	
	// Show View All Notes code here
	public List<NotesDtls> getViewAllNotes();
	
	//Delete Notes Source Code Here
	public boolean deleteNotes(int id);
}
