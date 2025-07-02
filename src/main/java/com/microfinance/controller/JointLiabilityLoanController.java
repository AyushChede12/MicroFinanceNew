package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.CreateLendingGroup;
import com.microfinance.service.JointLiabilityLoanService;



@RestController
@RequestMapping("/api/joinliability")
public class JointLiabilityLoanController {
	@Autowired 
	JointLiabilityLoanService jointLiabilityLoanService;
	
	@PostMapping("/createLendingGroupsave")
    public ResponseEntity<ApiResponse<CreateLendingGroup>> saveLendingGroup(@RequestBody CreateLendingGroup createLendingGroup) {
        boolean isSaved = jointLiabilityLoanService.saveLendingGroup(createLendingGroup);

        if (isSaved) {
            ApiResponse<CreateLendingGroup> response = ApiResponse.success(
                HttpStatus.CREATED,
                "Lending Group saved successfully",
                createLendingGroup
            );
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
        } else {
            ApiResponse<CreateLendingGroup> response = ApiResponse.error(
                HttpStatus.BAD_REQUEST,
                "Failed to save Lending Group."
            );
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }
	 // View All createlendinggroup
    @GetMapping("/viewlendinggroup")
    public ResponseEntity<ApiResponse<List<CreateLendingGroup>>> getAlllendinggroup() {
        List<CreateLendingGroup> plans = jointLiabilityLoanService.getAlllendinggroup();

        if (plans != null && !plans.isEmpty()) {
            ApiResponse<List<CreateLendingGroup>> response = ApiResponse.success(
                HttpStatus.OK,
                "Lending Group fetched successfully.",
                plans
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<List<CreateLendingGroup>> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "No Lending Group found."
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
    @GetMapping("/editLendingGroup/{id}")
    public ResponseEntity<ApiResponse<CreateLendingGroup>> getLendingGroupById(@PathVariable Long id) {
        CreateLendingGroup plan = jointLiabilityLoanService.getLendingGroupById(id);

        if (plan != null) {
            ApiResponse<CreateLendingGroup> response = ApiResponse.success(
                HttpStatus.OK,
                "Lending Group fetched successfully.",
                plan
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<CreateLendingGroup> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "Lending Group not found for ID: " + id
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }

    // Update Loan Plan
    @PostMapping("/updateLendingGroup/{id}")
    public ResponseEntity<ApiResponse<CreateLendingGroup>> updateLoanPlan(
            @PathVariable Long id,
            @RequestBody CreateLendingGroup updatedGroup) {

        CreateLendingGroup updated = jointLiabilityLoanService.updategroupLending(id, updatedGroup);

        if (updated != null) {
            ApiResponse<CreateLendingGroup> response = ApiResponse.success(
                HttpStatus.OK,
                "Lending Group updated successfully.",
                updated
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<CreateLendingGroup> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "Lending Group not found or failed to update."
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
    // Delete Create group Lending
    @PostMapping("/deleteLendingGroup/{id}")
    public ResponseEntity<ApiResponse<Void>> deleteLoanPlan(@PathVariable Long id) {
        boolean deleted = jointLiabilityLoanService.deleteLendingGroup(id);

        if (deleted) {
            ApiResponse<Void> response = ApiResponse.success(
                HttpStatus.OK,
                "Lending Group deleted successfully.",
                null
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<Void> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "Lending Group not found for ID: " + id
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
	

}
