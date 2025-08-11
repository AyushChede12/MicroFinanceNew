package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import com.microfinance.dto.ApiResponse;
import com.microfinance.model.LoanApplication;
import com.microfinance.model.LoanPayment;
import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.model.addCustomer;
import com.microfinance.service.LoanManagementService;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

@RestController
@RequestMapping("/api/loanmanegment")
public class LoanManagementController {

	@Value("${upload.directory}")
	private String uploadDirectory;

	@Autowired
	private LoanManagementService loanServices;

	// Api for saving and updatig the loan scheme data (Vaibhav) Loan Scheme Catalog
	@PostMapping("/saveLoanManagment")
	public ResponseEntity<ApiResponse<LoanSchemCatalog>> saveLoanManagmentData(@RequestBody LoanSchemCatalog loan) {
		LoanSchemCatalog savedLoan = loanServices.saveLoanManagmentData(loan);

		if (savedLoan != null) {
			String message = (loan.getId() != null) ? "Data updated successfully" : "Data saved successfully";
			ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(HttpStatus.OK, message, savedLoan);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<LoanSchemCatalog> errorResponse = new ApiResponse<>(HttpStatus.INTERNAL_SERVER_ERROR,
					"Failed to save or update data", null);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
		}
	}

	// Api for fetching the data on tabel (Vaibhav) Loan Scheme Catalog
	@GetMapping("/allDataFetchLoanSchemCatelog")
	public ResponseEntity<ApiResponse<List<LoanSchemCatalog>>> allDataFetchLoanSchemCatelog() {
		List<LoanSchemCatalog> list = loanServices.allDataFetchLoanSchemCatelog();

		if (list != null && !list.isEmpty()) {
			ApiResponse<List<LoanSchemCatalog>> response = new ApiResponse<>(HttpStatus.OK,
					"LoanSchemCatalog fetched successfully", list);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<List<LoanSchemCatalog>> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "No data found",
					null);
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(response);
		}
	}

// Edit BY Id 19/06/25 Loan scheme catalog

	@GetMapping("/getLoanByIdEdite")
	public ResponseEntity<ApiResponse<LoanSchemCatalog>> getLoanById(@RequestParam Long id) {
		LoanSchemCatalog loan = loanServices.getLoanById(id);

		if (loan != null) {
			// Success response
			ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(

					HttpStatus.OK, "Loan fetched successfully", loan);
			return ResponseEntity.ok(response);
		} else {
			// Failure response
			ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(

					HttpStatus.NOT_FOUND, "Loan not found with ID: " + id, null);
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		}
	}

	// delete By Id 19/06/25 Loan scheme catalog

	@PostMapping("/deleteLoanById")
	public ResponseEntity<ApiResponse<LoanSchemCatalog>> deleteLoan(@RequestParam Long id) {
		boolean deleted = loanServices.deleteLoanLoanById(id);

		if (deleted) {
			ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(HttpStatus.OK, "Loan deleted successfully",
					null);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "Loan not found", null);
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		}
	}

