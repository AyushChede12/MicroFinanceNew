package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class MISDepositPM {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String planCodeMD;
	private String planNameMD;
	private String minimumAmountRD2;
	private String maturityROI;
	private String termMode2;
	private String term1;
	private String MISIntROI;
	private String MISInterval;
	private String MISInterest;
	private String maturityAmountRD2;
	private String commissionOnNewRD2;
	private String statusOfPlanRD2;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPlanCodeMD() {
		return planCodeMD;
	}
	public void setPlanCodeRD2(String planCodeMD) {
		this.planCodeMD = planCodeMD;
	}
	public String getMinimumAmountRD2() {
		return minimumAmountRD2;
	}
	public void setMinimumAmountRD2(String minimumAmountRD2) {
		this.minimumAmountRD2 = minimumAmountRD2;
	}
	public String getMaturityROI() {
		return maturityROI;
	}
	public void setMaturityROI(String maturityROI) {
		this.maturityROI = maturityROI;
	}
	public String getTermMode2() {
		return termMode2;
	}
	public void setTermMode2(String termMode2) {
		this.termMode2 = termMode2;
	}
	public String getTerm1() {
		return term1;
	}
	public void setTerm1(String term1) {
		this.term1 = term1;
	}
	public String getMISIntROI() {
		return MISIntROI;
	}
	public void setMISIntROI(String mISIntROI) {
		MISIntROI = mISIntROI;
	}
	public String getMISInterval() {
		return MISInterval;
	}
	public void setMISInterval(String mISInterval) {
		MISInterval = mISInterval;
	}
	public String getMISInterest() {
		return MISInterest;
	}
	public void setMISInterest(String mISInterest) {
		MISInterest = mISInterest;
	}
	public String getMaturityAmountRD2() {
		return maturityAmountRD2;
	}
	public void setMaturityAmountRD2(String maturityAmountRD2) {
		this.maturityAmountRD2 = maturityAmountRD2;
	}
	public String getCommissionOnNewRD2() {
		return commissionOnNewRD2;
	}
	public void setCommissionOnNewRD2(String commissionOnNewRD2) {
		this.commissionOnNewRD2 = commissionOnNewRD2;
	}
	public String getStatusOfPlanRD2() {
		return statusOfPlanRD2;
	}
	public void setStatusOfPlanRD2(String statusOfPlanRD2) {
		this.statusOfPlanRD2 = statusOfPlanRD2;
	}
	public String getPlanNameMD() {
		return planNameMD;
	}
	public void setPlanNameMD(String planNameMD) {
		this.planNameMD = planNameMD;
	}
	

}
