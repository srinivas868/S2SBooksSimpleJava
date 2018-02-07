package com.s2sbooks.vo;

public class BookStatus {

	private String title;
	private int id;
	
	public BookStatus() {}
	
	public BookStatus(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
