package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class CreateSavingsAccount {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String openingDate;
	private String selectByCustomer;
	private String enterCustomerName;
	private String dateOfBirth;
	private String familyDetails;
	private String contactNumber;
	private String suggestedNomineeName;
	private String suggestedNomineeAge;
	private String suggestedNomineeRelation;
	private String address;
	private String district;
	private String branchName;
	private String state;
	private String pinCode;
	private String operationType;
	private String jointOperationCode;
	private String jointSurvivorCode;
	private String familyRelation;
	private String selectPlan;
	private String openingAmount;
	private String financialConsultantCode;
	private String financialConsultantName;
	private String openingFees;
	private String authenticateWith;
	private String modeOfPayment;
	private String comment;
	private String accountStatus;
	private String messageSend;
	private String debitCardIssue;
	private String accountNumber;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(String openingDate) {
		this.openingDate = openingDate;
	}
	public String getSelectByCustomer() {
		return selectByCustomer;
	}
	public void setSelectByCustomer(String selectByCustomer) {
		this.selectByCustomer = selectByCustomer;
	}
	public String getEnterCustomerName() {
		return enterCustomerName;
	}
	public void setEnterCustomerName(String enterCustomerName) {
		this.enterCustomerName = enterCustomerName;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getFamilyDetails() {
		return familyDetails;
	}
	public void setFamilyDetails(String familyDetails) {
		this.familyDetails = familyDetails;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getSuggestedNomineeName() {
		return suggestedNomineeName;
	}
	public void setSuggestedNomineeName(String suggestedNomineeName) {
		this.suggestedNomineeName = suggestedNomineeName;
	}
	public String getSuggestedNomineeAge() {
		return suggestedNomineeAge;
	}
	public void setSuggestedNomineeAge(String suggestedNomineeAge) {
		this.suggestedNomineeAge = suggestedNomineeAge;
	}
	public String getSuggestedNomineeRelation() {
		return suggestedNomineeRelation;
	}
	public void setSuggestedNomineeRelation(String suggestedNomineeRelation) {
		this.suggestedNomineeRelation = suggestedNomineeRelation;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPinCode() {
		return pinCode;
	}
	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	public String getOperationType() {
		return operationType;
	}
	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}
	public String getJointOperationCode() {
		return jointOperationCode;
	}
	public void setJointOperationCode(String jointOperationCode) {
		this.jointOperationCode = jointOperationCode;
	}
	public String getJointSurvivorCode() {
		return jointSurvivorCode;
	}
	public void setJointSurvivorCode(String jointSurvivorCode) {
		this.jointSurvivorCode = jointSurvivorCode;
	}
	public String getFamilyRelation() {
		return familyRelation;
	}
	public void setFamilyRelation(String familyRelation) {
		this.familyRelation = familyRelation;
	}
	public String getSelectPlan() {
		return selectPlan;
	}
	public void setSelectPlan(String selectPlan) {
		this.selectPlan = selectPlan;
	}
	public String getOpeningAmount() {
		return openingAmount;
	}
	public void setOpeningAmount(String openingAmount) {
		this.openingAmount = openingAmount;
	}
	public String getFinancialConsultantCode() {
		return financialConsultantCode;
	}
	public void setFinancialConsultantCode(String financialConsultantCode) {
		this.financialConsultantCode = financialConsultantCode;
	}
	public String getFinancialConsultantName() {
		return financialConsultantName;
	}
	public void setFinancialConsultantName(String financialConsultantName) {
		this.financialConsultantName = financialConsultantName;
	}
	public String getOpeningFees() {
		return openingFees;
	}
	public void setOpeningFees(String openingFees) {
		this.openingFees = openingFees;
	}
	public String getAuthenticateWith() {
		return authenticateWith;
	}
	public void setAuthenticateWith(String authenticateWith) {
		this.authenticateWith = authenticateWith;
	}
	public String getModeOfPayment() {
		return modeOfPayment;
	}
	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}
	public String getMessageSend() {
		return messageSend;
	}
	public void setMessageSend(String messageSend) {
		this.messageSend = messageSend;
	}
	public String getDebitCardIssue() {
		return debitCardIssue;
	}
	public void setDebitCardIssue(String debitCardIssue) {
		this.debitCardIssue = debitCardIssue;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}


	
	
	
}
