package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.ApplyForGroupLoan;
@Repository
public interface ApplyForGroupLoanRepo extends JpaRepository<ApplyForGroupLoan, Long> {

}
