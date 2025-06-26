package com.microfinance.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.repository.LoanMangmentSchemeRepo;

@Service
public class LoanManagementService {

	
	@Autowired
	
	 private LoanMangmentSchemeRepo loanRepository ;
	
	 /* public LoanSchemCatalog saveLoan(LoanSchemCatalog lone) { return
	 * loanRepository.save(lone);
	 * 
	 * }
	 */
	

//	public ApiResponse<LoanSchemCatalog> saveLoanManagmentData(LoanSchemCatalog loan) {
//	    // Check if ID is present (update case)
//	    if(loan.getId() != null ) {
//	        Optional<LoanSchemCatalog> optionalLoan = loanRepository.findById(loan.getId());
//
//	        if (optionalLoan.isPresent()) {
//	            LoanSchemCatalog existingLoan = optionalLoan.get();
//
//	            // Update fields
//	            existingLoan.setLoanPlaneName(loan.getLoanPlaneName());
//	            existingLoan.setTypeloan(loan.getTypeloan());
//	            existingLoan.setMinimumAge(loan.getMinimumAge());
//	            existingLoan.setMinloanDuration(loan.getMinloanDuration());
//	            existingLoan.setMixloanDuration(loan.getMixloanDuration());
//	            existingLoan.setEmiFrequency(loan.getEmiFrequency());
//	            existingLoan.setEmiType(loan.getEmiType());
//	            existingLoan.setMinimumloanAmount(loan.getMinimumloanAmount());
//	            existingLoan.setMaximumloanAmount(loan.getMaximumloanAmount());
//	            existingLoan.setRateIntrestType(loan.getRateIntrestType());
//	            existingLoan.setTypeIntrest(loan.getTypeIntrest());
//	            existingLoan.setTypesecurity(loan.getTypesecurity());
//	            existingLoan.setFeeProcessing(loan.getFeeProcessing());
//	            existingLoan.setChargesLegal(loan.getChargesLegal());
//	            existingLoan.setFeeInsurence(loan.getFeeInsurence());
//	            existingLoan.setGst(loan.getGst());
//	            existingLoan.setFeeValuation(loan.getFeeValuation());
//	            existingLoan.setLateAllowanceday(loan.getLateAllowanceday());
//	            existingLoan.setModePanalty(loan.getModePanalty());
//	            existingLoan.setPennaltyMonthly(loan.getPennaltyMonthly());
//
//	            LoanSchemCatalog updatedLoan = loanRepository.save(existingLoan);
//	       return  new ApiResponse<>("Loan updated successfully", true, updatedLoan);
//	      
//	         
//	        }
//	    }
//
//	  
//	    LoanSchemCatalog savedLoan = loanRepository.save(loan);
//	    return new ApiResponse<>("Loan saved successfully", true, savedLoan);
//	}

	
	

}
