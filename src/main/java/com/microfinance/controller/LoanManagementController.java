package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.service.LoanManagementService;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequestMapping("/api/loanmanegment")
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
	
	
	// save and Update 17/06/25
	@PostMapping("/saveLoanManagment")
	public ResponseEntity<ApiResponse<LoanSchemCatalog>> saveLoanManagmentData(@RequestBody LoanSchemCatalog loan) {
	    
	    LoanSchemCatalog savedLoan = loanServices.saveLoanManagmentData(loan);

	    if (savedLoan != null) {
	        ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(true, HttpStatus.OK, "Data saved", savedLoan);
	        return ResponseEntity.status(HttpStatus.CREATED).body(response); // 201 CREATED
	    } else {
	        ApiResponse<LoanSchemCatalog> errorResponse = new ApiResponse<>(false, HttpStatus.NOT_FOUND, "Data not saved", null);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
	    }
	}

	// Fetch Data 18/06/25
	
	
	@GetMapping("/allDataFetchLoanSchemCatelog")
	public ResponseEntity<ApiResponse<List<LoanSchemCatalog>>> allDataFetchLoanSchemCatelog() {
	    List<LoanSchemCatalog> list = loanServices.allDataFetchLoanSchemCatelog();

	    if (list != null && !list.isEmpty()) {
	        ApiResponse<List<LoanSchemCatalog>> response = new ApiResponse<>(true, HttpStatus.OK, "LoanSchemCatalog fetched successfully", list);
	        return ResponseEntity.ok(response);
	    } else {
	        ApiResponse<List<LoanSchemCatalog>> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND, "No data found", null);
	        return ResponseEntity.status(HttpStatus.NO_CONTENT).body(response);
	    }
	}
	
	
// Edit BY Id 19/06/25
	
	
	@GetMapping("/getLoanByIdEdite")
	public ResponseEntity<ApiResponse<LoanSchemCatalog>> getLoanById(@RequestParam Long id) {
	    LoanSchemCatalog loan = loanServices.getLoanById(id);

	    if (loan != null) {
	        // Success response
	        ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(
	            true,
	            HttpStatus.OK,
	            "Loan fetched successfully",
	            loan
	        );
	        return ResponseEntity.ok(response);
	    } else {
	        // Failure response
	        ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(
	            false,
	            HttpStatus.NOT_FOUND,
	            "Loan not found with ID: " + id,
	            null
	        );
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
	    }
	}


	// delete By Id 19/06/25
	
	@PostMapping("/deleteLoanById")
	public ResponseEntity<ApiResponse<LoanSchemCatalog>> deleteLoan(@RequestParam Long id) {
	    boolean deleted = loanServices.deleteLoanLoanById(id);

	    if (deleted) {
	        ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(true, HttpStatus.OK, "Loan deleted successfully", null);
	        return ResponseEntity.ok(response);
	    } else {
	        ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND, "Loan not found", null);
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
	    }
	}



  


	
	
}


