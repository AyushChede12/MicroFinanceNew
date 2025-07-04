package com.microfinance.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.addCustomer;
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



}