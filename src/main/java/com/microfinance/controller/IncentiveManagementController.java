package com.microfinance.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
	

import com.microfinance.model.IncentiveSchemeMaster;
import com.microfinance.model.TeamMember;
import com.microfinance.service.IncentiveManagementService;



@Controller
public class IncentiveManagementController {

	@Autowired
	private IncentiveManagementService incentiveSchemeMasterService;
	
	
	//incentive save Data date:-13-6-25
	//Anjali
	
	@PostMapping("/saveIncentive")
	@ResponseBody
	public ResponseEntity<String> saveIncentiveScheme(@RequestBody IncentiveSchemeMaster incentive) {
		IncentiveSchemeMaster Data = incentiveSchemeMasterService.saveIncentive(incentive);
		if(Data!=null)
			return ResponseEntity.ok("success");
		else
			return ResponseEntity.badRequest().body("Failure");
	}
	
	//fetch the data from table 
	//Anjali 14-6-25
	
	
	@GetMapping("/getAllIncentives")
	@ResponseBody
    public List<IncentiveSchemeMaster> getAllIncentives() {
		List<IncentiveSchemeMaster> list=incentiveSchemeMasterService.getAllIncentives();
        return list;
    }
	
	//fetch the team member name 
	//anjali 17-6-25
	
	@GetMapping("/getAllTeamMembers")
	@ResponseBody
	public List<String> getAllTeamMemberNames() {
	    List<TeamMember> members = incentiveSchemeMasterService.getAllTeamMember();
	    List<String> names = new ArrayList<>();
	    for (TeamMember member : members) {
	        names.add(member.getTeamMemberName());
	    }
	    return names;
	}

	

	
}
