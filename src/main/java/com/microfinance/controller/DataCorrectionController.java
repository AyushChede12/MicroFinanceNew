package com.microfinance.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.CustomerDto;
import com.microfinance.model.CompanyAdministration;
import com.microfinance.model.addCustomer;
import com.microfinance.repository.CustomerRepo;
import com.microfinance.service.DataCorrectionService;

@RestController
@RequestMapping("/api/datacorrection")
public class DataCorrectionController {
	
	@Autowired
	DataCorrectionService dataCorrectionService;
	
	// Ayush
	@PostMapping("/deleteCustomerDataByForm")        
	public ResponseEntity<ApiResponse<String>> deleteCustomerData(@RequestParam("id") Long id) {
		boolean isDeleted = dataCorrectionService.deleteCustomerData(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Customer Data deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					"Customer Data deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}
	


}
