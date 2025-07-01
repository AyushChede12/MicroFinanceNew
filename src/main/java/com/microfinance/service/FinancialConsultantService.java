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
		return addCustomerRepo.findByMemberCodeIgnoreCase(memberCode);
	}

	public List<addCustomer> getAllRelationToApplicant() {
		// TODO Auto-generated method stub
		return addCustomerRepo.findAll();
	}

	public ApiResponse<addFinancialConsultant> saveOrUpdateFinancialConsultant(
			FinancialConsultantDto financialConsultantDto, String customerPhoto, String customerSignature) {
		// TODO Auto-generated method stub

		addFinancialConsultant addFinancialConsultant = new addFinancialConsultant();
		boolean isNew = true;

		// Check if the ClientMaster is being updated
		if (financialConsultantDto.getId() != null) {
			addFinancialConsultant = financialConsultationRepo.findById(financialConsultantDto.getId())
					.orElse(new addFinancialConsultant());
			isNew = false;
		}

		// Map fields from DTO to entity
		addFinancialConsultant.setFinancialCode(financialConsultantDto.getFinancialCode());
		addFinancialConsultant.setJoiningDate(financialConsultantDto.getJoiningDate());
		addFinancialConsultant.setMemberCode(financialConsultantDto.getMemberCode());
		addFinancialConsultant.setCustomerName(financialConsultantDto.getCustomerName());
		// advisorCollectorDetails.setMemberId(advisorCollectorDto.getMemberId());
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
		addFinancialConsultant.setFees(financialConsultantDto.getFees());
		addFinancialConsultant.setModeofPayment(financialConsultantDto.getModeofPayment());
		addFinancialConsultant.setChequeNo(financialConsultantDto.getChequeNo());
		addFinancialConsultant.setChequeDate(financialConsultantDto.getChequeDate());
		addFinancialConsultant.setDepositAccount(financialConsultantDto.getDepositAccount());
		addFinancialConsultant.setRefNo(financialConsultantDto.getRefNo());
		addFinancialConsultant.setComments(financialConsultantDto.getComments());
		addFinancialConsultant.setFinancialStatus(financialConsultantDto.getFinancialStatus());
		addFinancialConsultant.setSmsSend(financialConsultantDto.getSmsSend());
		
		
		
// Set photoWithAadhar path (already fetched)
		if (customerPhoto != null && !customerPhoto.isEmpty()) {
			addFinancialConsultant.setCustomerPhoto(customerPhoto);
		}

		// Set Signature path (already fetched)
		if (customerSignature != null && !customerSignature.isEmpty()) {
			addFinancialConsultant.setCustomerSignature(customerSignature);
		}
		// Save entity to the database
		addFinancialConsultant savedFinancialConsultant = financialConsultationRepo.save(addFinancialConsultant);

		if (isNew) {
			return ApiResponse.success(HttpStatus.CREATED,
					"Saved successfully. Finnacial Code: " + savedFinancialConsultant.getFinancialCode(),
					savedFinancialConsultant);
		} else {
			return ApiResponse.success(HttpStatus.OK,
					"Updated successfully. Financial Code: " + savedFinancialConsultant.getFinancialCode(),
					savedFinancialConsultant);
		}

	}

	public List<addFinancialConsultant> getAllFinancialConsultantDetails() {
		// TODO Auto-generated method stub
		return financialConsultationRepo.findAll();
	}

	public Optional<addFinancialConsultant> FinancialConsultantById(Long id) {
		// TODO Auto-generated method stub
		return financialConsultationRepo.findById(id);
	}

	public boolean deleteFinancialConsultant(Long id) {
		// TODO Auto-generated method stub
		if (financialConsultationRepo.existsById(id)) {
			financialConsultationRepo.deleteById(id);
			return true;
		}
		return false;
    }

	public List<addFinancialConsultant> fetchfinancialHierarchyByFinancialCode(String financialCode) {
		// TODO Auto-generated method stub
		return financialConsultationRepo.findByFinancialCode(financialCode);
	}
	

	public addFinancialConsultant save(addFinancialConsultant customer) {
		// TODO Auto-generated method stub
		return financialConsultationRepo.save(customer);
	}

	

	
	
}
