package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class GroupDirectory {
	@Id 
	@GeneratedValue(strategy = GenerationType.AUTO)
	 // Group Info
	private Long id;
    private String communityName;
    private String openingDate;
    private String assignedBranch;
    private String communityLeader;
    private String contactNo;
    private String communityAddress;
    private String allocatedStaff;
    private String collectionDay;
    private String collectionTime;

    // Group Member Link
    private String selectedMember;
    private String memberName;
    private String relativeDetails;
    private String mobile;
    private String previousLoan;

    // Uploads
    private String uploadPhoto;        
    private String uploadSignature;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCommunityName() {
		return communityName;
	}
	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}
	public String getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(String openingDate) {
		this.openingDate = openingDate;
	}
	public String getAssignedBranch() {
		return assignedBranch;
	}
	public void setAssignedBranch(String assignedBranch) {
		this.assignedBranch = assignedBranch;
	}
	public String getCommunityLeader() {
		return communityLeader;
	}
	public void setCommunityLeader(String communityLeader) {
		this.communityLeader = communityLeader;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getCommunityAddress() {
		return communityAddress;
	}
	public void setCommunityAddress(String communityAddress) {
		this.communityAddress = communityAddress;
	}
	public String getAllocatedStaff() {
		return allocatedStaff;
	}
	public void setAllocatedStaff(String allocatedStaff) {
		this.allocatedStaff = allocatedStaff;
	}
	public String getCollectionDay() {
		return collectionDay;
	}
	public void setCollectionDay(String collectionDay) {
		this.collectionDay = collectionDay;
	}
	public String getCollectionTime() {
		return collectionTime;
	}
	public void setCollectionTime(String collectionTime) {
		this.collectionTime = collectionTime;
	}
	public String getSelectedMember() {
		return selectedMember;
	}
	public void setSelectedMember(String selectedMember) {
		this.selectedMember = selectedMember;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getRelativeDetails() {
		return relativeDetails;
	}
	public void setRelativeDetails(String relativeDetails) {
		this.relativeDetails = relativeDetails;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPreviousLoan() {
		return previousLoan;
	}
	public void setPreviousLoan(String previousLoan) {
		this.previousLoan = previousLoan;
	}
	public String getUploadPhoto() {
		return uploadPhoto;
	}
	public void setUploadPhoto(String uploadPhoto) {
		this.uploadPhoto = uploadPhoto;
	}
	public String getUploadSignature() {
		return uploadSignature;
	}
	public void setUploadSignature(String uploadSignature) {
		this.uploadSignature = uploadSignature;
	} 
    

}
