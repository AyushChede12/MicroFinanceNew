package com.microfinance.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.CustomerDto;
import com.microfinance.model.addCustomer;
import com.microfinance.service.CustomerManagementService;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
public class CustomerManagementController {
	@Autowired
	CustomerManagementService customerService;

	
	
	
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
	
	
	
	
	
	
	
}
