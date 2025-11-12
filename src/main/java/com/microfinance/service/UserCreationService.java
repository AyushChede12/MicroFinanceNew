package com.microfinance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.UserCreation;
import com.microfinance.repository.UserCreationRepo;

@Service
public class UserCreationService {
	
	@Autowired
	private UserCreationRepo userCreationRepo;

	public void save(UserCreation userCreation) {
		// TODO Auto-generated method stub
		userCreationRepo.save(userCreation);
	}

}
