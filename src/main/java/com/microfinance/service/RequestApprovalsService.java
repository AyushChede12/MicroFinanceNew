package com.microfinance.service;

import java.util.List;

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

}
