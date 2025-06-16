package com.microfinance.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.service.LoanManagementService;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;



@RestController
public class LoanManagementController {
	
	@Autowired
	private LoanManagementService loanServices ;
	
     @ResponseBody
	@PostMapping("/SaveLoan")
	public String saveLoan(@RequestBody LoanSchemCatalog lone ) {
		//TODO: process POST request
		loanServices.saveLoan(lone);
		return "Save successfully";
	}
     
     
    
	

}
