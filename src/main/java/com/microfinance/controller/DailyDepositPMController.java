package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.microfinance.model.DailyDepositPM;
import com.microfinance.service.DailyDepositPMService;



import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class DailyDepositPMController {
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
	 
	@ResponseBody 
	 @GetMapping("/viewdailydeposite")
	    public List<DailyDepositPM> getAllData() {
	        return dailyDepositPMService.getAllData();
	    }

	}
