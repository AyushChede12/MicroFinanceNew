package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.addFinancialConsultant;
import com.microfinance.service.ReportsAndAnalyticsService;


@RestController
@RequestMapping("/api/reports")
public class ReportsAndAnalyticsController {
	
	@Autowired
	ReportsAndAnalyticsService reportsAndAnalyticsService;
	//Janvi : Fetch Approved Financial Consultant Data
	 @GetMapping("/getApprovedFinancialConsultant")
	    public ResponseEntity<ApiResponse<List<addFinancialConsultant>>> getApprovedFinancialConsultant() {
	        List<addFinancialConsultant> list = reportsAndAnalyticsService.getApprovedFinancialConsultant();
	        if (!list.isEmpty()) {
	            return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "approved customers fetched", list));
	        } else {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND)
	                    .body(ApiResponse.error(HttpStatus.NOT_FOUND, "No approved customers found"));
	        }
	    }

}
