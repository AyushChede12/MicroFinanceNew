package com.microfinance.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class IncomingReceiptDto {
	
	
	private long id;
	
    @NotBlank(message = "Branch name must not be blank")
	private String branchName;
    
    private String generatedReceiptID; 
    
    @NotBlank(message = "Date of entry is required")
    private String dateOfEntry;
    
    @NotBlank(message = "Ledger account must not be blank")
    private String ledgerAccount;
    
    @NotBlank(message = "Transfer mode is required")
    private String transferMode;
    
    @NotBlank(message = "Transaction amount must not be blank")
    private String transactionAmount;
    
    @NotBlank(message = "Remarks must not be blank")
    @Size(max = 255, message = "Remarks should not exceed 255 characters")
    private String remarks;
    
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getGeneratedReceiptID() {
		return generatedReceiptID;
	}
	public void setGeneratedReceiptID(String generatedReceiptID) {
		this.generatedReceiptID = generatedReceiptID;
	}
	public String getDateOfEntry() {
		return dateOfEntry;
	}
	public void setDateOfEntry(String dateOfEntry) {
		this.dateOfEntry = dateOfEntry;
	}
	
	
	public String getLedgerAccount() {
		return ledgerAccount;
	}
	public void setLedgerAccount(String ledgerAccount) {
		this.ledgerAccount = ledgerAccount;
	}
	public String getTransferMode() {
		return transferMode;
	}
	public void setTransferMode(String transferMode) {
		this.transferMode = transferMode;
	}
	public String getTransactionAmount() {
		return transactionAmount;
	}
	public void setTransactionAmount(String transactionAmount) {
		this.transactionAmount = transactionAmount;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
    
    

}
