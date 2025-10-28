package com.microfinance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.microfinance.model.ApplyForGold;
import com.microfinance.model.GoldDirectory;
import com.microfinance.model.SecuredGoldPlan;
import com.microfinance.model.addCustomer;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.ApplyForGoldRepo;
import com.microfinance.repository.GoldDirectoryRepo;
import com.microfinance.repository.GoldLoanApprovalRepo;
import com.microfinance.repository.GoldSecurePlanRepo;

@Service
public class SecuredGoldLoanService {

	@Autowired
	GoldSecurePlanRepo goldSecurePlanRepo;

	@Autowired
	GoldDirectoryRepo goldDirectoryRepo;
	
	@Autowired
	ApplyForGoldRepo applyForGoldRepo;
	
	@Autowired
	AddCustomerRepo addCustomerRepo;
	
	@Autowired
	GoldLoanApprovalRepo goldLoanApprovalRepo;
	


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
			existingGoldLoan.setLoanAmt(goldLoan.getLoanAmt());
			existingGoldLoan.setLoanTerm(goldLoan.getLoanTerm());
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
	
	public List<GoldDirectory> getAllGoldDirectories() {
		// TODO Auto-generated method stub
		return goldDirectoryRepo.findAll();
	}

	
	  public List<addCustomer> getLoanApplicationById(String memberCode) { 
		  // TODO Auto-generated method stub 
		  return addCustomerRepo.findByMemberCode(memberCode);
		  }
	 

	public List<addCustomer> getAllCustomers() {
		// TODO Auto-generated method stub
		return addCustomerRepo.findAll();
	}

	public List<GoldDirectory> getLoanPlanNameApplyForGoldByLoanPlan(String loanPlanName) {
		// TODO Auto-generated method stub
		return goldDirectoryRepo.findByloanPlanName(loanPlanName);
	}

	public GoldDirectory saveGoldDirectory(GoldDirectory goldDirectory) {
		// TODO Auto-generated method stub
		return goldDirectoryRepo.save(goldDirectory);
	}

	public List<GoldDirectory> getByMemberCodeApplyForGoldByLoanPlan(String customerCode) {
		// TODO Auto-generated method stub
		return goldDirectoryRepo.findBycustomerCode(customerCode);
	}

	public boolean saveApplyForGoldData(ApplyForGold applyForGold) {
		// TODO Auto-generated method stub
		try {
			applyForGoldRepo.save(applyForGold);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
	}

	public List<ApplyForGold> getAllGoldLoanCustomer() {
		// TODO Auto-generated method stub
		return applyForGoldRepo.findAll();
	}

	public List<ApplyForGold> getByGoldIDforApproval(String goldID) {
		// TODO Auto-generated method stub
		return goldLoanApprovalRepo.findByGoldID(goldID);
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
