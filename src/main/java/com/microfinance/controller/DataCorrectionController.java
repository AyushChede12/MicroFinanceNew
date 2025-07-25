package com.microfinance.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.CustomerDto;
import com.microfinance.dto.FinancialConsultantDto;
import com.microfinance.dto.PolicyManagementDto;
import com.microfinance.model.AddnewinvestmentPM;
import com.microfinance.model.CompanyAdministration;
import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.DailyPremiumRenewalPM;
import com.microfinance.model.ExecutiveFounder;
import com.microfinance.model.FlexiblepremiumrenewalPM;
import com.microfinance.model.LoanApplication;
import com.microfinance.model.PolicyRenewal;
import com.microfinance.model.SavingAccountActivity;
import com.microfinance.model.TransferShare;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.repository.CustomerRepo;
import com.microfinance.repository.SavingAccountActivityRepo;
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
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "Customer Data deletion failed",
					"failure");
			return ResponseEntity.badRequest().body(response);
		}
	}

	// Ayush
//	@PostMapping("/deleteFinancialDataByForm")
//	public ResponseEntity<ApiResponse<String>> deleteFinancialData(@RequestParam("id") Long id) {
//		boolean isDeleted = dataCorrectionService.deleteFinancialData(id);
//		if (isDeleted) {
//			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Financial Data deleted successfully",
//					"success");
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "Financial Data deletion failed",
//					"failure");
//			return ResponseEntity.badRequest().body(response);
//		}
//	}

	// Ayush
	@GetMapping("/fetchAllSavingAccountActivity")
	public ResponseEntity<ApiResponse<List<SavingAccountActivity>>> fetchAllSavingAccountActivity() {
		List<SavingAccountActivity> list = dataCorrectionService.fetchAllSavingAccountActivity();
		ApiResponse<List<SavingAccountActivity>> response = new ApiResponse<>(HttpStatus.FOUND,
				"Saving Account Activity fetched successfully", list);
		return ResponseEntity.ok(response);
	}

	// Ayush
	@PostMapping("/deleteSavingTransactionRemoval")
	public ResponseEntity<ApiResponse<String>> deleteSavingTransaction(@RequestParam("id") Long id) {
		boolean isDeleted = dataCorrectionService.deleteSavingTransaction(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Saving Transaction deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "Saving Transaction deletion failed",
					"failure");
			return ResponseEntity.badRequest().body(response);
		}
	}

	// Ayush
//	@PostMapping("/saveOrUpdatePolicyManagement")
//	public ResponseEntity<ApiResponse<AddnewinvestmentPM>> saveOrUpdatePolicyManagementData(
//			@ModelAttribute PolicyManagementDto policyManagementDto,
//			@RequestParam(value = "image1", required = false) MultipartFile image1,
//			@RequestParam(value = "image2", required = false) MultipartFile image2) {
//
//		// System.out.println("Received file: " + (signature != null ?
//		// signature.getOriginalFilename() : "No file uploaded"));
//
//		System.out.println("Received financialPhoto: " + image1);
//
//		System.out.println("Received Signature: " + image2);
//
//		ApiResponse<AddnewinvestmentPM> response = dataCorrectionService
//				.saveOrUpdatePolicyManagement(policyManagementDto, image1, image2);
//		return new ResponseEntity<>(response, response.getStatus());
//	}

	@PostMapping("/deletePolicyDataByForm")
	public ResponseEntity<ApiResponse<String>> deletePolicyData(@RequestParam("id") Long id) {
		boolean isDeleted = dataCorrectionService.deletePolicyData(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Policy Data deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "Policy Data deletion failed",
					"failure");
			return ResponseEntity.badRequest().body(response);
		}
	}

	// Ayush
