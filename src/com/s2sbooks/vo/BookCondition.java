package com.s2sbooks.vo;

public class BookCondition {
	
	private int id;
	private String title;

	public BookCondition() {}
	
	public BookCondition(String title) {
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
