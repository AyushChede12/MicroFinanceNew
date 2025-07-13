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
import com.microfinance.dto.CustomerDto;
import com.microfinance.dto.PolicyManagementDto;
import com.microfinance.model.AddnewinvestmentPM;
import com.microfinance.model.CompanyAdministration;
import com.microfinance.model.SavingAccountActivity;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.AddInvestmentRepo;
import com.microfinance.repository.CustomerRepo;
import com.microfinance.repository.FinancialConsultantRepo;
import com.microfinance.repository.SavingAccountActivityRepo;

@Service
public class DataCorrectionService {
	
	@Autowired
	CustomerRepo customerRepo;
	
	@Autowired
	FinancialConsultantRepo financialConsultantRepo;
	
	@Autowired
	SavingAccountActivityRepo savingAccountActivityRepo;
	
	@Autowired
	AddInvestmentRepo addInvestmentRepo;
	
	@Value("${upload.directory}")
	private String uploadDirectory;

	public boolean deleteCustomerData(Long id) {
		// TODO Auto-generated method stub
		if (customerRepo.existsById(id)) {
			customerRepo.deleteById(id);
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteFinancialData(Long id) {
		// TODO Auto-generated method stub
		if (financialConsultantRepo.existsById(id)) {
			financialConsultantRepo.deleteById(id);
			return true;
		} else {
			return false;
		}
	}

	public List<SavingAccountActivity> fetchAllSavingAccountActivity() {
		// TODO Auto-generated method stub
		return savingAccountActivityRepo.findAll();
	}

	public boolean deleteSavingTransaction(Long id) {
		// TODO Auto-generated method stub
		if (savingAccountActivityRepo.existsById(id)) {
			savingAccountActivityRepo.deleteById(id);
			return true;
		} else {
			return false;
		}
	}

	public ApiResponse<AddnewinvestmentPM> saveOrUpdatePolicyManagement(PolicyManagementDto policyManagementDto,
			MultipartFile image1, MultipartFile image2) {
		// TODO Auto-generated method stub
		AddnewinvestmentPM addnewinvestmentpm = new AddnewinvestmentPM();
		boolean isNew = true;

		if (policyManagementDto.getId() != null) {
			addnewinvestmentpm = addInvestmentRepo.findById(policyManagementDto.getId())
					.orElse(new AddnewinvestmentPM());
			isNew = false;
		}

		// Map fields from DTO to entity
		addnewinvestmentpm.setPolicyCode(policyManagementDto.getPolicyCode());
		addnewinvestmentpm.setPolicyStartDate(policyManagementDto.getPolicyStartDate());
		addnewinvestmentpm.setMemberSelection(policyManagementDto.getMemberSelection());
		addnewinvestmentpm.setCustomerName(policyManagementDto.getCustomerName());
		addnewinvestmentpm.setDateofBirth(policyManagementDto.getDateofBirth());
		addnewinvestmentpm.setRelationDetails(policyManagementDto.getRelationDetails());
		addnewinvestmentpm.setContactNo(policyManagementDto.getContactNo());
		addnewinvestmentpm.setSuggestedNominee(policyManagementDto.getSuggestedNominee());
		addnewinvestmentpm.setAgeOfNominee(policyManagementDto.getAgeOfNominee());
		addnewinvestmentpm.setRelation(policyManagementDto.getRelation());
		addnewinvestmentpm.setAddress(policyManagementDto.getAddress());
		addnewinvestmentpm.setDistrict(policyManagementDto.getDistrict());
		addnewinvestmentpm.setState(policyManagementDto.getState());
		addnewinvestmentpm.setPinCode(policyManagementDto.getPinCode());
		addnewinvestmentpm.setTds(policyManagementDto.getTds());
		addnewinvestmentpm.setBranchName(policyManagementDto.getBranchName());
		addnewinvestmentpm.setModeOfOperation(policyManagementDto.getModeOfOperation());
		addnewinvestmentpm.setJointMemCode(policyManagementDto.getJointMemCode());
		addnewinvestmentpm.setJointName(policyManagementDto.getJointName());
		addnewinvestmentpm.setMaturityDate(policyManagementDto.getMaturityDate());
		addnewinvestmentpm.setSchemeType(policyManagementDto.getSchemeType());
		addnewinvestmentpm.setSchemeTerm(policyManagementDto.getSchemeTerm());
		addnewinvestmentpm.setSchemeMode(policyManagementDto.getSchemeMode());
		addnewinvestmentpm.setPolicyAmount(policyManagementDto.getPolicyAmount());
		addnewinvestmentpm.setDepositAmount(policyManagementDto.getDepositAmount());
		addnewinvestmentpm.setIntroMCode(policyManagementDto.getIntroMCode());
		addnewinvestmentpm.setMaturityAmount(policyManagementDto.getMaturityAmount());
		addnewinvestmentpm.setMISInterest(policyManagementDto.getMISInterest());
		addnewinvestmentpm.setPaymentBy(policyManagementDto.getPaymentBy());
		addnewinvestmentpm.setRemark(policyManagementDto.getRemark());
		addnewinvestmentpm.setAgent(policyManagementDto.getAgent());
		addnewinvestmentpm.setSmsSend(policyManagementDto.getSmsSend());
		
		//Image1
		if (image1 != null && !image1.isEmpty()) {
			try {
				String fileName = saveFile(image1);
				addnewinvestmentpm.setImage1(fileName);
			} catch (IOException e) {
				return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "File upload failed");
			}
		}

		//Image2
		if (image2 != null && !image2.isEmpty()) {
			try {
				String fileName = saveFile1(image2); // Save the signature
				addnewinvestmentpm.setImage2(fileName); // ✅ Correctly set it in entity
			} catch (IOException e) {
				return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "File upload failed");
			}
		}

		// Save entity to the database
		AddnewinvestmentPM savedPolicyManagement = addInvestmentRepo.save(addnewinvestmentpm);

		// Return response
		if (isNew) {
			return ApiResponse.success(HttpStatus.CREATED,
					"Saved successfully. Policy Code: " + savedPolicyManagement.getPolicyCode(), savedPolicyManagement);
		} else {
			return ApiResponse.success(HttpStatus.OK,
					"Updated successfully. Policy Code: " + savedPolicyManagement.getPolicyCode(), savedPolicyManagement);
		}
	}
	
	private String saveFile(MultipartFile file) throws IOException {
		if (file != null && !file.isEmpty()) {
			ensureUploadDirectoryExists();
			String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			File destinationFile = new File(uploadDirectory + File.separator + fileName);

			try {
				file.transferTo(destinationFile);
				System.out.println("File successfully saved at: " + destinationFile.getAbsolutePath());
				return fileName;
			} catch (IOException e) {
				System.err.println("File saving failed: " + e.getMessage());
				throw e;
			}
		}
		return null;
	}
	
	private String saveFile1(MultipartFile image2) throws IOException {
		// TODO Auto-generated method stub
		if (image2 != null && !image2.isEmpty()) {
			ensureUploadDirectoryExists(); // Ensure the upload directory exists
			String fileName = System.currentTimeMillis() + "_" + image2.getOriginalFilename(); // Generate a
																											// unique
																											// filename
			File destinationFile = new File(uploadDirectory + File.separator + fileName);

			try {
				image2.transferTo(destinationFile); // Save the file to the destination path
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
			boolean created = uploadDir.mkdirs();
			if (created) {
				System.out.println("Upload directory created at: " + uploadDirectory);
			} else {
				System.err.println("Failed to create upload directory: " + uploadDirectory);
			}
		}
	}
	



}
