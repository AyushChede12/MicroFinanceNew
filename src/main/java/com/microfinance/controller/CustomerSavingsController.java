package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.model.SavingSchemeCatalog;
import com.microfinance.model.states;
import com.microfinance.service.CustomerSavingsService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class CustomerSavingsController {

	@Autowired
	CustomerSavingsService customersaving;
	
	@ResponseBody
	@PostMapping("/savescheme")
	public ResponseEntity<String> saveSavingScheme(@RequestBody SavingSchemeCatalog savingSchemeCatalog){
		SavingSchemeCatalog ssc=customersaving.saveSavingScheme(savingSchemeCatalog);
		if(ssc!=null)
			return ResponseEntity.ok("Data Saved Successfully");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	
}
