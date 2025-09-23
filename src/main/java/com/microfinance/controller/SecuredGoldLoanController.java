package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.GoldDirectory;
import com.microfinance.model.LoanSchemCatalog;
import com.microfinance.model.SecuredGoldPlan;
import com.microfinance.model.addCustomer;
import com.microfinance.service.SecuredGoldLoanService;

@RestController
@RequestMapping("/api/securedGoldLoan")
public class SecuredGoldLoanController {

	@Autowired
	private SecuredGoldLoanService secureGoldLoanService;

	// by poonam for saving and updating Gold Secure Plan on 03/09/2025
	@PostMapping("/saveGoldSecurePlan")
	public ResponseEntity<ApiResponse<SecuredGoldPlan>> saveGoldSecurePlanData(@RequestBody SecuredGoldPlan goldLoan) {
		SecuredGoldPlan savedGoldLoan = secureGoldLoanService.saveLoanManagmentData(goldLoan);

		if (savedGoldLoan != null) {
			String message = (goldLoan.getId() != null) ? "Data updated successfully" : "Data saved successfully";
			ApiResponse<SecuredGoldPlan> response = new ApiResponse<>(HttpStatus.OK, message, savedGoldLoan);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<SecuredGoldPlan> errorResponse = new ApiResponse<>(HttpStatus.INTERNAL_SERVER_ERROR,
					"Failed to save or update data", null);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
		}
	}

	@GetMapping("/allDataFetchGoldSecurePlan")
	public ResponseEntity<ApiResponse<List<SecuredGoldPlan>>> allDataFetchGoldSecurePlan() {
		List<SecuredGoldPlan> list = secureGoldLoanService.allDataFetchGoldSecurePlan();

		if (list != null && !list.isEmpty()) {
			ApiResponse<List<SecuredGoldPlan>> response = new ApiResponse<>(HttpStatus.OK,
					"Gold Secure Plan fetched successfully", list);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<List<SecuredGoldPlan>> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "No data found",
					null);
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(response);
		}
	}

	@GetMapping("/getGoldLoanByIdEdite")
	public ResponseEntity<ApiResponse<SecuredGoldPlan>> getLoanById(@RequestParam Long id) {
		SecuredGoldPlan goldLoan = secureGoldLoanService.getGoldLoanById(id);

		if (goldLoan != null) {
			// Success response
			ApiResponse<SecuredGoldPlan> response = new ApiResponse<>(

					HttpStatus.OK, "Loan fetched successfully", goldLoan);
			return ResponseEntity.ok(response);
		} else {
			// Failure response
			ApiResponse<SecuredGoldPlan> response = new ApiResponse<>(

					HttpStatus.NOT_FOUND, "GoldLoan not found with ID: " + id, null);
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		}
	}

	@PostMapping("/deleteGoldLoanById")
	public ResponseEntity<ApiResponse<SecuredGoldPlan>> deleteGoldLoan(@RequestParam Long id) {
		boolean deleted = secureGoldLoanService.deleteGoldLoanLoanById(id);

		if (deleted) {
			ApiResponse<SecuredGoldPlan> response = new ApiResponse<>(HttpStatus.OK, "Gold Loan deleted successfully",
					null);
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<SecuredGoldPlan> response = new ApiResponse<>(HttpStatus.NOT_FOUND, "Gold Loan not found",
					null);
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		}
	}

	// By poonam for GoldDirectory on 11/09/2025

	@PostMapping("/saveGoldDirectory")
	public ResponseEntity<ApiResponse<GoldDirectory>> saveGoldDirectory(@RequestParam(required = false) Long id,
			@RequestParam String karat, @RequestParam String silverRate, @RequestParam String goldRate,
			@RequestParam String itemMasterType, @RequestParam String itemName, @RequestParam String lockerLocation,
			@RequestParam String lockerAddress, @RequestParam String purityName, @RequestParam String purity,
			@RequestParam String itemPurityType) {

		GoldDirectory saved = secureGoldLoanService.saveOrUpdateGoldDirectory(id, karat, silverRate, goldRate,
				itemMasterType, itemName, lockerLocation, lockerAddress, purityName, purity, itemPurityType);

		return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK,
				(id == null ? "Row created successfully" : "Row updated successfully"), saved));
	}

	@GetMapping("/getAllGoldDirectories")
	public ResponseEntity<ApiResponse<List<GoldDirectory>>> getAllGoldDirectories() {
		List<GoldDirectory> list = secureGoldLoanService.getAllGoldDirectories();

		return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK,
				list.isEmpty() ? "No records found" : "Records fetched successfully", list));
	}

	@GetMapping("/getAllMembersForGoldLoan")
	public ResponseEntity<ApiResponse<List<addCustomer>>> getAllMembersforGold() {
		List<addCustomer> list = secureGoldLoanService.getAllCustomers();
		ApiResponse<List<addCustomer>> response = ApiResponse.success(HttpStatus.OK, "All Members Fetched Successfully",
				list);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@GetMapping("/getByMemberCodeGoldLoan")
	public ResponseEntity<ApiResponse<List<addCustomer>>> getGoldLoanByMemberCode(@RequestParam String memberCode) {
		try {
			List<addCustomer> customerList = secureGoldLoanService.getLoanApplicationById(memberCode);

			if (customerList == null || customerList.isEmpty()) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND)
						.body(new ApiResponse<>(HttpStatus.NOT_FOUND, "No customer found for member code", null));
			}

			return ResponseEntity.ok(new ApiResponse<>(HttpStatus.OK, "Customer(s) found", customerList));
		} catch (RuntimeException ex) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(new ApiResponse<>(HttpStatus.INTERNAL_SERVER_ERROR, ex.getMessage(), null));
		}
	}
	
	
	//for Apply for gold by using loanPlanName 
	
	@GetMapping("/getLoanPlanNameApplyForGold")
	public ResponseEntity<ApiResponse<List<SecuredGoldPlan>>> getLoanPlanNameApplyForGold(@RequestParam String loanPlanName) {
		try {
			List<SecuredGoldPlan> goldLoanList = secureGoldLoanService.getLoanPlanNameApplyForGoldByLoanPlan(loanPlanName);

			if (goldLoanList == null || goldLoanList.isEmpty()) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND)
						.body(new ApiResponse<>(HttpStatus.NOT_FOUND, "No customer found for member code", null));
			}

			return ResponseEntity.ok(new ApiResponse<>(HttpStatus.OK, "LoanPlan found", goldLoanList));
		} catch (RuntimeException ex) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(new ApiResponse<>(HttpStatus.INTERNAL_SERVER_ERROR, ex.getMessage(), null));
		}
	}

}

