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
import com.microfinance.dto.FinancialConsultantDto;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.FinancialConsultantRepo;

@Service
public class FinancialConsultantService {

	@Autowired
	FinancialConsultantRepo financialConsultationRepo;
	
	@Autowired
	AddCustomerRepo addCustomerRepo;
	
	@Value("${upload.directory}")
	private String uploadDirectory;

	public List<addCustomer> getAllCustomerCodes() {
		// TODO Auto-generated method stub
		return addCustomerRepo.findAll();
	}

	public List<addCustomer> getAllBranch() {
		// TODO Auto-generated method stub
		return addCustomerRepo.findAll();
	}

	public List<addCustomer> getByMemberCode(String memberCode) {
		// TODO Auto-generated method stub
		return addCustomerRepo.findByMemberCode(memberCode);
	}

	public List<addCustomer> getAllRelationToApplicant() {
		// TODO Auto-generated method stub
		return addCustomerRepo.findAll();
	}

	public ApiResponse<addFinancialConsultant> saveOrUpdateFinancialConsultant(
			FinancialConsultantDto financialConsultantDto, MultipartFile customerPhoto,
			MultipartFile customerSignature) {
		addFinancialConsultant addFinancialConsultant = new addFinancialConsultant();
		boolean isNew = true;

		// Check if the finacialConsultant is being updated
		if (financialConsultantDto.getId() > 0) {
			addFinancialConsultant = financialConsultationRepo.findById(financialConsultantDto.getId())
					.orElse(new addFinancialConsultant());
			isNew = false;
		}
		addFinancialConsultant.setFinancialCode(financialConsultantDto.getFinancialCode());
		addFinancialConsultant.setJoiningDate(financialConsultantDto.getJoiningDate());
		addFinancialConsultant.setMemberCode(financialConsultantDto.getMemberCode());
		addFinancialConsultant.setCustomerName(financialConsultantDto.getCustomerName());
		addFinancialConsultant.setDob(financialConsultantDto.getDob());
		addFinancialConsultant.setCustomerAge(financialConsultantDto.getCustomerAge());
		addFinancialConsultant.setGuardianName(financialConsultantDto.getGuardianName());
		addFinancialConsultant.setRelationToApplicant(financialConsultantDto.getRelationToApplicant());
		addFinancialConsultant.setContactNo(financialConsultantDto.getContactNo());
		addFinancialConsultant.setNomineeName(financialConsultantDto.getNomineeName());
		addFinancialConsultant.setBranchName(financialConsultantDto.getBranchName());
		addFinancialConsultant.setNomineeAge(financialConsultantDto.getNomineeAge());
		addFinancialConsultant.setCustomerAddress(financialConsultantDto.getCustomerAddress());
		addFinancialConsultant.setDistrict(financialConsultantDto.getDistrict());
		addFinancialConsultant.setState(financialConsultantDto.getState());
		addFinancialConsultant.setPinCode(financialConsultantDto.getPinCode());
		addFinancialConsultant.setProfession(financialConsultantDto.getProfession());
		addFinancialConsultant.setAcademicBackground(financialConsultantDto.getAcademicBackground());
		addFinancialConsultant.setSelectPosition(financialConsultantDto.getSelectPosition());
		addFinancialConsultant.setReferralCode(financialConsultantDto.getReferralCode());
		addFinancialConsultant.setReferralName(financialConsultantDto.getReferralName());

		// TODO Auto-generated method stub
		// Handle file upload
		if (customerPhoto != null && !customerPhoto.isEmpty()) {
			try {
				String fileName = saveFile(customerPhoto);
				addFinancialConsultant.setCustomerPhoto(fileName);
			} catch (IOException e) {
				return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "File upload failed");
			}
		}

		if (customerSignature != null && !customerSignature.isEmpty()) {
			try {
				String fileName1 = saveFile1(customerSignature); // Save the signature
				addFinancialConsultant.setCustomerSignature(fileName1); // ✅ Correctly set it in entity
			} catch (IOException e) {
				return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "File upload failed");
			}
		}

		// Save entity to the database
		addFinancialConsultant savedFinancialCunsultant = financialConsultationRepo.save(addFinancialConsultant);

		// Return response
		if (isNew) {
			return ApiResponse.success(HttpStatus.CREATED,
					"Saved successfully. Member Code: " + savedFinancialCunsultant.getFinancialCode(),
					savedFinancialCunsultant);
		} else {
			return ApiResponse.success(HttpStatus.OK,
					"Updated successfully. Member Code: " + savedFinancialCunsultant.getFinancialCode(),
					savedFinancialCunsultant);
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

	private String saveFile1(MultipartFile customerSignature) throws IOException {
		// TODO Auto-generated method stub
		if (customerSignature != null && !customerSignature.isEmpty()) {
			ensureUploadDirectoryExists(); // Ensure the upload directory exists
			String fileName = System.currentTimeMillis() + "_" + customerSignature.getOriginalFilename();
			File destinationFile = new File(uploadDirectory + File.separator + fileName);

			try {
				customerSignature.transferTo(destinationFile); // Save the file to the destination path
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
