package com.microfinance.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.CustomerDto;
import com.microfinance.model.addCustomer;
import com.microfinance.repository.CustomerRepo;

@Service
public class CustomerManagementService {
	
	@Autowired
	CustomerRepo customerRepo;
	
	
	@Value("${upload.directory}")
	private String uploadDirectory;

	public ApiResponse<addCustomer> saveOrUpdateCustomer(CustomerDto clientMasterDto, MultipartFile customerPhoto,
			MultipartFile customerSignature) {
		addCustomer addcustomer= new addCustomer();
		boolean isNew = true;
		
		// Check if the ClientMaster is being updated
	    if (clientMasterDto.getId() > 0) {
	    	addcustomer = customerRepo.findById(clientMasterDto.getId())
	                                             .orElse(new addCustomer());
	        isNew = false;
	    }

	    // Map fields from DTO to entity
	    addcustomer.setMemberCode(clientMasterDto.getMemberCode());
	    addcustomer.setAuthenticateFor(clientMasterDto.getAuthenticateFor());
	    addcustomer.setSignupDate(clientMasterDto.getSignupDate());
	    addcustomer.setCustomerName(clientMasterDto.getCustomerName());
	    addcustomer.setGuardianName(clientMasterDto.getGuardianName());
	    addcustomer.setRelationToApplicant(clientMasterDto.getRelationToApplicant());
	    addcustomer.setCustomerGender(clientMasterDto.getCustomerGender());
	    addcustomer.setDob(clientMasterDto.getDob());
	    addcustomer.setCustomerAge(clientMasterDto.getCustomerAge());
	    addcustomer.setRelationshipStatus(clientMasterDto.getRelationshipStatus());
	    addcustomer.setCustomerAddress(clientMasterDto.getCustomerAddress());
	    addcustomer.setDistrict(clientMasterDto.getDistrict());
	    addcustomer.setState(clientMasterDto.getState());
	    addcustomer.setBranchName(clientMasterDto.getBranchName());
	    addcustomer.setPinCode(clientMasterDto.getPinCode());
	    addcustomer.setAadharNo(clientMasterDto.getAadharNo());
	    addcustomer.setPanNo(clientMasterDto.getPanNo());
	    addcustomer.setVoterNo(clientMasterDto.getVoterNo());
	    addcustomer.setContactNo(clientMasterDto.getContactNo());
	    addcustomer.setMinor(clientMasterDto.getMinor());
	    addcustomer.setEmailId(clientMasterDto.getEmailId());
	    addcustomer.setProfession(clientMasterDto.getProfession());
	    addcustomer.setAcademicBackground(clientMasterDto.getAcademicBackground());
	    addcustomer.setReferralCode(clientMasterDto.getReferralCode());
	    addcustomer.setReferralName(clientMasterDto.getReferralName());
	    addcustomer.setDrivingLicenceNo(clientMasterDto.getDrivingLicenceNo());

	    // Nominee Details
	    addcustomer.setNomineeName(clientMasterDto.getNomineeName());
	    addcustomer.setNomineeRelationToApplicant(clientMasterDto.getNomineeRelationToApplicant());
	    addcustomer.setNomineeAddress(clientMasterDto.getNomineeAddress());
	    addcustomer.setNomineeKycNo(clientMasterDto.getNomineeKycNo());
	    addcustomer.setNomineeMobileNo(clientMasterDto.getNomineeMobileNo());
	    addcustomer.setNomineeAge(clientMasterDto.getNomineeAge());
	    addcustomer.setNomineePanNo(clientMasterDto.getNomineePanNo());
	    addcustomer.setNomineeKycType(clientMasterDto.getNomineeKycType());
	    

	    // Fees/Setting Details
	    

	    // Handle file upload
	    if (customerPhoto != null && !customerPhoto.isEmpty()) {
	        try {
	            String fileName = saveFile(customerPhoto);
	            addcustomer.setCustomerPhoto(fileName);
	        } catch (IOException e) {
	            return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "File upload failed");
	        }
	    }
	    
	 // Handle signature upload
	    if (customerSignature != null && !customerSignature.isEmpty()) {
	    	try {
	        String fileName1 = saveFile1(customerSignature);  // Save the signature
	        addcustomer.getCustomerSignature();
	    	} catch (IOException e) {
	            return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "File upload failed");
	        } 
	    }

	    // Save entity to the database
	    addCustomer savedClientMaster = customerRepo.save(addcustomer);

	    // Return response
	    if (isNew) {
	        return ApiResponse.success(
	            HttpStatus.CREATED,
	            "Saved successfully. Member Code: " + savedClientMaster.getMemberCode(),
	            savedClientMaster
	        );
	    } else {
	        return ApiResponse.success(
	            HttpStatus.OK,
	            "Updated successfully. Member Code: " + savedClientMaster.getMemberCode(),
	            savedClientMaster
	        );
	    }



	}
	
	private String saveFile1(MultipartFile customerSignature) throws IOException {
		// TODO Auto-generated method stub
		if (customerSignature != null && !customerSignature.isEmpty()) {
	        ensureUploadDirectoryExists();  // Ensure the upload directory exists
	        String fileName = System.currentTimeMillis() + "_" + customerSignature.getOriginalFilename();  // Generate a unique filename
	        File destinationFile = new File(uploadDirectory + File.separator + fileName);

	        try {
	        	customerSignature.transferTo(destinationFile);  // Save the file to the destination path
	            System.out.println("File successfully saved at: " + destinationFile.getAbsolutePath());
	            return fileName;  // Return the saved file's name
	        } catch (IOException e) {
	            System.err.println("File saving failed: " + e.getMessage());
	            throw e;  // Rethrow the exception to handle errors
	        }
	    }
		return null;
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
