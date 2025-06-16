package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.microfinance.model.LoanSchemCatalog;

public interface LoanMangmentSchemeRepo extends JpaRepository<LoanSchemCatalog, Long> {
	
	

}
