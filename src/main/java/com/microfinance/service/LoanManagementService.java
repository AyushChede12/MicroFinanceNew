package com.microfinance.service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.BranchModule;
import com.microfinance.model.LoanApplication;
import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.model.NewLoanApplication;
import com.microfinance.model.addCustomer;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.BranchModuleRepo;
import com.microfinance.repository.LoanApplicationRepo;
import com.microfinance.repository.LoanMangmentSchemeRepo;
import com.microfinance.repository.NewLoanAppicationRepo;

@Service
public class LoanManagementService {

	@Autowired

	private LoanMangmentSchemeRepo loanRepository;
	@Autowired
	private AddCustomerRepo addCustomerRepo;

	@Autowired
	LoanApplicationRepo loanApplicationRepo;

	// Service fo saving and updating the loan scheme data
	public LoanSchemCatalog saveLoanManagmentData(LoanSchemCatalog loan) {
		if (loan.getId() != null && loanRepository.existsById(loan.getId())) {
			// Perform update
			LoanSchemCatalog existingLoan = loanRepository.findById(loan.getId()).get();

			// Copy all fields from input to existing
			existingLoan.setLoanSchemeCode(loan.getLoanSchemeCode());
			existingLoan.setLoanPlaneName(loan.getLoanPlaneName());
			existingLoan.setTypeLoan(loan.getTypeLoan());
			existingLoan.setAge(loan.getAge());
			existingLoan.setLoanTerm(loan.getLoanTerm());
			existingLoan.setEmiType(loan.getEmiType());
			existingLoan.setLoanAmount(loan.getLoanAmount());
			existingLoan.setLoanMode(loan.getLoanMode());
			existingLoan.setRateIntrestType(loan.getRateIntrestType());
			existingLoan.setTypeIntrest(loan.getTypeIntrest());
			existingLoan.setTypesecurity(loan.getTypesecurity());
			existingLoan.setPlanStatus(loan.getPlanStatus());

			// Deductions
			existingLoan.setFeeProcessing(loan.getFeeProcessing());
			existingLoan.setChargesLegal(loan.getChargesLegal());
			existingLoan.setGst(loan.getGst());
			existingLoan.setFeeInsurence(loan.getFeeInsurence());
			existingLoan.setFeeValuation(loan.getFeeValuation());

			// Late fee
			existingLoan.setLateAllowanceday(loan.getLateAllowanceday());
			existingLoan.setModePanalty(loan.getModePanalty());
			existingLoan.setPennaltyMonthly(loan.getPennaltyMonthly());

			return loanRepository.save(existingLoan);
		} else {
			// Save new record
			return loanRepository.save(loan);
		}
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

	// Loan schem Code Name Dropdrawn

	public List<LoanSchemCatalog> getLoanSchemCode() {
		// TODO Auto-generated method stub
		return loanRepository.findAll();
	}

	// fetching in new loan application by schem loan Code

	public LoanSchemCatalog getLoanByCode(String code) {
		return loanRepository.findByLoanSchemeCode(code)
				.orElseThrow(() -> new RuntimeException("Loan Scheme not found for code: " + code));
	}

	public List<LoanSchemCatalog> getLoanPlanName(String loanPlanName) {
		// Example: find by plan name (case-insensitive match)
		return loanRepository.findByLoanPlaneNameContainingIgnoreCase(loanPlanName);
	}

	public List<LoanSchemCatalog> getSchemeCatalog() {

		return loanRepository.findAll();
	}

	public boolean saveLoanApplicationData(LoanApplication loanApplication) {
		try {
			loanApplicationRepo.save(loanApplication);
			return true; // Saved successfully
		} catch (Exception e) {
			e.printStackTrace();
			return false; // Something went wrong
		}
	}

	public List<addCustomer> getLoanApplicationById(String memberCode) {
		return addCustomerRepo.findByMemberCode(memberCode);
	}

	// Service for fetching Loan Id In the dropdown (Vaibhav)
	public List<String> fetchAllLoanIds() {

		// This assumes you have a loanId field in your Loan entity.
		return loanApplicationRepo.findAll().stream().map(LoanApplication::getLoanId) // adjust class name if needed
				.filter(Objects::nonNull).collect(Collectors.toList());
	}

	// Service for fetching the data in the textfields (Vaibhav)
	public LoanApplication getLoanById(String loanId) {
		return loanApplicationRepo.findByLoanId(loanId); // Make sure this method exists
	}

	// Service for approving the loan application (Vaibhav)
	public String updateApproval(LoanApplication approval) {
		LoanApplication loan = loanApplicationRepo.findByLoanId(approval.getLoanId());

		if (loan != null) {
			if (loan.isApprovalStatus()) {
				return "already_approved";
			}

			loan.setApprovalStatus(approval.isApprovalStatus());
			loan.setApprovalDate(approval.getApprovalDate());
			loanApplicationRepo.save(loan);
			return "success";
		} else {
			return "not_found";
		}
	}
	
	// Service for getting Approved loan Ids( Vaibhav)
		public List<String> getApprovedLoanIds() {
			List<LoanApplication> approvedLoans = loanApplicationRepo.findByApprovalStatusTrue();

			return approvedLoans.stream().map(LoanApplication::getLoanId) // assuming loanId is a String like "LP00001"
					.collect(Collectors.toList());
		}

}