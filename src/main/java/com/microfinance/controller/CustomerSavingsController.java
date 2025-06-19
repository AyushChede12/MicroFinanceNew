package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import com.microfinance.dto.ApiResponse;
import com.microfinance.model.SavingSchemeCatalog;
import com.microfinance.model.addCustomer;
import com.microfinance.service.CustomerSavingsService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
   
	
	
}
