package com.microfinance.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.CustomerDto;
import com.microfinance.model.CompanyAdministration;
import com.microfinance.model.addCustomer;
import com.microfinance.service.DataCorrectionService;

@RestController
@RequestMapping("/api/datacorrection")
public class DataCorrectionController {
	
	@Autowired
	DataCorrectionService dataCorrectionService;
	
	@Value("${upload.directory}")
	private String uploadDirectory;
	
	@PostMapping("/updateDataOfCustomer")
	public ResponseEntity<ApiResponse<addCustomer>> updateCustomerData(
			@RequestBody CustomerDto customerDto,
			@RequestParam(value = "customerPhoto", required = false) MultipartFile customerPhoto
	) throws IOException {

		try {

			String photoName = null;
			String signatureName = null;

			// Save customer photo
			if (customerPhoto != null && !customerPhoto.isEmpty()) {
				photoName = System.currentTimeMillis() + "_" + customerPhoto.getOriginalFilename();
				File photoFile = new File(uploadDirectory + photoName);
				customerPhoto.transferTo(photoFile);
			}

			

			// Update customer
			addCustomer updated = dataCorrectionService.updateCustomer(customerDto, photoName);

			return ResponseEntity.ok(new ApiResponse<>(HttpStatus.OK, "Customer updated successfully", updated));

		} catch (IOException e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
				.body(new ApiResponse<>(HttpStatus.INTERNAL_SERVER_ERROR, "File upload failed", null));
		}
	}


}
