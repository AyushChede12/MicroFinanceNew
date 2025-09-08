package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.LoanSchemCatalog;
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
	
	@GetMapping("/allDataFetchGoldSecurePlan")
	public ResponseEntity<ApiResponse<List<SecuredGoldPlan>>> allDataFetchGoldSecurePlan() {
		List<SecuredGoldPlan> list = secureGoldLoanService.allDataFetchGoldSecurePlan();

		if (list != null && !list.isEmpty()) {
			ApiResponse<List<SecuredGoldPlan>> response = new ApiResponse<>(HttpStatus.OK,
					"Gold Secure Plan fetched successfully", list);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<List<SecuredGoldPlan>> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "No data found",
					null);
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(response);
		}
	}
	
	@GetMapping("/getGoldLoanByIdEdite")
	public ResponseEntity<ApiResponse<SecuredGoldPlan>> getLoanById(@RequestParam Long id) {
		SecuredGoldPlan goldLoan = secureGoldLoanService.getGoldLoanById(id);

		if (goldLoan != null) {
			// Success response
			ApiResponse<SecuredGoldPlan> response = new ApiResponse<>(

					HttpStatus.OK, "Loan fetched successfully", goldLoan);
			return ResponseEntity.ok(response);
		} else {
			// Failure response
			ApiResponse<SecuredGoldPlan> response = new ApiResponse<>(

					HttpStatus.NOT_FOUND, "GoldLoan not found with ID: " + id, null);
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		}
	}


}
