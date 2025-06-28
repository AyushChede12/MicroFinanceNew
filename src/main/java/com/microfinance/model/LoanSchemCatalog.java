package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class LoanSchemCatalog {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String loanPlaneName;
	private String typeloan;
	private String minimumAge;
	private String maximumAge;
	private String minloanDuration;
	private String mixloanDuration;
	private String emiFrequency;
	private String emiType;
	private String minimumloanAmount;
	private String maximumloanAmount;
	private String rateIntrestType;
	private String typeIntrest;
	private String typesecurity;
	
	
	//Deduction Details
	
	private String feeProcessing;
	private String chargesLegal;
	private String gst;
	private String feeInsurence;
	private String feeValuation;
	
	//Late Fine Details
	
	private String lateAllowanceday;
	private String modePanalty;
	private String pennaltyMonthly;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLoanPlaneName() {
		return loanPlaneName;
	}
	public void setLoanPlaneName(String loanPlaneName) {
		this.loanPlaneName = loanPlaneName;
	}
	public String getTypeloan() {
		return typeloan;
	}
	public void setTypeloan(String typeloan) {
		this.typeloan = typeloan;
	}
	public String getMinimumAge() {
		return minimumAge;
	}
	public void setMinimumAge(String minimumAge) {
		this.minimumAge = minimumAge;
	}
	
	public String getMaximumAge() {
		return maximumAge;
	}
	public void setMaximumAge(String maximumAge) {
		this.maximumAge = maximumAge;
	}
	public String getMinloanDuration() {
		return minloanDuration;
	}
	public void setMinloanDuration(String minloanDuration) {
		this.minloanDuration = minloanDuration;
	}
	public String getMixloanDuration() {
		return mixloanDuration;
	}
	public void setMixloanDuration(String mixloanDuration) {
		this.mixloanDuration = mixloanDuration;
	}
	public String getEmiFrequency() {
		return emiFrequency;
	}
	public void setEmiFrequency(String emiFrequency) {
		this.emiFrequency = emiFrequency;
	}
	public String getEmiType() {
		return emiType;
	}
	public void setEmiType(String emiType) {
		this.emiType = emiType;
	}
	public String getMinimumloanAmount() {
		return minimumloanAmount;
	}
	public void setMinimumloanAmount(String minimumloanAmount) {
		this.minimumloanAmount = minimumloanAmount;
	}
	public String getMaximumloanAmount() {
		return maximumloanAmount;
	}
	public void setMaximumloanAmount(String maximumloanAmount) {
		this.maximumloanAmount = maximumloanAmount;
	}
	public String getRateIntrestType() {
		return rateIntrestType;
	}
	public void setRateIntrestType(String rateIntrestType) {
		this.rateIntrestType = rateIntrestType;
	}
	public String getTypeIntrest() {
		return typeIntrest;
	}
	public void setTypeIntrest(String typeIntrest) {
		this.typeIntrest = typeIntrest;
	}
	public String getTypesecurity() {
		return typesecurity;
	}
	public void setTypesecurity(String typesecurity) {
		this.typesecurity = typesecurity;
	}
	public String getFeeProcessing() {
		return feeProcessing;
	}
	public void setFeeProcessing(String feeProcessing) {
		this.feeProcessing = feeProcessing;
	}
	public String getChargesLegal() {
		return chargesLegal;
	}
	public void setChargesLegal(String chargesLegal) {
		this.chargesLegal = chargesLegal;
	}
	public String getGst() {
		return gst;
	}
	public void setGst(String gst) {
		this.gst = gst;
	}
	public String getFeeInsurence() {
		return feeInsurence;
	}
	public void setFeeInsurence(String feeInsurence) {
		this.feeInsurence = feeInsurence;
	}
	public String getFeeValuation() {
		return feeValuation;
	}
	public void setFeeValuation(String feeValuation) {
		this.feeValuation = feeValuation;
	}
	public String getLateAllowanceday() {
		return lateAllowanceday;
	}
	public void setLateAllowanceday(String lateAllowanceday) {
		this.lateAllowanceday = lateAllowanceday;
	}
	public String getModePanalty() {
		return modePanalty;
	}
	public void setModePanalty(String modePanalty) {
		this.modePanalty = modePanalty;
	}
	public String getPennaltyMonthly() {
		return pennaltyMonthly;
	}
	public void setPennaltyMonthly(String pennaltyMonthly) {
		this.pennaltyMonthly = pennaltyMonthly;
	}
	

}
