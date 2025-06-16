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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

@Controller
public class PreferenceController {
	
	@Autowired
	PreferenceService preferenceService;
	
	@Autowired
	StateDistrictRepo stateDistrictRepo;
	
	@Value("${upload.directory}")
	private String uploadDirectory;
	
	//Branch Module - Ayush
	@PostMapping("/saveAllBranchModule")
	@ResponseBody
	public ResponseEntity<String> saveBranchMaster(@RequestBody BranchModule branchmodule) {
		BranchModule branch=preferenceService.saveAllBranchModule(branchmodule);
		if(branch!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	@GetMapping("/getAllBranchModule")               //Ayush
	@ResponseBody
	public List<BranchModule> fetchAllBranchModule(){
		List<BranchModule> list = preferenceService.fetchAllBranchModule();
		return list;
	}
	
	@GetMapping("/getBranchModuleById")           //Ayush
	@ResponseBody
	public Optional<BranchModule> findBranchModuleById(@RequestParam("id") Long id) {
		Optional<BranchModule> branch=preferenceService.findBranchDataById(id);
		return branch;
	}
	
	@PostMapping("/updateBranchModuleById")               //Ayush
	@ResponseBody
	public ResponseEntity<String> updateBranchModule(@RequestBody BranchModule branchModule) {
		BranchModule updateBranch=preferenceService.updateAllBranchModule(branchModule);
		if(updateBranch!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("failure");
	}
	
	@PostMapping("/deleteBranchModuleById")             //Ayush
	@ResponseBody
	public ResponseEntity<String> deleteBranchModule(@RequestParam("id") Long id) {
		Boolean deleteBranch=preferenceService.deleteBranchModule(id);
		if(deleteBranch!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("failure");
	}
	
	
	//Bank Module - Ayush
	@PostMapping("/saveAllBankModule")
	@ResponseBody
	public ResponseEntity<String> saveBankModule(@RequestBody BankModule bankModule) {
		BankModule bank = preferenceService.saveAllBankModule(bankModule);
		if(bank!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	@GetMapping("/getAllBankModule")                   //Ayush
	@ResponseBody
	public List<BankModule> fetchAllBankModule(){
		List<BankModule> list = preferenceService.fetchAllBankModule();
		return list;
	}
	
	@GetMapping("/getBankModuleById")                      //Ayush
	@ResponseBody
	public Optional<BankModule> findBankModuleById(@RequestParam("id") Long id) {
		Optional<BankModule> bank=preferenceService.findBankDataById(id);
		return bank;
	}
	
	@PostMapping("/updateBankModuleById")                  //Ayush
	@ResponseBody
	public ResponseEntity<String> updateBankModule(@RequestBody BankModule bankModule) {
		BankModule updateBank=preferenceService.updateBankModuleById(bankModule);
		if(updateBank!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("failure");
	}
	
	@PostMapping("/deleteBankModuleById")                  //Ayush
	@ResponseBody
	public ResponseEntity<String> deleteBankModule(@RequestParam("id") Long id) {
		Boolean deleteBank=preferenceService.deleteBankModule(id);
		if(deleteBank!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("failure");
	}
	
	//Relative Module - Ayush
	@PostMapping("/saveAllRelativeModule")
	@ResponseBody
	public ResponseEntity<String> saveRelativeModule(@RequestBody RelativeModule relativeModule) {
		RelativeModule relative = preferenceService.saveAllRelativeModule(relativeModule);
		if(relative!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	@GetMapping("/getAllRelativeModule")                       //Ayush
	@ResponseBody
	public List<RelativeModule> fetchAllRelativeModule(){
		List<RelativeModule> list = preferenceService.fetchAllRelativeModule();
		return list;
	}
	
	@GetMapping("/getAllStates")                       //Niraj
	@ResponseBody
	public List<states> getAllStates(){
		List<states> list = preferenceService.getAllStates();
		return list;
	}
	
	
	@GetMapping("/getAllDistrictsByStateId")                 //Niraj
	@ResponseBody
	public Map<String, List<Statedistricts>> getAllDistrictsByStateId(@RequestParam("stateId") int stateId) {
	    List<Statedistricts> data = stateDistrictRepo.findBystateId(stateId);
	    Map<String, List<Statedistricts>> response = new HashMap<>();
	    response.put("allDistricts", data);
	    return response;
	}

	
	//Caste Module - Ayush
	@PostMapping("/saveAllCasteModule")
	@ResponseBody
	public ResponseEntity<String> saveCasteModuleData(@RequestBody CasteModule castemodule) {
		CasteModule caste=preferenceService.saveCasteModule(castemodule);
		if(caste!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("failure");
	}
	
	@GetMapping("/getAllCasteModule")             //Ayush
	@ResponseBody
	public List<CasteModule> fetchAllCasteModule(){
		List<CasteModule> list = preferenceService.fetchAllCasteModule();
		return list;
	}
	
	//Category Module - Ayush
	@PostMapping("/saveAllCategoryModule")
	public ResponseEntity<String> saveCategoryModuleData(@RequestBody CategoryModule categorymodule) {
	    CategoryModule category = preferenceService.saveCategoryModule(categorymodule);
	    if (category != null)
	        return ResponseEntity.ok("success");
	    else
	        return ResponseEntity.badRequest().body("failure");
	}

	 
	@GetMapping("/getAllCategoryModule")                      //Ayush
	@ResponseBody
	public List<CategoryModule> fetchAllCategoryModule(){
		List<CategoryModule> list = preferenceService.fetchAllCategoryModule();
		return list;
	}
	// ayush branch
	//Financial Year - Ayush
	@PostMapping("/saveFinancialYear")
	public ResponseEntity<String> saveFinancialYearData(@RequestBody FinancialYear financialyear) {
	    FinancialYear fy = preferenceService.saveFinancialYear(financialyear);
	    if (fy != null)
	        return ResponseEntity.ok("success");
	    else
	        return ResponseEntity.badRequest().body("failure");
	}
	
	@GetMapping("/getAllFinancialYear")                   //Ayush
	@ResponseBody
	public List<FinancialYear> fetchAllFinancialYear(){
		List<FinancialYear> list = preferenceService.fetchAllFinancialYear();
		return list;
	}

	
	//Executive Founder(With DTO) - Ayush
	@ResponseBody
	@PostMapping("/saveExecutiveFounder")
	public ResponseEntity<ApiResponse<ExecutiveFounder>> saveExecutiveFounderData(
	        @ModelAttribute ExecutiveFounderDto executiveFounderDto,
	        @RequestParam(value = "photo", required = false) MultipartFile photo, @RequestParam(value = "signature", required = false) MultipartFile signature) {	 
		
		if (photo != null) {
	        System.out.println("Received photo: " + photo.getOriginalFilename());
	    }
		if (signature != null) {
	        System.out.println("Received signature: " + signature.getOriginalFilename());
	    }
	    
	    ApiResponse<ExecutiveFounder> response = preferenceService.saveExecutiveFounder(executiveFounderDto, photo, signature);
	    //return new ResponseEntity<>(response, response.getStatus());
	    return ResponseEntity.ok(new ApiResponse<ExecutiveFounder>("OK", executiveFounderDto.getId() != 0 ? "Data updated successfully" : "Data saved successfully", response));
	}
	
	@ResponseBody                  //Ayush
	@PostMapping("/fetchAllExecutiveFounder")
	public List<ExecutiveFounder> getAllExecutiveFounderData() {
		List<ExecutiveFounder> list = preferenceService.fetchAllExecutiveFounder();
		return list;
	}
	
	@ResponseBody                   //Ayush
	@PostMapping("/deleteExecutiveFounder")
	public ResponseEntity<String> deleteDirectorPromoter(@RequestParam long id) {
		boolean bool = preferenceService.deleteExecutiveFounder(id);
		if (bool) {
			return ResponseEntity.ok("Data Deleted Successfully!!");
		} else
			return ResponseEntity.badRequest().body("Data Not Found");
	}
	
	@ResponseBody            //Ayush
	@PostMapping("/fetchExecutiveFounderById")
	public ExecutiveFounder getExecutiveFounderById(@RequestParam long id){
		ExecutiveFounder exeFounder = preferenceService.fetchExecutiveById(id);
		return exeFounder;		
	}
	
	//Customer Administration - Ayush
	@ResponseBody
	@PostMapping("/fetchAllCompanyAdministration")
	public List<CompanyAdministration> getCompanyAdministrationData() {
		List<CompanyAdministration> companyAdmin = preferenceService.fetchAllCompanyAdministration();
		return companyAdmin;
	}
	
	@ResponseBody               //Ayush
	@PostMapping("/updateDataOfCompanyAdministration")
	public ResponseEntity<String> updateCompanyAdministration(@RequestBody CompanyAdministration companyAdministration){
		int i=preferenceService.updateCompanyAdministration(companyAdministration);
		if(i>0)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	
	

}
