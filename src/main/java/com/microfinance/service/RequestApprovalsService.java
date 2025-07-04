package com.microfinance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.addCustomer;
import com.microfinance.repository.AddCustomerRepo;
import com.microfinance.repository.CreateSavingAccountRepo;


@Service
public class RequestApprovalsService {
	
	@Autowired
	AddCustomerRepo addCustomerRepo;
	
	@Autowired
	CreateSavingAccountRepo createSavingAccountRepo;

	public List<addCustomer> findAllMemberCode() {
		// TODO Auto-generated method stub
		List<addCustomer> list = addCustomerRepo.findAll();
		return list;

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

}