//	@PostMapping("/fetchSavingAccountByCustomerCode")
//	public ApiResponse<List<CreateSavingsAccount>> fetchSavingByCustomerCode(@RequestParam("selectByCustomer") String selectByCustomer) {
//		List<CreateSavingsAccount> list = dataCorrectionService.fetchSavingDataByCustomerCode(selectByCustomer);
//		if (list != null && !list.isEmpty()) {
//			return ApiResponse.success(HttpStatus.FOUND, "Saving Account Fetched Successfully", list);
//		} else {
//			return ApiResponse.error(HttpStatus.NOT_FOUND, "Saving Account Share Not Found");
//		}
//	}

	@PostMapping("/updateDataOfPolicyManagement")
	public ResponseEntity<ApiResponse<String>> updatePolicyManagement(
			@RequestBody AddnewinvestmentPM adddnewinvestmentPM) {

		int result = dataCorrectionService.updatePolicyManagement(adddnewinvestmentPM);

		if (result > 0) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Policy Data updated successfully.",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.BAD_REQUEST, "Failed to update Policy Data.",
					"failure");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
		}
	}

	// Ayush
	@GetMapping("/fetchAllApprovedLoanApplications")
	public ResponseEntity<ApiResponse<List<LoanApplication>>> getApprovedLoanApplications() {
		List<LoanApplication> loan = dataCorrectionService.getApprovedLoanApplications();

		if (loan != null && !loan.isEmpty()) {
			ApiResponse<List<LoanApplication>> response = new ApiResponse<>(HttpStatus.OK,
					"Approved Loan Application fetched successfully.", loan);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<List<LoanApplication>> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					"No approved customers found.", null);
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		}
	}

	// Ayush
	@GetMapping("/fetchAllLoanApplications")
	public ResponseEntity<ApiResponse<List<LoanApplication>>> fetchAllLoanApplicationsData() {
		List<LoanApplication> list = dataCorrectionService.fetchAllLoanApplication();
		ApiResponse<List<LoanApplication>> response = new ApiResponse<>(HttpStatus.FOUND,
				"Loan Application fetched successfully", list);
		return ResponseEntity.ok(response);
	}

	
	// Ayush
	@GetMapping("/fetchAllApprovedPolicyRenewal")
	public ResponseEntity<ApiResponse<List<PolicyRenewal>>> getApprovedPolicyRenewal() {
		List<PolicyRenewal> policy = dataCorrectionService.getApprovedPolicyRenewal();
		if (policy != null && !policy.isEmpty()) {

			ApiResponse<List<PolicyRenewal>> response = new ApiResponse<>(HttpStatus.OK,
					"Policy Renewal Data fetched successfully.", policy);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<List<PolicyRenewal>> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					"No approved Policy Renewal found.", null);
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		}
	}

	// Ayush
