package com.microfinance.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.service.RequestApprovalsService;

@RestController
@RequestMapping("/api/requestapproval")
public class RequestApprovalsController {

	@Autowired
	RequestApprovalsService requestApprovalsService;
	
	@GetMapping("/findAllMemberCode")
	public ApiResponse<List<addCustomer>> findAllMemberCode() {
		List<addCustomer> list = requestApprovalsService.findAllMemberCode();
		if (list != null && !list.isEmpty()) {
			return ApiResponse.success(HttpStatus.OK, "Transfer Share List Find Successfully", list);
		} else
			return ApiResponse.error(HttpStatus.NOT_FOUND, "Transfer Share Data List is not Found");
	}
	
	//Janvi : get Unapproved Savings Data 01/07/2025
  	@PostMapping("/getUnapprovedSavingTransaction")
      public ResponseEntity<ApiResponse<List<CreateSavingsAccount>>> getUnapprovedSavingTransaction() {
          List<CreateSavingsAccount> list = requestApprovalsService.getUnapprovedSavingTransaction();
          ApiResponse<List<CreateSavingsAccount>> response = ApiResponse.success(
              HttpStatus.OK, 
              "Unapproved Saving Transaction fetched successfully", 
              list
          );
          return new ResponseEntity<>(response, HttpStatus.OK);
      }
  	
  //janvi: Approved Financial Consultant 30/06/2025
  	@PostMapping("/approvedSavingTransactionData")
  	public ResponseEntity<ApiResponse<CreateSavingsAccount>> updateSavingIsApprovedStatus(
  	        @RequestParam Long id,
  	        @RequestParam boolean isApproved) {

  	    Optional<CreateSavingsAccount> optionalCustomer = requestApprovalsService.SavingTransactionById(id);

  	    if (!optionalCustomer.isPresent()) {
  	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
  	                .body(ApiResponse.error(HttpStatus.NOT_FOUND, "Customer with ID " + id + " not found."));
  	    }

  	  CreateSavingsAccount customer = optionalCustomer.get();
  	    customer.setApproved(isApproved); // ✅ Use a proper setter method
  	  CreateSavingsAccount updated = requestApprovalsService.save(customer);

  	    return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "isApproved status updated for ID " + id, updated));
  	}

}
