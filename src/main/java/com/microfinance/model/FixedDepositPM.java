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
	private String planNameFD;
	private String minimumAmountRD1;
	private String rateOfInterestRD1;
	private String termMode1;
	private String installmentType1;
	private String commissionOnNewRD1;
	private String componentIntervalRD;
	private String totalPaidRD;
	private String maturityAmountRD;
	private String statusOfPlanRD1;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlanCodeFD() {
		return planCodeFD;
	}
	public void setPlanCodeRD1(String planCodeFD) {
		this.planCodeFD = planCodeFD;
	}
	public String getMinimumAmountRD1() {
		return minimumAmountRD1;
	}
	public void setMinimumAmountRD1(String minimumAmountRD1) {
		this.minimumAmountRD1 = minimumAmountRD1;
	}
	public String getRateOfInterestRD1() {
		return rateOfInterestRD1;
	}
	public void setRateOfInterestRD1(String rateOfInterestRD1) {
		this.rateOfInterestRD1 = rateOfInterestRD1;
	}
	public String getTermMode1() {
		return termMode1;
	}
	public void setTermMode1(String termMode1) {
		this.termMode1 = termMode1;
	}
	public String getInstallmentType1() {
		return installmentType1;
	}
	public void setInstallmentType1(String installmentType1) {
		this.installmentType1 = installmentType1;
	}
	public String getCommissionOnNewRD1() {
		return commissionOnNewRD1;
	}
	public void setCommissionOnNewRD1(String commissionOnNewRD1) {
		this.commissionOnNewRD1 = commissionOnNewRD1;
	}
	public String getComponentIntervalRD() {
		return componentIntervalRD;
	}
	public void setComponentIntervalRD(String componentIntervalRD) {
		this.componentIntervalRD = componentIntervalRD;
	}
	public String getTotalPaidRD() {
		return totalPaidRD;
	}
	public void setTotalPaidRD(String totalPaidRD) {
		this.totalPaidRD = totalPaidRD;
	}
	public String getMaturityAmountRD() {
		return maturityAmountRD;
	}
	public void setMaturityAmountRD(String maturityAmountRD) {
		this.maturityAmountRD = maturityAmountRD;
	}
	public String getStatusOfPlanRD1() {
		return statusOfPlanRD1;
	}
	public void setStatusOfPlanRD1(String statusOfPlanRD1) {
		this.statusOfPlanRD1 = statusOfPlanRD1;
	}
	public String getPlanNameFD() {
		return planNameFD;
	}
	public void setPlanNameFD(String planNameFD) {
		this.planNameFD = planNameFD;
	}
	

}
