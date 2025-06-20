package com.microfinance.service;

import java.util.List;
import java.util.Optional;

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




public DailyDepositPM getDailyDepositById(Long id) {
	// TODO Auto-generated method stub
	 return dailyDepositPMRepo.findById(id).orElse(null);
}




public DailyDepositPM updateDailyDeposit(Long id, DailyDepositPM updatedData) {
	// TODO Auto-generated method stub
	 
	    return dailyDepositPMRepo.findById(id).map(existing -> {
	        existing.setPlanCode(updatedData.getPlanCode());
	        existing.setMinimumDeposit(updatedData.getMinimumDeposit());
	        existing.setRateOfInterest(updatedData.getRateOfInterest());
	        existing.setInstallmentType(updatedData.getInstallmentType());
	        existing.setPlanNameDD(updatedData.getPlanNameDD());
	        existing.setDuration(updatedData.getDuration()); // Fixed here
	        existing.setCommissionOnNew(updatedData.getCommissionOnNew());
	        existing.setRenewalCommission(updatedData.getRenewalCommission());
	        existing.setTermDD(updatedData.getTermDD());
	        existing.setTermModeDD(updatedData.getTermModeDD());
	        existing.setInterestInterval(updatedData.getInterestInterval());
	        existing.setTotalPaid(updatedData.getTotalPaid());
	        existing.setMaturityAmount(updatedData.getMaturityAmount());
	        existing.setFlexiblePlan(updatedData.getFlexiblePlan());
	        existing.setGraceDays(updatedData.getGraceDays());
	        existing.setPenaltyRate(updatedData.getPenaltyRate());
	        existing.setStatusOfPlan(updatedData.getStatusOfPlan());
	        
	        return dailyDepositPMRepo.save(existing); // Fixed here
	    }).orElse(null);
	}




public boolean deleteDailyDeposit(Long id) {
	// TODO Auto-generated method stub
	 if (dailyDepositPMRepo.existsById(id)) {
		 dailyDepositPMRepo.deleteById(id);
	        return true;
	    } else {
	        return false;
	    }
}



// edit by id reccuring deposite
public RecurringDepositPM getRecurringDepositById(Long id) {
	// TODO Auto-generated method stub
	 return recurringDepositRepo.findById(id).orElse(null);
}



//update the reccuring deposite service
public RecurringDepositPM updateRecurringDeposit(Long id, RecurringDepositPM updatedData) {
	 Optional<RecurringDepositPM> existingOpt = recurringDepositRepo.findById(id);

	    if (existingOpt.isPresent()) {
	        RecurringDepositPM existing = existingOpt.get();

	        // Update all fields
	        existing.setPlanCodeRD(updatedData.getPlanCodeRD());
	        existing.setPlanNameRD(updatedData.getPlanNameRD());
	        existing.setMinimumAmountRD(updatedData.getMinimumAmountRD());
	        existing.setRateOfInterestRD(updatedData.getRateOfInterestRD());
	        existing.setInstallmentTypeRD(updatedData.getInstallmentTypeRD());
	        existing.setDurationRD(updatedData.getDurationRD());
	        existing.setTermMode(updatedData.getTermMode());
	        existing.setTerm(updatedData.getTerm());
	        existing.setCommissionOnNewRD(updatedData.getCommissionOnNewRD());
	        existing.setRenewalCommissionRD(updatedData.getRenewalCommissionRD());
	        existing.setComponentIntervalRD(updatedData.getComponentIntervalRD());
	        existing.setTotalPaidRD(updatedData.getTotalPaidRD());
	        existing.setMaturityAmountRD(updatedData.getMaturityAmountRD());
	        existing.setFlexiblePlanRD(updatedData.getFlexiblePlanRD());
	        existing.setGraceDaysRD(updatedData.getGraceDaysRD());
	        existing.setPenltyfineRD(updatedData.getPenltyfineRD());
	        existing.setStatusOfPlanRD(updatedData.getStatusOfPlanRD());

	        return recurringDepositRepo.save(existing);
	    }

	    return null; // Not found
	}


//delete the recurring deposit service

public boolean deleteRecurringDeposit(Long id) {
	 if (recurringDepositRepo.existsById(id)) {
		 recurringDepositRepo.deleteById(id);
	        return true;
	    } else {
	        return false;
	    }
}
}





