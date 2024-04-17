package com.entities;

public class Pass {
	private int id;
	private String account;
	private int length;
	private String password;
	private User user;
	public Pass(int id, String account, int length, String password, User user) {
		super();
		this.id = id;
		this.account = account;
		this.length = length;
		this.password = password;
		this.user = user;
	}
	public Pass() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
