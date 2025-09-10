package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SecuredGoldPlan {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	// Gold Loan Details
	private String loanPlanName;
	private String typeOfLoan;
	private String loanMode;
	private String interestType;
	private String emiType;
	private String minAge;
	private String maxAge;
	private String minAmt;
	private String maxAmt;
	private String minTerm;
	private String maxTerm;
	private String rateInterestType;
	private String securityType;
	private String planStatus;

	// Deduction Details
	private String procFee;
	private String legalCharge;
	private String gst;
	private String insuFee;
	private String valuFee;

	// Late Fine Details
	private String lateAllowanceDay;
	private String penaltyMode;
	private String monthlyPenalty;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getLoanMode() {
		return loanMode;
	}

	public void setLoanMode(String loanMode) {
		this.loanMode = loanMode;
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

	public String getMinAge() {
		return minAge;
	}

	public void setMinAge(String minAge) {
		this.minAge = minAge;
	}

	public String getMaxAge() {
		return maxAge;
	}

	public void setMaxAge(String maxAge) {
		this.maxAge = maxAge;
	}

	public String getMinAmt() {
		return minAmt;
	}

	public void setMinAmt(String minAmt) {
		this.minAmt = minAmt;
	}

	public String getMaxAmt() {
		return maxAmt;
	}

	public void setMaxAmt(String maxAmt) {
		this.maxAmt = maxAmt;
	}

	public String getMinTerm() {
		return minTerm;
	}

	public void setMinTerm(String minTerm) {
		this.minTerm = minTerm;
	}

	public String getMaxTerm() {
		return maxTerm;
	}

	public void setMaxTerm(String maxTerm) {
		this.maxTerm = maxTerm;
	}

	public String getRateInterestType() {
		return rateInterestType;
	}

	public void setRateInterestType(String rateInterestType) {
		this.rateInterestType = rateInterestType;
	}

	public String getSecurityType() {
		return securityType;
	}

	public void setSecurityType(String securityType) {
		this.securityType = securityType;
	}

	public String getPlanStatus() {
		return planStatus;
	}

	public void setPlanStatus(String planStatus) {
		this.planStatus = planStatus;
	}

	public String getProcFee() {
		return procFee;
	}

	public void setProcFee(String procFee) {
		this.procFee = procFee;
	}

	public String getLegalCharge() {
		return legalCharge;
	}

	public void setLegalCharge(String legalCharge) {
		this.legalCharge = legalCharge;
	}

	public String getGst() {
		return gst;
	}

	public void setGst(String gst) {
		this.gst = gst;
	}

	public String getInsuFee() {
		return insuFee;
	}

	public void setInsuFee(String insuFee) {
		this.insuFee = insuFee;
	}

	public String getValuFee() {
		return valuFee;
	}

	public void setValuFee(String valuFee) {
		this.valuFee = valuFee;
	}

	public String getLateAllowanceDay() {
		return lateAllowanceDay;
	}

	public void setLateAllowanceDay(String lateAllowanceDay) {
		this.lateAllowanceDay = lateAllowanceDay;
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

}
