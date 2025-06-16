package com.microfinance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.repository.LoanMangmentSchemeRepo;

@Service
public class LoanManagementService {

	@Autowired
	private LoanMangmentSchemeRepo loanRepository ;
	
	public LoanSchemCatalog saveLoan(LoanSchemCatalog lone) {
		return loanRepository.save(lone);
		
	}

}
