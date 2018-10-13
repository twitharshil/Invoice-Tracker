package com.infotech.dto;

public class Invoice {
	private Integer invoiceId;
	private int poId;
	private int poNumber;
	private String description;
	private String gSTCond;
	private String gSTCondValue;
	private Integer amount;
	private String invStartDate;
	private String invDispatchDate;
	private String invClosedDate;
	private String remark;
	private int status;
	private boolean invoiceState;
	private int search;
	private String errorMessage;
	private String milestone;
	
	public Integer getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(Integer invoiceId) {
		this.invoiceId = invoiceId;
	}
	
	public int getPoId() {
		return poId;
	}
	public void setPoId(int poId) {
		this.poId = poId;
	}
	
	public int getPoNumber() {
		return poNumber;
	}
	public void setPoNumber(int poNumber) {
		this.poNumber = poNumber;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getgSTCond() {
		return gSTCond;
	}
	public void setgSTCond(String gSTCond) {
		this.gSTCond = gSTCond;
	}
	public String getgSTCondValue() {
		return gSTCondValue;
	}
	public void setgSTCondValue(String gSTCondValue) {
		this.gSTCondValue = gSTCondValue;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getInvStartDate() {
		return invStartDate;
	}
	public void setInvStartDate(String invStartDate) {
		this.invStartDate = invStartDate;
	}
	public String getInvDispatchDate() {
		return invDispatchDate;
	}
	public void setInvDispatchDate(String invDispatchDate) {
		this.invDispatchDate = invDispatchDate;
	}
	public String getInvClosedDate() {
		return invClosedDate;
	}
	public void setInvClosedDate(String invClosedDate) {
		this.invClosedDate = invClosedDate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public boolean isInvoiceState() {
		return invoiceState;
	}
	public void setInvoiceState(boolean invoiceState) {
		this.invoiceState = invoiceState;
	}
	public int getSearch() {
		return search;
	}
	public void setSearch(int search) {
		this.search = search;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public String setErrorMessage(String errorMessage) {
		return this.errorMessage = errorMessage;
	}
	public String getMilestone() {
		return milestone;
	}
	public void setMilestone(String milestone) {
		this.milestone = milestone;
	}
	
}