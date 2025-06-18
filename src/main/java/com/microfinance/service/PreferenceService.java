package com.microfinance.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.BranchModuleDto;
import com.microfinance.dto.ExecutiveFounderDto;
import com.microfinance.model.BankModule;
import com.microfinance.model.BranchModule;
import com.microfinance.model.CasteModule;
import com.microfinance.model.CategoryModule;
import com.microfinance.model.CompanyAdministration;
import com.microfinance.model.ExecutiveFounder;
import com.microfinance.model.FinancialYear;
import com.microfinance.model.RelativeModule;
import com.microfinance.model.states;
import com.microfinance.repository.BankModuleRepo;
import com.microfinance.repository.BranchModuleRepo;
import com.microfinance.repository.CasteModuleRepo;
import com.microfinance.repository.CategoryModuleRepo;
import com.microfinance.repository.CompanyAdministrationRepo;
import com.microfinance.repository.ExecutiveFounderRepo;
import com.microfinance.repository.FinancialYearRepo;
import com.microfinance.repository.RelativeModuleRepo;
import com.microfinance.repository.Staterepo;

@Service
public class PreferenceService {

	@Autowired
	BranchModuleRepo branchModuleRepo;

	@Autowired
	CasteModuleRepo casteModuleRepo;

	@Autowired
	BankModuleRepo bankModuleRepo;

	@Autowired
	RelativeModuleRepo relativeModuleRepo;

	@Autowired
	CategoryModuleRepo categoryModuleRepo;

	@Autowired
	FinancialYearRepo financialYearRepo;

	@Autowired
	ExecutiveFounderRepo executiveFounderRepo;
	
	@Autowired
	CompanyAdministrationRepo companyAdministrationRepo;
	
	@Autowired
	Staterepo stateRepo;

	@Value("${upload.directory}")
	private String uploadDirectory;

	// Branch Module
//	public BranchModule saveAllBranchModule(BranchModule branchModule) {
//		// TODO Auto-generated method stub
//		return branchModuleRepo.save(branchModule);
//	}
	
	
	//Save Branch Module using DTO - Ayush (18/06/2025)
	public BranchModuleDto saveBranchModule(BranchModuleDto branchDto) {
		BranchModule entity;

	    if (branchDto.getId() != null) {
	        // Update
	        entity = branchModuleRepo.findById(branchDto.getId())
	                .orElseThrow(() -> new RuntimeException("Branch not found with ID: " + branchDto.getId()));
	    } else {
	        // New insert
	        entity = new BranchModule();
	    }

	    entity.setBranchCode(branchDto.getBranchCode());
	    entity.setBranchName(branchDto.getBranchName());
	    entity.setOpeningDate(branchDto.getOpeningDate());
	    entity.setAddress(branchDto.getAddress());
	    entity.setPin(branchDto.getPin());
	    entity.setState(branchDto.getState());
	    entity.setPrimaryContact(branchDto.getPrimaryContact());
	    entity.setContact(branchDto.getContact());

	    BranchModule saved = branchModuleRepo.save(entity);

	    BranchModuleDto response = new BranchModuleDto();
	    response.setId(saved.getId());
	    response.setBranchCode(saved.getBranchCode());
	    response.setBranchName(saved.getBranchName());
	    response.setOpeningDate(saved.getOpeningDate());
	    response.setAddress(saved.getAddress());
	    response.setPin(saved.getPin());
	    response.setState(saved.getState());
	    response.setPrimaryContact(saved.getPrimaryContact());
	    response.setContact(saved.getContact());

	    return response;
	}

	public List<BranchModule> fetchAllBranchModule() {
		// TODO Auto-generated method stub
		return branchModuleRepo.findAll();
	}

	public Optional<BranchModule> findBranchDataById(Long id) {
		// TODO Auto-generated method stub
		return branchModuleRepo.findById(id);
	}

