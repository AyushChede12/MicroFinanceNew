package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.microfinance.model.BranchModule;
import com.microfinance.model.addCustomer;
import com.microfinance.service.CustomerShareholdingService;

@Controller
public class CustomerShareholdingController {

	@Autowired
	CustomerShareholdingService customershareholdingservice;
	
//Transfer Share - Oshin 14-06-2025	
	//Find CustomerCode 
	@GetMapping("/findAllCustomerCode")
	@ResponseBody
	public List<addCustomer> findByCustomerCode(){
		List<addCustomer> list = customershareholdingservice.findByCustomerCode();
		return list;
	}
	
	//Fetching CustomerCode   
	@PostMapping("/fetchByCustomerCode")
	@ResponseBody
	public List<addCustomer> fetchByCustomerCode(@RequestBody addCustomer addcustomer) {
		List<addCustomer>  list = customershareholdingservice.fetchByCustomerCode(addcustomer.getMemberCode());
		return list;
	}
	
	//Find Branch 
	@GetMapping("/findAllBranch")
	@ResponseBody
	public List<BranchModule> findByBranch(){
		List<BranchModule> list = customershareholdingservice.findByBranch();
		return list;
	}
	
	
	
}
