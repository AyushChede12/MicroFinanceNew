package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AccountbankStatement {
	@Id 
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String customerAcnumber;
	private String startDate;
	private String endDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCustomerAcnumber() {
		return customerAcnumber;
	}
	public void setCustomerAcnumber(String customerAcnumber) {
		this.customerAcnumber = customerAcnumber;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
	

}
