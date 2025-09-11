package com.microfinance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.microfinance.model.GoldDirectory;
import com.microfinance.model.SecuredGoldPlan;
import com.microfinance.repository.GoldDirectoryRepo;
import com.microfinance.repository.GoldSecurePlanRepo;

@Service
public class SecuredGoldLoanService {

	@Autowired
	GoldSecurePlanRepo goldSecurePlanRepo;

	@Autowired
	GoldDirectoryRepo goldDirectoryRepo;

	public SecuredGoldPlan saveLoanManagmentData(SecuredGoldPlan goldLoan) {
		if (goldLoan.getId() != null && goldSecurePlanRepo.existsById(goldLoan.getId())) {
			// Perform update
			SecuredGoldPlan existingGoldLoan = goldSecurePlanRepo.findById(goldLoan.getId()).get();

			// Gold Loan Details
			existingGoldLoan.setLoanPlanName(goldLoan.getLoanPlanName());
			existingGoldLoan.setTypeOfLoan(goldLoan.getTypeOfLoan());
			existingGoldLoan.setLoanMode(goldLoan.getLoanMode());
			existingGoldLoan.setInterestType(goldLoan.getInterestType());
			existingGoldLoan.setEmiType(goldLoan.getEmiType());
			existingGoldLoan.setMinAge(goldLoan.getMinAge());
			existingGoldLoan.setMaxAge(goldLoan.getMaxAge());
			existingGoldLoan.setMinAmt(goldLoan.getMinAmt());
			existingGoldLoan.setMaxAmt(goldLoan.getMaxAmt());
			existingGoldLoan.setMinTerm(goldLoan.getMinTerm());
			existingGoldLoan.setMaxTerm(goldLoan.getMaxTerm());
			existingGoldLoan.setRateInterestType(goldLoan.getRateInterestType());
			existingGoldLoan.setSecurityType(goldLoan.getSecurityType());
			existingGoldLoan.setPlanStatus(goldLoan.getPlanStatus());

			// Deduction Details
			existingGoldLoan.setProcFee(goldLoan.getProcFee());
			existingGoldLoan.setLegalCharge(goldLoan.getLegalCharge());
			existingGoldLoan.setGst(goldLoan.getGst());
			existingGoldLoan.setInsuFee(goldLoan.getInsuFee());
			existingGoldLoan.setValuFee(goldLoan.getValuFee());

			// Late Fine Details
			existingGoldLoan.setLateAllowanceDay(goldLoan.getLateAllowanceDay());
			existingGoldLoan.setPenaltyMode(goldLoan.getPenaltyMode());
			existingGoldLoan.setMonthlyPenalty(goldLoan.getMonthlyPenalty());

			return goldSecurePlanRepo.save(existingGoldLoan);
		} else {
			// Save new record
			return goldSecurePlanRepo.save(goldLoan);
		}

	}

	public List<SecuredGoldPlan> allDataFetchGoldSecurePlan() {
		// TODO Auto-generated method stub
		return goldSecurePlanRepo.findAll();

	}

	public SecuredGoldPlan getGoldLoanById(Long id) {
		// TODO Auto-generated method stub
		return goldSecurePlanRepo.findById(id).orElse(null);
	}

	public boolean deleteGoldLoanLoanById(Long id) {
		// TODO Auto-generated method stub
		if (goldSecurePlanRepo.existsById(id)) {
			goldSecurePlanRepo.deleteById(id);
			return true;
		}
		return false;
	}

	/*
	 * public GoldDirectory saveGoldDirectory(String karat, String silverRate,
	 * String goldRate, String itemMasterType, String itemName, String
	 * lockerLocation, String lockerAddress, String purityName, String purity,
	 * String itemPurityType) {
	 * 
	 * GoldDirectory goldDirectory = new GoldDirectory();
	 * 
	 * // Today's Rate goldDirectory.setKarat(karat);
	 * goldDirectory.setSilverRate(silverRate); goldDirectory.setGoldRate(goldRate);
	 * 
	 * // Item Master goldDirectory.setItemMasterType(itemMasterType);
	 * goldDirectory.setItemName(itemName);
	 * 
	 * // Locker Master goldDirectory.setLockerLocation(lockerLocation);
	 * goldDirectory.setLockerAddress(lockerAddress);
	 * 
	 * // Purity Master goldDirectory.setPurityName(purityName);
	 * goldDirectory.setPurity(purity);
	 * goldDirectory.setItemPurityType(itemPurityType);
	 * 
	 * return goldDirectoryRepo.save(goldDirectory); }
	 */
	public GoldDirectory saveOrUpdateGoldDirectory(Long id, String karat, String silverRate, String goldRate,
			String itemMasterType, String itemName, String lockerLocation, String lockerAddress, String purityName,
			String purity, String itemPurityType) {
		
		GoldDirectory goldDirectory;

        if (id != null) {
            goldDirectory = goldDirectoryRepo.findById(id).orElse(new GoldDirectory());
        } else {
            goldDirectory = new GoldDirectory();
        }

        // Set all fields
        goldDirectory.setKarat(karat);
        goldDirectory.setSilverRate(silverRate);
        goldDirectory.setGoldRate(goldRate);
        goldDirectory.setItemMasterType(itemMasterType);
        goldDirectory.setItemName(itemName);
        goldDirectory.setLockerLocation(lockerLocation);
        goldDirectory.setLockerAddress(lockerAddress);
        goldDirectory.setPurityName(purityName);
        goldDirectory.setPurity(purity);
        goldDirectory.setItemPurityType(itemPurityType);

        return goldDirectoryRepo.save(goldDirectory);
	}

//	public GoldDirectory saveItemMaster(String itemMasterType, String itemName) {
//		// TODO Auto-generated method stub
//		GoldDirectory goldDirectory = new GoldDirectory();
//		goldDirectory.setItemMasterType(itemMasterType);
//		goldDirectory.setItemName(itemName);
//		return goldDirectoryRepo.save(goldDirectory);
//	}
//
//	public GoldDirectory saveLockerMaster(String lockerLocation, String lockerAddress) {
//		// TODO Auto-generated method stub
//		GoldDirectory goldDirectory = new GoldDirectory();
//		goldDirectory.setLockerLocation(lockerLocation);
//		goldDirectory.setLockerAddress(lockerAddress);
//		return goldDirectoryRepo.save(goldDirectory);
//	}
//
//	public GoldDirectory savePurityMaster(String purityName, String purity, String itemPurityType) {
//		// TODO Auto-generated method stub
//		GoldDirectory goldDirectory = new GoldDirectory();
//		goldDirectory.setPurityName(purityName);
//		goldDirectory.setPurity(purity);
//		goldDirectory.setItemPurityType(itemPurityType);
//		return goldDirectoryRepo.save(goldDirectory);
//	}

}
