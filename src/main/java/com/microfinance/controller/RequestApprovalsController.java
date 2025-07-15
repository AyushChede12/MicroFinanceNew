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
import com.microfinance.model.AddnewinvestmentPM;
import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.service.RequestApprovalsService;

@RestController
@RequestMapping("/api/requestapproval")
public class RequestApprovalsController {

	@Autowired
	RequestApprovalsService requestApprovalsService;
	
	//anjali
	
	@GetMapping("/findAllMemberCode")
	public ApiResponse<List<addCustomer>> findAllMemberCode() {
	    List<addCustomer> list = requestApprovalsService.findAllMemberCode();
	    
	    if (list != null && !list.isEmpty()) {
	        return ApiResponse.success(HttpStatus.OK, "Filtered customers fetched successfully", list);
	    } else {
	        return ApiResponse.error(HttpStatus.NOT_FOUND, "No unapproved customers found");
	    }
	}

	
	//anjali (30/06/25)
	@PostMapping("/approvedCustomerData")
	public ResponseEntity<ApiResponse<addCustomer>> updateIsApprovedStatus(
	        @RequestParam Long id,
	        @RequestParam boolean isApproved) {

	    Optional<addCustomer> optionalCustomer = requestApprovalsService.findByIdShowStatus(id);

	    if (!optionalCustomer.isPresent()) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
	                .body(ApiResponse.error(HttpStatus.NOT_FOUND, "Customer with ID " + id + " not found."));
	    }

	    addCustomer customer = optionalCustomer.get();
	    customer.setApproved(isApproved); // ✅ Use a proper setter method
	    addCustomer updated = requestApprovalsService.save(customer);

	    return ResponseEntity.ok(
	            ApiResponse.success(HttpStatus.OK, "isApproved status updated for ID " + id, updated));
	}
	

	//anjali (2/07/25)
   
	
    @GetMapping("/unapproved")
    public ResponseEntity<ApiResponse<List<addCustomer>>> getAllUnapprovedCustomers() {
        List<addCustomer> list = requestApprovalsService.getUnapprovedCustomers();
        if (!list.isEmpty()) {
            return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Unapproved customers fetched", list));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(ApiResponse.error(HttpStatus.NOT_FOUND, "No unapproved customers found"));
        }
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


  	//anjali :unapprove data AddNewInvestment 14/07/2025

  	@GetMapping("/unapprovedAddNewInvestment")
  	public ResponseEntity<ApiResponse<List<AddnewinvestmentPM>>> getAllUnapprovedAddNewInvestment() {
  	    List<AddnewinvestmentPM> list = requestApprovalsService.getAllUnapprovedAddNewInvestment();

  	    if (!list.isEmpty()) {
  	        return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Unapproved investments fetched", list));
  	    } else {
  	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
  	                .body(ApiResponse.error(HttpStatus.NOT_FOUND, "No unapproved investments found"));
  	    }
  	}
  	
  	// anjali:: approve add invetment data 14/07/25
        
  	@PostMapping("/approveInvestmentData")
  	public ResponseEntity<ApiResponse<AddnewinvestmentPM>> updateIsApprovedStatusInvestment(
  	        @RequestParam("id") Long id,
  	        @RequestParam("isApproved") boolean isApproved) {

  	    Optional<AddnewinvestmentPM> optionalInvestment = requestApprovalsService.findByIdShowStatusInvestment(id);

  	    if (!optionalInvestment.isPresent()) {
  	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
  	                .body(ApiResponse.error(HttpStatus.NOT_FOUND, "Investment with ID " + id + " not found."));
  	    }

  	    AddnewinvestmentPM investment = optionalInvestment.get();
  	    investment.setApproved(isApproved);

  	    AddnewinvestmentPM updatedInvestment = requestApprovalsService.save(investment);

  	    return ResponseEntity.ok(
  	            ApiResponse.success(HttpStatus.OK, "Approval status updated for ID " + id, updatedInvestment)
  	    );
  	}


}