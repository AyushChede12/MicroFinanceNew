package com.microfinance.controller;

import java.util.List;
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

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.DailyDepositPM;

import com.microfinance.service.DailyDepositPMService;

import com.microfinance.service.PolicyManagementService;




import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class DailyDepositPMController {

	    @Autowired
	    private PolicyManagementService policyManagementService;

	@Autowired

	DailyDepositPMService dailyDepositPMService;
	
	 @PostMapping("/dailydepositepmsave")
	    public ResponseEntity<String> save(@RequestBody DailyDepositPM data) {
	        boolean isSaved = dailyDepositPMService.saveDailyDeposite(data);
	        if (isSaved) {
	            return ResponseEntity.ok("success");
	        } else {
	            return ResponseEntity.badRequest().body("failure");
	        }
	    }

	PolicyManagementService policyManagementService;
	
	@RestController
	public class PolicyManagementController {

	    @Autowired
	    private PolicyManagementService policyManagementService;

	    @PostMapping("/dailydepositepmsave")
	    public ResponseEntity<ApiResponse<DailyDepositPM>> save(@RequestBody DailyDepositPM data) {
	        boolean isSaved = policyManagementService.saveDailyDeposite(data);
	        
	        if (isSaved) {
	            ApiResponse<DailyDepositPM> response = new ApiResponse<>(
	                "success", "Data saved successfully", data
	            );
	            return ResponseEntity.ok(response);
	        } else {
	            ApiResponse<DailyDepositPM> response = new ApiResponse<>(
	                "failure", "Failed to save data", null
	            );
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	        }
	    }
	}



	 
	@ResponseBody 
	 @GetMapping("/viewdailydeposite")
	    public List<DailyDepositPM> getAllData() {

	        return dailyDepositPMService.getAllData();

	        return policyManagementService.getAllData();

	    }

	}
