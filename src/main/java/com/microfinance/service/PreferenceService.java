package com.microfinance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.BankModule;
import com.microfinance.model.BranchModule;
import com.microfinance.model.CasteModule;
import com.microfinance.model.CategoryModule;
import com.microfinance.model.FinancialYear;
import com.microfinance.model.RelativeModule;
import com.microfinance.repository.BankModuleRepo;
import com.microfinance.repository.BranchModuleRepo;
import com.microfinance.repository.CasteModuleRepo;
import com.microfinance.repository.CategoryModuleRepo;
import com.microfinance.repository.FinancialYearRepo;
import com.microfinance.repository.RelativeModuleRepo;

@Service
public class PreferenceService {
	
	@Autowired
	BranchModuleRepo branchModuleRepo;
	
	@Autowired
	CasteModuleRepo casteModuleRepo;
	
	@Autowired
	BankModuleRepo bankModuleRepo;
	
	@Autowired
	RelativeModuleRepo relativeModuleRepo;
	
	@Autowired
	CategoryModuleRepo categoryModuleRepo;
	
	@Autowired
	FinancialYearRepo financialYearRepo;

	//Branch Module
	public BranchModule saveAllBranchModule(BranchModule branchModule) {
		// TODO Auto-generated method stub
		return branchModuleRepo.save(branchModule);
	}

	public List<BranchModule> fetchAllBranchModule() {
		// TODO Auto-generated method stub
		return branchModuleRepo.findAll();
	}

	//Bank Module
	public BankModule saveAllBankModule(BankModule bankModule) {
		// TODO Auto-generated method stub
		return bankModuleRepo.save(bankModule);
	}

	public List<BankModule> fetchAllBankModule() {
		// TODO Auto-generated method stub
		return bankModuleRepo.findAll();
	}

	//Relative Module
	public RelativeModule saveAllRelativeModule(RelativeModule relativeModule) {
		// TODO Auto-generated method stub
		return relativeModuleRepo.save(relativeModule);
	}
	
	public List<RelativeModule> fetchAllRelativeModule() {
		// TODO Auto-generated method stub
		return relativeModuleRepo.findAll();
	}
	
	//Caste Module
	public CasteModule saveCasteModule(CasteModule castemodule) {
		// TODO Auto-generated method stub
		return casteModuleRepo.save(castemodule);
	}

	public List<CasteModule> fetchAllCasteModule() {
		// TODO Auto-generated method stub
		return casteModuleRepo.findAll();
	}

	//Category Module
	public CategoryModule saveCategoryModule(CategoryModule categorymodule) {
		// TODO Auto-generated method stub
		return categoryModuleRepo.save(categorymodule);
	}

	public List<CategoryModule> fetchAllCategoryModule() {
		// TODO Auto-generated method stub
		return categoryModuleRepo.findAll();
	}

	//Financial Year
	public FinancialYear saveFinancialYear(FinancialYear financialyear) {
		// TODO Auto-generated method stub
		return financialYearRepo.save(financialyear);
	}

	public List<FinancialYear> fetchAllFinancialYear() {
		// TODO Auto-generated method stub
		return financialYearRepo.findAll();
	}

	
	
	

}
