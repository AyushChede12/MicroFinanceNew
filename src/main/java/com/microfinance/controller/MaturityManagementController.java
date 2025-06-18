package com.microfinance.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.MaturitySchemeMaster;
import com.microfinance.service.MaturitySchemeMasterService;

@RestController
@RequestMapping("/api")
public class MaturityManagementController {
	
	
	@Autowired
	MaturitySchemeMasterService maturityservice;
	
	
	
	
	// save maturity scheme master daily deposit
	//Ashwini
	
	@PostMapping("/savematurityscheme")
	@ResponseBody
	public ApiResponse<MaturitySchemeMaster> saveMaturityDailyDeposit(@RequestBody MaturitySchemeMaster maturityscheme) {
		MaturitySchemeMaster maturity = maturityservice.saveAllDailyDeposit(maturityscheme);
		
		if (maturity != null) {
			return ApiResponse.success(HttpStatus.OK,"Data saved successfully",maturity);
	    } 
		else {
			return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR,"Data could not be saved");
	       
	    }

	}
	
	
	
	
}
