package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.microfinance.model.BankModule;
import com.microfinance.model.BranchModule;
import com.microfinance.model.CasteModule;
import com.microfinance.model.CategoryModule;
import com.microfinance.model.RelativeModule;
import com.microfinance.model.FinancialYear;
import com.microfinance.service.PreferenceService;
@CrossOrigin
@Controller
public class PreferenceController {
	
	@Autowired
	PreferenceService preferenceService;
	
	//Branch Module
	@PostMapping("/saveAllBranchModule")
	@ResponseBody
	public ResponseEntity<String> saveBranchMaster(@RequestBody BranchModule branchmodule) {
		BranchModule branch=preferenceService.saveAllBranchModule(branchmodule);
		if(branch!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	@GetMapping("/getAllBranchModule")
	@ResponseBody
	public List<BranchModule> fetchAllBranchModule(){
		List<BranchModule> list = preferenceService.fetchAllBranchModule();
		return list;
	}
	
	
	//Bank Module
	@PostMapping("/saveAllBankModule")
	@ResponseBody
	public ResponseEntity<String> saveBankModule(@RequestBody BankModule bankModule) {
		BankModule bank = preferenceService.saveAllBankModule(bankModule);
		if(bank!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	@GetMapping("/getAllBankModule")
	@ResponseBody
	public List<BankModule> fetchAllBankModule(){
		List<BankModule> list = preferenceService.fetchAllBankModule();
		return list;
	}
	
	//Relative Module
	@PostMapping("/saveAllRelativeModule")
	@ResponseBody
	public ResponseEntity<String> saveRelativeModule(@RequestBody RelativeModule relativeModule) {
		RelativeModule relative = preferenceService.saveAllRelativeModule(relativeModule);
		if(relative!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	@GetMapping("/getAllRelativeModule")
	@ResponseBody
	public List<RelativeModule> fetchAllRelativeModule(){
		List<RelativeModule> list = preferenceService.fetchAllRelativeModule();
		return list;
	}
	
	
	//Caste Module
	@PostMapping("/saveAllCasteModule")
	@ResponseBody
	public ResponseEntity<String> saveCasteModuleData(@RequestBody CasteModule castemodule) {
		CasteModule caste=preferenceService.saveCasteModule(castemodule);
		if(caste!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("failure");
	}
	
	@GetMapping("/getAllCasteModule")
	@ResponseBody
	public List<CasteModule> fetchAllCasteModule(){
		List<CasteModule> list = preferenceService.fetchAllCasteModule();
		return list;
	}
	
	//Category Module
	@PostMapping("/saveAllCategoryModule")
	public ResponseEntity<String> saveCategoryModuleData(@RequestBody CategoryModule categorymodule) {
	    CategoryModule category = preferenceService.saveCategoryModule(categorymodule);
	    if (category != null)
	        return ResponseEntity.ok("success");
	    else
	        return ResponseEntity.badRequest().body("failure");
	}

	
	@GetMapping("/getAllCategoryModule")
	@ResponseBody
	public List<CategoryModule> fetchAllCategoryModule(){
		List<CategoryModule> list = preferenceService.fetchAllCategoryModule();
		return list;
	}
	
	//Executive Founder
	@PostMapping("/saveFinancialYear")
	public ResponseEntity<String> saveFinancialYearData(@RequestBody FinancialYear financialyear) {
	    FinancialYear fy = preferenceService.saveFinancialYear(financialyear);
	    if (fy != null)
	        return ResponseEntity.ok("success");
	    else
	        return ResponseEntity.badRequest().body("failure");
	}
	
	@GetMapping("/getAllFinancialYear")
	@ResponseBody
	public List<FinancialYear> fetchAllFinancialYear(){
		List<FinancialYear> list = preferenceService.fetchAllFinancialYear();
		return list;
	}
	

}
