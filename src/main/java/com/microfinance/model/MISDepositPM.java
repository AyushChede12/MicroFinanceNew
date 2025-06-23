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

	private String rateOfInterestMD;
	private String durationMD;
	private String installmentTypeMD;
	private String minimumAmountMD;
	private String maturityROIMD;
	private String termModeMD;
	private String termMD;
	private String MISIntROIMD;
	private String MISIntervalMD;
	private String MISInterestMD;
	private String maturityAmountMD;
	private String flexiblePlanMD;
	private String commissionOnNewMD;
	private String statusOfPlanMDRD2;

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

	public void setPlanCodeMD(String planCodeMD) {

		this.planCodeMD = planCodeMD;
	}
	public String getMinimumAmountMD() {
		return minimumAmountMD;
	}
	public void setMinimumAmountMD(String minimumAmountMD) {
		this.minimumAmountMD = minimumAmountMD;
	}
	public String getMaturityROIMD() {
		return maturityROIMD;
	}
	public void setMaturityROIMD(String maturityROIMD) {
		this.maturityROIMD = maturityROIMD;
	}
	public String getTermModeMD() {
		return termModeMD;
	}
	public void setTermModeMD(String termModeMD) {
		this.termModeMD = termModeMD;
	}
	public String getTermMD() {
		return termMD;
	}
	public void setTermMD(String termMD) {
		this.termMD = termMD;
	}
	public String getMISIntROIMD() {
		return MISIntROIMD;
	}
	public void setMISIntROIMD(String mISIntROIMD) {
		MISIntROIMD = mISIntROIMD;
	}
	public String getMISIntervalMD() {
		return MISIntervalMD;
	}
	public void setMISIntervalMD(String mISIntervalMD) {
		MISIntervalMD = mISIntervalMD;
	}
	public String getMISInterestMD() {
		return MISInterestMD;
	}
	public void setMISInterestMD(String mISInterestMD) {
		MISInterestMD = mISInterestMD;
	}
	public String getMaturityAmountMD() {
		return maturityAmountMD;
	}
	public void setMaturityAmountMD(String maturityAmountMD) {
		this.maturityAmountMD = maturityAmountMD;
	}
	public String getCommissionOnNewMD() {
		return commissionOnNewMD;
	}
	public void setCommissionOnNewMD(String commissionOnNewMD) {
		this.commissionOnNewMD = commissionOnNewMD;
	}
	public String getStatusOfPlanMDRD2() {
		return statusOfPlanMDRD2;
	}
	public void setStatusOfPlanMDRD2(String statusOfPlanMDRD2) {
		this.statusOfPlanMDRD2 = statusOfPlanMDRD2;
	}
	public String getPlanNameMD() {
		return planNameMD;
	}
	public void setPlanNameMD(String planNameMD) {
		this.planNameMD = planNameMD;
	}
	
	

}
