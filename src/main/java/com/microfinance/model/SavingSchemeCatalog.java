package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SavingSchemeCatalog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String PolicyName;
	private String YearlyROI;
	private String CustomerName;
	private String InitialDeposite;
	private String MonthlyMinimumBalance;
	private String ReservedFunds;
	private String MessagingFees;
	private String MessagingInterval;
	private String MonthlyFreeIFSCTransactions;
	private String FreeMoneyTransfers;
	private String LimitperTransaction;
	private String DailyLimit;
	private String WeeklyLimit;
	private String MonthlyLimit;
	private String ServiceFee;
	private String BillingCycle;
	private String CardFee;
	private String MonthlyCardLimit;
	private String YearlyCardLimit;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPolicyName() {
		return PolicyName;
	}
	public void setPolicyName(String policyName) {
		PolicyName = policyName;
	}
	public String getYearlyROI() {
		return YearlyROI;
	}
	public void setYearlyROI(String yearlyROI) {
		YearlyROI = yearlyROI;
	}
	public String getCustomerName() {
		return CustomerName;
	}
	public void setCustomerName(String customerName) {
		CustomerName = customerName;
	}
	public String getInitialDeposite() {
		return InitialDeposite;
	}
	public void setInitialDeposite(String initialDeposite) {
		InitialDeposite = initialDeposite;
	}
	public String getMonthlyMinimumBalance() {
		return MonthlyMinimumBalance;
	}
	public void setMonthlyMinimumBalance(String monthlyMinimumBalance) {
		MonthlyMinimumBalance = monthlyMinimumBalance;
	}
	public String getReservedFunds() {
		return ReservedFunds;
	}
	public void setReservedFunds(String reservedFunds) {
		ReservedFunds = reservedFunds;
	}
	public String getMessagingFees() {
		return MessagingFees;
	}
	public void setMessagingFees(String messagingFees) {
		MessagingFees = messagingFees;
	}
	public String getMessagingInterval() {
		return MessagingInterval;
	}
	public void setMessagingInterval(String messagingInterval) {
		MessagingInterval = messagingInterval;
	}
	public String getMonthlyFreeIFSCTransactions() {
		return MonthlyFreeIFSCTransactions;
	}
	public void setMonthlyFreeIFSCTransactions(String monthlyFreeIFSCTransactions) {
		MonthlyFreeIFSCTransactions = monthlyFreeIFSCTransactions;
	}
	public String getFreeMoneyTransfers() {
		return FreeMoneyTransfers;
	}
	public void setFreeMoneyTransfers(String freeMoneyTransfers) {
		FreeMoneyTransfers = freeMoneyTransfers;
	}
	public String getLimitperTransaction() {
		return LimitperTransaction;
	}
	public void setLimitperTransaction(String limitperTransaction) {
		LimitperTransaction = limitperTransaction;
	}
	public String getDailyLimit() {
		return DailyLimit;
	}
	public void setDailyLimit(String dailyLimit) {
		DailyLimit = dailyLimit;
	}
	public String getWeeklyLimit() {
		return WeeklyLimit;
	}
	public void setWeeklyLimit(String weeklyLimit) {
		WeeklyLimit = weeklyLimit;
	}
	public String getMonthlyLimit() {
		return MonthlyLimit;
	}
	public void setMonthlyLimit(String monthlyLimit) {
		MonthlyLimit = monthlyLimit;
	}
	public String getServiceFee() {
		return ServiceFee;
	}
	public void setServiceFee(String serviceFee) {
		ServiceFee = serviceFee;
	}
	public String getBillingCycle() {
		return BillingCycle;
	}
	public void setBillingCycle(String billingCycle) {
		BillingCycle = billingCycle;
	}
	public String getCardFee() {
		return CardFee;
	}
	public void setCardFee(String cardFee) {
		CardFee = cardFee;
	}
	public String getMonthlyCardLimit() {
		return MonthlyCardLimit;
	}
	public void setMonthlyCardLimit(String monthlyCardLimit) {
		MonthlyCardLimit = monthlyCardLimit;
	}
	public String getYearlyCardLimit() {
		return YearlyCardLimit;
	}
	public void setYearlyCardLimit(String yearlyCardLimit) {
		YearlyCardLimit = yearlyCardLimit;
	}
	
	
}
