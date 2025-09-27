package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.DailyPremiumRenewalPM;
import com.microfinance.model.LoanApplication;
import com.microfinance.model.LoanPayment;
import com.microfinance.model.SavingAccountActivity;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.service.ReportsAndAnalyticsService;

@RestController
@RequestMapping("/api/reports")
public class ReportsAndAnalyticsController {

	@Autowired
	ReportsAndAnalyticsService reportsAndAnalyticsService;

	// Janvi : Fetch Approved Financial Consultant Data
	@GetMapping("/getApprovedFinancialConsultant")
	public ResponseEntity<ApiResponse<List<addFinancialConsultant>>> getApprovedFinancialConsultant() {
		List<addFinancialConsultant> list = reportsAndAnalyticsService.getApprovedFinancialConsultant();
		if (!list.isEmpty()) {
			return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "approved customers fetched", list));
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body(ApiResponse.error(HttpStatus.NOT_FOUND, "No approved customers found"));
		}
	}

	@GetMapping("/getApprovedSavingAccount")
	public ResponseEntity<ApiResponse<List<CreateSavingsAccount>>> getApprovedSavingAccount() {
		List<CreateSavingsAccount> list = reportsAndAnalyticsService.getApprovedSavingAccount();
		if (!list.isEmpty()) {
			return ResponseEntity
					.ok(ApiResponse.success(HttpStatus.OK, "approved Saving Account customers fetched", list));
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body(ApiResponse.error(HttpStatus.NOT_FOUND, "No approved customers found"));
		}
	}

	// poonam : Fetch Unapproved Loan Application on 08-08-2025
	@GetMapping("/getUnapprovedLoanApplication")
	public ResponseEntity<ApiResponse<List<LoanApplication>>> getUnapprovedLoanApplication() {
		List<LoanApplication> list = reportsAndAnalyticsService.getUnapprovedLoanApplication();

		if (!list.isEmpty()) {
			return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Unapproved loan fetched", list));
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body(ApiResponse.error(HttpStatus.NOT_FOUND, "No unapproved investments found"));
		}
	}

	// poonam : Fetch Loan Payment 20-08-2025
	@GetMapping("/getLoanPaymentReport")
	public ResponseEntity<ApiResponse<List<LoanPayment>>> getLoanPaymentReport() {
		List<LoanPayment> list = reportsAndAnalyticsService.getLoanPaymentReport();
		if (!list.isEmpty()) {
			return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Loan Payment Fetched Succesfully", list));
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body(ApiResponse.error(HttpStatus.NOT_FOUND, "No Loan Payment Found"));
		}
	}

	// poonam : Fetch Loan Confirmation Document 28/08/2025
	@GetMapping("/getLoanConfirmationDocument")
	public ResponseEntity<ApiResponse<List<LoanApplication>>> getLoanConfirmationDocument() {
		List<LoanApplication> list = reportsAndAnalyticsService.getLoanConfirmationDocument();
		if (!list.isEmpty()) {
			return ResponseEntity
					.ok(ApiResponse.success(HttpStatus.OK, "Loan Confirmation Document Fetch Succesfully", list));
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body(ApiResponse.error(HttpStatus.NOT_FOUND, "No Loan Confirmation Document Found"));
		}
	}

	@GetMapping("/getPayByFromSavingAccountActivity")
	public ResponseEntity<ApiResponse<List<SavingAccountActivity>>> getPayByFromSavingAccountActivity() {
		List<SavingAccountActivity> list = reportsAndAnalyticsService.fetchPayByFromSavingAccountActivity();
		if (!list.isEmpty()) {
			return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Cheque Data fetched Successfully", list));
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body(ApiResponse.error(HttpStatus.NOT_FOUND, "Cheque Data Not found"));
		}
	}

}
