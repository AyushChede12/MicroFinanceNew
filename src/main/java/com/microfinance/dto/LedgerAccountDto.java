package com.microfinance.dto;

import javax.validation.constraints.NotBlank;

public class LedgerAccountDto {
	
	private long id;
	
	//New Ledger Entry
    @NotBlank(message = "Account title is required")
    private String accountTitle;
    
    @NotBlank(message = "Group Name is required")
    private String groupName;

    
    @NotBlank(message = "Branch name is required")
    private String branchName;
    
    
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getAccountTitle() {
		return accountTitle;
	}
	public void setAccountTitle(String accountTitle) {
		this.accountTitle = accountTitle;
	}
	
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
    
    

}
