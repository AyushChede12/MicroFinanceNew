package com.microfinance.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.CustomerDto;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addCustomerKYC;
import com.microfinance.model.states;
import com.microfinance.repository.CustomerRepo;
import com.microfinance.service.CustomerManagementService;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
public class CustomerManagementController {
	@Autowired
	CustomerManagementService customerService;
	
	@Autowired
	CustomerRepo customerRepo;

	
	
	
	@PostMapping("/saveOrUpdateCustomer")
	public ResponseEntity<ApiResponse<addCustomer>> saveOrUpdateCustomer(
			@ModelAttribute CustomerDto clientMasterDto,
			@RequestParam(value = "customerPhoto", required = false) MultipartFile customerPhoto,
			@RequestParam(value = "customerSignature", required = false) MultipartFile customerSignature) throws IOException{

		// Debug log
		System.out.println("Received file: " + (customerPhoto != null ? customerPhoto.getOriginalFilename() : "No file uploaded"));
		if (customerSignature != null) {
	        System.out.println("Received file: " + customerSignature.getOriginalFilename());
	    }

		ApiResponse<addCustomer> response = customerService.saveOrUpdateCustomer(clientMasterDto, customerPhoto, customerSignature);
		return new ResponseEntity<>(response, response.getStatus());
	}
	
	
	
	@GetMapping("/getAllCustomer")               //Niraj
	public List<addCustomer> getAllCustomer(){
		List<addCustomer> list = customerService.getAllCustomer();
		return list;
	}
	
	
	// get Data by MemberCode
		@PostMapping("/fetchBySelectedCustomer")
		public List<addCustomer> fetchBySelectedMember(@RequestBody addCustomer customer) { 
			List<addCustomer> list = customerService.fetchBySelectedMember(customer.getMemberCode());
			return list;
		}
	
		// Add Member Kyc //
		
		 @PostMapping("/saveOrUpdateCustomerKYC")
		    public ResponseEntity<ApiResponse<addCustomerKYC>> saveOrUpdateCustomerKYC(
		            @ModelAttribute addCustomerKYC kyc,
		            @RequestParam(value = "customerPhoto", required = false) MultipartFile customerPhoto,
		            @RequestParam(value = "customerSignature", required = false) MultipartFile customerSignature,
		            @RequestParam(value = "aadharFrontPhoto", required = false) MultipartFile aadharFrontPhoto,
		            @RequestParam(value = "aadharBackPhoto", required = false) MultipartFile aadharBackPhoto,
		            @RequestParam(value = "panPhoto", required = false) MultipartFile panPhoto) {

		        ApiResponse<addCustomerKYC> response = customerService.saveOrUpdateCustomerKYC(
		                kyc, customerPhoto, customerSignature, aadharFrontPhoto, aadharBackPhoto, panPhoto);

		        return new ResponseEntity<>(response, response.getStatus());
		    }
		 @PostMapping("/searchCustomerByBranchAndDates")
		 public List<addCustomer> searchCustomerByBranchAndDates(@RequestBody addCustomer searchCriteria) {
		     return customerService.searchByBranchAndDateRange(
		         searchCriteria.getBranchName(),
		         searchCriteria.getfDate(),
		         searchCriteria.gettDate()
		     );
		 }
		 
		 @PostMapping("/verifyFetchedData")
		 public ResponseEntity<Map<String, Object>> verifyFetchedData(@RequestBody Map<String, Object> fetchedData) {
		     String customerCode = (String) fetchedData.get("memberCode");

		     Map<String, Object> response = new HashMap<>();

		     // Fetch customer by code
		     Optional<addCustomer> optionalCustomer = customerRepo.findByMemberCode(customerCode);

		     if (!optionalCustomer.isPresent()) {
		         response.put("isVerified", false);
		         response.put("message", "Customer not found!");
		         return ResponseEntity.ok(response);
		     }

		     addCustomer customer = optionalCustomer.get();

		     if (customer.isVerified()) {
		         response.put("isVerified", true);
		         response.put("message", "This customer is already verified!");
		         return ResponseEntity.ok(response);
		     }

		     // Required fields to validate
		     String[] requiredFields = {
		    		    "memberCode", "customerName", "contactNo", "signupDate", 
		    		    "aadharNo", "pan", "voterNo", "drivingLicenceNo"
		    		};


		     boolean isVerified = true;
		     StringBuilder missingFields = new StringBuilder();

		     for (String field : requiredFields) {
		         Object value = fetchedData.get(field);
		         if (value == null || value.toString().trim().isEmpty()) {
		             isVerified = false;
		             missingFields.append(field).append(", ");
		         }
		     }

		     if (!isVerified) {
		         response.put("isVerified", false);
		         response.put("message", "Verification failed. Missing fields: " + missingFields.toString());
		     } else {
		         customer.setVerified(true);
		         customerRepo.save(customer);

		         response.put("isVerified", true);
		         response.put("message", "Verification successful!");
		     }

		     return ResponseEntity.ok(response);
		 }




}
