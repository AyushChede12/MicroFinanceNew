package com.microfinance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.SavingSchemeCatalog;
import com.microfinance.repository.SavingSchmeCatalogRepo;

@Service
public class CustomerSavingsService {

	@Autowired
	SavingSchmeCatalogRepo savingSchmeCatalogRepo;
	public void saveSavingScheme(SavingSchemeCatalog savingSchemeCatalog) {
		savingSchmeCatalogRepo.save(savingSchemeCatalog);
	}

}
