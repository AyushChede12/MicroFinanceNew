package com.microfinance.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import com.microfinance.dto.ApiResponse;
import com.microfinance.model.CategoryModule;
import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.FinancialYear;
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
  	
  	// find saving scheme catalog by id
  	 @GetMapping("/getSavingSchemeCatalogById")
 	public ResponseEntity<ApiResponse<SavingSchemeCatalog>> findSavingSchmeCatalogById(@RequestParam("id") Long id) {
 		Optional<SavingSchemeCatalog> savingscheme = customersaving.findSavingSchmeCatalogById(id);
 		if (savingscheme.isPresent()) {
 			ApiResponse<SavingSchemeCatalog> response = new ApiResponse<>(HttpStatus.FOUND,
 					"Saving Scheme Catalog Data fetched successfully", savingscheme.get());
 			return ResponseEntity.ok(response);
 		} else {
 			ApiResponse<SavingSchemeCatalog> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
 					"Saving Scheme Catalog Data not found for ID: " + id, null);
 			return ResponseEntity.status(404).body(response);
 		}
 	}
  	 
  	 //delete saving scheme catalog by id
  	@PostMapping("/deleteSavingSchemeCatalogDataById") 
	public ResponseEntity<ApiResponse<String>> deleteSavingSchemeCatalog(@RequestParam("id") Long id) {
		boolean isDeleted = customersaving.deleteSavingSchemeCatalog(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Saving Scheme Catalog Data deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					" deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}
     
	//fetch policy name
  	@GetMapping("/fetchpolicyname")
  	public ApiResponse<List<SavingSchemeCatalog>> findByPolicyName(@RequestParam String policyName) {
  	    List<SavingSchemeCatalog> list = customersaving.findByPolicyName(policyName);
  	    if (list != null && !list.isEmpty()) {
  	        return ApiResponse.success(HttpStatus.FOUND, "Fetching is Successfull", list);
  	    } else {
  	        return ApiResponse.error(HttpStatus.NOT_FOUND, "Not Found fetching Data");
  	    }
  	}

  	//fetch financial code  
  	@GetMapping("/fetchfinancialcode")
  	public ApiResponse<List<addFinancialConsultant>> findByFinancialCode(@RequestParam String financialCode) {
  	    List<addFinancialConsultant> list = customersaving.findByFinancialCode(financialCode);
  	    if (list != null && !list.isEmpty()) {
  	        return ApiResponse.success(HttpStatus.FOUND, "Fetching is Successfull", list);
  	    } else {
  	        return ApiResponse.error(HttpStatus.NOT_FOUND, "Not Found fetching Data");
  	    }
  	}
  	
 
    @PostMapping("/saveandupdatesavingaccount") 
	public ResponseEntity<ApiResponse<CreateSavingsAccount>> saveSavingAccountDetails(@RequestBody CreateSavingsAccount createSavingsAccount) {
    	CreateSavingsAccount savedEntity = customersaving.saveSavingAccountDetails(createSavingsAccount);
		String message = (createSavingsAccount.getId() == null) ? "Saving Account Details Save successfully"
				: "Saving Account Details updated successfully";
		ApiResponse<CreateSavingsAccount> response = new ApiResponse<>(HttpStatus.OK, message, savedEntity);
		return ResponseEntity.ok(response);
	}
    
    //fetch all saving accouunt data
    @GetMapping("/getAllSavingAccountData")
	public ResponseEntity<ApiResponse<List<CreateSavingsAccount>>> fetchAllSavingAccountData() {
		List<CreateSavingsAccount> list = customersaving.fetchAllSavingAccountData();
		ApiResponse<List<CreateSavingsAccount>> response = new ApiResponse<>(HttpStatus.FOUND,
				"Saving Account Data fetched successfully", list);
		return ResponseEntity.ok(response);
	}
	
    //fetch all saving account data by account number
    @GetMapping("/getallbyaccountnumber")
   	public ResponseEntity<ApiResponse<List<CreateSavingsAccount>>> findAllByAccountNumber(@RequestParam String accountNumber) {
   		List<CreateSavingsAccount> list = customersaving.findAllByAccountNumber(accountNumber);
   		ApiResponse<List<CreateSavingsAccount>> response = new ApiResponse<>(HttpStatus.FOUND,
   				"Fetch account details by account number", list);
   		return ResponseEntity.ok(response);
   	}
    
    @GetMapping("/getSavingAccountDataById")
	public ResponseEntity<ApiResponse<CreateSavingsAccount>> findSavingAccountDataById(@RequestParam("id") Long id) {
		Optional<CreateSavingsAccount> fyear = customersaving.findSavingAccountDataById(id);
		if (fyear.isPresent()) {
			ApiResponse<CreateSavingsAccount> response = new ApiResponse<>(HttpStatus.FOUND,
					"Saving Account Data fetched successfully", fyear.get());
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<CreateSavingsAccount> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					"Saving Account Data not found for ID: " + id, null);
			return ResponseEntity.status(404).body(response);
		}
	}
    
    @PostMapping("/deleteSavingAccountDataById") 
	public ResponseEntity<ApiResponse<String>> deleteFinancialYear(@RequestParam("id") Long id) {
		boolean isDeleted = customersaving.deleteFinancialYear(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Saving Account Data deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					" deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}
	
}
