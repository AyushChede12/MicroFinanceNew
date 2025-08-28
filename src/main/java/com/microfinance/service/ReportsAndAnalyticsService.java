package com.microfinance.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.LoanApplication;
import com.microfinance.model.LoanPayment;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.repository.ReportsAndAnalyticsRepo;
import com.microfinance.repository.CreateSavingAccountRepo;
import com.microfinance.repository.LoanApplicationRepo;
import com.microfinance.repository.LoanPaymentRepo;



@Service
public class ReportsAndAnalyticsService {
	
	@Autowired
	ReportsAndAnalyticsRepo reportsAndAnalyticsRepo;
	
	@Autowired
	CreateSavingAccountRepo createSavingAccountRepo;
	
	@Autowired
	LoanApplicationRepo loanApplicationRepo;
	
	@Autowired
	LoanPaymentRepo loanPaymentRepo;

	public List<addFinancialConsultant> getApprovedFinancialConsultant() {
		// TODO Auto-generated method stub
		return reportsAndAnalyticsRepo.findByIsApprovedTrue();
	}

	public List<CreateSavingsAccount> getApprovedSavingAccount() {
		// TODO Auto-generated method stub
		return createSavingAccountRepo.findByIsApprovedTrue();
	}

	public List<LoanApplication> getUnapprovedLoanApplication() {
		// TODO Auto-generated method stub
		return loanApplicationRepo.findByApprovalStatusFalse();
	}

	public List<LoanPayment> getLoanPaymentReport() {
		// TODO Auto-generated method stub
		return loanPaymentRepo.findAll();
	}

	public List<LoanApplication> getLoanConfirmationDocument() {
		// TODO Auto-generated method stub
		return loanApplicationRepo.findAll();
	}
	

}
