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

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.DailyDepositPM;
import com.microfinance.service.PolicyManagementService;



import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class DailyDepositPMController {
	    @Autowired
	    private PolicyManagementService policyManagementService;
	 
	@ResponseBody 
	 @GetMapping("/viewdailydeposite")
	    public List<DailyDepositPM> getAllData() {
	        return policyManagementService.getAllData();
	    }

	}
