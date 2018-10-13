package com.infotech.dto;

public class Login {
	private int id;
	private String username;
	
	public Login(int id, String name) {
	super();
	this.id = id;
	this.username = name;
	}
	
	public int getId() {
	return id;
	}
	public void setId(int id) {
	this.id = id;
	}
	
	public String getName() {
	return username;
	}
	public void setName(String name) {
	this.username = name;
	}
	
	
}
