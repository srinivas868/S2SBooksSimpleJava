package com.s2sbooks.vo;

import java.util.ArrayList;
import java.util.List;

public class Department {
	
	private int id;
	private String title;
	private List<Subject> subjects = new ArrayList<>();
	
	public Department() {}
	
	public Department(String title, List<Subject> subjects) {
		this.title = title;
		this.subjects = subjects;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Subject> getSubjects() {
		return subjects;
	}
	public void setSubjects(List<Subject> subjects) {
		this.subjects = subjects;
	} 
}
