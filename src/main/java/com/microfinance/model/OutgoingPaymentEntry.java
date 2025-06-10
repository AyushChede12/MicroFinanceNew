package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class OutgoingPaymentEntry {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
	
	private String branchName;

    private String genratedId;  // Typo retained from form name. Recommended: `generatedId`

    private String dateOfEntry;

    private String creditLedger;

    private String debitLedger;

    private String transactionAmount;

    private String remarks;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getGenratedId() {
		return genratedId;
	}

	public void setGenratedId(String genratedId) {
		this.genratedId = genratedId;
	}

	public String getDateOfEntry() {
		return dateOfEntry;
	}

	public void setDateOfEntry(String dateOfEntry) {
		this.dateOfEntry = dateOfEntry;
	}

	public String getCreditLedger() {
		return creditLedger;
	}

	public void setCreditLedger(String creditLedger) {
		this.creditLedger = creditLedger;
	}

	public String getDebitLedger() {
		return debitLedger;
	}

	public void setDebitLedger(String debitLedger) {
		this.debitLedger = debitLedger;
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