// 1. Save Today's Rate
/*
 * @PostMapping("/saveGoldDirectory") public
 * ResponseEntity<ApiResponse<GoldDirectory>> saveGoldDirectory(@RequestParam
 * String karat,
 * 
 * @RequestParam String silverRate, @RequestParam String goldRate, @RequestParam
 * String itemMasterType,
 * 
 * @RequestParam String itemName, @RequestParam String
 * lockerLocation, @RequestParam String lockerAddress,
 * 
 * @RequestParam String purityName, @RequestParam String purity, @RequestParam
 * String itemPurityType) { GoldDirectory saved =
 * secureGoldLoanService.saveGoldDirectory(karat, silverRate, goldRate,
 * itemMasterType, itemName, lockerLocation, lockerAddress, purityName, purity,
 * itemPurityType); return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK,
 * "Today's rate saved successfully", saved)); }
 */

// 2. Save Item Master
//	@PostMapping("/saveItemMaster")
//	public ResponseEntity<ApiResponse<GoldDirectory>> saveItemMaster(@RequestParam String itemMasterType,
//			@RequestParam String itemName) {
//		GoldDirectory saved = secureGoldLoanService.saveItemMaster(itemMasterType, itemName);
//		return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Item Master saved successfully", saved));
//	}
//
//	// 3. Save Locker Master
//	@PostMapping("/saveLockerMaster")
//	public ResponseEntity<ApiResponse<GoldDirectory>> saveLockerMaster(@RequestParam String lockerLocation,
//			@RequestParam String lockerAddress) {
//		GoldDirectory saved = secureGoldLoanService.saveLockerMaster(lockerLocation, lockerAddress);
//		return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Locker Master saved successfully", saved));
//	}
//
//	// 4. Save Purity Master
//	@PostMapping("/savePurityMaster")
//	public ResponseEntity<ApiResponse<GoldDirectory>> savePurityMaster(@RequestParam String purityName,
//			@RequestParam String purity, @RequestParam String itemPurityType) {
//		GoldDirectory saved = secureGoldLoanService.savePurityMaster(purityName, purity, itemPurityType);
//		return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Purity Master saved successfully", saved));
//	}
