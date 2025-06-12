package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class CompanyAdministration {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private long id;
	private String companyName;
	private String shortName;
	private String signUpDate;
	private String cinNo;
	private String pan;
	private String tan;
	private String gstin;
	private String declaredValue;
	private String address;
	private String state;
	private String pinCode;
	private String emailId;
	private String authorizedShareCapital;
	private String paidUpCapital;
	private String nof;
	private String contactNo;
	private String tdsWithPan;
	private String tdsWithoutPan;
	private String taxDeduction;
	private String seniorCitizenTaxDeduction;
	private String photo;
	private String signature;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getSignUpDate() {
		return signUpDate;
	}
	public void setSignUpDate(String signUpDate) {
		this.signUpDate = signUpDate;
	}
	public String getCinNo() {
		return cinNo;
	}
	public void setCinNo(String cinNo) {
		this.cinNo = cinNo;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public String getTan() {
		return tan;
	}
	public void setTan(String tan) {
		this.tan = tan;
	}
	public String getGstin() {
		return gstin;
	}
	public void setGstin(String gstin) {
		this.gstin = gstin;
	}
	public String getDeclaredValue() {
		return declaredValue;
	}
	public void setDeclaredValue(String declaredValue) {
		this.declaredValue = declaredValue;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPinCode() {
		return pinCode;
	}
	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getAuthorizedShareCapital() {
		return authorizedShareCapital;
	}
	public void setAuthorizedShareCapital(String authorizedShareCapital) {
		this.authorizedShareCapital = authorizedShareCapital;
	}
	public String getPaidUpCapital() {
		return paidUpCapital;
	}
	public void setPaidUpCapital(String paidUpCapital) {
		this.paidUpCapital = paidUpCapital;
	}
	public String getNof() {
		return nof;
	}
	public void setNof(String nof) {
		this.nof = nof;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getTdsWithPan() {
		return tdsWithPan;
	}
	public void setTdsWithPan(String tdsWithPan) {
		this.tdsWithPan = tdsWithPan;
	}
	public String getTdsWithoutPan() {
		return tdsWithoutPan;
	}
	public void setTdsWithoutPan(String tdsWithoutPan) {
		this.tdsWithoutPan = tdsWithoutPan;
	}
	public String getTaxDeduction() {
		return taxDeduction;
	}
	public void setTaxDeduction(String taxDeduction) {
		this.taxDeduction = taxDeduction;
	}
	public String getSeniorCitizenTaxDeduction() {
		return seniorCitizenTaxDeduction;
	}
	public void setSeniorCitizenTaxDeduction(String seniorCitizenTaxDeduction) {
		this.seniorCitizenTaxDeduction = seniorCitizenTaxDeduction;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}

}
