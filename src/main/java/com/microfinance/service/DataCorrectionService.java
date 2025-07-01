package com.microfinance.service;

import java.io.File;
import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.CustomerDto;
import com.microfinance.model.CompanyAdministration;
import com.microfinance.model.addCustomer;
import com.microfinance.repository.AddCustomerRepo;

@Service
public class DataCorrectionService {
	
	@Autowired
	AddCustomerRepo addCustomerRepo;
	
	@Value("${upload.directory}")
	private String uploadDirectory;
	
//	public ApiResponse<addCustomer> updateCustomer(CustomerDto customerDto,
//		MultipartFile customerPhoto) {
//
//		Optional<addCustomer> optionalCustomer = addCustomerRepo.findById(customerDto.getId());
//
//		if (!optionalCustomer.isPresent()) {
//			return ApiResponse.error(HttpStatus.NOT_FOUND, "Customer not found with ID: " + customerDto.getId());
//		}
//
//		addCustomer addcustomer = optionalCustomer.get();
//
//		// Map fields from DTO to entity
//		addcustomer.setSignupDate(customerDto.getSignupDate());
//		addcustomer.setCustomerName(customerDto.getCustomerName());
//		addcustomer.setGuardianName(customerDto.getGuardianName());
//		addcustomer.setRelationToApplicant(customerDto.getRelationToApplicant());
//		addcustomer.setCustomerGender(customerDto.getCustomerGender());
//		addcustomer.setDob(customerDto.getDob());
//		addcustomer.setCustomerAge(customerDto.getCustomerAge());
//		addcustomer.setRelationshipStatus(customerDto.getRelationshipStatus());
//		addcustomer.setCustomerAddress(customerDto.getCustomerAddress());
//		addcustomer.setDistrict(customerDto.getDistrict());
//		addcustomer.setState(customerDto.getState());
//		addcustomer.setBranchName(customerDto.getBranchName());
//		addcustomer.setPinCode(customerDto.getPinCode());
//		addcustomer.setAadharNo(customerDto.getAadharNo());
//		addcustomer.setPanNo(customerDto.getPanNo());
//		addcustomer.setVoterNo(customerDto.getVoterNo());
//		addcustomer.setContactNo(customerDto.getContactNo());
//		addcustomer.setMinor(customerDto.getMinor());
//		addcustomer.setEmailId(customerDto.getEmailId());
//		addcustomer.setProfession(customerDto.getProfession());
//		addcustomer.setAcademicBackground(customerDto.getAcademicBackground());
//		addcustomer.setReferralCode(customerDto.getReferralCode());
//		addcustomer.setReferralName(customerDto.getReferralName());
//		addcustomer.setDrivingLicenceNo(customerDto.getDrivingLicenceNo());
//
//		// Nominee Details
//		addcustomer.setNomineeName(customerDto.getNomineeName());
//		addcustomer.setNomineeRelationToApplicant(customerDto.getNomineeRelationToApplicant());
//		addcustomer.setNomineeAddress(customerDto.getNomineeAddress());
//		addcustomer.setNomineeKycNo(customerDto.getNomineeKycNo());
//		addcustomer.setNomineeMobileNo(customerDto.getNomineeMobileNo());
//		addcustomer.setNomineeAge(customerDto.getNomineeAge());
//		addcustomer.setNomineePanNo(customerDto.getNomineePanNo());
//		addcustomer.setNomineeKycType(customerDto.getNomineeKycType());
//
//		// Upload image files
//		try {
//			if (customerPhoto != null && !customerPhoto.isEmpty()) {
//				String fileName = saveFile(customerPhoto);
//				addcustomer.setCustomerPhoto(fileName);
//			}
//			
//		} catch (IOException e) {
//			return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "Error while uploading file: " + e.getMessage());
//		}
//
//		// Only update (no creation here)
//		addCustomer updatedCustomer = addCustomerRepo.save(addcustomer);
//
//		return ApiResponse.success(
//			HttpStatus.OK,
//			"Customer updated successfully. Member Code: " + updatedCustomer.getMemberCode(),
//			updatedCustomer
//		);
//	}
	
	public addCustomer updateCustomer(CustomerDto customerDto, String photoName) {
		addCustomer existing = addCustomerRepo.findById(customerDto.getId()).orElseThrow(() -> new RuntimeException("Customer not found"));

		// Set updated fields
		existing.setSignupDate(customerDto.getSignupDate());
		existing.setCustomerName(customerDto.getCustomerName());
		existing.setGuardianName(customerDto.getGuardianName());
		existing.setRelationToApplicant(customerDto.getRelationToApplicant());
		existing.setCustomerGender(customerDto.getCustomerGender());
		existing.setDob(customerDto.getDob());
		existing.setCustomerAge(customerDto.getCustomerAge());
		existing.setRelationshipStatus(customerDto.getRelationshipStatus());
		existing.setCustomerAddress(customerDto.getCustomerAddress());
		existing.setDistrict(customerDto.getDistrict());
		existing.setState(customerDto.getState());
		existing.setBranchName(customerDto.getBranchName());
		existing.setPinCode(customerDto.getPinCode());
		existing.setAadharNo(customerDto.getAadharNo());
		existing.setPanNo(customerDto.getPanNo());
		existing.setVoterNo(customerDto.getVoterNo());
		existing.setContactNo(customerDto.getContactNo());
		existing.setMinor(customerDto.getMinor());
		existing.setEmailId(customerDto.getEmailId());
		existing.setProfession(customerDto.getProfession());
		existing.setAcademicBackground(customerDto.getAcademicBackground());
		existing.setReferralCode(customerDto.getReferralCode());
		existing.setReferralName(customerDto.getReferralName());
		existing.setDrivingLicenceNo(customerDto.getDrivingLicenceNo());

		// Nominee Details
		existing.setNomineeName(customerDto.getNomineeName());
		existing.setNomineeRelationToApplicant(customerDto.getNomineeRelationToApplicant());
		existing.setNomineeAddress(customerDto.getNomineeAddress());
		existing.setNomineeKycNo(customerDto.getNomineeKycNo());
		existing.setNomineeMobileNo(customerDto.getNomineeMobileNo());
		existing.setNomineeAge(customerDto.getNomineeAge());
		existing.setNomineePanNo(customerDto.getNomineePanNo());
		existing.setNomineeKycType(customerDto.getNomineeKycType());

		if (photoName != null) {
			existing.setCustomerPhoto(photoName);
		}


		return addCustomerRepo.save(existing); // ✅ Only update existing
	}



}
