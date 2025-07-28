package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class LedgerAccountMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private String accountTitle;
	private String groupName;
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
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	
	
	

}
