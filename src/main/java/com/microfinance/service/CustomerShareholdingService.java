package com.microfinance.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.BranchModule;
import com.microfinance.model.addCustomer;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.BranchModuleRepo;

@Service
public class CustomerShareholdingService {

	@Autowired
	AddCustomerRepo addcustomerRepo;
	
	@Autowired
	BranchModuleRepo branchmodulRepo;

	// Find CustomerCode of Transfer Share
	public List<addCustomer> findByCustomerCode() {
		List<addCustomer> list = addcustomerRepo.findAll();
		return list;
	}

	//Fetching CustomerCode of Transfer ShareT 
	public List<addCustomer> fetchByCustomerCode(String memberCode) {
		List<addCustomer> list = addcustomerRepo.findByMemberCode(memberCode);
		return list;
	}

	//Find Branch of Transfer Share
	public List<BranchModule> findByBranch() {
		List<BranchModule> list = branchmodulRepo.findAll();
		return list;
	}
	
	
	
}
