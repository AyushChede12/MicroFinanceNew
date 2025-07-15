package com.microfinance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.AddnewinvestmentPM;
import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.addCustomer;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.AddInvestmentRepo;
import com.microfinance.repository.CreateSavingAccountRepo;


@Service
public class RequestApprovalsService {
	
	@Autowired
	AddCustomerRepo addCustomerRepo;
	
	@Autowired
	CreateSavingAccountRepo createSavingAccountRepo;
	
	@Autowired
	AddInvestmentRepo addInvestmentRepo;

	public List<addCustomer> findAllMemberCode() {
		// TODO Auto-generated method stub
		List<addCustomer> list = addCustomerRepo.findAll();
		return list;

	}


	public Optional<addCustomer> findByIdShowStatus(Long id) {
		// TODO Auto-generated method stub
		return addCustomerRepo.findById(id);
	}

	public addCustomer save(addCustomer customer) {
		// TODO Auto-generated method stub
		return addCustomerRepo.save(customer);
	}

	public List<addCustomer> getUnapprovedCustomersByMemberCode(String branchName) {
		// TODO Auto-generated method stub
		return addCustomerRepo.findByIsApprovedFalseAndMemberCode(branchName);
	}

	

	public List<addCustomer> getUnapprovedCustomers() {
	    return addCustomerRepo.findByIsApprovedFalse();
	}



	
	

	public List<CreateSavingsAccount> getUnapprovedSavingTransaction() {
		// TODO Auto-generated method stub
		return createSavingAccountRepo.findByIsApprovedFalse();
	}

	public Optional<CreateSavingsAccount> SavingTransactionById(Long id) {
		// TODO Auto-generated method stub
		return createSavingAccountRepo.findById(id);
	}

	public CreateSavingsAccount save(CreateSavingsAccount customer) {
		// TODO Auto-generated method stub
		return createSavingAccountRepo.save(customer);
	}

	public List<AddnewinvestmentPM> getAllUnapprovedAddNewInvestment() {
		// TODO Auto-generated method stub
		return addInvestmentRepo.findByIsApprovedFalse();
	}


	


	public Optional<AddnewinvestmentPM> findByIdShowStatusInvestment(Long id) {
		// TODO Auto-generated method stub
		return addInvestmentRepo.findById(id);
	}


	public AddnewinvestmentPM save(AddnewinvestmentPM investment) {
		// TODO Auto-generated method stub
		return addInvestmentRepo.save(investment);
	}


	
}
