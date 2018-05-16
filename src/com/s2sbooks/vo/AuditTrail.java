package com.s2sbooks.vo;

import java.util.Date;

public class AuditTrail implements Comparable{

	private int id;
	private User user;
	private Date lastLogin;
	private double isbn;
	
	public AuditTrail() {}
	
	public AuditTrail(User user, Date lastLogin) {
		this.user = user;
		this.lastLogin = lastLogin;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public double getIsbn() {
		return isbn;
	}

	public void setIsbn(double isbn) {
		this.isbn = isbn;
	}

	@Override
	public int compareTo(Object arg0) {
		return this.lastLogin.compareTo(((AuditTrail) arg0).lastLogin);
	}
}
