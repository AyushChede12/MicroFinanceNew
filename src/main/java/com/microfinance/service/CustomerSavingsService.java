package com.microfinance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.SavingSchemeCatalog;
import com.microfinance.model.addCustomer;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.SavingSchmeCatalogRepo;

@Service
public class CustomerSavingsService {

	@Autowired
	SavingSchmeCatalogRepo savingSchmeCatalogRepo;
	
	@Autowired
	AddCustomerRepo addcustomerRepo;
	
	public boolean saveSavingScheme(SavingSchemeCatalog savingSchemeCatalog) {
		 try {
			 savingSchmeCatalogRepo.save(savingSchemeCatalog);
		        return true;
		    } catch (Exception e) {
		        e.printStackTrace(); // Log actual error
		        return false;
		    }
	}

	public List<addCustomer> findCustomerCode() {
		List<addCustomer> list = addcustomerRepo.findAll();
		return list;
	}

	public List<addCustomer> fetchCustomerCode(String memberCode) {
		List<addCustomer> list = addcustomerRepo.findByMemberCode(memberCode);
		return list;
	}

	

}
