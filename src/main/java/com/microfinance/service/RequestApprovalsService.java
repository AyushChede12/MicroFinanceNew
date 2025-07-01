package com.microfinance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.addCustomer;
import com.microfinance.repository.AddCustomerRepo;


@Service
public class RequestApprovalsService {
	
	@Autowired
	AddCustomerRepo addCustomerRepo;

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


	
	
}
