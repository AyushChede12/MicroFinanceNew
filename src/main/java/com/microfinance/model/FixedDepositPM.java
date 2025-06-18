package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class FixedDepositPM {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String planCodeFD;
	private String minimumAmountFD;
	private String rateOfInterestFD;
	private String termMode1;
	private String termFd;
	private String installmentTypeFD;
	private String commissionOnNewFD;
	private String componentIntervalFD;
	private String totalPaidFD;
	private String maturityAmountFD;
	private String statusOfPlanFD;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlanCodeFD() {
		return planCodeFD;
	}
	public void setPlanCodeFD(String planCodeFD) {
		this.planCodeFD = planCodeFD;
	}
	public String getMinimumAmountFD() {
		return minimumAmountFD;
	}
	public void setMinimumAmountFD(String minimumAmountFD) {
		this.minimumAmountFD = minimumAmountFD;
	}
	public String getRateOfInterestFD() {
		return rateOfInterestFD;
	}
	public void setRateOfInterestFD(String rateOfInterestFD) {
		this.rateOfInterestFD = rateOfInterestFD;
	}
	public String getTermMode1() {
		return termMode1;
	}
	public void setTermMode1(String termMode1) {
		this.termMode1 = termMode1;
	}
	public String getInstallmentType1() {
		return installmentTypeFD;
	}
	public void setInstallmentType1(String installmentType1) {
		this.installmentTypeFD = installmentType1;
	}
	public String getCommissionOnNewFD() {
		return commissionOnNewFD;
	}
	public void setCommissionOnNewFD(String commissionOnNewFD) {
		this.commissionOnNewFD = commissionOnNewFD;
	}
	public String getComponentIntervalFD() {
		return componentIntervalFD;
	}
	public void setComponentIntervalFD(String componentIntervalFD) {
		this.componentIntervalFD = componentIntervalFD;
	}
	public String getTotalPaidFD() {
		return totalPaidFD;
	}
	public void setTotalPaidFD(String totalPaidFD) {
		this.totalPaidFD = totalPaidFD;
	}
	public String getMaturityAmountFD() {
		return maturityAmountFD;
	}
	public void setMaturityAmountFD(String maturityAmountFD) {
		this.maturityAmountFD = maturityAmountFD;
	}
	public String getStatusOfPlanFD() {
		return statusOfPlanFD;
	}
	public void setStatusOfPlanFD(String statusOfPlanFD) {
		this.statusOfPlanFD = statusOfPlanFD;
	}
	public String getTermFd() {
		return termFd;
	}
	public void setTermFd(String termFd) {
		this.termFd = termFd;
	}
	
	

}
