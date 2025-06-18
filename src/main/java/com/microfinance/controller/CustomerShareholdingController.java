package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.microfinance.dto.ApiResponse;
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
	public ApiResponse<List<addCustomer>> findByCustomerCode(){
		List<addCustomer> list = customershareholdingservice.findByCustomerCode();
		if(!list.isEmpty()) {
			return ApiResponse.success(HttpStatus.OK, "Fetched Success", list);
		}else
			return ApiResponse.error(HttpStatus.NOT_FOUND, "Data is not Found");
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
	
	//Save Code  
	
}