//	@GetMapping("/getPolicyRenewalByPolicyCode")
//	public ResponseEntity<ApiResponse<List<PolicyRenewal>>> getRenewalByPolicyData(@RequestParam String policyCode) {
//
//	    List<PolicyRenewal> renewal = dataCorrectionService.fetchRenewalByPolicyCode(policyCode);
//
//	    if (renewal != null && !renewal.isEmpty()) {
//	        ApiResponse<List<PolicyRenewal>> response = ApiResponse.success(
//	            HttpStatus.OK,
//	            "Policy Renewal found for PolicyCode: " + policyCode,
//	            renewal
//	        );
//	        return new ResponseEntity<>(response, HttpStatus.OK);
//	    } else {
//	        ApiResponse<List<PolicyRenewal>> response = ApiResponse.error(
//	            HttpStatus.NOT_FOUND,
//	            "No member found with this code"
//	        );
//	        return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
//	    }
//	}

	@PostMapping("/deleteLoanApplicationDataById")
	public ResponseEntity<ApiResponse<String>> deleteLoanApplication(@RequestParam("id") Long id) {
		boolean isDeleted = dataCorrectionService.deleteLoanApplication(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Loan Application deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "Loan Application deletion failed",
					"failure");
			return ResponseEntity.badRequest().body(response);
		}
	}

	// Ayush
	@PostMapping("/updateLoanApplication")
	public ResponseEntity<ApiResponse<String>> updateLoanApplicationData(@RequestBody LoanApplication loanapplication) {
		boolean result = dataCorrectionService.updateLoanApplication(loanapplication);
		if (result) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK,
					"Loan Application Data Updated Successfully", "success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.BAD_REQUEST,
					"Loan Application Data Not Updated", "failure");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
		}
	}

	// Ayush
	@GetMapping("/getPolicyRenewalByPolicyCode")
	public ResponseEntity<ApiResponse<PolicyRenewal>> getPolicyRenewalDataByPolicyCode(
			@RequestParam String policyCode) {

		Optional<PolicyRenewal> renewal = dataCorrectionService.fetchPolicyRenewalByPolicyCode(policyCode);

		if (renewal.isPresent()) {
			ApiResponse<PolicyRenewal> response = ApiResponse.success(HttpStatus.FOUND,
					"Policy Renewal found for Policy Code: " + policyCode, renewal.get());
			return new ResponseEntity<>(response, HttpStatus.OK);
		} else {
			ApiResponse<PolicyRenewal> response = ApiResponse.error(HttpStatus.NOT_FOUND,
					"No Policy Renewal found with Policy Code: " + policyCode);
			return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
		}
	}
	
	//Ayush
	@PostMapping("/deletePolicyRenewalDataById")
	public ResponseEntity<ApiResponse<String>> deletePolicyRenewal(@RequestParam("id") Long id) {
		boolean isDeleted = dataCorrectionService.deletePolicyRenewalData(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Policy Renewal deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "Policy Renewal deletion failed",
					"failure");
			return ResponseEntity.badRequest().body(response);
		}
	}
	
	//Ayush
	@GetMapping("/fetchAllApprovedDailyRenewal")
	public ResponseEntity<ApiResponse<List<DailyPremiumRenewalPM>>> getApprovedDailyRenewalData() {
		List<DailyPremiumRenewalPM> dailyrenewal = dataCorrectionService.getApprovedDailyRenewal();
		if (dailyrenewal != null && !dailyrenewal.isEmpty()) {

			ApiResponse<List<DailyPremiumRenewalPM>> response = new ApiResponse<>(HttpStatus.FOUND,
					"Daily Renewal Data fetched successfully.", dailyrenewal);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<List<DailyPremiumRenewalPM>> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					"No approved Daily Renewal found.", null);
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		}
	}
	
	//Ayush
	@GetMapping("/getDailyRenewalByPolicyCode")
	public ResponseEntity<ApiResponse<DailyPremiumRenewalPM>> getDailyRenewalDataByPolicyCode(
			@RequestParam String policyCode) {

		Optional<DailyPremiumRenewalPM> renewal = dataCorrectionService.fetchDailyRenewalByPolicyCode(policyCode);

		if (renewal.isPresent()) {
			ApiResponse<DailyPremiumRenewalPM> response = ApiResponse.success(HttpStatus.FOUND,
					"Daily Renewal found for Policy Code: " + policyCode, renewal.get());
			return new ResponseEntity<>(response, HttpStatus.OK);
		} else {
			ApiResponse<DailyPremiumRenewalPM> response = ApiResponse.error(HttpStatus.NOT_FOUND,
					"No Daily Renewal found with Policy Code: " + policyCode);
			return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
		}
	}
	
	@PostMapping("/deleteDailyRenewalDataById")
	public ResponseEntity<ApiResponse<String>> deleteDailyRenewalData(@RequestParam("id") Long id) {
		boolean isDeleted = dataCorrectionService.deleteDailyRenewal(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Daily Renewal deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "Daily Renewal deletion failed",
					"failure");
			return ResponseEntity.badRequest().body(response);
		}
	}
	
	@GetMapping("/fetchAllApprovedFlexibleRenewal")
	public ResponseEntity<ApiResponse<List<FlexiblepremiumrenewalPM>>> getApprovedFlexibleRenewalData() {
		List<FlexiblepremiumrenewalPM> dailyrenewal = dataCorrectionService.getApprovedFlexibleRenewal();
		if (dailyrenewal != null && !dailyrenewal.isEmpty()) {

			ApiResponse<List<FlexiblepremiumrenewalPM>> response = new ApiResponse<>(HttpStatus.FOUND,
					"Flexible Renewal Data fetched successfully.", dailyrenewal);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<List<FlexiblepremiumrenewalPM>> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					"No approved Flexible Renewal found.", null);
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		}
	}


}
