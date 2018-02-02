package com.s2sbooks.vo;

import com.s2sbooks.vo.enumtypes.BookCondition;
import com.s2sbooks.vo.enumtypes.BookStatus;

public class BookSellingInfo {

	private int id;
	private BookStatus status;
	private double isbn;
	private String title;
	private String firstAuthor;
	private String edition;
	private BookCondition condition;
	private double price;
	private User user;
	private String department;
	private String subject;
	
	public BookSellingInfo() {}
	
	public BookSellingInfo(double isbn, String title, String author, String edition, String condition,  
			String status, String department, String subject, double price, User user) {
		this.isbn = isbn;
		this.title = title;
		this.firstAuthor = author;
		this.edition = edition;
		this.condition = BookCondition.valueOf(condition);
		this.status = BookStatus.valueOf(status);
		this.department = department;
		this.subject = subject;
		this.price = price;
		this.user = user;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public BookStatus getStatus() {
		return status;
	}
	public void setStatus(BookStatus status) {
		this.status = status;
	}
	public double getIsbn() {
		return isbn;
	}
	public void setIsbn(double isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFirstAuthor() {
		return firstAuthor;
	}
	public void setFirstAuthor(String firstAuthor) {
		this.firstAuthor = firstAuthor;
	}
	public String getEdition() {
		return edition;
	}
	public void setEdition(String edition) {
		this.edition = edition;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public BookCondition getCondition() {
		return condition;
	}
	public void setCondition(BookCondition condition) {
		this.condition = condition;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
}
