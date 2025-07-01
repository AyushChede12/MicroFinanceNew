package com.microfinance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.BranchModule;
import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.model.NewLoanApplication;
import com.microfinance.model.addCustomer;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.BranchModuleRepo;
import com.microfinance.repository.LoanMangmentSchemeRepo;
import com.microfinance.repository.NewLoanAppicationRepo;


@Service
public class LoanManagementService {

	@Autowired

	private LoanMangmentSchemeRepo loanRepository;
	@Autowired
	private AddCustomerRepo addCustomerRepo;
	
	@Autowired
	private BranchModuleRepo branchModuleRepo;
	
	



// update and save
	public LoanSchemCatalog saveLoanManagmentData(LoanSchemCatalog loan) {
		// Check if ID is present (update case)
		if (loan.getId() != null) {
			Optional<LoanSchemCatalog> optionalLoan = loanRepository.findById(loan.getId());

			if (optionalLoan.isPresent()) {
				LoanSchemCatalog existingLoan = optionalLoan.get();

				// Update fields
				existingLoan.setLoanSchemeCode(loan.getLoanSchemeCode());

				existingLoan.setLoanPlaneName(loan.getLoanPlaneName());
				existingLoan.setTypeloan(loan.getTypeloan());
				existingLoan.setMinimumAge(loan.getMinimumAge());
				existingLoan.setMaximumAge(loan.getMaximumAge());
				existingLoan.setMinloanDuration(loan.getMinloanDuration());
				existingLoan.setMixloanDuration(loan.getMixloanDuration());
				existingLoan.setEmiFrequency(loan.getEmiFrequency());
				existingLoan.setEmiType(loan.getEmiType());
				existingLoan.setMinimumloanAmount(loan.getMinimumloanAmount());
				existingLoan.setMaximumloanAmount(loan.getMaximumloanAmount());
				existingLoan.setRateIntrestType(loan.getRateIntrestType());
				existingLoan.setTypeIntrest(loan.getTypeIntrest());
				existingLoan.setTypesecurity(loan.getTypesecurity());
				existingLoan.setFeeProcessing(loan.getFeeProcessing());
				existingLoan.setChargesLegal(loan.getChargesLegal());
				existingLoan.setFeeInsurence(loan.getFeeInsurence());
				existingLoan.setGst(loan.getGst());
				existingLoan.setFeeValuation(loan.getFeeValuation());
				existingLoan.setLateAllowanceday(loan.getLateAllowanceday());
				existingLoan.setModePanalty(loan.getModePanalty());
				existingLoan.setPennaltyMonthly(loan.getPennaltyMonthly());

				return loanRepository.save(existingLoan);

			}
		}
		return loanRepository.save(loan);

	}

	// Fetch data On Table

	public List<LoanSchemCatalog> allDataFetchLoanSchemCatelog() {
		// TODO Auto-generated method stub
		return loanRepository.findAll();
	}
// Append the data on Text Field
	public LoanSchemCatalog getLoanById(Long id) {
		// TODO Auto-generated method stub
		return loanRepository.findById(id).orElse(null);
	}
// Delete By ID
	public boolean deleteLoanLoanById(Long id) {
		// TODO Auto-generated method stub
		if (loanRepository.existsById(id)) {
	        loanRepository.deleteById(id);
	        return true;
	    }
	    return false;
	}

	public List<addCustomer> getAllLoanApplication() {
		// TODO Auto-generated method stub
		return addCustomerRepo.findAll();
	}


	public addCustomer getLoanApplicationById(Long id) {
		
		  return addCustomerRepo.findById(id)
	                .orElseThrow(() -> new RuntimeException("Loan not found with ID: " + id));
	}
	
	//Branch Model fetch for prefenses

	public List<BranchModule> getgetBranchName() {
		// TODO Auto-generated method stub
		return branchModuleRepo.findAll();
	}

	// Loan schem Code Name Dropdrawn
	
	public List<LoanSchemCatalog> getLoanSchemCode() {
		// TODO Auto-generated method stub
		return loanRepository.findAll();
	}

	
	//fetching in new loan application by schem loan Code

	public LoanSchemCatalog getLoanByCode(String code) {
	    return loanRepository.findByLoanSchemeCode(code)
	        .orElseThrow(() -> new RuntimeException("Loan Scheme not found for code: " + code));
	}

	

}