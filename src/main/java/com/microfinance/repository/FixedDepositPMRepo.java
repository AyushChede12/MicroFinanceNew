package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.microfinance.model.FixedDepositPM;

@Repository
public interface FixedDepositPMRepo extends JpaRepository<FixedDepositPM, Integer>  {
	@Query("select coalesce(max(id), 0) from FixedDepositPM")
	long getMaxId();




}
