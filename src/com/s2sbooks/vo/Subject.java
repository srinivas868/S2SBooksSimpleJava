package com.s2sbooks.vo;

public class Subject {
	private int id;
	private String title;
	
	public Subject(){}
	
	public Subject(String title){
		this.title = title;
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
}
