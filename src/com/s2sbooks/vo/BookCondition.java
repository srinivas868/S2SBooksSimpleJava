package com.s2sbooks.vo;

public class BookCondition implements Comparable{
	
	private int id;
	private String title;
	private String description;
	private int priority;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}
	
	@Override
	public int compareTo(Object arg0) {
		int compareQuantity = ((BookCondition) arg0).getPriority(); 
		//ascending order
		return this.priority - compareQuantity;
	}
}
