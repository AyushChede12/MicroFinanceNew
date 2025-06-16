package com.microfinance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.model.FixedDepositPM;
import com.microfinance.model.RecurringDepositPM;
import com.microfinance.service.PolicyManagementService;

@RestController
public class PolicyManagementController {
	@Autowired 
	PolicyManagementService policyManagementService;
	
	//saving fixed deposit by aakansha
	@PostMapping("/Fixeddepositepmsave")
	public ResponseEntity<?> save(@RequestBody FixedDepositPM fixedDepositPM) {
	    boolean isSaved = policyManagementService.saveFixedDeposite(fixedDepositPM);
	    if (isSaved) {
	        Map<String, Object> response = new HashMap<>();
	        response.put("status", "success");
	        response.put("data", fixedDepositPM); // return saved data in response
	        return ResponseEntity.ok(response);
	    } else {
	        Map<String, Object> response = new HashMap<>();
	        response.put("status", "failure");
	        return ResponseEntity.badRequest().body(response);
	    }
	}
	 
	 @GetMapping("/viewreFixeddeposit") 
	 @ResponseBody
	 public List<FixedDepositPM> getAllData() {
	     return policyManagementService.getAllFixeddata();
	 }

	 @PostMapping("/reccuringepositepmsave")
	    public ResponseEntity<String> save(@RequestBody RecurringDepositPM recuringDepositPM) {
	        boolean isSaved = policyManagementService.saveRecuringDailyDeposite(recuringDepositPM);
	        if (isSaved) {
	            return ResponseEntity.ok("success");
	        } else {
	            return ResponseEntity.badRequest().body("failure");
	        }
	    }
	 
	@ResponseBody 
	 @GetMapping("/viedRecurringeposite")
	    public List<RecurringDepositPM> getAllData1() {
	        return policyManagementService.getAllData1();
	    }



}
