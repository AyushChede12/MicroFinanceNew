package com.microfinance.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.DailyDepositPM;
import com.microfinance.repository.DailyDepositPMRepo;

@Service
public class DailyDepositPMService {
	@Autowired
	DailyDepositPMRepo dailyDepositPMRepo;
	
@Transactional
	public boolean saveDailyDeposite(DailyDepositPM data) {
		// TODO Auto-generated method stub
		return dailyDepositPMRepo.save(data) != null;
	}

public List<DailyDepositPM> getAllData() {
	// TODO Auto-generated method stub
	return dailyDepositPMRepo.findAll();
}


}
