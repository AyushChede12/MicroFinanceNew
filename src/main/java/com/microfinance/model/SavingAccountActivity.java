package com.microfinance.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class SavingAccountActivity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;
	private String selectSavingTransactionId;
	private String transactionDate;
	private String selectBranchName;
	private String accountNumber;
	private String customerCode;
	private String customerName;
	private String contactNumber;
	private String jointHolderName;
	private String savingPlanName;
	private String averageBalance;
	private String transactionFor;
	private String comments;
	private String transactionType;
	private String transactionAmount;
	private String payBy;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSelectSavingTransactionId() {
		return selectSavingTransactionId;
	}
	public void setSelectSavingTransactionId(String selectSavingTransactionId) {
		this.selectSavingTransactionId = selectSavingTransactionId;
	}
	public String getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}
	public String getSelectBranchName() {
		return selectBranchName;
	}
	public void setSelectBranchName(String selectBranchName) {
		this.selectBranchName = selectBranchName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getJointHolderName() {
		return jointHolderName;
	}
	public void setJointHolderName(String jointHolderName) {
		this.jointHolderName = jointHolderName;
	}
	public String getSavingPlanName() {
		return savingPlanName;
	}
	public void setSavingPlanName(String savingPlanName) {
		this.savingPlanName = savingPlanName;
	}
	public String getAverageBalance() {
		return averageBalance;
	}
	public void setAverageBalance(String averageBalance) {
		this.averageBalance = averageBalance;
	}
	public String getTransactionFor() {
		return transactionFor;
	}
	public void setTransactionFor(String transactionFor) {
		this.transactionFor = transactionFor;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public String getTransactionAmount() {
		return transactionAmount;
	}
	public void setTransactionAmount(String transactionAmount) {
		this.transactionAmount = transactionAmount;
	}
	public String getPayBy() {
		return payBy;
	}
	public void setPayBy(String payBy) {
		this.payBy = payBy;
	}
	
	



}
