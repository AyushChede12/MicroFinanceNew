package com.microfinance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.ExecutiveFounderDto;
import com.microfinance.dto.SavingAccountDto;
import com.microfinance.model.CategoryModule;
import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.ExecutiveFounder;
import com.microfinance.model.FinancialYear;
import com.microfinance.model.SavingAccountActivity;
import com.microfinance.model.SavingSchemeCatalog;
import com.microfinance.model.states;
import com.microfinance.repository.CreateSavingAccountRepo;
import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;

import com.microfinance.service.CustomerSavingsService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/customersavings")
public class CustomerSavingsController {

	@Autowired
	CustomerSavingsService customersaving;
	
	
	  @Autowired CreateSavingAccountRepo createSavingAccountRepo;
	 
	
	@Value("${upload.directory}")
	private String uploadDirectory;
	
	// Save Saving Scheme Catalog
    @PostMapping("/savescheme")
    public ResponseEntity<ApiResponse<SavingSchemeCatalog>> saveSchemeCatalog(@RequestBody SavingSchemeCatalog savingSchemeCatalog) {
        boolean isSaved = customersaving.saveSavingScheme(savingSchemeCatalog);

        if (isSaved) {
            ApiResponse<SavingSchemeCatalog> response = ApiResponse.success(
                HttpStatus.OK,
                "Saving Scheme saved successfully.",
                savingSchemeCatalog
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<SavingSchemeCatalog> response = ApiResponse.error(
                HttpStatus.BAD_REQUEST,
                "Failed to save scheme."
            );
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }
    
  //Fetching CustomerCode   
  	@PostMapping("/fetchCustomerCode")
  	public ApiResponse<List<addCustomer>> fetchByCustomerCode(@RequestBody addCustomer addcustomer) {
  		List<addCustomer>  list = customersaving.fetchCustomerCode(addcustomer.getMemberCode());
  		if(list!=null && !list.isEmpty()) {
  			return ApiResponse.success(HttpStatus.FOUND, "Fetching is Successfull", list);
  		}else
  			return ApiResponse.error(HttpStatus.NOT_FOUND, "Not Found fetching Data");
  		
  		
  	}
  	
  	//fetching saving scheme catalog data
  	@GetMapping("/fetchsavingchemecatalog")
  	public ApiResponse<List<SavingSchemeCatalog>> findBySchemeType() {
  		List<SavingSchemeCatalog>  list = customersaving.findBySchemeType();
  		if(list!=null && !list.isEmpty()) {
  			return ApiResponse.success(HttpStatus.FOUND, "Fetching is Successfull", list);
  		}else
  			return ApiResponse.error(HttpStatus.NOT_FOUND, "Not Found fetching Data");
  		
  	}
  	
  	// find saving scheme catalog by id
  	 @GetMapping("/getSavingSchemeCatalogById")
 	public ResponseEntity<ApiResponse<SavingSchemeCatalog>> findSavingSchmeCatalogById(@RequestParam("id") Long id) {
 		Optional<SavingSchemeCatalog> savingscheme = customersaving.findSavingSchmeCatalogById(id);
 		if (savingscheme.isPresent()) {
 			ApiResponse<SavingSchemeCatalog> response = new ApiResponse<>(HttpStatus.FOUND,
 					"Saving Scheme Catalog Data fetched successfully", savingscheme.get());
 			return ResponseEntity.ok(response);
 		} else {
 			ApiResponse<SavingSchemeCatalog> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
 					"Saving Scheme Catalog Data not found for ID: " + id, null);
 			return ResponseEntity.status(404).body(response);
 		}
 	}
  	 
  	 //delete saving scheme catalog by id
  	@PostMapping("/deleteSavingSchemeCatalogDataById") 
	public ResponseEntity<ApiResponse<String>> deleteSavingSchemeCatalog(@RequestParam("id") Long id) {
		boolean isDeleted = customersaving.deleteSavingSchemeCatalog(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Saving Scheme Catalog Data deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					" deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}
     
	//fetch policy name
  	@GetMapping("/fetchpolicyname")
  	public ApiResponse<List<SavingSchemeCatalog>> findByPolicyName(@RequestParam String policyName) {
  	    List<SavingSchemeCatalog> list = customersaving.findByPolicyName(policyName);
  	    if (list != null && !list.isEmpty()) {
  	        return ApiResponse.success(HttpStatus.FOUND, "Fetching is Successfull", list);
  	    } else {
  	        return ApiResponse.error(HttpStatus.NOT_FOUND, "Not Found fetching Data");
  	    }
  	}

  	//fetch financial code  
  	@GetMapping("/fetchfinancialcode")
  	public ApiResponse<List<addFinancialConsultant>> findByFinancialCode(@RequestParam String financialCode) {
  	    List<addFinancialConsultant> list = customersaving.findByFinancialCode(financialCode);
  	    if (list != null && !list.isEmpty()) {
  	        return ApiResponse.success(HttpStatus.FOUND, "Fetching is Successfull", list);
  	    } else {
  	        return ApiResponse.error(HttpStatus.NOT_FOUND, "Not Found fetching Data");
  	    }
  	}
  	
 
//  	//save saving account data
//    @PostMapping("/saveandupdatesavingaccount") 
//	public ResponseEntity<ApiResponse<CreateSavingsAccount>> saveSavingAccountDetails(@RequestBody CreateSavingsAccount createSavingsAccount) {
//    	CreateSavingsAccount savedEntity = customersaving.saveSavingAccountDetails(createSavingsAccount);
//		String message = (createSavingsAccount.getId() == null) ? "Saving Account Details Save successfully"
//				: "Saving Account Details updated successfully";
//		ApiResponse<CreateSavingsAccount> response = new ApiResponse<>(HttpStatus.OK, message, savedEntity);
//		return ResponseEntity.ok(response);
//	}
    
	@PostMapping("/saveandupdatesavingaccount")
	public ResponseEntity<ApiResponse<CreateSavingsAccount>> saveSavingAccountDetails(
			@ModelAttribute SavingAccountDto savingAccountDto,
			@RequestParam(value = "photo", required = false) MultipartFile photo,
			@RequestParam(value = "signature", required = false) MultipartFile signature) {

		if (photo != null) {
			System.out.println("Received photo: " + photo.getOriginalFilename());
		}
		if (signature != null) {
			System.out.println("Received signature: " + signature.getOriginalFilename());
		}

		ApiResponse<CreateSavingsAccount> response = customersaving.saveSavingAccountDetails(savingAccountDto, photo,
				signature);
		// return new ResponseEntity<>(response, response.getStatus());
		return ResponseEntity.ok(new ApiResponse<>(
                HttpStatus.OK,
                savingAccountDto.getId() != null ? "Data updated successfully" : "Data saved successfully",
                response.getData()
        ));
	}
    
    //fetch all saving accouunt data
    @GetMapping("/getAllSavingAccountData")
	public ResponseEntity<ApiResponse<List<CreateSavingsAccount>>> fetchAllSavingAccountData() {
		List<CreateSavingsAccount> list = customersaving.fetchAllSavingAccountData();
		ApiResponse<List<CreateSavingsAccount>> response = new ApiResponse<>(HttpStatus.FOUND,
				"Saving Account Data fetched successfully", list);
		return ResponseEntity.ok(response);
	}
	
    /*//fetch all saving account data by account number
    @GetMapping("/getallbyaccountnumber")
   	public ResponseEntity<ApiResponse<List<CreateSavingsAccount>>> findAllByAccountNumber(@RequestParam String accountNumber) {
   		List<CreateSavingsAccount> list = customersaving.findAllByAccountNumber(accountNumber);
   		ApiResponse<List<CreateSavingsAccount>> response = new ApiResponse<>(HttpStatus.FOUND,
   				"Fetch account details by account number", list);
   		return ResponseEntity.ok(response);
   	}*/
    @GetMapping("/getallbyaccountnumber")
    public ResponseEntity<ApiResponse<List<CreateSavingsAccount>>> findAllByAccountNumber(@RequestParam String accountNumber) {
        
        List<CreateSavingsAccount> approvedAccounts = customersaving.findAllApprovedByAccountNumber(accountNumber);

        if (approvedAccounts == null || approvedAccounts.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ApiResponse<>(HttpStatus.BAD_REQUEST, "First approve account", null));
        }

        return ResponseEntity.status(HttpStatus.FOUND)
                .body(new ApiResponse<>(HttpStatus.FOUND, "Fetch account details by account number", approvedAccounts));
    }

    
    @GetMapping("/getSavingAccountDataById")
	public ResponseEntity<ApiResponse<CreateSavingsAccount>> findSavingAccountDataById(@RequestParam("id") Long id) {
		Optional<CreateSavingsAccount> fyear = customersaving.findSavingAccountDataById(id);
		if (fyear.isPresent()) {
			ApiResponse<CreateSavingsAccount> response = new ApiResponse<>(HttpStatus.FOUND,
					"Saving Account Data fetched successfully", fyear.get());
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<CreateSavingsAccount> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					"Saving Account Data not found for ID: " + id, null);
			return ResponseEntity.status(404).body(response);
		}
	}
    
    @PostMapping("/deleteSavingAccountDataById") 
	public ResponseEntity<ApiResponse<String>> deleteFinancialYear(@RequestParam("id") Long id) {
		boolean isDeleted = customersaving.deleteFinancialYear(id);
		if (isDeleted) {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.OK, "Saving Account Data deleted successfully",
					"success");
			return ResponseEntity.ok(response);
		} else {
			ApiResponse<String> response = new ApiResponse<>(HttpStatus.NOT_FOUND,
					" deletion failed", "failure");
			return ResponseEntity.badRequest().body(response);
		}
	}
    

