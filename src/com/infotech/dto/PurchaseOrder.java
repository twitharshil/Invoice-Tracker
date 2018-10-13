package com.infotech.dto;

public class PurchaseOrder {
	private Integer poId;
	private Integer orgId;
	private String orgName;
	private Integer clientId;
	private String clientSpoc;
	private String email;
	private String contactNo;
	private Integer poNumber;
	private String description;
	private Integer sacHsn;		
	private Integer amount;
	private String poStartDate;
	private String poEndDate;
	private Integer status;
	
	
	public Integer getPoId() {
		return poId;
	}
	public void setPoId(Integer poId) {
		this.poId = poId;
	}
	public Integer getOrgId() {
		return orgId;
	}
	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public Integer getClientId() {
		return clientId;
	}
	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}
	public String getClientSpoc() {
		return clientSpoc;
	}
	public void setClientSpoc(String clientSpoc) {
		this.clientSpoc = clientSpoc;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public Integer getPoNumber() {
		return poNumber;
	}
	public void setPoNumber(Integer poNumber) {
		this.poNumber = poNumber;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getSacHsn() {
		return sacHsn;
	}
	public void setSacHsn(Integer sacHsn) {
		this.sacHsn = sacHsn;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getPoStartDate() {
		return poStartDate;
	}
	public void setPoStartDate(String poStartDate) {
		this.poStartDate = poStartDate;
	}
	public String getPoEndDate() {
		return poEndDate;
	}
	public void setPoEndDate(String poEndDate) {
		this.poEndDate = poEndDate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}


}