package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class MaturitySchemeMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private long id;
	private String ddPolicyCode;
	private String ddInstFrom;
	private String ddInstTo;
	private String ddInterestRate;
	private String ddDeduction;
	
	private String rdPolicyCode;
	private String rdInstFrom;
	private String rdInstTo;
	private String rdInterestRate;
	private String rdDeduction;
	
	private String fdPolicyCode;
	private String fdMonthsFrom;
	private String fdMonthsTo;
	private String fdInterestRate;
	private String fdDeduction;
	
	private String misPolicyCode;
	private String misMonthsFrom;
	private String misMonthsTo;
	private String misInterestRate;
	private String misDeduction;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getDdPolicyCode() {
		return ddPolicyCode;
	}
	public void setDdPolicyCode(String ddPolicyCode) {
		this.ddPolicyCode = ddPolicyCode;
	}
	public String getDdInstFrom() {
		return ddInstFrom;
	}
	public void setDdInstFrom(String ddInstFrom) {
		this.ddInstFrom = ddInstFrom;
	}
	public String getDdInstTo() {
		return ddInstTo;
	}
	public void setDdInstTo(String ddInstTo) {
		this.ddInstTo = ddInstTo;
	}
	public String getDdInterestRate() {
		return ddInterestRate;
	}
	public void setDdInterestRate(String ddInterestRate) {
		this.ddInterestRate = ddInterestRate;
	}
	public String getDdDeduction() {
		return ddDeduction;
	}
	public void setDdDeduction(String ddDeduction) {
		this.ddDeduction = ddDeduction;
	}
	public String getRdPolicyCode() {
		return rdPolicyCode;
	}
	public void setRdPolicyCode(String rdPolicyCode) {
		this.rdPolicyCode = rdPolicyCode;
	}
	public String getRdInstFrom() {
		return rdInstFrom;
	}
	public void setRdInstFrom(String rdInstFrom) {
		this.rdInstFrom = rdInstFrom;
	}
	public String getRdInstTo() {
		return rdInstTo;
	}
	public void setRdInstTo(String rdInstTo) {
		this.rdInstTo = rdInstTo;
	}
	public String getRdInterestRate() {
		return rdInterestRate;
	}
	public void setRdInterestRate(String rdInterestRate) {
		this.rdInterestRate = rdInterestRate;
	}
	public String getRdDeduction() {
		return rdDeduction;
	}
	public void setRdDeduction(String rdDeduction) {
		this.rdDeduction = rdDeduction;
	}
	public String getFdPolicyCode() {
		return fdPolicyCode;
	}
	public void setFdPolicyCode(String fdPolicyCode) {
		this.fdPolicyCode = fdPolicyCode;
	}
	public String getFdMonthsFrom() {
		return fdMonthsFrom;
	}
	public void setFdMonthsFrom(String fdMonthsFrom) {
		this.fdMonthsFrom = fdMonthsFrom;
	}
	public String getFdMonthsTo() {
		return fdMonthsTo;
	}
	public void setFdMonthsTo(String fdMonthsTo) {
		this.fdMonthsTo = fdMonthsTo;
	}
	public String getFdInterestRate() {
		return fdInterestRate;
	}
	public void setFdInterestRate(String fdInterestRate) {
		this.fdInterestRate = fdInterestRate;
	}
	public String getFdDeduction() {
		return fdDeduction;
	}
	public void setFdDeduction(String fdDeduction) {
		this.fdDeduction = fdDeduction;
	}
	public String getMisPolicyCode() {
		return misPolicyCode;
	}
	public void setMisPolicyCode(String misPolicyCode) {
		this.misPolicyCode = misPolicyCode;
	}
	public String getMisMonthsFrom() {
		return misMonthsFrom;
	}
	public void setMisMonthsFrom(String misMonthsFrom) {
		this.misMonthsFrom = misMonthsFrom;
	}
	public String getMisMonthsTo() {
		return misMonthsTo;
	}
	public void setMisMonthsTo(String misMonthsTo) {
		this.misMonthsTo = misMonthsTo;
	}
	public String getMisInterestRate() {
		return misInterestRate;
	}
	public void setMisInterestRate(String misInterestRate) {
		this.misInterestRate = misInterestRate;
	}
	public String getMisDeduction() {
		return misDeduction;
	}
	public void setMisDeduction(String misDeduction) {
		this.misDeduction = misDeduction;
	}
	
	
	
	
}
