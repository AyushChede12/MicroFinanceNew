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
	private String componentIntervalMD;
	private String totalPaidMD;
	private String graceDaysMD;
	private String penltyfineMD;
	private String maturityAmountMD;
	private String flexiblePlanMD;
	private String commissionOnNewMD;
	private String renewalCommissionMD;
	private String statusOfPlanMDRD2;
}
