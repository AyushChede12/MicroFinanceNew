package com.microfinance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.AddnewinvestmentPM;
import com.microfinance.model.DailyDepositPM;
import com.microfinance.model.FixedDepositPM;
import com.microfinance.model.MISDepositPM;
import com.microfinance.model.RecurringDepositPM;
import com.microfinance.service.PolicyManagementService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequestMapping("/api/Policymangment")
public class PolicyManagementController {

    @Autowired
    private PolicyManagementService policyManagementService;
    
    //save daily Deposite
    @PostMapping("/daily-depositsave")
    public ResponseEntity<ApiResponse<DailyDepositPM>> savedailyDeposite(@RequestBody DailyDepositPM dailyDepositPM)
    {
    	boolean isSaved=policyManagementService.savedailydeposite(dailyDepositPM);
    	
    	if(isSaved)
    	{
    		ApiResponse<DailyDepositPM> response=ApiResponse.success(HttpStatus.CREATED, "Daily Deposite saved successfully", dailyDepositPM);
    		 return ResponseEntity.status(HttpStatus.CREATED).body(response);
    		
    		
    	}else
    	 {
            ApiResponse<DailyDepositPM> response = ApiResponse.error(
                HttpStatus.BAD_REQUEST,
                "Failed to save fixed deposit."
            );
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
    	
    }
    } 
    // View All daily Deposits
    @GetMapping("/daily-deposit/view")
    public ResponseEntity<ApiResponse<List<DailyDepositPM>>> getAlldailyDeposits() {
        List<DailyDepositPM> deposits = policyManagementService.getAlldailydepositedata();

        if (deposits != null && !deposits.isEmpty()) {
            ApiResponse<List<DailyDepositPM>> response = ApiResponse.success(HttpStatus.OK,
                "Daily deposits fetched successfully.",
                deposits
            );
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            ApiResponse<List<DailyDepositPM>> response = ApiResponse.error(HttpStatus.NOT_FOUND,
                "No daily deposits found."
            );
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
    }
// feacth by id daily deposite
    @GetMapping("/dailyedit/{id}")
    public ResponseEntity<ApiResponse<DailyDepositPM>> getDailyDepositById(@PathVariable Long id) {
        DailyDepositPM deposit = policyManagementService.getDailyDepositById(id);

        if (deposit != null) {
            ApiResponse<DailyDepositPM> response = ApiResponse.success(
                HttpStatus.OK,
                "Daily deposit fetched successfully.",
                deposit
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<DailyDepositPM> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "Daily deposit not found for ID: " + id
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
// update the deposite daily data
    @PostMapping("/dailyupdate/{id}")
    public ResponseEntity<ApiResponse<DailyDepositPM>> updateDailyDeposit(
            @PathVariable Long id,
            @RequestBody DailyDepositPM updatedData) {

        DailyDepositPM updated = policyManagementService.updateDailyDeposit(id, updatedData);

        if (updated != null) {
            ApiResponse<DailyDepositPM> response = ApiResponse.success(
                HttpStatus.OK,
                "Daily deposit updated successfully.",
                updated
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<DailyDepositPM> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "Daily deposit not found or failed to update."
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
    //delete the data of the daily deposite
    @PostMapping("/dailydelete/{id}")
    public ResponseEntity<ApiResponse<Void>> deleteDailyDeposit(@PathVariable Long id) {
        boolean deleted = policyManagementService.deleteDailyDeposit(id);

        if (deleted) {
            ApiResponse<Void> response = ApiResponse.success(
                HttpStatus.OK,
                "Daily deposit deleted successfully.",
                null
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<Void> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "Daily deposit not found for ID: " + id
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
 // Save Recurring Deposit
    @PostMapping("/recurring-depositsave")
    public ResponseEntity<ApiResponse<RecurringDepositPM>>saveRecurringDeposit(@RequestBody RecurringDepositPM recurringDepositPM) {
        boolean isSaved = policyManagementService.saveRecuringDailyDeposite(recurringDepositPM);
        System.out.println("Received Term: " + recurringDepositPM.getRdterm());

        if (isSaved) {
            ApiResponse<RecurringDepositPM> response = ApiResponse.success(HttpStatus.CREATED,
                "Recurring deposit saved successfully.",
                recurringDepositPM
            );
            return new ResponseEntity<>(response, HttpStatus.CREATED);
        } else {
            ApiResponse<RecurringDepositPM> response = ApiResponse.error(HttpStatus.BAD_REQUEST,
                "Failed to save recurring deposit."
            );
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }
    }



    // View All Recurring Deposits
    @GetMapping("/recurring-depositview")
    public ResponseEntity<ApiResponse<List<RecurringDepositPM>>> getAllRecurringDeposits() {
        List<RecurringDepositPM> deposits = policyManagementService.getAllData1();
            
        if (deposits != null && !deposits.isEmpty()) {
            ApiResponse<List<RecurringDepositPM>> response = ApiResponse.success(HttpStatus.OK,
                "Recurring deposits fetched successfully.",
                deposits
            );
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            ApiResponse<List<RecurringDepositPM>> response = ApiResponse.error(HttpStatus.NOT_FOUND,
                "No recurring deposits found."
            );
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
    }
    

 // GET BY ID reccuring deposite
    @GetMapping("/recurringedit/{id}")
    public ResponseEntity<ApiResponse<RecurringDepositPM>> getRecurringDepositById(@PathVariable Long id) {
        RecurringDepositPM deposit = policyManagementService.getRecurringDepositById(id);

        if (deposit != null) {
            ApiResponse<RecurringDepositPM> response = ApiResponse.success(
                HttpStatus.OK,
                "Recurring deposit fetched successfully.",
                deposit
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<RecurringDepositPM> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "Recurring deposit not found for ID: " + id
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
   // Update reccuring deposite 
    @PostMapping("/recurringupdate/{id}")
    public ResponseEntity<ApiResponse<RecurringDepositPM>> updateRecurringDeposit(
            @PathVariable Long id,
            @RequestBody RecurringDepositPM updatedData) {

        RecurringDepositPM updated = policyManagementService.updateRecurringDeposit(id, updatedData);

        if (updated != null) {
            ApiResponse<RecurringDepositPM> response = ApiResponse.success(
                HttpStatus.OK,
                "Recurring deposit updated successfully.",
                updated
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<RecurringDepositPM> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "Recurring deposit not found or failed to update."
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
    //delete reccuring deposite
    @PostMapping("/recurringdelete/{id}")
    public ResponseEntity<ApiResponse<Void>> deleteRecurringDeposit(@PathVariable Long id) {
        boolean deleted = policyManagementService.deleteRecurringDeposit(id);

        if (deleted) {
            ApiResponse<Void> response = ApiResponse.success(
                HttpStatus.OK,
                "Recurring deposit deleted successfully.",
                null
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<Void> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "Recurring deposit not found for ID: " + id
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }

    
    

    // Save Fixed Deposit
    @PostMapping("/fixed-depositsave")
    public ResponseEntity<ApiResponse<FixedDepositPM>> saveFixedDeposit(@RequestBody FixedDepositPM fixedDepositPM) {
        boolean isSaved = policyManagementService.saveFixedDeposite(fixedDepositPM);

        if (isSaved) {
            ApiResponse<FixedDepositPM> response = ApiResponse.success(
                HttpStatus.CREATED,
                "Fixed deposit saved successfully.",
                fixedDepositPM
            );
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
        } else {
            ApiResponse<FixedDepositPM> response = ApiResponse.error(
                HttpStatus.BAD_REQUEST,
                "Failed to save fixed deposit."
            );
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }


    // View All Fixed Deposits
    @GetMapping("/fixed-depositview")
    public ResponseEntity<ApiResponse<List<FixedDepositPM>>> getAllFixedDeposits() {
        List<FixedDepositPM> deposits = policyManagementService.getAllFixeddata();

        if (deposits != null && !deposits.isEmpty()) {
            ApiResponse<List<FixedDepositPM>> response = ApiResponse.success(HttpStatus.OK,
                "Fixed deposits fetched successfully.",
                deposits
            );
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            ApiResponse<List<FixedDepositPM>> response = ApiResponse.error(HttpStatus.NOT_FOUND,
                "No fixed deposits found."
            );
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
    }
    //fetch by id fixed deposit
    @GetMapping("/fixededit/{id}")
    public ResponseEntity<ApiResponse<FixedDepositPM>> getFixedDepositById(@PathVariable Long id) {
        FixedDepositPM deposit = policyManagementService.getFixedDepositById(id);

        if (deposit != null) {
            ApiResponse<FixedDepositPM> response = ApiResponse.success(HttpStatus.OK, "Fixed deposit fetched successfully.", deposit);
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<FixedDepositPM> response = ApiResponse.error(HttpStatus.NOT_FOUND, "Fixed deposit not found for ID: " + id);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }

 // Update Fixed deposit
    @PostMapping("/fixedupdate/{id}")
    public ResponseEntity<ApiResponse<FixedDepositPM>> updateFixedDeposit(
            @PathVariable Long id,
            @RequestBody FixedDepositPM updatedData) {

        FixedDepositPM updated = policyManagementService.updateFixedDeposit(id, updatedData);

        if (updated != null) {
            ApiResponse<FixedDepositPM> response = ApiResponse.success(HttpStatus.OK, "Fixed deposit updated successfully.", updated);
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<FixedDepositPM> response = ApiResponse.error(HttpStatus.NOT_FOUND, "Fixed deposit not found or failed to update.");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
    
    //  Delete fixed deposit
    @PostMapping("/fixeddelete/{id}")
    public ResponseEntity<ApiResponse<Void>> deleteFixedDeposit(@PathVariable Long id) {
        boolean deleted = policyManagementService.deleteFixedDeposit(id);

        if (deleted) {
            ApiResponse<Void> response = ApiResponse.success(HttpStatus.OK, "Fixed deposit deleted successfully.", null);
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<Void> response = ApiResponse.error(HttpStatus.NOT_FOUND, "Fixed deposit not found for ID: " + id);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }


    
    //MIS Deposit save 
    
    @PostMapping("/mis-deposit/save")
    public ResponseEntity<ApiResponse<MISDepositPM>> savemisdeposite(@RequestBody MISDepositPM misDepositPM)
    {
    	boolean isSaved=policyManagementService.savemistdeposite(misDepositPM);
    	if(isSaved)
    	{
    		ApiResponse<MISDepositPM> response=ApiResponse.success(HttpStatus.CREATED, "The MIS Deposite saved succesfully", misDepositPM);
    		 return new ResponseEntity<>(response, HttpStatus.CREATED);
    		
    		
    	}else{
            ApiResponse<MISDepositPM> response = ApiResponse.error(HttpStatus.BAD_REQUEST,
                    "Failed to save MIS deposit."
                );
                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
            }
    	
    	
    }
 // View All MIS Deposits
    @GetMapping("/mis-deposit/view")
    public ResponseEntity<ApiResponse<List<MISDepositPM>>> getAllMISDeposits() {
        List<MISDepositPM> deposits = policyManagementService.getAllMISDepositData();

        if (deposits != null && !deposits.isEmpty()) {
            ApiResponse<List<MISDepositPM>> response = ApiResponse.success(
                HttpStatus.OK,
                "MIS deposits fetched successfully.",
                deposits
            );
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            ApiResponse<List<MISDepositPM>> response = ApiResponse.error(
                HttpStatus.NOT_FOUND,
                "No MIS deposits found."
            );
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
    }



 //Get MIS deposit by ID
 @GetMapping("/misedit/{id}")
   public ResponseEntity<ApiResponse<MISDepositPM>> getMISDepositById(@PathVariable Long id) {
       MISDepositPM deposit = policyManagementService.getMISDepositById(id);

      if (deposit != null) {
           ApiResponse<MISDepositPM> response = ApiResponse.success(
                HttpStatus.OK,
               "MIS deposit fetched successfully.",
               deposit
          );
          return ResponseEntity.ok(response);
        } else {
           ApiResponse<MISDepositPM> response = ApiResponse.error(
               HttpStatus.NOT_FOUND,
                "MIS deposit not found for ID: " + id
           );
          return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
 }
    // Update MIS deposit

    @PostMapping("/misupdate/{id}")
   public ResponseEntity<ApiResponse<MISDepositPM>> updateMISDeposit(
            @PathVariable Long id,
           @RequestBody MISDepositPM updatedData) {

       MISDepositPM updated = policyManagementService.updateMISDeposit(id, updatedData);

       if (updated != null) {
           ApiResponse<MISDepositPM> response = ApiResponse.success(
                HttpStatus.OK,
               "MIS deposit updated successfully.",
               updated
            );
            return ResponseEntity.ok(response);
       } else {
            ApiResponse<MISDepositPM> response = ApiResponse.error(
               HttpStatus.NOT_FOUND,
               "MIS deposit not found or failed to update."
            );
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }

    // Delete MIS deposit
    @DeleteMapping("/misdelete/{id}")
    public ResponseEntity<ApiResponse<Void>> deleteMISDeposit(@PathVariable Long id) {
       boolean deleted = policyManagementService.deleteMISDeposit(id);

        if (deleted) {
            ApiResponse<Void> response = ApiResponse.success(
               HttpStatus.OK,
                "MIS deposit deleted successfully.",
               null
          );
            return ResponseEntity.ok(response);
       } else {
           ApiResponse<Void> response = ApiResponse.error(
               HttpStatus.NOT_FOUND,
                "MIS deposit not found for ID: " + id
          );
           return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
   }
    

   
    
    // Get Scheme Name by Scheme Term
    
    @GetMapping("/getSchemeNameBySchemeType")
    public Map<String, List<String>> getSchemeNameBySchemeType(
            @RequestParam(value = "drd", required = false) String drd,
            @RequestParam(value = "rd", required = false) String rd,
            @RequestParam(value = "fd", required = false) String fd,
            @RequestParam(value = "mis", required = false) String mis) {

        Map<String, List<String>> response = new HashMap<>();

        if (drd != null) {
            response.put("allBrands", policyManagementService.getSchemeNameBySchemeType(drd));
        }
        if (rd != null) {
            response.put("allRds", policyManagementService.getRRDBySchemeType(rd));
        }
        if (fd != null) {
            response.put("allFRDs", policyManagementService.getFRDBySchemeType(fd));
        }
        if (mis != null) {
            response.put("allMISRDs", policyManagementService.getMISRDBySchemeType(mis));
        }

        return response;
    }

    
    
    
    
    @GetMapping("/ddterm")
    public ResponseEntity<ApiResponse<DailyDepositPM>> getDDTermAndInterestRate(
            @RequestParam(name = "planNameDD", required = true) String planNameDD) {

        DailyDepositPM response = policyManagementService.getDDTermAndInterestRate(planNameDD);
        if (response != null) {
            return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Daily Deposit plan details found", response));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(ApiResponse.error(HttpStatus.NOT_FOUND, "Daily Deposit plan not found"));
        }
    }





 // view add new Investment details
 	//Ashwini
 	@GetMapping("/getaddinvestmentdetails")
 	public ResponseEntity<ApiResponse<List<AddnewinvestmentPM>>> getAddInvestmentDetails() {
 		 List<AddnewinvestmentPM> invest = policyManagementService.getAddInvestmentDetails();
 		 
 		 if (invest != null && !invest.isEmpty()) {
 	            ApiResponse<List<AddnewinvestmentPM>> response = ApiResponse.success(HttpStatus.OK,
 	                "Investment Details fetched successfully.",
 	                invest
 	            );
 	            return new ResponseEntity<>(response, HttpStatus.OK);
 	        } else {
 	            ApiResponse<List<AddnewinvestmentPM>> response = ApiResponse.error(HttpStatus.NOT_FOUND,
 	                "No Details found."
 	            );
 	            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
 	        }
 	}
 	
 	
 	//fetch new investment details by id
 	//Ashwini
 	
 	@GetMapping("/getinvestmentdetails")
 	public ResponseEntity<ApiResponse<List<AddnewinvestmentPM>>> findByBranch(@RequestParam  String branchName) {
 		 List<AddnewinvestmentPM> invest = policyManagementService.findByBranch(branchName);
 		
 		
 			ApiResponse<List<AddnewinvestmentPM>> response = new ApiResponse<>(HttpStatus.FOUND, "investment fetched successfully.", invest);
            return ResponseEntity.ok(response);
      
 	}
 	
 	 
 	


    
 
    @GetMapping("/rdterm")
    public ResponseEntity<ApiResponse<RecurringDepositPM>> getRDTermAndInterestRate(
            @RequestParam(name = "planNameRD", required = true) String planNameRD) {

        RecurringDepositPM response = policyManagementService.getRDTermAndInterestRate(planNameRD);
        if (response != null) {
            return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Recurring Deposit plan details found", response));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(ApiResponse.error(HttpStatus.NOT_FOUND, "Recurring Deposit plan not found"));
        }
    }

	
    @GetMapping("/fdterm")
    public ResponseEntity<ApiResponse<FixedDepositPM>> getFDTermAndInterestRate(
            @RequestParam(name = "planNameFD", required = true) String planNameFD) {

        FixedDepositPM response = policyManagementService.getFDTermAndInterestRate(planNameFD);
        if (response != null) {
            return ResponseEntity.ok(ApiResponse.success(HttpStatus.OK, "Fixed Deposit plan details found", response));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(ApiResponse.error(HttpStatus.NOT_FOUND, "Fixed Deposit plan not found"));
        }
    }

    
 

    
	
	@GetMapping("/misterm")
	public ResponseEntity<?> getMISTermAndInterestRate(@RequestParam(name = "planNameMD", required = true) String planNameMD) {
	    MISDepositPM response = policyManagementService.getMISTermAndInterestRate(planNameMD);
	    if (response != null) {
	        return ResponseEntity.ok(response);
	    } else {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Data not found");
	    }
	}

    
    
}

