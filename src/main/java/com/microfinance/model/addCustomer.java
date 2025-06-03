package com.microfinance.model;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class addCustomer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

//Customer Details
	private String authenticateFor;
	private String signupDate;
	private String major;
	private String customerName;
	private String minor;
	private String customerGender;
	private String guardianName;
	private String relationToApplicant;
	private String dob;
	private String customerAge;
	private String relationshipStatus;
	private String customerAddress;
	private String state;
	private String district;
	private String aadharNo;
	private String pinCode;
	private String branchName;
	private String panNo;
	private String voterNo;
	private String drivingLicenceNo;
	private String referralCode;
	private String referralName;
	private String contactNo;
	private String emailId;
	private String profession;
	private String academicBackground;
	private String customerPhoto;
	private String customerSignature;

//Nominee Details

	private String nomineeAuthenticatefor;
	private String nomineeSignupDate;
	private String nomineeMajor;
	private String nomineeName;
	private String nomineeMinor;
	private String nomineeMemberName;
	private String nomineeRelationToApplicant;
	private String nomineeGender;
	private String nomineeDob;
	private String nomineeAge;
	private String nomineeRelationshipStatus;
	private String NomineeAddress;
	private String nomineeState;
	private String nomineeDistrict;
	private String nomineeAadharNo;
	private String nomineePinCode;
	private String nomineeBranchName;
	private String nomineePanNo;
	private String nomineeVoterNo;
	private String nomineeDrivingLicenceNo;
	private String nomineeReferralCode;
	private String nomineeReferralName;
	private String nomineeContactNo;
	private String nomineeEmailId;
	private String nomineeProfession;
	private String nomineeAcademicBackground;
	private String nomineePhoto;
	private String nomineeSignature;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getAuthenticateFor() {
		return authenticateFor;
	}

	public void setAuthenticateFor(String authenticateFor) {
		this.authenticateFor = authenticateFor;
	}

	public String getSignupDate() {
		return signupDate;
	}

	public void setSignupDate(String signupDate) {
		this.signupDate = signupDate;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getMinor() {
		return minor;
	}

	public void setMinor(String minor) {
		this.minor = minor;
	}

	public String getCustomerGender() {
		return customerGender;
	}

	public void setCustomerGender(String customerGender) {
		this.customerGender = customerGender;
	}

	public String getGuardianName() {
		return guardianName;
	}

	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}

	public String getRelationToApplicant() {
		return relationToApplicant;
	}

	public void setRelationToApplicant(String relationToApplicant) {
		this.relationToApplicant = relationToApplicant;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getCustomerAge() {
		return customerAge;
	}

	public void setCustomerAge(String customerAge) {
		this.customerAge = customerAge;
	}

	public String getRelationshipStatus() {
		return relationshipStatus;
	}

	public void setRelationshipStatus(String relationshipStatus) {
		this.relationshipStatus = relationshipStatus;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
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

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public String getVoterNo() {
		return voterNo;
	}

	public void setVoterNo(String voterNo) {
		this.voterNo = voterNo;
	}

	public String getDrivingLicenceNo() {
		return drivingLicenceNo;
	}

	public void setDrivingLicenceNo(String drivingLicenceNo) {
		this.drivingLicenceNo = drivingLicenceNo;
	}

	public String getReferralCode() {
		return referralCode;
	}

	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}

	public String getReferralName() {
		return referralName;
	}

	public void setReferralName(String referralName) {
		this.referralName = referralName;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getAcademicBackground() {
		return academicBackground;
	}

	public void setAcademicBackground(String academicBackground) {
		this.academicBackground = academicBackground;
	}

	public String getCustomerPhoto() {
		return customerPhoto;
	}

	public void setCustomerPhoto(String customerPhoto) {
		this.customerPhoto = customerPhoto;
	}

	public String getCustomerSignature() {
		return customerSignature;
	}

	public void setCustomerSignature(String customerSignature) {
		this.customerSignature = customerSignature;
	}

	public String getNomineeAuthenticatefor() {
		return nomineeAuthenticatefor;
	}

	public void setNomineeAuthenticatefor(String nomineeAuthenticatefor) {
		this.nomineeAuthenticatefor = nomineeAuthenticatefor;
	}

	public String getNomineeSignupDate() {
		return nomineeSignupDate;
	}

	public void setNomineeSignupDate(String nomineeSignupDate) {
		this.nomineeSignupDate = nomineeSignupDate;
	}

	public String getNomineeMajor() {
		return nomineeMajor;
	}

	public void setNomineeMajor(String nomineeMajor) {
		this.nomineeMajor = nomineeMajor;
	}

	public String getNomineeName() {
		return nomineeName;
	}

	public void setNomineeName(String nomineeName) {
		this.nomineeName = nomineeName;
	}

	public String getNomineeMinor() {
		return nomineeMinor;
	}

	public void setNomineeMinor(String nomineeMinor) {
		this.nomineeMinor = nomineeMinor;
	}

	public String getNomineeMemberName() {
		return nomineeMemberName;
	}

	public void setNomineeMemberName(String nomineeMemberName) {
		this.nomineeMemberName = nomineeMemberName;
	}

	public String getNomineeRelationToApplicant() {
		return nomineeRelationToApplicant;
	}

	public void setNomineeRelationToApplicant(String nomineeRelationToApplicant) {
		this.nomineeRelationToApplicant = nomineeRelationToApplicant;
	}

	public String getNomineeGender() {
		return nomineeGender;
	}

	public void setNomineeGender(String nomineeGender) {
		this.nomineeGender = nomineeGender;
	}

	public String getNomineeDob() {
		return nomineeDob;
	}

	public void setNomineeDob(String nomineeDob) {
		this.nomineeDob = nomineeDob;
	}

	public String getNomineeAge() {
		return nomineeAge;
	}

	public void setNomineeAge(String nomineeAge) {
		this.nomineeAge = nomineeAge;
	}

	public String getNomineeRelationshipStatus() {
		return nomineeRelationshipStatus;
	}

	public void setNomineeRelationshipStatus(String nomineeRelationshipStatus) {
		this.nomineeRelationshipStatus = nomineeRelationshipStatus;
	}

	public String getNomineeAddress() {
		return NomineeAddress;
	}

	public void setNomineeAddress(String nomineeAddress) {
		NomineeAddress = nomineeAddress;
	}

	public String getNomineeState() {
		return nomineeState;
	}

	public void setNomineeState(String nomineeState) {
		this.nomineeState = nomineeState;
	}

	public String getNomineeDistrict() {
		return nomineeDistrict;
	}

	public void setNomineeDistrict(String nomineeDistrict) {
		this.nomineeDistrict = nomineeDistrict;
	}

	public String getNomineeAadharNo() {
		return nomineeAadharNo;
	}

	public void setNomineeAadharNo(String nomineeAadharNo) {
		this.nomineeAadharNo = nomineeAadharNo;
	}

	public String getNomineePinCode() {
		return nomineePinCode;
	}

	public void setNomineePinCode(String nomineePinCode) {
		this.nomineePinCode = nomineePinCode;
	}

	public String getNomineeBranchName() {
		return nomineeBranchName;
	}

	public void setNomineeBranchName(String nomineeBranchName) {
		this.nomineeBranchName = nomineeBranchName;
	}

	public String getNomineePanNo() {
		return nomineePanNo;
	}

	public void setNomineePanNo(String nomineePanNo) {
		this.nomineePanNo = nomineePanNo;
	}

	public String getNomineeVoterNo() {
		return nomineeVoterNo;
	}

	public void setNomineeVoterNo(String nomineeVoterNo) {
		this.nomineeVoterNo = nomineeVoterNo;
	}

	public String getNomineeDrivingLicenceNo() {
		return nomineeDrivingLicenceNo;
	}

	public void setNomineeDrivingLicenceNo(String nomineeDrivingLicenceNo) {
		this.nomineeDrivingLicenceNo = nomineeDrivingLicenceNo;
	}

	public String getNomineeReferralCode() {
		return nomineeReferralCode;
	}

	public void setNomineeReferralCode(String nomineeReferralCode) {
		this.nomineeReferralCode = nomineeReferralCode;
	}

	public String getNomineeReferralName() {
		return nomineeReferralName;
	}

	public void setNomineeReferralName(String nomineeReferralName) {
		this.nomineeReferralName = nomineeReferralName;
	}

	public String getNomineeContactNo() {
		return nomineeContactNo;
	}

	public void setNomineeContactNo(String nomineeContactNo) {
		this.nomineeContactNo = nomineeContactNo;
	}

	public String getNomineeEmailId() {
		return nomineeEmailId;
	}

	public void setNomineeEmailId(String nomineeEmailId) {
		this.nomineeEmailId = nomineeEmailId;
	}

	public String getNomineeAcademicBackground() {
		return nomineeAcademicBackground;
	}

	public void setNomineeAcademicBackground(String nomineeAcademicBackground) {
		this.nomineeAcademicBackground = nomineeAcademicBackground;
	}

	public String getNomineePhoto() {
		return nomineePhoto;
	}

	public void setNomineePhoto(String nomineePhoto) {
		this.nomineePhoto = nomineePhoto;
	}

	public String getNomineeSignature() {
		return nomineeSignature;
	}

	public void setNomineeSignature(String nomineeSignature) {
		this.nomineeSignature = nomineeSignature;
	}

	public String getNomineeProfession() {
		return nomineeProfession;
	}

	public void setNomineeProfession(String nomineeProfession) {
		this.nomineeProfession = nomineeProfession;
	}

}
