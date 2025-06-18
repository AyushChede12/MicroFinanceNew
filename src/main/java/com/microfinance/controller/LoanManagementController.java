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
	
	@PostMapping("/saveLoanManagment")
	public ApiResponse<LoanSchemCatalog> saveLoanManagmentData(@RequestBody LoanSchemCatalog  Loan) {
		//TODO: process POST request
	LoanSchemCatalog response = loanServices.saveLoanManagmentData(Loan);
		if(response!=null) {
			return ApiResponse.success(HttpStatus.OK,"data saved",response);
		}
		else
		{
			return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR,"data not saved");
		}
		
	
		
	}
	
}


