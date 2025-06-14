package com.microfinance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.model.SavingSchemeCatalog;
import com.microfinance.service.CustomerSavingsService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


@RestController
public class CustomerSavingsController {

	@Autowired
	CustomerSavingsService customersaving;
	
	@ResponseBody
	@PostMapping("/savescheme")
	public ResponseEntity<String> saveSavingScheme(@RequestBody SavingSchemeCatalog savingSchemeCatalog){
		customersaving.saveSavingScheme(savingSchemeCatalog);
		return ResponseEntity.ok("Save Saving Scheme Successfully");
	}
	
}
