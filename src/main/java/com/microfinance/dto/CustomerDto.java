package com.microfinance.dto;

import org.springframework.web.multipart.MultipartFile;

public class CustomerDto {
	
	private long id;

	//Customer Details
	private String memberCode;
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
		private MultipartFile customerPhoto;
		private MultipartFile customerSignature;

	//Nominee Details
		private String nomineeName;
		private String nomineeRelationToApplicant;
		private String nomineeAge;
		private String nomineeAddress;
		private String nomineePanNo;
		private String nomineeKycNo;
		private String nomineeKycType;
		private String nomineeMobileNo;

		

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
		
		
		

		public String getMemberCode() {
			return memberCode;
		}

		public void setMemberCode(String memberCode) {
			this.memberCode = memberCode;
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

		

		public MultipartFile getCustomerPhoto() {
			return customerPhoto;
		}

		public void setCustomerPhoto(MultipartFile customerPhoto) {
			this.customerPhoto = customerPhoto;
		}

		public MultipartFile getCustomerSignature() {
			return customerSignature;
		}

		public void setCustomerSignature(MultipartFile customerSignature) {
			this.customerSignature = customerSignature;
		}

		public String getNomineeName() {
			return nomineeName;
		}

		public void setNomineeName(String nomineeName) {
			this.nomineeName = nomineeName;
		}

		public String getNomineeRelationToApplicant() {
			return nomineeRelationToApplicant;
		}

		public void setNomineeRelationToApplicant(String nomineeRelationToApplicant) {
			this.nomineeRelationToApplicant = nomineeRelationToApplicant;
		}

		public String getNomineeAge() {
			return nomineeAge;
		}

		public void setNomineeAge(String nomineeAge) {
			this.nomineeAge = nomineeAge;
		}

		public String getNomineeAddress() {
			return nomineeAddress;
		}

		public void setNomineeAddress(String nomineeAddress) {
			this.nomineeAddress = nomineeAddress;
		}

		public String getNomineePanNo() {
			return nomineePanNo;
		}

		public void setNomineePanNo(String nomineePanNo) {
			this.nomineePanNo = nomineePanNo;
		}

		public String getNomineeKycNo() {
			return nomineeKycNo;
		}

		public void setNomineeKycNo(String nomineeKycNo) {
			this.nomineeKycNo = nomineeKycNo;
		}

		public String getNomineeKycType() {
			return nomineeKycType;
		}

		public void setNomineeKycType(String nomineeKycType) {
			this.nomineeKycType = nomineeKycType;
		}
        
		public String getNomineeMobileNo() {
			return nomineeMobileNo;
		}

		public void setNomineeMobileNo(String nomineeMobileNo) {
			this.nomineeMobileNo = nomineeMobileNo;
		}
		
		

}
