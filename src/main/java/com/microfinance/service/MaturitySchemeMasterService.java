package com.microfinance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.MaturitySchemeMaster;
import com.microfinance.repository.MaturitySchemeMasterRepo;

@Service
public class MaturitySchemeMasterService {
	
	@Autowired
	MaturitySchemeMasterRepo maturityrepo;

	public MaturitySchemeMaster saveAllDailyDeposit(MaturitySchemeMaster maturityscheme) {
		// TODO Auto-generated method stub
		return maturityrepo.save(maturityscheme);
	}

}
