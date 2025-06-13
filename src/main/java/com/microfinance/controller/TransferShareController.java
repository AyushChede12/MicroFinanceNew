package com.microfinance.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.microfinance.model.addCustomer;
import com.microfinance.repository.TransferShareRepo;

@Controller
public class TransferShareController {

	@Autowired
	TransferShareRepo transferShareRepo;
	
	//fetch CustomerCode
	//@PostMapping("/fetchingTransferShare")
	//@ResponseBody
	/*public List<addCustomer> fetchByTransferShare(@RequestBody addCustomer addcustomer){
		List<addCustomer> list = 
		return list;
	}*/
}
