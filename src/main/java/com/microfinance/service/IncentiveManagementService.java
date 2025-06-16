package com.microfinance.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.IncentiveSchemeMaster;
import com.microfinance.repository.IncentiveSchemeMasterRepo;


@Service
public class IncentiveManagementService {
	
	@Autowired 
	IncentiveSchemeMasterRepo incentiveschemerepo;

	public IncentiveSchemeMaster saveIncentive(IncentiveSchemeMaster incentive) {
		// TODO Auto-generated method stub
		return incentiveschemerepo.save(incentive);
	}

	public List<IncentiveSchemeMaster> getAllIncentives() {
		// TODO Auto-generated method stub
		return incentiveschemerepo.findAll();
	}


	
}
