package com.microfinance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.model.UserCreation;
import com.microfinance.service.UserCreationService;

@RestController
@RequestMapping("/api/userCreation")
public class UserCreationController {
	
	@Autowired
	private UserCreationService userCreationService;
	
	 @PostMapping("/saveUser")
	    @ResponseBody
	    public ResponseEntity<?> saveUser(@RequestBody UserCreation userCreation) {
	        if (userCreation != null) {
	            userCreationService.save(userCreation);  // ✅ use instance here
	            return ResponseEntity.ok("User saved successfully!");
	        } else {
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	                    .body("Failed to save user!");
	        }
	    }

}
