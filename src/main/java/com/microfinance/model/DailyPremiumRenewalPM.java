package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class DailyPremiumRenewalPM {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String policyDate;
	private String maturityDate;
	private String customerCode;
	private String clientName;
	private String contactNumber;
	private String policyAmount;
	private String policyType;
	private String policyTerm;
	private String maturityAmt;
	private String totalDeposits;
	private String paymentDue;
	private String notificationStatus;
	private String financialCode;
	private String lastPaymentDate;
	private String dueDate;
	private String installmentsCompleted;
	private String modeOfPayment;
	private String agentCollectorName;
	private String name;
	private String comments;
	private String image1;
	private String image2;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPolicyDate() {
		return policyDate;
	}
	public void setPolicyDate(String policyDate) {
		this.policyDate = policyDate;
	}
	public String getMaturityDate() {
		return maturityDate;
	}
	public void setMaturityDate(String maturityDate) {
		this.maturityDate = maturityDate;
	}
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getPolicyAmount() {
		return policyAmount;
	}
	public void setPolicyAmount(String policyAmount) {
		this.policyAmount = policyAmount;
	}
	public String getPolicyType() {
		return policyType;
	}
	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}
	public String getPolicyTerm() {
		return policyTerm;
	}
	public void setPolicyTerm(String policyTerm) {
		this.policyTerm = policyTerm;
	}
	public String getMaturityAmt() {
		return maturityAmt;
	}
	public void setMaturityAmt(String maturityAmt) {
		this.maturityAmt = maturityAmt;
	}
	public String getTotalDeposits() {
		return totalDeposits;
	}
	public void setTotalDeposits(String totalDeposits) {
		this.totalDeposits = totalDeposits;
	}
	public String getPaymentDue() {
		return paymentDue;
	}
	public void setPaymentDue(String paymentDue) {
		this.paymentDue = paymentDue;
	}
	public String getNotificationStatus() {
		return notificationStatus;
	}
	public void setNotificationStatus(String notificationStatus) {
		this.notificationStatus = notificationStatus;
	}
	public String getFinancialCode() {
		return financialCode;
	}
	public void setFinancialCode(String financialCode) {
		this.financialCode = financialCode;
	}
	public String getLastPaymentDate() {
		return lastPaymentDate;
	}
	public void setLastPaymentDate(String lastPaymentDate) {
		this.lastPaymentDate = lastPaymentDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getInstallmentsCompleted() {
		return installmentsCompleted;
	}
	public void setInstallmentsCompleted(String installmentsCompleted) {
		this.installmentsCompleted = installmentsCompleted;
	}
	public String getModeOfPayment() {
		return modeOfPayment;
	}
	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}
	public String getAgentCollectorName() {
		return agentCollectorName;
	}
	public void setAgentCollectorName(String agentCollectorName) {
		this.agentCollectorName = agentCollectorName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	
	

}