//data Fetch from name and id from customer model
	@GetMapping("/getByMemberCodeNewLoanApplication")
	public ResponseEntity<ApiResponse<List<addCustomer>>> getLoanByMemberCode(@RequestParam String memberCode) {
		try {
			List<addCustomer> customerList = loanServices.getLoanApplicationById(memberCode);

			if (customerList == null || customerList.isEmpty()) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND)
						.body(new ApiResponse<>(HttpStatus.NOT_FOUND, "No customer found for member code", null));
			}

			return ResponseEntity.ok(new ApiResponse<>(HttpStatus.OK, "Customer(s) found", customerList));
		} catch (RuntimeException ex) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(new ApiResponse<>(HttpStatus.INTERNAL_SERVER_ERROR, ex.getMessage(), null));
		}
	}

	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/Uploads/**").addResourceLocations("file:///" + uploadDirectory);
	}

	// fetch all data loan scheme catalog
	@GetMapping("/fetchLoanSchemeCatalog")
	public ResponseEntity<ApiResponse<List<LoanSchemCatalog>>> getSchemeCatalog() {
		List<LoanSchemCatalog> loanschemCodeList = loanServices.getSchemeCatalog();

		ApiResponse<List<LoanSchemCatalog>> response = new ApiResponse<>(HttpStatus.FOUND,
				"Loan Schem fetched successfully", loanschemCodeList);

		return ResponseEntity.ok(response);
	}

	@GetMapping("/allfetchdataLoanPlanName")
	public ResponseEntity<ApiResponse<List<LoanSchemCatalog>>> getLoanPlanName(@RequestParam String loanPlanName) {
		List<LoanSchemCatalog> loanschemCodeList = loanServices.getLoanPlanName(loanPlanName);

		ApiResponse<List<LoanSchemCatalog>> response = new ApiResponse<>(HttpStatus.FOUND,
				"Loan Schem fetched successfully", loanschemCodeList);

		return ResponseEntity.ok(response);
	}

// New Loan Application scheme loan code

	@GetMapping("/getBySchemLoanCode")
	public ResponseEntity<ApiResponse<LoanSchemCatalog>> getLoanByCode(@RequestParam String code) {
		try {
			LoanSchemCatalog loanScheme = loanServices.getLoanByCode(code);
			return ResponseEntity.ok(new ApiResponse<>(HttpStatus.OK, "Loan Scheme found", loanScheme));
		} catch (RuntimeException ex) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body(new ApiResponse<>(HttpStatus.NOT_FOUND, ex.getMessage(), null));
		}
	}

	// save loan application details
	@PostMapping("/saveloanapplication")
	public ResponseEntity<ApiResponse<LoanApplication>> saveSchemeCatalog(
			@RequestBody LoanApplication loanApplication) {
		boolean isSaved = loanServices.saveLoanApplicationData(loanApplication);

		if (isSaved) {
			ApiResponse<LoanApplication> response = ApiResponse.success(HttpStatus.CREATED,
					"Saving Scheme saved successfully.", loanApplication);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<LoanApplication> response = ApiResponse.error(HttpStatus.BAD_REQUEST, "Failed to save scheme.");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
		}
	}

//Api for fetching Loan Id In the dropdown (Vaibhav)
	@GetMapping("/getAllLoanIds")
	public ResponseEntity<ApiResponse<List<String>>> getAllLoanIds() {
		List<String> loanIds = loanServices.fetchAllLoanIds();

		if (loanIds != null && !loanIds.isEmpty()) {
			return ResponseEntity.ok(new ApiResponse<>(HttpStatus.OK, "Loan IDs fetched successfully", loanIds));
		} else {
			return ResponseEntity.status(HttpStatus.NO_CONTENT)
					.body(new ApiResponse<>(HttpStatus.NO_CONTENT, "No Loan IDs found", null));
		}
	}

	// Api for fething the details on the textfiled (Vaibhav)
	@GetMapping("/getLoanById")
	public ResponseEntity<ApiResponse<LoanApplication>> getLoanById(@RequestParam String loanId) {
		LoanApplication loan = loanServices.getLoanById(loanId);

		if (loan != null) {
			return ResponseEntity.ok(new ApiResponse<>(HttpStatus.OK, "Loan found", loan));
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body(new ApiResponse<>(HttpStatus.NOT_FOUND, "Loan not found", null));
		}
	}

	// Api for approving the loan application (Vaibhav)
	@PostMapping("/approve")
	public ResponseEntity<ApiResponse<LoanApplication>> approveLoan(@RequestBody LoanApplication approval) {
		String result = loanServices.updateApproval(approval);

		switch (result) {
		case "already_approved":
			return ResponseEntity.ok(new ApiResponse<>(HttpStatus.OK, "Loan is already approved.", null));

		case "success":
			return ResponseEntity.ok(new ApiResponse<>(HttpStatus.OK, "Loan approved successfully.", approval));

		}
		return null;
	}
	
	// API to fetch all approved loan IDs (Vaibhav)
		@GetMapping("/getApprovedLoanIds")
		public ResponseEntity<ApiResponse<List<String>>> getApprovedLoanIds() {
			List<String> approvedLoanIds = loanServices.getApprovedLoanIds();

			if (!approvedLoanIds.isEmpty()) {
				return ResponseEntity
						.ok(new ApiResponse<>(HttpStatus.OK, "Approved loan IDs fetched successfully", approvedLoanIds));
			} else {
				return ResponseEntity.status(HttpStatus.NOT_FOUND)
						.body(new ApiResponse<>(HttpStatus.NOT_FOUND, "No approved loans found", null));
			}
		}
		
		//API for Paying Emi (Vaibhav) 
		@PostMapping("/payEmi")
		public ResponseEntity<ApiResponse<String>> payEmi(@RequestBody LoanPayment request) {
			boolean success = loanServices.processEmiPayment(request, "1"); // Pass entire object

			if (success) {
				return ResponseEntity.ok(new ApiResponse<>(HttpStatus.OK, "EMI paid successfully", null));
			} else {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST)
						.body(new ApiResponse<>(HttpStatus.BAD_REQUEST, "Payment failed", null));
			}
		}
		
		//API for fetching all data of loan payment
		@GetMapping("/fetchLoanPaymentsByLoanId")
		public ResponseEntity<ApiResponse<List<LoanPayment>>> fetchLoanPaymentsByLoanId(
		        @RequestParam String loanId) {

		    List<LoanPayment> list = loanServices.fetchLoanPaymentsByLoanId(loanId);

		    if (list != null && !list.isEmpty()) {
		        ApiResponse<List<LoanPayment>> response = new ApiResponse<>(
		            HttpStatus.OK,
		            "Loan Payments fetched successfully",
		            list
		        );
		        return ResponseEntity.ok(response);
		    } else {
		        ApiResponse<List<LoanPayment>> response = new ApiResponse<>(
		            HttpStatus.NOT_FOUND,
		            "No data found for Loan ID: " + loanId,
		            null
		        );
		        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		    }
		}


		
}
