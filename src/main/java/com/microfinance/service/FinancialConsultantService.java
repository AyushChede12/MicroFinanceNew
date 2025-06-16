package com.microfinance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.addCustomer;
import com.microfinance.repository.FinancialConsultantRepo;

@Service
public class FinancialConsultantService {
	
	@Autowired
	FinancialConsultantRepo financialConsultationRepo;

	public List<addCustomer> getAllCustomerCodes() {
		// TODO Auto-generated method stub
		return financialConsultationRepo.findAll();
	}

	public List<addCustomer> getAllBranch() {
		// TODO Auto-generated method stub
		return financialConsultationRepo.findAll();
	}

	public addCustomer getByMemberCode(String memberCode) {
		// TODO Auto-generated method stub
		return financialConsultationRepo.findByMemberCode(memberCode).orElse(null);
	}

}
