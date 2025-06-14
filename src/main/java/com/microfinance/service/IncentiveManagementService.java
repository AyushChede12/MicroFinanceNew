package com.microfinance.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.incentiveSchemeMaster;
import com.microfinance.repository.IncentiveSchemeMasterRepo;


@Service
public class IncentiveManagementService {
	
	@Autowired 
	IncentiveSchemeMasterRepo incentiveschemerepo;

	public incentiveSchemeMaster saveIncentive(incentiveSchemeMaster incentive) {
		// TODO Auto-generated method stub
		return incentiveschemerepo.save(incentive);
	}


	
}
