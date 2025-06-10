package com.microfinance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.microfinance.model.ManageDepartment;
import com.microfinance.model.ManageDesignation;
import com.microfinance.repository.DepartmentRepo;
import com.microfinance.repository.DesignationRepo;

@Service
public class TeamManagementService {
	@Autowired
	DesignationRepo designationRepo;
	
	@Autowired
	DepartmentRepo departmentRepo;

	public ManageDesignation saveDesignation(ManageDesignation manageDesignation) {
		// TODO Auto-generated method stub
		return designationRepo.save(manageDesignation);
	}

	public ManageDepartment saveDepartment(ManageDepartment manageDepartment) {
		// TODO Auto-generated method stub
		return departmentRepo.save(manageDepartment);
	}

	public List<ManageDesignation> fetchDesignationList() {
		// TODO Auto-generated method stub
		return designationRepo.findAll();
	}

	public List<ManageDepartment> fetchDepartmentList() {
		// TODO Auto-generated method stub
		return departmentRepo.findAll();
	}

}
