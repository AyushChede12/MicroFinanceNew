package com.microfinance.dto;

import org.springframework.http.HttpStatus;

import com.microfinance.model.ExecutiveFounder;
import com.microfinance.model.IncentiveSchemeMaster;
import com.microfinance.model.RecurringDepositPM;

public class ApiResponse<T> {

	private boolean success;
	private HttpStatus status;
	private String message;
	private T data;

	// Constructors

	public ApiResponse() {
	}

	public ApiResponse(HttpStatus status, String message, T data) {
		this.status = status;
		this.message = message;
		this.data = data;
	}

	public ApiResponse(String string, String message, ApiResponse<ExecutiveFounder> response) {
		// TODO Auto-generated constructor stub
	}

	public ApiResponse(String message, boolean success, T data) {
	}

	public ApiResponse(boolean success, HttpStatus status, String message, T data) {
		this.success = success;
		this.status = status;
		this.message = message;
		this.data = data;
	}

	// Static helper methods for success and error responses
	public static <T> ApiResponse<T> success(HttpStatus status, String message, T data) {
		return new ApiResponse<>(status, message, data);
	}

	public static <T> ApiResponse<T> error(HttpStatus status, String message) {
		return new ApiResponse<>(status, message, null);
	}

	public HttpStatus getStatus() {
		return status;
	}

	public void setStatus(HttpStatus status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}


	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
	

}
