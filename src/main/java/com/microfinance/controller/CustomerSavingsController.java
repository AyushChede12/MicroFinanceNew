package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import com.microfinance.dto.ApiResponse;
import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.SavingSchemeCatalog;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.service.CustomerSavingsService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/customersavings")
public class CustomerSavingsController {

	@Autowired
	CustomerSavingsService customersaving;
	
	// Save Saving Scheme Catalog
    @PostMapping("/savescheme")
    public ResponseEntity<ApiResponse<SavingSchemeCatalog>> saveSchemeCatalog(@RequestBody SavingSchemeCatalog savingSchemeCatalog) {
        boolean isSaved = customersaving.saveSavingScheme(savingSchemeCatalog);

        if (isSaved) {
            ApiResponse<SavingSchemeCatalog> response = ApiResponse.success(
                HttpStatus.OK,
                "Saving Scheme saved successfully.",
                savingSchemeCatalog
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<SavingSchemeCatalog> response = ApiResponse.error(
                HttpStatus.BAD_REQUEST,
                "Failed to save fixed deposit."
            );
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }
    
  //Fetching CustomerCode   
  	@PostMapping("/fetchCustomerCode")
  	public ApiResponse<List<addCustomer>> fetchByCustomerCode(@RequestBody addCustomer addcustomer) {
  		List<addCustomer>  list = customersaving.fetchCustomerCode(addcustomer.getMemberCode());
  		if(list!=null && !list.isEmpty()) {
  			return ApiResponse.success(HttpStatus.FOUND, "Fetching is Successfull", list);
  		}else
  			return ApiResponse.error(HttpStatus.NOT_FOUND, "Not Found fetching Data");
  		
  		
  	}
  	
  	//fetching saving scheme catalog data
  	@GetMapping("/fetchsavingchemecatalog")
  	public ApiResponse<List<SavingSchemeCatalog>> findBySchemeType() {
  		List<SavingSchemeCatalog>  list = customersaving.findBySchemeType();
  		if(list!=null && !list.isEmpty()) {
  			return ApiResponse.success(HttpStatus.FOUND, "Fetching is Successfull", list);
  		}else
  			return ApiResponse.error(HttpStatus.NOT_FOUND, "Not Found fetching Data");
  		
  	}
	
  	@GetMapping("/fetchpolicyname")
  	public ApiResponse<List<SavingSchemeCatalog>> findByPolicyName(@RequestParam String policyName) {
  	    List<SavingSchemeCatalog> list = customersaving.findByPolicyName(policyName);
  	    if (list != null && !list.isEmpty()) {
  	        return ApiResponse.success(HttpStatus.FOUND, "Fetching is Successfull", list);
  	    } else {
  	        return ApiResponse.error(HttpStatus.NOT_FOUND, "Not Found fetching Data");
  	    }
  	}

  	@GetMapping("/fetchfinancialcode")
  	public ApiResponse<List<addFinancialConsultant>> findByFinancialCode(@RequestParam String financialCode) {
  	    List<addFinancialConsultant> list = customersaving.findByFinancialCode(financialCode);
  	    if (list != null && !list.isEmpty()) {
  	        return ApiResponse.success(HttpStatus.FOUND, "Fetching is Successfull", list);
  	    } else {
  	        return ApiResponse.error(HttpStatus.NOT_FOUND, "Not Found fetching Data");
  	    }
  	}
  	
 // Save Saving Scheme Catalog
    @PostMapping("/savesavingaccount")
    public ResponseEntity<ApiResponse<CreateSavingsAccount>> saveSavingAccountDetails(@RequestBody CreateSavingsAccount createSavingsAccount) {
        boolean isSaved = customersaving.saveSavingAccountDetails(createSavingsAccount);

        if (isSaved) {
            ApiResponse<CreateSavingsAccount> response = ApiResponse.success(
                HttpStatus.OK,
                "Saving Scheme saved successfully.",
                createSavingsAccount
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<CreateSavingsAccount> response = ApiResponse.error(
                HttpStatus.BAD_REQUEST,
                "Failed to save fixed deposit."
            );
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }
	
	
}
