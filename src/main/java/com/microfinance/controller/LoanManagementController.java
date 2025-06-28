package com.microfinance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.service.LoanManagementService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@RestController
public class LoanManagementController {

	@Autowired
	private LoanManagementService loanServices;

	// Shraddha - 16/06/2025
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("/SaveLoan") public String saveLoan(@RequestBody
	 * LoanSchemCatalog lone) { // TODO: process POST request
	 * loanServices.saveLoan(lone); return "Save successfully"; }
	 */
	
//	@PostMapping("/saveLoanManagment")
//	public ResponseEntity<ApiResponse<LoanSchemCatalog>> saveLoanManagmentData(@RequestBody LoanSchemCatalog  Loan) {
//		//TODO: process POST request
//		ApiResponse<LoanSchemCatalog> response = loanServices.saveLoanManagmentData(Loan);
//		
//		return new ResponseEntity<>(response,HttpStatus.OK);
//	
//		
//	}
	
}


