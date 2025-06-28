package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.addCustomer;
import com.microfinance.service.RequestApprovalsService;

@RestController
@RequestMapping("/api/requestapproval")
public class RequestApprovalsController {

	@Autowired
	RequestApprovalsService requestApprovalsService;
	
	@GetMapping("/findAllMemberCode")
	public ApiResponse<List<addCustomer>> findAllMemberCode() {
		List<addCustomer> list = requestApprovalsService.findAllMemberCode();
		if (list != null && !list.isEmpty()) {
			return ApiResponse.success(HttpStatus.OK, "Transfer Share List Find Successfully", list);
		} else
			return ApiResponse.error(HttpStatus.NOT_FOUND, "Transfer Share Data List is not Found");
	}

}
