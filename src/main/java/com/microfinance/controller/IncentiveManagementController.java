package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
	

import com.microfinance.model.IncentiveSchemeMaster;
import com.microfinance.service.IncentiveManagementService;

@Controller
public class IncentiveManagementController {

	@Autowired
	private IncentiveManagementService incentiveSchemeMasterService;
	
	
	//incentive save Data date:-13-6-24
	//Anjali
	
	@PostMapping("/saveIncentive")
	@ResponseBody
	public ResponseEntity<String> saveIncentiveScheme(@RequestBody IncentiveSchemeMaster incentive) {
		IncentiveSchemeMaster Data = incentiveSchemeMasterService.saveIncentive(incentive);
		if(Data!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	//fetch the data from table 
	//Anjali
	
	
	@GetMapping("/getAllIncentives")
	@ResponseBody
    public List<IncentiveSchemeMaster> getAllIncentives() {
		List<IncentiveSchemeMaster> list=incentiveSchemeMasterService.getAllIncentives();
        return list;
    }

}
