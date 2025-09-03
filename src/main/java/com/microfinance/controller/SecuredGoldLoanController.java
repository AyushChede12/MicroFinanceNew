package com.microfinance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.model.SecureGoldPlan;
import com.microfinance.model.SecuredGoldPlan;
import com.microfinance.service.SecuredGoldLoanService;

@RestController
@RequestMapping("/api/securedGoldLoan")
public class SecuredGoldLoanController {
	
	@Autowired
	private SecuredGoldLoanService secureGoldLoanService;
	
	//by poonam for saving and updating Gold Secure Plan on 03/09/2025
	@PostMapping("/saveGoldSecurePlan")
	public ResponseEntity<ApiResponse<SecuredGoldPlan>> saveGoldSecurePlanData(@RequestBody SecuredGoldPlan goldLoan) {
		SecuredGoldPlan savedGoldLoan = secureGoldLoanService.saveLoanManagmentData(goldLoan);

		if (savedGoldLoan != null) {
			String message = (goldLoan.getId() != null) ? "Data updated successfully" : "Data saved successfully";
			ApiResponse<SecuredGoldPlan> response = new ApiResponse<>(HttpStatus.OK, message, savedGoldLoan);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<SecuredGoldPlan> errorResponse = new ApiResponse<>(HttpStatus.INTERNAL_SERVER_ERROR,
					"Failed to save or update data", null);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
		}
	}

}
