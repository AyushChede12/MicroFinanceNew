package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.microfinance.model.DailyDepositPM;
import com.microfinance.model.RecurringDepositPM;
import com.microfinance.service.PolicyManagementService;

@Controller
public class RecurringDepositPMController {
	@Autowired 
	PolicyManagementService policyManagementService;
	
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
	    public List<RecurringDepositPM> getAllData() {
	        return policyManagementService.getAllData1();
	    }


}
