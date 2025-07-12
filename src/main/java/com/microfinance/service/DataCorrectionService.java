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
import com.microfinance.model.CompanyAdministration;
import com.microfinance.model.SavingAccountActivity;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.repository.AddCustomerRepo;
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
	



}