	public BranchModule updateAllBranchModule(BranchModule branchModule) {
		// TODO Auto-generated method stub
		Optional<BranchModule> existingOptional = branchModuleRepo.findById(branchModule.getId());
		if (existingOptional.isPresent()) {
			BranchModule existing = existingOptional.get();
			existing.setBranchCode(branchModule.getBranchCode());
			existing.setBranchName(branchModule.getBranchName());
			existing.setOpeningDate(branchModule.getOpeningDate());
			existing.setAddress(branchModule.getAddress());
			existing.setPin(branchModule.getPin());
			existing.setState(branchModule.getState());
			existing.setPrimaryContact(branchModule.getPrimaryContact());
			existing.setContact(branchModule.getContact());
			return branchModuleRepo.save(existing);
		} else
			return null;
	}

	public boolean deleteBranchModule(long id) {
		if (branchModuleRepo.existsById(id)) {
			branchModuleRepo.deleteById(id);
			return true;
		}
		return false;
	}

	// Bank Module
	public BankModule saveAllBankModule(BankModule bankModule) {
		// TODO Auto-generated method stub
		return bankModuleRepo.save(bankModule);
	}

	public List<BankModule> fetchAllBankModule() {
		// TODO Auto-generated method stub
		return bankModuleRepo.findAll();
	}

	public Optional<BankModule> findBankDataById(Long id) {
		// TODO Auto-generated method stub
		return bankModuleRepo.findById(id);
	}

	public BankModule updateBankModuleById(BankModule bankModule) {
		// TODO Auto-generated method stub
		Optional<BankModule> existingOptional = bankModuleRepo.findById(bankModule.getId());
		if (existingOptional.isPresent()) {
			BankModule existing = existingOptional.get();
			existing.setBankName(bankModule.getBankName());
			existing.setAccountNo(bankModule.getAccountNo());
			existing.setContactNo(bankModule.getContactNo());
			existing.setAddress(bankModule.getAddress());
			existing.setOpeningDate(bankModule.getOpeningDate());
			existing.setOpeningBalance(bankModule.getOpeningBalance());
			return bankModuleRepo.save(existing);
		} else
			return null;
	}

	public boolean deleteBankModule(long id) {
		if (bankModuleRepo.existsById(id)) {
			bankModuleRepo.deleteById(id);
			return true;
		}
		return false;
	}

	// Relative Module
	public RelativeModule saveAllRelativeModule(RelativeModule relativeModule) {
		// TODO Auto-generated method stub
		return relativeModuleRepo.save(relativeModule);
	}

	public List<RelativeModule> fetchAllRelativeModule() {
		// TODO Auto-generated method stub
		return relativeModuleRepo.findAll();
	}

	// Caste Module
	public CasteModule saveCasteModule(CasteModule castemodule) {
		// TODO Auto-generated method stub
		return casteModuleRepo.save(castemodule);
	}

	public List<CasteModule> fetchAllCasteModule() {
		// TODO Auto-generated method stub
		return casteModuleRepo.findAll();
	}

	// Category Module
	public CategoryModule saveCategoryModule(CategoryModule categorymodule) {
		// TODO Auto-generated method stub
		return categoryModuleRepo.save(categorymodule);
	}

	public List<CategoryModule> fetchAllCategoryModule() {
		// TODO Auto-generated method stub
		return categoryModuleRepo.findAll();
	}

	// Financial Year
	public FinancialYear saveFinancialYear(FinancialYear financialyear) {
		// TODO Auto-generated method stub
		return financialYearRepo.save(financialyear);
	}

	public List<FinancialYear> fetchAllFinancialYear() {
		// TODO Auto-generated method stub
		return financialYearRepo.findAll();
	}

//	public ExecutiveFounder saveExecutiveFounder(ExecutiveFounder founder) {
//		// TODO Auto-generated method stub
//		return executiveFounderRepo.save(founder);
//		
//	}

