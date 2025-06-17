package com.microfinance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.FixedDepositPM;
import com.microfinance.model.RecurringDepositPM;
import com.microfinance.service.PolicyManagementService;

@RestController
public class PolicyManagementController {
	@Autowired 
	PolicyManagementService policyManagementService;
	
	//saving fixed deposit by aakansha
	
	@PostMapping("/Fixeddepositepmsave")
	public ResponseEntity<ApiResponse<FixedDepositPM>> save(@RequestBody FixedDepositPM fixedDepositPM) {
	    boolean isSaved = policyManagementService.saveFixedDeposite(fixedDepositPM);

	    if (isSaved) {
	        ApiResponse<FixedDepositPM> response = ApiResponse.success(
	            HttpStatus.OK,
	            "Fixed deposit saved successfully.",
	            fixedDepositPM
	        );
	        return ResponseEntity.ok(response);
	    } else {
	        ApiResponse<FixedDepositPM> response = ApiResponse.success(
	            HttpStatus.BAD_REQUEST,
	            "Failed to save fixed deposit.",
	            null
	        );
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
	    }
	}
	//view the fixed deposite code 
	 @GetMapping("/viewreFixeddeposit") 
	 @ResponseBody
	 public List<FixedDepositPM> getAllData() {
	     return policyManagementService.getAllFixeddata();
	 }
 
	//saving recurring deposit by aakansha

	 @PostMapping("/reccuringepositepmsave")
	 public ResponseEntity<ApiResponse<RecurringDepositPM>> save(@RequestBody RecurringDepositPM recuringDepositPM) {
	     boolean isSaved = policyManagementService.saveRecuringDailyDeposite(recuringDepositPM);

	     if (isSaved) {
	         ApiResponse<RecurringDepositPM> response = ApiResponse.success(
	             HttpStatus.OK,
	             "Recurring deposit saved successfully.",
	             recuringDepositPM
	         );
	         return ResponseEntity.ok(response);
	     } else {
	         ApiResponse<RecurringDepositPM> response = ApiResponse.success(
	             HttpStatus.BAD_REQUEST,
	             "Failed to save recurring deposit.",
	             null
	         );
	         return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
	     }
	 }
	 
	@ResponseBody 
	 @GetMapping("/viedRecurringeposite")
	    public List<RecurringDepositPM> getAllData1() {
	        return policyManagementService.getAllData1();
	    }



}
