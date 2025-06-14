package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.microfinance.model.addCustomer;
import com.microfinance.model.states;
import com.microfinance.service.FinancialConsultantService;

@Controller
public class FinancialConsultantController {
	@Autowired
	FinancialConsultantService financialConsultantService;
	
	@GetMapping("/getAllCustomerCodes")  // Poonam 13-06-2025
	@ResponseBody
	public List<addCustomer> getAllCustomerCodes() {
	    List<addCustomer> list = financialConsultantService.getAllCustomerCodes();
	    return list;
	}
	
	
	@GetMapping("/getAllBranch")  //poonam 13-06-2025
	@ResponseBody
	public List<addCustomer> getAllBranch(){
		List<addCustomer>  list=financialConsultantService.getAllBranch();
		return list;
	}
	
	
	 @PostMapping("/getCustomerByMemberCode")  //poonam 14-06-2025
	 @ResponseBody
	    public ResponseEntity<?> getMemberByCode(@RequestParam String memberCode) {
	        addCustomer customer = financialConsultantService.getByMemberCode(memberCode);
	        if (customer != null) {
	            return ResponseEntity.ok(customer);
	        } else {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Member not found");
	        }
	    }
	


}