	public ApiResponse<ExecutiveFounder> saveExecutiveFounder(ExecutiveFounderDto executiveFounderDto,
			MultipartFile photo, MultipartFile signature) {
		// TODO Auto-generated method stub
		ExecutiveFounder executiveFounder = new ExecutiveFounder();
		boolean isNew = true;

		// Check if the ClientMaster is being updated
		if (executiveFounderDto.getId() > 0) {
			executiveFounder = executiveFounderRepo.findById(executiveFounderDto.getId())
					.orElse(new ExecutiveFounder());
			isNew = false;
		}

		// Map fields from DTO to entity
		executiveFounder.setType(executiveFounderDto.getType());
		executiveFounder.setBranchName(executiveFounderDto.getBranchName());
		executiveFounder.setFullName(executiveFounderDto.getFullName());
		executiveFounder.setDateOfBirth(executiveFounderDto.getDateOfBirth());

		executiveFounder.setPromoterNo(executiveFounderDto.getPromoterNo());
		executiveFounder.setAppointmentDate(executiveFounderDto.getAppointmentDate());
		executiveFounder.setRelationName(executiveFounderDto.getRelationName());
		executiveFounder.setRelationToApplicant(executiveFounderDto.getRelationToApplicant());
		executiveFounder.setAddress(executiveFounderDto.getAddress());
		executiveFounder.setDistrict(executiveFounderDto.getDistrict());
		executiveFounder.setState(executiveFounderDto.getState());
		executiveFounder.setPinCode(executiveFounderDto.getPinCode());
		executiveFounder.setAadharNo(executiveFounderDto.getAadharNo());
		executiveFounder.setPanNo(executiveFounderDto.getPanNo());
		executiveFounder.setContactNo(executiveFounderDto.getContactNo());
		executiveFounder.setEmailId(executiveFounderDto.getEmailId());
		executiveFounder.setBaseValue(executiveFounderDto.getBaseValue());
		executiveFounder.setShareCount(executiveFounderDto.getShareCount());
		executiveFounder.setShareAmount(executiveFounderDto.getShareAmount());
		executiveFounder.setDepositAcc(executiveFounderDto.getDepositAcc());

		// Handle photo upload
		if (photo != null && !photo.isEmpty()) {
			try {
				String fileName1 = saveFile(photo); // Save the signature
				executiveFounder.setPhoto(fileName1);
			} catch (IOException e) {
				return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "File upload failed");
			}
		}

