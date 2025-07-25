package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ApplyForGroupLoan {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	// Data Search Panel
	private Long id;
    private String groupCode;

    // Group Profile
    private String openingDate;
    private String selectedMember;
    private String customerName;
    
    private String communityName;
    private String allocatedStaff;
    private String branchName;
    private String collectionDays;
    private String communityLeader;
    private String contactNumber;
    private String loanPurpose;

    // Financial Deductions
    private String planCode;
    private String processingFee;
    private String legalCharges;
    private String gstPercentage;
    private String insuranceFee;
    private String valuationFee;
    private String lateAllowanceDays;
    private String penaltyMode;
    private String monthlyPenalty;
    private String emiFrequency;
    private String rateOfInterest;
    private String interestType;
    private String emiType;
    private String Term;
    private String totalAmount;
    
    private String approvalStatus;
    private String approvalDate;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(String openingDate) {
		this.openingDate = openingDate;
	}
	public String getCommunityName() {
		return communityName;
	}
	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}
	public String getAllocatedStaff() {
		return allocatedStaff;
	}
	public void setAllocatedStaff(String allocatedStaff) {
		this.allocatedStaff = allocatedStaff;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getCollectionDays() {
		return collectionDays;
	}
	public void setCollectionDays(String collectionDays) {
		this.collectionDays = collectionDays;
	}
	public String getCommunityLeader() {
		return communityLeader;
	}
	public void setCommunityLeader(String communityLeader) {
		this.communityLeader = communityLeader;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getLoanPurpose() {
		return loanPurpose;
	}
	public void setLoanPurpose(String loanPurpose) {
		this.loanPurpose = loanPurpose;
	}
	public String getPlanCode() {
		return planCode;
	}
	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}
	public String getProcessingFee() {
		return processingFee;
	}
	public void setProcessingFee(String processingFee) {
		this.processingFee = processingFee;
	}
	public String getLegalCharges() {
		return legalCharges;
	}
	public void setLegalCharges(String legalCharges) {
		this.legalCharges = legalCharges;
	}
	public String getGstPercentage() {
		return gstPercentage;
	}
	public void setGstPercentage(String gstPercentage) {
		this.gstPercentage = gstPercentage;
	}
	public String getInsuranceFee() {
		return insuranceFee;
	}
	public void setInsuranceFee(String insuranceFee) {
		this.insuranceFee = insuranceFee;
	}
	public String getValuationFee() {
		return valuationFee;
	}
	public void setValuationFee(String valuationFee) {
		this.valuationFee = valuationFee;
	}
	public String getLateAllowanceDays() {
		return lateAllowanceDays;
	}
	public void setLateAllowanceDays(String lateAllowanceDays) {
		this.lateAllowanceDays = lateAllowanceDays;
	}
	public String getPenaltyMode() {
		return penaltyMode;
	}
	public void setPenaltyMode(String penaltyMode) {
		this.penaltyMode = penaltyMode;
	}
	public String getMonthlyPenalty() {
		return monthlyPenalty;
	}
	public void setMonthlyPenalty(String monthlyPenalty) {
		this.monthlyPenalty = monthlyPenalty;
	}
	public String getEmiFrequency() {
		return emiFrequency;
	}
	public void setEmiFrequency(String emiFrequency) {
		this.emiFrequency = emiFrequency;
	}
	public String getRateOfInterest() {
		return rateOfInterest;
	}
	public void setRateOfInterest(String rateOfInterest) {
		this.rateOfInterest = rateOfInterest;
	}
	public String getInterestType() {
		return interestType;
	}
	public void setInterestType(String interestType) {
		this.interestType = interestType;
	}
	public String getEmiType() {
		return emiType;
	}
	public void setEmiType(String emiType) {
		this.emiType = emiType;
	}
	public String getSelectedMember() {
		return selectedMember;
	}
	public void setSelectedMember(String selectedMember) {
		this.selectedMember = selectedMember;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getApprovalStatus() {
		return approvalStatus;
	}
	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	public String getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
	}
	public String getTerm() {
		return Term;
	}
	public void setTerm(String term) {
		Term = term;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	
    

}
