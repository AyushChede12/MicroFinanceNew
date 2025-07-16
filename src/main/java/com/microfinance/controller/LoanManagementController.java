package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.BranchModule;
import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.model.NewLoanApplication;
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

	@Autowired
	private LoanManagementService loanServices;
	
	// Api for saving and updatig the loan scheme data  (Vaibhav) Loan Scheme Catalog
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
	            
	            HttpStatus.OK,
	            "Loan fetched successfully",
	            loan
	        );
	        return ResponseEntity.ok(response);
	    } else {
	        // Failure response
	        ApiResponse<LoanSchemCatalog> response = new ApiResponse<>(
	           
	            HttpStatus.NOT_FOUND,
	            "Loan not found with ID: " + id,
	            null
	        );
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
	    }
	}

	// delete By Id 19/06/25 Loan scheme catalog
	
	@PostMapping("/deleteLoanById")
	public ResponseEntity<ApiResponse<LoanSchemCatalog>> deleteLoan(@RequestParam Long id) {
	    boolean deleted = loanServices.deleteLoanLoanById(id);

	    if (deleted) {
	        ApiResponse<LoanSchemCatalog> response = new ApiResponse<>( HttpStatus.OK, "Loan deleted successfully", null);
	        return ResponseEntity.ok(response);
	    } else {
	        ApiResponse<LoanSchemCatalog> response = new ApiResponse<>( HttpStatus.NOT_FOUND, "Loan not found", null);
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
	    }
	}

//data Fetch from name and id from customer model
	@GetMapping("/getByIdNewLoanApplication")
	public ResponseEntity<ApiResponse<addCustomer>> getLoanById1(@RequestParam Long id) {
	    try {
	    	addCustomer customer = loanServices.getLoanApplicationById(id);
	        return ResponseEntity.ok(new ApiResponse<>( HttpStatus.OK, "Customer found", customer));
	    } catch (RuntimeException ex) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
	            .body(new ApiResponse<>( HttpStatus.NOT_FOUND, ex.getMessage(), null));
	    }
	}
	
	//fetch all data loan scheme catalog
	@GetMapping("/fetchLoanSchemeCatalog")
	public ResponseEntity<ApiResponse<List<LoanSchemCatalog>>> getSchemeCatalog() {
	    List<LoanSchemCatalog> loanschemCodeList = loanServices.getSchemeCatalog();

	    ApiResponse<List<LoanSchemCatalog>> response = new ApiResponse<>( HttpStatus.FOUND,"Loan Schem fetched successfully",loanschemCodeList );

	    return ResponseEntity.ok(response);
	}


@GetMapping("/allfetchdataLoanPlanName")
public ResponseEntity<ApiResponse<List<LoanSchemCatalog>>> getLoanPlanName(@RequestParam String loanPlanName) {
    List<LoanSchemCatalog> loanschemCodeList = loanServices.getLoanPlanName(loanPlanName);

    ApiResponse<List<LoanSchemCatalog>> response = new ApiResponse<>( HttpStatus.FOUND,"Loan Schem fetched successfully",loanschemCodeList );

    return ResponseEntity.ok(response);
}


// New Loan Application schem loan code

@GetMapping("/getBySchemLoanCode")
public ResponseEntity<ApiResponse<LoanSchemCatalog>> getLoanByCode(@RequestParam String code) {
    try {
        LoanSchemCatalog loanScheme = loanServices.getLoanByCode(code);
        return ResponseEntity.ok(
            new ApiResponse<>( HttpStatus.OK, "Loan Scheme found", loanScheme)
        );
    } catch (RuntimeException ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
            .body(new ApiResponse<>( HttpStatus.NOT_FOUND, ex.getMessage(), null));
    }
}

}


