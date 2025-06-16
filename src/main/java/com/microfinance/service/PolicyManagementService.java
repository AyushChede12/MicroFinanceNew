package com.microfinance.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.DailyDepositPM;
import com.microfinance.model.FixedDepositPM;
import com.microfinance.model.RecurringDepositPM;
import com.microfinance.repository.DailyDepositPMRepo;
import com.microfinance.repository.FixedDepositPMRepo;
import com.microfinance.repository.RecurringDepositRepo;

@Service
public class PolicyManagementService {
	@Autowired
	DailyDepositPMRepo dailyDepositPMRepo;
	
	@Autowired
	RecurringDepositRepo recurringDepositRepo;
	
	@Autowired
	FixedDepositPMRepo fixedDepositPMRepo;
	

public boolean saveRecuringDailyDeposite(RecurringDepositPM recurringDepositPM) {
	return recurringDepositRepo.save(recurringDepositPM) != null;
}



public List<RecurringDepositPM> getAllData1() {
	// TODO Auto-generated method stub
	return recurringDepositRepo.findAll();
}

public boolean saveFixedDeposite(FixedDepositPM fixedDepositPM) {
	// TODO Auto-generated method stub
	return fixedDepositPMRepo.save(fixedDepositPM) != null;
}

public List<FixedDepositPM> getAllFixeddata() {
	// TODO Auto-generated method stub
	return fixedDepositPMRepo.findAll();
}



}