    @PostMapping("/savesavingaccountactivity")
    public ResponseEntity<ApiResponse<SavingAccountActivity>> saveSavingAccountActivityData(@RequestBody SavingAccountActivity savingAccountActivity) {

    	SavingAccountActivity savedSavingActivity = customersaving.saveSavingAccountActivityData(savingAccountActivity);
        ApiResponse<SavingAccountActivity> response = new ApiResponse<>(HttpStatus.CREATED, "Saving Account Activit Data saved successfully", savedSavingActivity);
        return ResponseEntity.ok(response);
    }
    
  //fetch all saving account Activity by account number
    
    @GetMapping("/getsavingaccountactivity")
	public ResponseEntity<ApiResponse<List<SavingAccountActivity>>> findAllByAccountNumberSavingActivity(@RequestParam String accountNumber) {

	    List<SavingAccountActivity> members = customersaving.findAllByAccountNumberSavingActivity(accountNumber);

	    if (members != null && !members.isEmpty()) {
	        ApiResponse<List<SavingAccountActivity>> response = ApiResponse.success(
	            HttpStatus.OK,
	            "Consultants found for memberCode: " + accountNumber,
	            members
	        );
	        return new ResponseEntity<>(response, HttpStatus.OK);
	    } else {
	        ApiResponse<List<SavingAccountActivity>> response = ApiResponse.error(
	            HttpStatus.NOT_FOUND,
	            "No member found with this code"
	        );
	        return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
	    }
	}
   //update average balance of saving account by account number
    @PostMapping("/updateaveragebalance")
    public ResponseEntity<ApiResponse<String>> updateAverageBalance(@RequestBody CreateSavingsAccount createSavingsAccount) {
        String accountNumber = createSavingsAccount.getAccountNumber();
        String newBalance = createSavingsAccount.getOpeningAmount();

        boolean isUpdated = customersaving.updateAverageBalance(accountNumber, newBalance);

        if (isUpdated) {
            ApiResponse<String> response = ApiResponse.success(
                HttpStatus.OK,
                "Average balance updated successfully.",
                "Updated account: " + accountNumber
            );
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            ApiResponse<String> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "Account number not found or update failed."
            );
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/transferAmount")
    @Transactional
    public ResponseEntity<?> transferAmount(
            @RequestParam("debitAccountNo") String debitAccountNo,
            @RequestParam("creditAccountNo") String creditAccountNo,
            @RequestParam("amount") double amount) {
        try {
            
          CreateSavingsAccount debitAccount = createSavingAccountRepo.findByAccountNumber(debitAccountNo)
                  .orElseThrow(() -> new RuntimeException("Debit account not found"));

          CreateSavingsAccount creditAccount = createSavingAccountRepo.findByAccountNumber(creditAccountNo)
                  .orElseThrow(() -> new RuntimeException("Credit account not found"));

          double debitBalance = Double.parseDouble(debitAccount.getOpeningAmount());
          System.out.println("debitBalance" +debitBalance);
          double creditBalance = Double.parseDouble(creditAccount.getOpeningAmount());
          System.out.println("creditBalance" +creditBalance);

          
          if (debitBalance < amount) {
          	Map<String, String> response = new HashMap<>();
          	response.put("message", "Insufficient balance in debit account");
          	return ResponseEntity.badRequest().body(response);
          }

          // Update balances
          debitAccount.setOpeningAmount(String.valueOf(debitBalance - amount));
          creditAccount.setOpeningAmount(String.valueOf(creditBalance + amount));
          
          // Save changes
          createSavingAccountRepo.save(debitAccount);
          createSavingAccountRepo.save(creditAccount);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Amount transferred successfully");
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            Map<String, String> response = new HashMap<>();
            response.put("message", "Transfer failed: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

 // Api For fetching account numbers (Vaibhav)
    @GetMapping("/fetchAccountNumbers")
    public ResponseEntity<ApiResponse<List<String>>> getAccountNumbersByType(@RequestParam String accountType) {
        List<String> accountNumbers = customersaving.getAccountNumbersByType(accountType);

        if (accountNumbers.isEmpty()) {
            ApiResponse<List<String>> response = ApiResponse.error(
                HttpStatus.NOT_FOUND, "No account numbers found.");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }

        ApiResponse<List<String>> response = ApiResponse.success(
            HttpStatus.OK, "Account numbers fetched successfully.", accountNumbers);
        return ResponseEntity.ok(response);
    }
    
 // Api for fetching the account details with the help of account number (vaibhav)
    @GetMapping("/getDataByAccountNumber")
    public ResponseEntity<ApiResponse<CreateSavingsAccount>> getAccountByNumber(@RequestParam String accountNumber) {
        Optional<CreateSavingsAccount> account = customersaving.getAccountByNumber(accountNumber);

        // ✔️ Correct null check for Optional:
        if (!account.isPresent()) {
            ApiResponse<CreateSavingsAccount> response = ApiResponse.error(
                    HttpStatus.NOT_FOUND, "Account not found.");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
         }

        // ✔️ Use account.get() not Optional itself
        ApiResponse<CreateSavingsAccount> response = ApiResponse.success(
                HttpStatus.OK, "Account fetched successfully.", account.get());
        return ResponseEntity.ok(response);
    }

 
	
}
