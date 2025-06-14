package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import com.microfinance.model.MaturitySchemeMaster;
import com.microfinance.service.MaturitySchemeMasterService;

@Controller
public class MaturityManagementController {
	
	
	@Autowired
	MaturitySchemeMasterService maturityservice;
	
	// save maturity scheme master daily deposit
	//Ashwini
	
	@PostMapping("/savematuritydailydeposit")
	@ResponseBody
	public ResponseEntity<String> saveMaturityDailyDeposit(@RequestBody MaturitySchemeMaster maturityscheme) {
		MaturitySchemeMaster maturity = maturityservice.saveAllDailyDeposit(maturityscheme);
		if(maturity!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	//Svae Maturity scheme master Recurring Deposite
	//Ashwini
	
	/*@PostMapping("Savematurityrecurringdepost")
	public ResponseEntity<String> saveMaturityRecurringDeposit(@RequestBody MaturitySchemeMaster maturityscheme) {
		MaturitySchemeMaster maturity = maturityservice.saveAllDailyDeposit(maturityscheme);
		if(maturity!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}*/
	
	
}
