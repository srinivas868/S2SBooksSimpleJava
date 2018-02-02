package com.s2sbooks.vo;

import com.s2sbooks.vo.enumtypes.Verified;

public class User implements java.io.Serializable {

    private static final long serialVersionUID = 1L;
    private int id;
    private String email;
    private String password;
    private Verified verified;
    private String firstName;
    private String lastName;
    private String cellNumber;
	
    public User(String firstName, String lastName, String email, String password) {
    	this.firstName = firstName;
    	this.lastName = lastName;
    	this.email = email;
    	this.password = password;
	}
    
    public User() {}
    
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Verified isVerified() {
		return verified;
	}
	public void setVerified(Verified verified) {
		this.verified = verified;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCellNumber() {
		return cellNumber;
	}
	public void setCellNumber(String cellNumber) {
		this.cellNumber = cellNumber;
	}
}