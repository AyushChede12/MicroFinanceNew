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

    // Save Fixed Deposit
    @PostMapping("/fixed-deposit/save")
    public ResponseEntity<ApiResponse<FixedDepositPM>> saveFixedDeposit(@RequestBody FixedDepositPM fixedDepositPM) {
        boolean isSaved = policyManagementService.saveFixedDeposite(fixedDepositPM);

        if (isSaved) {
            ApiResponse<FixedDepositPM> response = ApiResponse.success(
                HttpStatus.OK,
                "Fixed deposit saved successfully.",
                fixedDepositPM
            );
            return ResponseEntity.ok(response);
        } else {
            ApiResponse<FixedDepositPM> response = ApiResponse.error(
                HttpStatus.BAD_REQUEST,
                "Failed to save fixed deposit."
            );
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }

    
    //view all fixed deposit
    @GetMapping("/fixed-deposit/view")
    @ResponseBody
    public ApiResponse<List<FixedDepositPM>> getAllFixedDeposits() {
        List<FixedDepositPM> list = policyManagementService.getAllFixeddata();
        if (list != null && !list.isEmpty()) {
            return ApiResponse.success(HttpStatus.OK, "Fetched Success", list);
        } else {
            return ApiResponse.error(HttpStatus.NOT_FOUND, "Data is not Found");
        }
    }


    // Save Recurring Deposit
    @PostMapping("/recurring-deposit/save")
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
    @GetMapping("/recurring-deposit/view")
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
