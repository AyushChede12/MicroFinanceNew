package com.microfinance.service;

import java.util.List;

import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.AddnewinvestmentPM;
import com.microfinance.model.DailyDepositPM;
import com.microfinance.model.FixedDepositPM;
import com.microfinance.model.MISDepositPM;
import com.microfinance.model.RecurringDepositPM;
import com.microfinance.repository.AddInvestmentRepo;
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

	@Autowired
	AddInvestmentRepo addinvestmentrepo;

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
			existing.setPlanCodeDD(updatedData.getPlanCodeDD());
			existing.setMinimumDeposit(updatedData.getMinimumDeposit());
			existing.setRateOfInterest(updatedData.getRateOfInterest());
			existing.setInstallmentType(updatedData.getInstallmentType());
			existing.setPlanNameDD(updatedData.getPlanNameDD());
			existing.setDuration(updatedData.getDuration()); // Fixed here
			existing.setCommissionOnNew(updatedData.getCommissionOnNew());
			existing.setRenewalCommission(updatedData.getRenewalCommission());
			existing.setDdterm(updatedData.getDdterm());
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
		Optional<RecurringDepositPM> existingOptional = recurringDepositRepo.findById(id);

		if (existingOptional.isPresent()) {
			RecurringDepositPM existing = existingOptional.get();

			// 🔁 Update all fields manually
			existing.setPlanCodeRD(updatedData.getPlanCodeRD());
			existing.setPlanNameRD(updatedData.getPlanNameRD());
			existing.setMinimumAmountRD(updatedData.getMinimumAmountRD());
			existing.setRateOfInterestRD(updatedData.getRateOfInterestRD());
			existing.setInstallmentTypeRD(updatedData.getInstallmentTypeRD());
			existing.setDurationRD(updatedData.getDurationRD());
			existing.setTermMode(updatedData.getTermMode());
			existing.setRdterm(updatedData.getRdterm());
			existing.setCommissionOnNewRD(updatedData.getCommissionOnNewRD());
			existing.setRenewalCommissionRD(updatedData.getRenewalCommissionRD());
			existing.setComponentIntervalRD(updatedData.getComponentIntervalRD());
			existing.setTotalPaidRD(updatedData.getTotalPaidRD());
			existing.setMaturityAmountRD(updatedData.getMaturityAmountRD());
			existing.setFlexiblePlanRD(updatedData.getFlexiblePlanRD());
			existing.setGraceDaysRD(updatedData.getGraceDaysRD());
			existing.setPenltyfineRD(updatedData.getPenltyfineRD());
			existing.setStatusOfPlanRD(updatedData.getStatusOfPlanRD());

			// Save updated object
			return recurringDepositRepo.save(existing);
		} else {
			return null; // ❌ ID not found
		}
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

//Fetch the data fixed deposit service

	public FixedDepositPM getFixedDepositById(Long id) {
		// TODO Auto-generated method stub
		return fixedDepositPMRepo.findById(id).orElse(null);
	}

	public FixedDepositPM updateFixedDeposit(Long id, FixedDepositPM updatedData) {
		Optional<FixedDepositPM> existingOptional = fixedDepositPMRepo.findById(id);

		if (existingOptional.isPresent()) {
			FixedDepositPM existing = existingOptional.get();

			// Update all fields
			existing.setPlanCodeFD(updatedData.getPlanCodeFD());
			existing.setPlanNameFD(updatedData.getPlanNameFD());
			existing.setMinimumAmountFD(updatedData.getMinimumAmountFD());
			existing.setRateOfInterestFD(updatedData.getRateOfInterestFD());
			existing.setTermModeFD(updatedData.getTermModeFD());
			existing.setFdterm(updatedData.getFdterm());
			existing.setDurationFD(updatedData.getDurationFD());
			existing.setInstallmentTypeFD(updatedData.getInstallmentTypeFD());
			existing.setCommissionOnNewFD(updatedData.getCommissionOnNewFD());
			existing.setComponentIntervalFD(updatedData.getComponentIntervalFD());
			existing.setTotalPaidFD(updatedData.getTotalPaidFD());
			existing.setMaturityAmountFD(updatedData.getMaturityAmountFD());
			existing.setFlexiblePlanFD(updatedData.getFlexiblePlanFD());
			existing.setRenewalCommissionFD(updatedData.getRenewalCommissionFD());
			existing.setGraceDaysFD(updatedData.getGraceDaysFD());
			existing.setPenltyfineFD(updatedData.getPenltyfineFD());
			existing.setStatusOfPlanFD(updatedData.getStatusOfPlanFD());

			return fixedDepositPMRepo.save(existing); // save updated data
		}

		return null; // not found
	}

	public boolean deleteFixedDeposit(Long id) {
		if (fixedDepositPMRepo.existsById(id)) {
			fixedDepositPMRepo.deleteById(id);
			return true;
		} else {
			return false;
		}
	}

	public MISDepositPM getMISDepositById(Long id) {
		// TODO Auto-generated method stub
		return misDepositePMRepo.findById(id).orElse(null);
	}

	public MISDepositPM updateMISDeposit(Long id, MISDepositPM updatedData) {
		// TODO Auto-generated method stub
		Optional<MISDepositPM> existingOptional = misDepositePMRepo.findById(id);

		if (existingOptional.isPresent()) {
			MISDepositPM existing = existingOptional.get();

			// Set fields from updatedData to existing
			existing.setPlanCodeMD(updatedData.getPlanCodeMD());
			existing.setPlanNameMD(updatedData.getPlanNameMD());
			existing.setRateOfInterestMD(updatedData.getRateOfInterestMD());
			existing.setDurationMD(updatedData.getDurationMD());
			existing.setInstallmentTypeMD(updatedData.getInstallmentTypeMD());
			existing.setMinimumAmountMD(updatedData.getMinimumAmountMD());
			existing.setMaturityROIMD(updatedData.getMaturityROIMD());
			existing.setTermModeMD(updatedData.getTermModeMD());
			existing.setMisTerm(updatedData.getMisTerm());
			existing.setMISIntROIMD(updatedData.getMISIntROIMD());
			existing.setMISIntervalMD(updatedData.getMISIntervalMD());
			existing.setMISInterestMD(updatedData.getMISInterestMD());
			existing.setMaturityAmountMD(updatedData.getMaturityAmountMD());
			existing.setFlexiblePlanMD(updatedData.getFlexiblePlanMD());
			existing.setCommissionOnNewMD(updatedData.getCommissionOnNewMD());
			existing.setRenewalCommissionMD(updatedData.getRenewalCommissionMD());
			existing.setStatusOfPlanMDRD2(updatedData.getStatusOfPlanMDRD2());

			return misDepositePMRepo.save(existing);
		}
		return null;

	}

	public boolean deleteMISDeposit(Long id) {
		if (misDepositePMRepo.existsById(id)) {
			misDepositePMRepo.deleteById(id);
			return true;
		} else {
			return false;
		}
	}