		// Handle signature upload
		if (signature != null && !signature.isEmpty()) {
			try {
				String fileName1 = saveFile1(signature); // Save the signature
				executiveFounder.setSignature(fileName1);
			} catch (IOException e) {
				return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "File upload failed");
			}
		}

		// Save entity to the database
		ExecutiveFounder savedExecutiveFounder = executiveFounderRepo.save(executiveFounder);

		if (isNew) {
			return ApiResponse.success(HttpStatus.CREATED,
					"Saved successfully. Director Name: " + savedExecutiveFounder.getFullName(), savedExecutiveFounder);
		} else {
			return ApiResponse.success(HttpStatus.OK,
					"Updated successfully. Director Name: " + savedExecutiveFounder.getFullName(),
					savedExecutiveFounder);
		}
	}

	private String saveFile(MultipartFile photo) throws IOException {
		// TODO Auto-generated method stub
		if (photo != null && !photo.isEmpty()) {
			ensureUploadDirectoryExists(); // Ensure the upload directory exists
			String fileName = System.currentTimeMillis() + "_" + photo.getOriginalFilename(); // Generate a unique
																								// filename
			File destinationFile = new File(uploadDirectory + File.separator + fileName);

			try {
				photo.transferTo(destinationFile); // Save the file to the destination path
				System.out.println("File successfully saved at: " + destinationFile.getAbsolutePath());
				return fileName; // Return the saved file's name
			} catch (IOException e) {
				System.err.println("File saving failed: " + e.getMessage());
				throw e; // Rethrow the exception to handle errors
			}
		}
		return null;
	}

	private String saveFile1(MultipartFile signature) throws IOException {
		// TODO Auto-generated method stub
		if (signature != null && !signature.isEmpty()) {
			ensureUploadDirectoryExists(); // Ensure the upload directory exists
			String fileName = System.currentTimeMillis() + "_" + signature.getOriginalFilename(); // Generate a unique
																									// filename
			File destinationFile = new File(uploadDirectory + File.separator + fileName);

			try {
				signature.transferTo(destinationFile); // Save the file to the destination path
				System.out.println("File successfully saved at: " + destinationFile.getAbsolutePath());
				return fileName; // Return the saved file's name
			} catch (IOException e) {
				System.err.println("File saving failed: " + e.getMessage());
				throw e; // Rethrow the exception to handle errors
			}
		}
		return null;
	}

	private void ensureUploadDirectoryExists() {
		File uploadDir = new File(uploadDirectory);
		if (!uploadDir.exists()) {
			boolean created = uploadDir.mkdirs(); // Create directories if they don't exist
			if (created) {
				System.out.println("Upload directory created at: " + uploadDirectory);
			} else {
				System.err.println("Failed to create upload directory: " + uploadDirectory);
			}
		}
	}

	public List<ExecutiveFounder> fetchAllExecutiveFounder() {
		// TODO Auto-generated method stub
		return executiveFounderRepo.findAll();
	}

	public boolean deleteExecutiveFounder(long id) {
		// TODO Auto-generated method stub
		if (executiveFounderRepo.existsById(id)) {
			executiveFounderRepo.deleteById(id);
			return true;
		} else {
			return false;
		}
	}

	public ExecutiveFounder fetchExecutiveById(long id) {
		// TODO Auto-generated method stub
		return executiveFounderRepo.findById(id).orElse(null);
	}

	//Company Administration - Ayush
	public List<CompanyAdministration> fetchAllCompanyAdministration() {
		// TODO Auto-generated method stub
		return companyAdministrationRepo.findAll();
	}

	public int updateCompanyAdministration(CompanyAdministration companyAdministration) {
		// TODO Auto-generated method stub
		Optional<CompanyAdministration> optional = companyAdministrationRepo.findById(companyAdministration.getId());

        if (optional.isPresent()) {
            CompanyAdministration company = optional.get();

            company.setCompanyName(companyAdministration.getCompanyName());
            company.setShortName(companyAdministration.getShortName()); 
            company.setSignUpDate(companyAdministration.getSignUpDate());
            company.setCinNo(companyAdministration.getCinNo());
            company.setPan(companyAdministration.getPan());
            company.setTan(companyAdministration.getTan());
            company.setGstin(companyAdministration.getGstin());
            company.setDeclaredValue(companyAdministration.getDeclaredValue());
            company.setAddress(companyAdministration.getAddress());
            company.setState(companyAdministration.getState());
            company.setPinCode(companyAdministration.getPinCode());
            company.setEmailId(companyAdministration.getEmailId());
            company.setAuthorizedShareCapital(companyAdministration.getAuthorizedShareCapital());
            company.setPaidUpCapital(companyAdministration.getPaidUpCapital());
            company.setNof(companyAdministration.getNof());
            company.setContactNo(companyAdministration.getContactNo());
            company.setTdsWithPan(companyAdministration.getTdsWithPan());
            company.setTdsWithoutPan(companyAdministration.getTdsWithoutPan());
            company.setTaxDeduction(companyAdministration.getTaxDeduction());
            company.setSeniorCitizenTaxDeduction(companyAdministration.getSeniorCitizenTaxDeduction());

            companyAdministrationRepo.save(company);
            return 1; // success
        } else {
            return 0; // failure
        }
    }

	public List<states> getAllStates() {
		// TODO Auto-generated method stub
		return stateRepo.findAll();
	}

	
	

}
