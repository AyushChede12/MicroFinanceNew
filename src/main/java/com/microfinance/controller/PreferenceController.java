package com.microfinance.controller;

import java.io.IOException;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.ExecutiveFounderDto;
import com.microfinance.model.BankModule;
import com.microfinance.model.BranchModule;
import com.microfinance.model.CasteModule;
import com.microfinance.model.CategoryModule;
import com.microfinance.model.CompanyAdministration;
import com.microfinance.model.ExecutiveFounder;
import com.microfinance.model.RelativeModule;
import com.microfinance.model.Statedistricts;
import com.microfinance.model.states;
import com.microfinance.repository.StateDistrictRepo;
import com.microfinance.model.FinancialYear;
import com.microfinance.service.PreferenceService;

@RestController
@RequestMapping("/api/preference")
public class PreferenceController {

	@Autowired
	PreferenceService preferenceService;

	@Autowired
	StateDistrictRepo stateDistrictRepo;

	@Value("${upload.directory}")
	private String uploadDirectory;


//	@PostMapping("/saveAndUpdateAllBranchModule") // Ayush (without DTO)
//	public ResponseEntity<ApiResponse<BranchModule>> saveBranch(@RequestBody BranchModule branchModule) {
//		BranchModule savedEntity = preferenceService.saveBranchModule(branchModule);
//		String message = (branchModule.getId() == null) ? "Branch created successfully" : "Branch updated successfully";
//		ApiResponse<BranchModule> response = new ApiResponse<>(true, HttpStatus.OK, message, savedEntity);
//		return ResponseEntity.ok(response);
//	}
//
//	@GetMapping("/getAllBranchModule") // Ayush (without DTO)
//	public ResponseEntity<ApiResponse<List<BranchModule>>> fetchAllBranchModule() {
//		List<BranchModule> list = preferenceService.fetchAllBranchModule();
//		ApiResponse<List<BranchModule>> response = new ApiResponse<>(true, HttpStatus.OK,
//				"Branch modules fetched successfully", list);
//		return ResponseEntity.ok(response);
//
//	}
//
//	@GetMapping("/getBranchModuleById") // Ayush
//	public ResponseEntity<ApiResponse<BranchModule>> findBranchModuleById(@RequestParam("id") Long id) {
//		Optional<BranchModule> branch = preferenceService.findBranchDataById(id);
//		if (branch.isPresent()) {
//			ApiResponse<BranchModule> response = new ApiResponse<>(true, HttpStatus.OK,
//					"BranchModule fetched successfully", branch.get());
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<BranchModule> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
//					"BranchModule not found for ID: " + id, null);
//			return ResponseEntity.status(404).body(response);
//		}
//	}
//
//	@PostMapping("/deleteBranchModuleById") // Ayush
//	public ResponseEntity<ApiResponse<String>> deleteBranchModule(@RequestParam("id") Long id) {
//		boolean isDeleted = preferenceService.deleteBranchModule(id);
//		if (isDeleted) {
//			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK, "Branch module deleted successfully",
//					"success");
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
//					"Branch module deletion failed", "failure");
//			return ResponseEntity.badRequest().body(response);
//		}
//	}
//
//	// Bank Module - Ayush
//	@PostMapping("/saveAndUpdateAllBankModule") // Ayush (without DTO)
//	public ResponseEntity<ApiResponse<BankModule>> saveBank(@RequestBody BankModule bankModule) {
//		BankModule savedEntity = preferenceService.saveBankModule(bankModule);
//		String message = (bankModule.getId() == null) ? "Bank created successfully" : "Bank updated successfully";
//		ApiResponse<BankModule> response = new ApiResponse<>(true, HttpStatus.OK, message, savedEntity);
//		return ResponseEntity.ok(response);
//	}
//
//	@GetMapping("/getAllBankModule") // Ayush (without DTO)
//	public ResponseEntity<ApiResponse<List<BankModule>>> fetchAllBankModule() {
//		List<BankModule> list = preferenceService.fetchAllBankModule();
//		ApiResponse<List<BankModule>> response = new ApiResponse<>(true, HttpStatus.OK,
//				"Bank modules fetched successfully", list);
//		return ResponseEntity.ok(response);
//	}
//
//	@GetMapping("/getBankModuleById") // Ayush
//	public ResponseEntity<ApiResponse<BankModule>> findBankModuleById(@RequestParam("id") Long id) {
//		Optional<BankModule> bank = preferenceService.findBankDataById(id);
//		if (bank.isPresent()) {
//			ApiResponse<BankModule> response = new ApiResponse<>(true, HttpStatus.OK,
//					"Bank Module fetched successfully", bank.get());
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<BankModule> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
//					"Bank Module not found for ID: " + id, null);
//			return ResponseEntity.status(404).body(response);
//		}
//	}
//
//	@PostMapping("/deleteBankModuleById") // Ayush
//	public ResponseEntity<ApiResponse<String>> deleteBankModule(@RequestParam("id") Long id) {
//		boolean isDeleted = preferenceService.deleteBankModule(id);
//		if (isDeleted) {
//			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK, "Bank module deleted successfully",
//					"success");
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND, "Bank module deletion failed",
//					"failure");
//			return ResponseEntity.badRequest().body(response);
//		}
//	}
//
//	// Relative Module - Ayush
//	@PostMapping("/saveRelativeModule") // Ayush (without DTO)
//	public ResponseEntity<ApiResponse<RelativeModule>> saveRelative(@RequestBody RelativeModule relativeModule) {
//		RelativeModule savedEntity = preferenceService.saveRelativeModule(relativeModule);
//		ApiResponse<RelativeModule> response = new ApiResponse<>(true, HttpStatus.OK, "Relative Saved Successfully",
//				savedEntity);
//		return ResponseEntity.ok(response);
//	}
//
//	@GetMapping("/getAllRelativeModule") // Ayush (without DTO)
//	public ResponseEntity<ApiResponse<List<RelativeModule>>> fetchAllRelativeModule() {
//		List<RelativeModule> list = preferenceService.fetchAllRelativeModule();
//		ApiResponse<List<RelativeModule>> response = new ApiResponse<>(true, HttpStatus.OK,
//				"Relative modules fetched successfully", list);
//		return ResponseEntity.ok(response);
//	}
//
//	@PostMapping("/deleteRelativeModuleById") // Ayush
//	public ResponseEntity<ApiResponse<String>> deleteRelativeModule(@RequestParam("id") Long id) {
//		boolean isDeleted = preferenceService.deleteRelativeModule(id);
//		if (isDeleted) {
//			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK,
//					"Relative module deleted successfully", "success");
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
//					"Relative module deletion failed", "failure");
//			return ResponseEntity.badRequest().body(response);
//		}
//	}
//
//	@GetMapping("/getAllStates") // Niraj
//	@ResponseBody
//	public List<states> getAllStates() {
//		List<states> list = preferenceService.getAllStates();
//		return list;
//	}
//
//	@GetMapping("/getAllDistrictsByStateId") // Niraj
//	@ResponseBody
//	public Map<String, List<Statedistricts>> getAllDistrictsByStateId(@RequestParam("stateId") int stateId) {
//		List<Statedistricts> data = stateDistrictRepo.findBystateId(stateId);
//		Map<String, List<Statedistricts>> response = new HashMap<>();
//		response.put("allDistricts", data);
//		return response;
//	}
//
//	// Caste Module - Ayush
//	@PostMapping("/saveCasteModule") // Ayush (without DTO)
//	public ResponseEntity<ApiResponse<CasteModule>> saveCaste(@RequestBody CasteModule casteModule) {
//		CasteModule savedEntity = preferenceService.saveCasteModule(casteModule);
//		ApiResponse<CasteModule> response = new ApiResponse<>(true, HttpStatus.OK, "Caste Saved Successfully",
//				savedEntity);
//		return ResponseEntity.ok(response);
//	}
//
//	@GetMapping("/getAllCasteModule") // Ayush (without DTO)
//	public ResponseEntity<ApiResponse<List<CasteModule>>> fetchAllCasteModule() {
//		List<CasteModule> list = preferenceService.fetchAllCasteModule();
//		ApiResponse<List<CasteModule>> response = new ApiResponse<>(true, HttpStatus.OK,
//				"Caste modules fetched successfully", list);
//		return ResponseEntity.ok(response);
//	}
//
//	@PostMapping("/deleteCasteModuleById") // Ayush
//	public ResponseEntity<ApiResponse<String>> deleteCasteModule(@RequestParam("id") Long id) {
//		boolean isDeleted = preferenceService.deleteCasteModule(id);
//		if (isDeleted) {
//			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK, "Caste module deleted successfully",
//					"success");
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
//					"Caste module deletion failed", "failure");
//			return ResponseEntity.badRequest().body(response);
//		}
//	}
//
//	// Category Module - Ayush
//	@PostMapping("/saveCategoryModule")
//	public ResponseEntity<ApiResponse<CategoryModule>> saveCaste(@RequestBody CategoryModule categoryModule) {
//		CategoryModule savedEntity = preferenceService.saveCategoryModule(categoryModule);
//		ApiResponse<CategoryModule> response = new ApiResponse<>(true, HttpStatus.OK, "Category Saved Successfully",
//				savedEntity);
//		return ResponseEntity.ok(response);
//	}
//
//	@GetMapping("/getAllCategoryModule")
//	public ResponseEntity<ApiResponse<List<CategoryModule>>> fetchAllCategoryModule() {
//		List<CategoryModule> list = preferenceService.fetchAllCategoryModule();
//		ApiResponse<List<CategoryModule>> response = new ApiResponse<>(true, HttpStatus.OK,
//				"Category modules fetched successfully", list);
//		return ResponseEntity.ok(response);
//	}
//
//	@PostMapping("/deleteCategoryModuleById") // Ayush
//	public ResponseEntity<ApiResponse<String>> deleteCategoryModule(@RequestParam("id") Long id) {
//		boolean isDeleted = preferenceService.deleteCategoryModule(id);
//		if (isDeleted) {
//			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK,
//					"Category module deleted successfully", "success");
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
//					"Category module deletion failed", "failure");
//			return ResponseEntity.badRequest().body(response);
//		}
//	}
//
//	// Financial Year - Ayush
//	@PostMapping("/saveAndUpdateAllFinancialYear") // Ayush (without DTO)
//	public ResponseEntity<ApiResponse<FinancialYear>> saveFinancialYear(@RequestBody FinancialYear financialYear) {
//		FinancialYear savedEntity = preferenceService.saveFinancialYear(financialYear);
//		String message = (financialYear.getId() == null) ? "Financial Year created successfully"
//				: "Financial Year updated successfully";
//		ApiResponse<FinancialYear> response = new ApiResponse<>(true, HttpStatus.OK, message, savedEntity);
//		return ResponseEntity.ok(response);
//	}
//
//	@GetMapping("/getAllFinancialYear")
//	public ResponseEntity<ApiResponse<List<FinancialYear>>> fetchAllFinancialYear() {
//		List<FinancialYear> list = preferenceService.fetchAllFinancialYear();
//		ApiResponse<List<FinancialYear>> response = new ApiResponse<>(true, HttpStatus.OK,
//				"Financial Year fetched successfully", list);
//		return ResponseEntity.ok(response);
//	}
//
//	@GetMapping("/getFinancialYearById") // Ayush
//	public ResponseEntity<ApiResponse<FinancialYear>> findFinancialYearById(@RequestParam("id") Long id) {
//		Optional<FinancialYear> fyear = preferenceService.findFinancialYearById(id);
//		if (fyear.isPresent()) {
//			ApiResponse<FinancialYear> response = new ApiResponse<>(true, HttpStatus.OK,
//					"Financial Year fetched successfully", fyear.get());
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<FinancialYear> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
//					"Financial Year not found for ID: " + id, null);
//			return ResponseEntity.status(404).body(response);
//		}
//	}
//
//	@PostMapping("/deleteFinancialYearById") // Ayush
//	public ResponseEntity<ApiResponse<String>> deleteFinancialYear(@RequestParam("id") Long id) {
//		boolean isDeleted = preferenceService.deleteFinancialYear(id);
//		if (isDeleted) {
//			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK, "Financial Year deleted successfully",
//					"success");
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
//					"Financial Year deletion failed", "failure");
//			return ResponseEntity.badRequest().body(response);
//		}
//	}
//
//	// Executive Founder(With DTO) - Ayush
//	@ResponseBody
//	@PostMapping("/saveExecutiveFounder")
//	public ResponseEntity<ApiResponse<ExecutiveFounder>> saveExecutiveFounderData(
//			@ModelAttribute ExecutiveFounderDto executiveFounderDto,
//			@RequestParam(value = "photo", required = false) MultipartFile photo,
//			@RequestParam(value = "signature", required = false) MultipartFile signature) {
//
//		if (photo != null) {
//			System.out.println("Received photo: " + photo.getOriginalFilename());
//		}
//		if (signature != null) {
//			System.out.println("Received signature: " + signature.getOriginalFilename());
//		}
//
//		ApiResponse<ExecutiveFounder> response = preferenceService.saveExecutiveFounder(executiveFounderDto, photo,
//				signature);
//		// return new ResponseEntity<>(response, response.getStatus());
//		return ResponseEntity.ok(new ApiResponse<>(
//                true,
//                HttpStatus.OK,
//                executiveFounderDto.getId() != null ? "Data updated successfully" : "Data saved successfully",
//                response.getData()
//        ));
//	}
//	
//	@GetMapping("/fetchAllExecutiveFounder")
//	public ResponseEntity<ApiResponse<List<ExecutiveFounder>>> fetchAllExecutiveFounder() {
//		List<ExecutiveFounder> list = preferenceService.fetchAllExecutiveFounder();
//		ApiResponse<List<ExecutiveFounder>> response = new ApiResponse<>(true, HttpStatus.OK,
//				"Executive Founder fetched successfully", list);
//		return ResponseEntity.ok(response);
//	}
//	
//	@PostMapping("/deleteExecutiveFounder") // Ayush
//	public ResponseEntity<ApiResponse<String>> deleteExecutiveFounder(@RequestParam("id") Long id) {
//		boolean isDeleted = preferenceService.deleteExecutiveFounder(id);
//		if (isDeleted) {
//			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK, "Executive Founder deleted successfully",
//					"success");
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
//					"Executive Founder deletion failed", "failure");
//			return ResponseEntity.badRequest().body(response);
//		}
//	}
//	
//	@GetMapping("/fetchExecutiveFounderById") // Ayush
//	public ResponseEntity<ApiResponse<ExecutiveFounder>> findExecutiveFounderById(@RequestParam("id") Long id) {
//		Optional<ExecutiveFounder> exePromoter = preferenceService.findExecutiveFounderById(id);
//		if (exePromoter.isPresent()) {
//			ApiResponse<ExecutiveFounder> response = new ApiResponse<>(true, HttpStatus.OK,
//					"Executive Founder fetched successfully", exePromoter.get());
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<ExecutiveFounder> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
//					"Executive Founder not found for ID: " + id, null);
//			return ResponseEntity.status(404).body(response);
//		}
//	}
//
//	// Customer Administration - Ayush
//	@GetMapping("/fetchAllCompanyAdministration") // Ayush (without DTO)
//	public ResponseEntity<ApiResponse<List<CompanyAdministration>>> fetchAllCompanyAdministration() {
//		List<CompanyAdministration> list = preferenceService.fetchAllCompanyAdministration();
//		ApiResponse<List<CompanyAdministration>> response = new ApiResponse<>(true, HttpStatus.OK,
//				"Company Administration fetched successfully", list);
//		return ResponseEntity.ok(response);
//	}
//
//	@PostMapping("/updateDataOfCompanyAdministration")
//	public ResponseEntity<ApiResponse<String>> updateCompanyAdministration(
//			@RequestBody CompanyAdministration companyAdministration) {
//
//		int result = preferenceService.updateCompanyAdministration(companyAdministration);
//
//		if (result > 0) {
//			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK,
//					"Company administration data updated successfully.", "success");
//			return ResponseEntity.ok(response);
//		} else {
//			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.BAD_REQUEST,
//					"Failed to update company administration data.", "failure");
//			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
//		}
//	}

}

	@PostMapping("/saveAndUpdateAllBranchModule") // Ayush (without DTO)
	public ResponseEntity<ApiResponse<BranchModule>> saveBranch(@RequestBody BranchModule branchModule) {
		BranchModule savedEntity = preferenceService.saveBranchModule(branchModule);
		String message = (branchModule.getId() == null) ? "Branch created successfully" : "Branch updated successfully";
		ApiResponse<BranchModule> response = new ApiResponse<>(true, HttpStatus.OK, message, savedEntity);
		return ResponseEntity.ok(response);
	}

	@GetMapping("/getAllBranchModule") // Ayush (without DTO)
	public ResponseEntity<ApiResponse<List<BranchModule>>> fetchAllBranchModule() {
		List<BranchModule> list = preferenceService.fetchAllBranchModule();
		ApiResponse<List<BranchModule>> response = new ApiResponse<>(true, HttpStatus.OK,
				"Branch modules fetched successfully", list);
		return ResponseEntity.ok(response);

	}

	@GetMapping("/getBranchModuleById") // Ayush
	public ResponseEntity<ApiResponse<BranchModule>> findBranchModuleById(@RequestParam("id") Long id) {
		Optional<BranchModule> branch = preferenceService.findBranchDataById(id);
		if (branch.isPresent()) {
			ApiResponse<BranchModule> response = new ApiResponse<>(true, HttpStatus.OK,
					"BranchModule fetched successfully", branch.get());
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<BranchModule> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
					"BranchModule not found for ID: " + id, null);
			return ResponseEntity.status(404).body(response);
		}
	}

	@PostMapping("/deleteBranchModuleById") // Ayush
	public ResponseEntity<ApiResponse<String>> deleteBranchModule(@RequestParam("id") Long id) {
		boolean isDeleted = preferenceService.deleteBranchModule(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK, "Branch module deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
					"Branch module deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}

	// Bank Module - Ayush
	@PostMapping("/saveAndUpdateAllBankModule") // Ayush (without DTO)
	public ResponseEntity<ApiResponse<BankModule>> saveBank(@RequestBody BankModule bankModule) {
		BankModule savedEntity = preferenceService.saveBankModule(bankModule);
		String message = (bankModule.getId() == null) ? "Bank created successfully" : "Bank updated successfully";
		ApiResponse<BankModule> response = new ApiResponse<>(true, HttpStatus.OK, message, savedEntity);
		return ResponseEntity.ok(response);
	}

	@GetMapping("/getAllBankModule") // Ayush (without DTO)
	public ResponseEntity<ApiResponse<List<BankModule>>> fetchAllBankModule() {
		List<BankModule> list = preferenceService.fetchAllBankModule();
		ApiResponse<List<BankModule>> response = new ApiResponse<>(true, HttpStatus.OK,
				"Bank modules fetched successfully", list);
		return ResponseEntity.ok(response);
	}

	@GetMapping("/getBankModuleById") // Ayush
	public ResponseEntity<ApiResponse<BankModule>> findBankModuleById(@RequestParam("id") Long id) {
		Optional<BankModule> bank = preferenceService.findBankDataById(id);
		if (bank.isPresent()) {
			ApiResponse<BankModule> response = new ApiResponse<>(true, HttpStatus.OK,
					"Bank Module fetched successfully", bank.get());
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<BankModule> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
					"Bank Module not found for ID: " + id, null);
			return ResponseEntity.status(404).body(response);
		}
	}

	@PostMapping("/deleteBankModuleById") // Ayush
	public ResponseEntity<ApiResponse<String>> deleteBankModule(@RequestParam("id") Long id) {
		boolean isDeleted = preferenceService.deleteBankModule(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK, "Bank module deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND, "Bank module deletion failed",
					"failure");
			return ResponseEntity.badRequest().body(response);
		}
	}

	// Relative Module - Ayush
	@PostMapping("/saveRelativeModule") // Ayush (without DTO)
	public ResponseEntity<ApiResponse<RelativeModule>> saveRelative(@RequestBody RelativeModule relativeModule) {
		RelativeModule savedEntity = preferenceService.saveRelativeModule(relativeModule);
		ApiResponse<RelativeModule> response = new ApiResponse<>(true, HttpStatus.OK, "Relative Saved Successfully",
				savedEntity);
		return ResponseEntity.ok(response);
	}

	@GetMapping("/getAllRelativeModule") // Ayush (without DTO)
	public ResponseEntity<ApiResponse<List<RelativeModule>>> fetchAllRelativeModule() {
		List<RelativeModule> list = preferenceService.fetchAllRelativeModule();
		ApiResponse<List<RelativeModule>> response = new ApiResponse<>(true, HttpStatus.OK,
				"Relative modules fetched successfully", list);
		return ResponseEntity.ok(response);
	}

	@PostMapping("/deleteRelativeModuleById") // Ayush
	public ResponseEntity<ApiResponse<String>> deleteRelativeModule(@RequestParam("id") Long id) {
		boolean isDeleted = preferenceService.deleteRelativeModule(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK,
					"Relative module deleted successfully", "success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
					"Relative module deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}

	@GetMapping("/getAllStates") // Niraj
	@ResponseBody
	public List<states> getAllStates() {
		List<states> list = preferenceService.getAllStates();
		return list;
	}

	@GetMapping("/getAllDistrictsByStateId") // Niraj
	@ResponseBody
	public Map<String, List<Statedistricts>> getAllDistrictsByStateId(@RequestParam("stateId") int stateId) {
		List<Statedistricts> data = stateDistrictRepo.findBystateId(stateId);
		Map<String, List<Statedistricts>> response = new HashMap<>();
		response.put("allDistricts", data);
		return response;
	}

	// Caste Module - Ayush
	@PostMapping("/saveCasteModule") // Ayush (without DTO)
	public ResponseEntity<ApiResponse<CasteModule>> saveCaste(@RequestBody CasteModule casteModule) {
		CasteModule savedEntity = preferenceService.saveCasteModule(casteModule);
		ApiResponse<CasteModule> response = new ApiResponse<>(true, HttpStatus.OK, "Caste Saved Successfully",
				savedEntity);
		return ResponseEntity.ok(response);
	}

	@GetMapping("/getAllCasteModule") // Ayush (without DTO)
	public ResponseEntity<ApiResponse<List<CasteModule>>> fetchAllCasteModule() {
		List<CasteModule> list = preferenceService.fetchAllCasteModule();
		ApiResponse<List<CasteModule>> response = new ApiResponse<>(true, HttpStatus.OK,
				"Caste modules fetched successfully", list);
		return ResponseEntity.ok(response);
	}

	@PostMapping("/deleteCasteModuleById") // Ayush
	public ResponseEntity<ApiResponse<String>> deleteCasteModule(@RequestParam("id") Long id) {
		boolean isDeleted = preferenceService.deleteCasteModule(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK, "Caste module deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
					"Caste module deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}

	// Category Module - Ayush
	@PostMapping("/saveCategoryModule")
	public ResponseEntity<ApiResponse<CategoryModule>> saveCaste(@RequestBody CategoryModule categoryModule) {
		CategoryModule savedEntity = preferenceService.saveCategoryModule(categoryModule);
		ApiResponse<CategoryModule> response = new ApiResponse<>(true, HttpStatus.OK, "Category Saved Successfully",
				savedEntity);
		return ResponseEntity.ok(response);
	}

	@GetMapping("/getAllCategoryModule")
	public ResponseEntity<ApiResponse<List<CategoryModule>>> fetchAllCategoryModule() {
		List<CategoryModule> list = preferenceService.fetchAllCategoryModule();
		ApiResponse<List<CategoryModule>> response = new ApiResponse<>(true, HttpStatus.OK,
				"Category modules fetched successfully", list);
		return ResponseEntity.ok(response);
	}

	@PostMapping("/deleteCategoryModuleById") // Ayush
	public ResponseEntity<ApiResponse<String>> deleteCategoryModule(@RequestParam("id") Long id) {
		boolean isDeleted = preferenceService.deleteCategoryModule(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK,
					"Category module deleted successfully", "success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
					"Category module deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}

	// Financial Year - Ayush
	@PostMapping("/saveAndUpdateAllFinancialYear") // Ayush (without DTO)
	public ResponseEntity<ApiResponse<FinancialYear>> saveFinancialYear(@RequestBody FinancialYear financialYear) {
		FinancialYear savedEntity = preferenceService.saveFinancialYear(financialYear);
		String message = (financialYear.getId() == null) ? "Financial Year created successfully"
				: "Financial Year updated successfully";
		ApiResponse<FinancialYear> response = new ApiResponse<>(true, HttpStatus.OK, message, savedEntity);
		return ResponseEntity.ok(response);
	}

	@GetMapping("/getAllFinancialYear")
	public ResponseEntity<ApiResponse<List<FinancialYear>>> fetchAllFinancialYear() {
		List<FinancialYear> list = preferenceService.fetchAllFinancialYear();
		ApiResponse<List<FinancialYear>> response = new ApiResponse<>(true, HttpStatus.OK,
				"Financial Year fetched successfully", list);
		return ResponseEntity.ok(response);
	}

	@GetMapping("/getFinancialYearById") // Ayush
	public ResponseEntity<ApiResponse<FinancialYear>> findFinancialYearById(@RequestParam("id") Long id) {
		Optional<FinancialYear> fyear = preferenceService.findFinancialYearById(id);
		if (fyear.isPresent()) {
			ApiResponse<FinancialYear> response = new ApiResponse<>(true, HttpStatus.OK,
					"Financial Year fetched successfully", fyear.get());
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<FinancialYear> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
					"Financial Year not found for ID: " + id, null);
			return ResponseEntity.status(404).body(response);
		}
	}

	@PostMapping("/deleteFinancialYearById") // Ayush
	public ResponseEntity<ApiResponse<String>> deleteFinancialYear(@RequestParam("id") Long id) {
		boolean isDeleted = preferenceService.deleteFinancialYear(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK, "Financial Year deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
					"Financial Year deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}

	// Executive Founder(With DTO) - Ayush
	@ResponseBody
	@PostMapping("/saveExecutiveFounder")
	public ResponseEntity<ApiResponse<ExecutiveFounder>> saveExecutiveFounderData(
			@ModelAttribute ExecutiveFounderDto executiveFounderDto,
			@RequestParam(value = "photo", required = false) MultipartFile photo,
			@RequestParam(value = "signature", required = false) MultipartFile signature) {

		if (photo != null) {
			System.out.println("Received photo: " + photo.getOriginalFilename());
		}
		if (signature != null) {
			System.out.println("Received signature: " + signature.getOriginalFilename());
		}

		ApiResponse<ExecutiveFounder> response = preferenceService.saveExecutiveFounder(executiveFounderDto, photo,
				signature);
		// return new ResponseEntity<>(response, response.getStatus());
		return ResponseEntity.ok(new ApiResponse<>(
                true,
                HttpStatus.OK,
                executiveFounderDto.getId() != null ? "Data updated successfully" : "Data saved successfully",
                response.getData()
        ));
	}
	
	@GetMapping("/fetchAllExecutiveFounder")
	public ResponseEntity<ApiResponse<List<ExecutiveFounder>>> fetchAllExecutiveFounder() {
		List<ExecutiveFounder> list = preferenceService.fetchAllExecutiveFounder();
		ApiResponse<List<ExecutiveFounder>> response = new ApiResponse<>(true, HttpStatus.OK,
				"Executive Founder fetched successfully", list);
		return ResponseEntity.ok(response);
	}
	
	@PostMapping("/deleteExecutiveFounder") // Ayush
	public ResponseEntity<ApiResponse<String>> deleteExecutiveFounder(@RequestParam("id") Long id) {
		boolean isDeleted = preferenceService.deleteExecutiveFounder(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK, "Executive Founder deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
					"Executive Founder deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}
	
	@GetMapping("/fetchExecutiveFounderById") // Ayush
	public ResponseEntity<ApiResponse<ExecutiveFounder>> findExecutiveFounderById(@RequestParam("id") Long id) {
		Optional<ExecutiveFounder> exePromoter = preferenceService.findExecutiveFounderById(id);
		if (exePromoter.isPresent()) {
			ApiResponse<ExecutiveFounder> response = new ApiResponse<>(true, HttpStatus.OK,
					"Executive Founder fetched successfully", exePromoter.get());
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<ExecutiveFounder> response = new ApiResponse<>(false, HttpStatus.NOT_FOUND,
					"Executive Founder not found for ID: " + id, null);
			return ResponseEntity.status(404).body(response);
		}
	}

	// Customer Administration - Ayush
	@GetMapping("/fetchAllCompanyAdministration") // Ayush (without DTO)
	public ResponseEntity<ApiResponse<List<CompanyAdministration>>> fetchAllCompanyAdministration() {
		List<CompanyAdministration> list = preferenceService.fetchAllCompanyAdministration();
		ApiResponse<List<CompanyAdministration>> response = new ApiResponse<>(true, HttpStatus.OK,
				"Company Administration fetched successfully", list);
		return ResponseEntity.ok(response);
	}

	@PostMapping("/updateDataOfCompanyAdministration")
	public ResponseEntity<ApiResponse<String>> updateCompanyAdministration(
			@RequestBody CompanyAdministration companyAdministration) {

		int result = preferenceService.updateCompanyAdministration(companyAdministration);

		if (result > 0) {
			ApiResponse<String> response = new ApiResponse<>(true, HttpStatus.OK,
					"Company administration data updated successfully.", "success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(false, HttpStatus.BAD_REQUEST,
					"Failed to update company administration data.", "failure");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
		}
	}

}

