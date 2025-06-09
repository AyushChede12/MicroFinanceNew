package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AccountcontraEntry {
	@Id 
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String branchName;
	private String genratedId;
	private String dateOfEntry;
	private String creditLedger;
	private String debitLedger;
	private String transactionAmount;
	private String remarks;
	
	
}
