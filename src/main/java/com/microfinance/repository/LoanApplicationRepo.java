package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.LoanApplication;

@Repository
public interface LoanApplicationRepo extends JpaRepository<LoanApplication,Long> {

}
