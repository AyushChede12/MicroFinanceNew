package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.microfinance.model.MISDepositPM;

public interface MisDepositePMRepo extends JpaRepository<MISDepositPM, Integer> {

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.microfinance.model.MISDepositPM;
@Repository
public interface MisDepositePMRepo extends JpaRepository<MISDepositPM, Long>{
	@Query("select coalesce(max(id), 0) from MISDepositPM")
	long getMaxId();

	


}
