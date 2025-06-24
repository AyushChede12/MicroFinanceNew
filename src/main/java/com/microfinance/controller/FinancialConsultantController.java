package com.microfinance.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.CustomerDto;
import com.microfinance.dto.FinancialConsultantDto;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;
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
	
	@GetMapping("/getAllRelationToApplicant")
	@ResponseBody
	public List<addCustomer> getAllRelationToApplicant(){
		List<addCustomer> list=financialConsultantService.getAllRelationToApplicant();
		return list;
	}
	
	
	@PostMapping("/getFinancialConsultantByMemberCode") // poonam 14-06-2025
	@ResponseBody
	public ResponseEntity<?> getMemberByCode(@RequestParam String memberCode) {
	    List<addCustomer> customerList = financialConsultantService.getByMemberCode(memberCode);

	    if (customerList != null && !customerList.isEmpty()) {
	        return ResponseEntity.ok(customerList); // Returns JSON in Postman
	    } else {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Member not found");
	    }
	}

	 
	 
	 @PostMapping("/saveOrUpdateFinancialConsultant")
		public ResponseEntity<ApiResponse<addFinancialConsultant>> saveOrUpdateFinancialConsultant(
				@ModelAttribute FinancialConsultantDto financialConsultantDto,
				@RequestParam(value = "customerPhoto", required = false) MultipartFile customerPhoto,
				@RequestParam(value = "customerSignature", required = false) MultipartFile customerSignature) throws IOException{

			// Debug log
			System.out.println("Received file: " + (customerPhoto != null ? customerPhoto.getOriginalFilename() : "No file uploaded"));
			if (customerSignature != null) {
		        System.out.println("Received file: " + customerSignature.getOriginalFilename());
		    }

			ApiResponse<addFinancialConsultant> response = financialConsultantService.saveOrUpdateFinancialConsultant(financialConsultantDto, customerPhoto, customerSignature);
			return new ResponseEntity<>(response, response.getStatus());
		}
		
		
	


}






