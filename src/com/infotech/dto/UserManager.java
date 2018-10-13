package com.infotech.dto;

public class UserManager {
	private int userId;
	private String name;
	private String email;
	private String password;
	private String contactNo;
	private String userClient;
	private String clientSpoc;
	private int status;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUserClient() {
		return userClient;
	}
	public void setUserClient(String userClient) {
		this.userClient = userClient;
	}
	public String getClientSpoc() {
		return clientSpoc;
	}
	public void setClientSpoc(String clientSpoc) {
		this.clientSpoc = clientSpoc;
	}
	
}