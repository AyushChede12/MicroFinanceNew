package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class LoanApplication {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private String loanId;
    private String loanDate;
    private String memberId;
    private String relativeDetails;
    private String dateOfBirth;
    private String age;
    private String contactNo;
    private String notificationStatus;
    private String address;
    private String pinCode;
    private String branchName;
    private String loanPlanName;
    private String typeOfLoan;
    private String loanCategory;
    private String planDuration;
    private String rateOfInterest;
    private String loanAmount;
    private String interestType;
    private String emiPayment;
    private String purposeOfLoan;

    // Guarantor Details
    private String guarantorMemberId;
    private String guarantorIdentity;
    private String guarantorAddress;
    private String guarantorPinCode;
    private String guarantorContactNo;
    private String guarantorSecurityType;

    // Co-Applicant Details
    private String coApplicantMemberId;
    private String coApplicantIdentity;
    private String coApplicantAddress;
    private String coApplicantPinCode;
    private String coApplicantContactNo;
    private String coApplicantSecurityType;

    // Deduction Details
    private String processingFee;
    private String legalCharges;
    private String buildingFund;
    private String insuranceFee;
    private String overdueInterestCharge;
    private String stationaryFee;
    private String advisorCollectorId;
    private String advisorCollectorName;
    
    
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getLoanId() {
		return loanId;
	}
	public void setLoanId(String loanId) {
		this.loanId = loanId;
	}
	public String getLoanDate() {
		return loanDate;
	}
	public void setLoanDate(String loanDate) {
		this.loanDate = loanDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRelativeDetails() {
		return relativeDetails;
	}
	public void setRelativeDetails(String relativeDetails) {
		this.relativeDetails = relativeDetails;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getNotificationStatus() {
		return notificationStatus;
	}
	public void setNotificationStatus(String notificationStatus) {
		this.notificationStatus = notificationStatus;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPinCode() {
		return pinCode;
	}
	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getLoanPlanName() {
		return loanPlanName;
	}
	public void setLoanPlanName(String loanPlanName) {
		this.loanPlanName = loanPlanName;
	}
	public String getTypeOfLoan() {
		return typeOfLoan;
	}
	public void setTypeOfLoan(String typeOfLoan) {
		this.typeOfLoan = typeOfLoan;
	}
	public String getLoanCategory() {
		return loanCategory;
	}
	public void setLoanCategory(String loanCategory) {
		this.loanCategory = loanCategory;
	}
	public String getPlanDuration() {
		return planDuration;
	}
	public void setPlanDuration(String planDuration) {
		this.planDuration = planDuration;
	}
	public String getRateOfInterest() {
		return rateOfInterest;
	}
	public void setRateOfInterest(String rateOfInterest) {
		this.rateOfInterest = rateOfInterest;
	}
	public String getLoanAmount() {
		return loanAmount;
	}
	public void setLoanAmount(String loanAmount) {
		this.loanAmount = loanAmount;
	}
	public String getInterestType() {
		return interestType;
	}
	public void setInterestType(String interestType) {
		this.interestType = interestType;
	}
	public String getEmiPayment() {
		return emiPayment;
	}
	public void setEmiPayment(String emiPayment) {
		this.emiPayment = emiPayment;
	}
	public String getPurposeOfLoan() {
		return purposeOfLoan;
	}
	public void setPurposeOfLoan(String purposeOfLoan) {
		this.purposeOfLoan = purposeOfLoan;
	}
	public String getGuarantorMemberId() {
		return guarantorMemberId;
	}
	public void setGuarantorMemberId(String guarantorMemberId) {
		this.guarantorMemberId = guarantorMemberId;
	}
	public String getGuarantorIdentity() {
		return guarantorIdentity;
	}
	public void setGuarantorIdentity(String guarantorIdentity) {
		this.guarantorIdentity = guarantorIdentity;
	}
	public String getGuarantorAddress() {
		return guarantorAddress;
	}
	public void setGuarantorAddress(String guarantorAddress) {
		this.guarantorAddress = guarantorAddress;
	}
	public String getGuarantorPinCode() {
		return guarantorPinCode;
	}
	public void setGuarantorPinCode(String guarantorPinCode) {
		this.guarantorPinCode = guarantorPinCode;
	}
	public String getGuarantorContactNo() {
		return guarantorContactNo;
	}
	public void setGuarantorContactNo(String guarantorContactNo) {
		this.guarantorContactNo = guarantorContactNo;
	}
	public String getGuarantorSecurityType() {
		return guarantorSecurityType;
	}
	public void setGuarantorSecurityType(String guarantorSecurityType) {
		this.guarantorSecurityType = guarantorSecurityType;
	}
	public String getCoApplicantMemberId() {
		return coApplicantMemberId;
	}
	public void setCoApplicantMemberId(String coApplicantMemberId) {
		this.coApplicantMemberId = coApplicantMemberId;
	}
	public String getCoApplicantIdentity() {
		return coApplicantIdentity;
	}
	public void setCoApplicantIdentity(String coApplicantIdentity) {
		this.coApplicantIdentity = coApplicantIdentity;
	}
	public String getCoApplicantAddress() {
		return coApplicantAddress;
	}
	public void setCoApplicantAddress(String coApplicantAddress) {
		this.coApplicantAddress = coApplicantAddress;
	}
	public String getCoApplicantPinCode() {
		return coApplicantPinCode;
	}
	public void setCoApplicantPinCode(String coApplicantPinCode) {
		this.coApplicantPinCode = coApplicantPinCode;
	}
	public String getCoApplicantContactNo() {
		return coApplicantContactNo;
	}
	public void setCoApplicantContactNo(String coApplicantContactNo) {
		this.coApplicantContactNo = coApplicantContactNo;
	}
	public String getCoApplicantSecurityType() {
		return coApplicantSecurityType;
	}
	public void setCoApplicantSecurityType(String coApplicantSecurityType) {
		this.coApplicantSecurityType = coApplicantSecurityType;
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
	public String getBuildingFund() {
		return buildingFund;
	}
	public void setBuildingFund(String buildingFund) {
		this.buildingFund = buildingFund;
	}
	public String getInsuranceFee() {
		return insuranceFee;
	}
	public void setInsuranceFee(String insuranceFee) {
		this.insuranceFee = insuranceFee;
	}
	public String getOverdueInterestCharge() {
		return overdueInterestCharge;
	}
	public void setOverdueInterestCharge(String overdueInterestCharge) {
		this.overdueInterestCharge = overdueInterestCharge;
	}
	public String getStationaryFee() {
		return stationaryFee;
	}
	public void setStationaryFee(String stationaryFee) {
		this.stationaryFee = stationaryFee;
	}
	public String getAdvisorCollectorId() {
		return advisorCollectorId;
	}
	public void setAdvisorCollectorId(String advisorCollectorId) {
		this.advisorCollectorId = advisorCollectorId;
	}
	public String getAdvisorCollectorName() {
		return advisorCollectorName;
	}
	public void setAdvisorCollectorName(String advisorCollectorName) {
		this.advisorCollectorName = advisorCollectorName;
	}

   
}

