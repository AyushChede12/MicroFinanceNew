package com.microfinance.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.DailyDepositPM;
import com.microfinance.model.FixedDepositPM;
import com.microfinance.model.MISDepositPM;
import com.microfinance.model.RecurringDepositPM;
import com.microfinance.repository.DailyDepositPMRepo;
import com.microfinance.repository.FixedDepositPMRepo;
import com.microfinance.repository.MisDepositePMRepo;
import com.microfinance.repository.RecurringDepositRepo;

@Service
public class PolicyManagementService {
	@Autowired
	DailyDepositPMRepo dailyDepositPMRepo;
	
	@Autowired
	RecurringDepositRepo recurringDepositRepo;
	
	@Autowired
	FixedDepositPMRepo fixedDepositPMRepo;
	
	@Autowired
	MisDepositePMRepo misDepositePMRepo;
	

	public boolean saveRecuringDailyDeposite(RecurringDepositPM deposit) {
	    try {
	    	recurringDepositRepo.save(deposit);
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace(); // Log actual error
	        return false;
	    }
	}




public List<RecurringDepositPM> getAllData1() {
	// TODO Auto-generated method stub
	return recurringDepositRepo.findAll();
}
// fixed deposite of the service
public boolean saveFixedDeposite(FixedDepositPM fixedDepositPM) {
	// TODO Auto-generated method stub
	try {
			fixedDepositPMRepo.save(fixedDepositPM);
			return true;
    } catch (Exception e) {
    		e.printStackTrace(); // Log actual error
        return false;
    }
}
// feacth all data of the fixed deposite
public List<FixedDepositPM> getAllFixeddata() {
	// TODO Auto-generated method stub
	return fixedDepositPMRepo.findAll();
}



// daily Deposite save service
public boolean savedailydeposite(DailyDepositPM dailyDepositPM) {
	// TODO Auto-generated method stub
	try {
			dailyDepositPMRepo.save(dailyDepositPM);
		return true;
} catch (Exception e) {
		e.printStackTrace(); // Log actual error
    return false;
}
}



//feacth all data of the daily deposite
public List<DailyDepositPM> getAlldailydepositedata() {
	// TODO Auto-generated method stub
	return dailyDepositPMRepo.findAll();
}



//MIS Deposite save service
public boolean savemistdeposite(MISDepositPM misDepositPM) {
	try {
		misDepositePMRepo.save(misDepositPM);
	return true;
} catch (Exception e) {
	e.printStackTrace(); // Log actual error
return false;
}
}




public List<MISDepositPM> getAllMISDepositData() {
	// TODO Auto-generated method stub
	return misDepositePMRepo.findAll();
}



}
