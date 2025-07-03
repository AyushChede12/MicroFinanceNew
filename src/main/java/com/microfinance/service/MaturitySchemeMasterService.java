package com.microfinance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.ApplyForMaturity;
import com.microfinance.model.MaturitySchemeMaster;
import com.microfinance.repository.ApplyForMaturityRepo;
import com.microfinance.repository.MaturitySchemeMasterRepo;

@Service
public class MaturitySchemeMasterService {
	
	@Autowired
	MaturitySchemeMasterRepo maturityschemerepo;
	
	@Autowired
	ApplyForMaturityRepo Applymaturityrepo;

	public MaturitySchemeMaster saveAllDailyDeposit(MaturitySchemeMaster maturityscheme) {
		// TODO Auto-generated method stub
		return maturityschemerepo.save(maturityscheme);
	}

	public ApplyForMaturity saveApplymaturity(ApplyForMaturity applymaturity) {
		// TODO Auto-generated method stub
		return Applymaturityrepo.save(applymaturity);
	}

}
