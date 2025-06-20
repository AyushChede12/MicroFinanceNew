package com.microfinance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.DailyDepositPM;
import com.microfinance.model.FixedDepositPM;
import com.microfinance.model.MISDepositPM;
import com.microfinance.model.RecurringDepositPM;
import com.microfinance.service.PolicyManagementService;

@RestController
@RequestMapping("/api")
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
    @PutMapping("/dailyupdate/{id}")
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
    @DeleteMapping("/dailydelete/{id}")
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
    @PutMapping("/recurringupdate/{id}")
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
    @DeleteMapping("/recurringdelete/{id}")
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
    @PostMapping("/fixed-deposit/save")
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
    @GetMapping("/fixed-deposit/view")
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


    
    //MIS Deposite save 
    
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

    

}
