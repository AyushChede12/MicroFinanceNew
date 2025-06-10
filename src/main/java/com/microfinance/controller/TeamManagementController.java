package com.microfinance.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.microfinance.model.ManageDepartment;
import com.microfinance.model.ManageDesignation;
import com.microfinance.model.RelativeModule;
import com.microfinance.service.TeamManagementService;

@Controller
public class TeamManagementController {
	
	@Autowired
	TeamManagementService teamService;
	
	//ManageDesignation Module - Janvi
		@PostMapping("/saveDesignation")
		@ResponseBody
		public ResponseEntity<String> saveDesignation(@RequestBody ManageDesignation manageDesignation) {
			ManageDesignation designation = teamService.saveDesignation(manageDesignation);
			if(designation!=null)
				return ResponseEntity.ok("success");
			else
				return ResponseEntity.badRequest().body("Failure");
		}
		
		//Get Designation List - Janvi
		@GetMapping("/getDesignationList")                       
		@ResponseBody
		public List<ManageDesignation> fetchDesignationList(){
			List<ManageDesignation> list = teamService.fetchDesignationList();
			return list;
		}
		
		
		//ManageDepartment Module - Janvi
		@PostMapping("/saveDepartment")
		@ResponseBody
		public ResponseEntity<String> saveDepartment(@RequestBody ManageDepartment manageDepartment) {
			ManageDepartment department = teamService.saveDepartment(manageDepartment);
			if (department != null)
				return ResponseEntity.ok("success");
			else
				return ResponseEntity.badRequest().body("Failure");
		}
				
		// Get Department List - Janvi
		@GetMapping("/getDepartmentList")
		@ResponseBody
		public List<ManageDepartment> fetchDepartmentList() {
			List<ManageDepartment> list = teamService.fetchDepartmentList();
			return list;
		}		

}
