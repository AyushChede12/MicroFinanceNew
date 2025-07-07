package com.microfinance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.FinancialYear;
import com.microfinance.model.SavingAccountActivity;
import com.microfinance.model.SavingSchemeCatalog;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.CreateSavingAccountRepo;
import com.microfinance.repository.FinancialConsultantRepo;
import com.microfinance.repository.SavingAccountActivityRepo;
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
	
	@Autowired
	SavingAccountActivityRepo savingAccountActivityRepo;
	
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


	public List<CreateSavingsAccount> findAllByAccountNumber(String accountNumber) {
		List<CreateSavingsAccount> list = createSavingAccountRepo.findAllByAccountNumber(accountNumber);
		return list;
	}

	public SavingAccountActivity saveSavingAccountActivityData(SavingAccountActivity savingAccountActivity) {
		return savingAccountActivityRepo.save(savingAccountActivity);
	}

	public Optional<SavingAccountActivity> findSavingAccountActivityById(Long id) {
		return savingAccountActivityRepo.findById(id);
	}

	public List<SavingAccountActivity> findAllByAccountNumberSavingActivity(String accountNumber) {
		List<SavingAccountActivity> list = savingAccountActivityRepo.findAllByAccountNumber(accountNumber);
		return list;
	}

	public boolean updateAverageBalance(String accountNumber, String newBalance) {
		 Optional<CreateSavingsAccount> optionalAccount = createSavingAccountRepo.findByAccountNumber(accountNumber);
		    if (optionalAccount.isPresent()) {
		        CreateSavingsAccount account = optionalAccount.get();
		        account.setOpeningAmount(newBalance); // or use `setAverageBalance()` if that's your actual field
		        createSavingAccountRepo.save(account);
		        return true;
		    }
		    return false;
	}


}