//Ashwini
	/*
	 * public List<AddnewinvestmentPM> getAddInvestmentDetails() { // TODO
	 * Auto-generated method stub return addinvestmentrepo.findAll(); }
	 */

	public List<String> getSchemeNameBySchemeType(String drd) {
		List<DailyDepositPM> allDrdPlans = dailyDepositPMRepo.findBydrd(drd);
		return allDrdPlans.stream().map(DailyDepositPM::getPlanNameDD).distinct().collect(Collectors.toList());
	}

	public List<String> getRRDBySchemeType(String rd) {
		List<RecurringDepositPM> allRrdPlans = recurringDepositRepo.findByrd(rd);
		return allRrdPlans.stream().map(RecurringDepositPM::getPlanNameRD).distinct().collect(Collectors.toList());
	}

	public List<String> getFRDBySchemeType(String fd) {
		List<FixedDepositPM> allFrdPlans = fixedDepositPMRepo.findByfd(fd);
		return allFrdPlans.stream().map(FixedDepositPM::getPlanNameFD).distinct().collect(Collectors.toList());

	}

public DailyDepositPM getDDTermAndInterestRate(String planNameDD) {
    return dailyDepositPMRepo.findByplanNameDD(planNameDD);
}

	public List<String> getMISRDBySchemeType(String mis) {
		List<MISDepositPM> allMisrdPlans = misDepositePMRepo.findBymis(mis);
		return allMisrdPlans.stream().map(MISDepositPM::getPlanNameMD).distinct().collect(Collectors.toList());
	}


//	public DailyDepositPM getDDTermAndInterestRate(String planNameDD) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	public List<AddnewinvestmentPM> getAddInvestmentDetails() {
		// TODO Auto-generated method stub
		return addinvestmentrepo.findAll();
	}

	public RecurringDepositPM getRDTermAndInterestRate(String planNameRD) {
		return recurringDepositRepo.findByplanNameRD(planNameRD);
	}

	public FixedDepositPM getFDTermAndInterestRate(String planNameFD) {
		return fixedDepositPMRepo.findByplanNameFD(planNameFD);
	}

	public MISDepositPM getMISTermAndInterestRate(String planNameMD) {
		return misDepositePMRepo.findByplanNameMD(planNameMD);
	}

	public List<AddnewinvestmentPM> findByBranch(String branchName) {
		// TODO Auto-generated method stub
		List<AddnewinvestmentPM> list = addinvestmentrepo.findByBranchName(branchName);
		return list;
	}

	public AddnewinvestmentPM getDetailsById(Long id) {
		// TODO Auto-generated method stub
		return addinvestmentrepo.findById(id).orElse(null);
	}



public AddnewinvestmentPM saveInvestment(AddnewinvestmentPM investment) {
    return addinvestmentrepo.save(investment);
}


public List<DailyDepositPM> getAllDDTerm() {
	// TODO Auto-generated method stub
	return dailyDepositPMRepo.findAll();
}





}

  










