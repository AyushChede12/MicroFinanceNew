package com.microfinance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.addFinancialConsultant;
import com.microfinance.repository.ReportsAndAnalyticsRepo;



@Service
public class ReportsAndAnalyticsService {
	
	@Autowired
	ReportsAndAnalyticsRepo reportsAndAnalyticsRepo;

	public List<addFinancialConsultant> getApprovedFinancialConsultant() {
		// TODO Auto-generated method stub
		return reportsAndAnalyticsRepo.findByIsApprovedTrue();
	}
	

}
