package com.microfinance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.FinancialYear;
import com.microfinance.model.SavingSchemeCatalog;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.CreateSavingAccountRepo;
import com.microfinance.repository.FinancialConsultantRepo;
import com.microfinance.repository.SavingSchmeCatalogRepo;

@Service
public class CustomerSavingsService {

	@Autowired
	SavingSchmeCatalogRepo savingSchmeCatalogRepo;
	
	@Autowired
	AddCustomerRepo addcustomerRepo;
	
	@Autowired
	FinancialConsultantRepo financialConsultantRepo;
	
	@Autowired
	CreateSavingAccountRepo createSavingAccountRepo;
	
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


	public List<SavingSchemeCatalog> findBySchemeType() {
		List<SavingSchemeCatalog> list = savingSchmeCatalogRepo.findAll();
		return list;
	}

	public List<SavingSchemeCatalog> findByPolicyName(String policyName) {
		List<SavingSchemeCatalog> list = savingSchmeCatalogRepo.findByPolicyName(policyName);
		return list;
	}

	public List<addFinancialConsultant> findByFinancialCode(String financialCode) {
		List<addFinancialConsultant> list = financialConsultantRepo.findByFinancialCode(financialCode);
		return list;
	}

//	public boolean saveSavingAccountDetails(CreateSavingsAccount createSavingsAccount) {
//		try {
//			createSavingAccountRepo.save(createSavingsAccount);
//		        return true;
//		    } catch (Exception e) {
//		        e.printStackTrace(); // Log actual error
//		        return false;
//		    }
//	}

	public CreateSavingsAccount saveSavingAccountDetails(CreateSavingsAccount createSavingsAccount) {
		// TODO Auto-generated method stub
		return createSavingAccountRepo.save(createSavingsAccount);
	}

	public List<CreateSavingsAccount> fetchAllSavingAccountData() {
		// TODO Auto-generated method stub
		return createSavingAccountRepo.findAll();
	}

	public Optional<CreateSavingsAccount> findSavingAccountDataById(Long id) {
		// TODO Auto-generated method stub
		return createSavingAccountRepo.findById(id);
	}

	public boolean deleteFinancialYear(Long id) {
		if (createSavingAccountRepo.existsById(id)) {
			createSavingAccountRepo.deleteById(id);
			return true;
		}
		return false;
	}

	public Optional<SavingSchemeCatalog> findSavingSchmeCatalogById(Long id) {
		return savingSchmeCatalogRepo.findById(id);
	}

	public boolean deleteSavingSchemeCatalog(Long id) {
		if (savingSchmeCatalogRepo.existsById(id)) {
			savingSchmeCatalogRepo.deleteById(id);
			return true;
		}
		return false;
	}

	
}
