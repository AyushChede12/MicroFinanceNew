package com.microfinance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.model.SecuredGoldPlan;
import com.microfinance.repository.GoldSecurePlanRepo;

@Service
public class SecuredGoldLoanService {
	
	@Autowired 
	GoldSecurePlanRepo goldSecurePlanRepo;

	public SecuredGoldPlan saveLoanManagmentData(SecuredGoldPlan goldLoan) {
		if (goldLoan.getId() != null && goldSecurePlanRepo.existsById(goldLoan.getId())) {
			// Perform update
			SecuredGoldPlan existingGoldLoan = goldSecurePlanRepo.findById(goldLoan.getId()).get();

			// Gold Loan Details
			existingGoldLoan.setLoanPlanName(goldLoan.getLoanPlanName());
			existingGoldLoan.setTypeOfLoan(goldLoan.getTypeOfLoan());
			existingGoldLoan.setLoanMode(goldLoan.getLoanMode());
			existingGoldLoan.setInterestType(goldLoan.getInterestType());
			existingGoldLoan.setEmiType(goldLoan.getEmiType());
			existingGoldLoan.setMinAge(goldLoan.getMinAge());
			existingGoldLoan.setMaxAge(goldLoan.getMaxAge());
			existingGoldLoan.setMinAmt(goldLoan.getMinAmt());
			existingGoldLoan.setMaxAmt(goldLoan.getMaxAmt());
			existingGoldLoan.setMinTerm(goldLoan.getMinTerm());
			existingGoldLoan.setMaxTerm(goldLoan.getMaxTerm());
			existingGoldLoan.setRateInterestType(goldLoan.getRateInterestType());
			existingGoldLoan.setSecurityType(goldLoan.getSecurityType());
			existingGoldLoan.setPlanStatus(goldLoan.getPlanStatus());
			
			//Deduction Details
			existingGoldLoan.setProcFee(goldLoan.getProcFee());
			existingGoldLoan.setLegalCharge(goldLoan.getLegalCharge());
			existingGoldLoan.setGst(goldLoan.getGst());
			existingGoldLoan.setInsuFee(goldLoan.getInsuFee());
			existingGoldLoan.setValuFee(goldLoan.getValuFee());
			
			//Late Fine Details
			existingGoldLoan.setLateAllowanceDay(goldLoan.getLateAllowanceDay());
			existingGoldLoan.setPenaltyMode(goldLoan.getPenaltyMode());
			existingGoldLoan.setMonthlyPenalty(goldLoan.getMonthlyPenalty());
			

			return goldSecurePlanRepo.save(existingGoldLoan);
		} else {
			// Save new record
			return goldSecurePlanRepo.save(goldLoan);
		}
		
	}

}
