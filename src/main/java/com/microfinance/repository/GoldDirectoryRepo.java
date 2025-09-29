package com.microfinance.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.GoldDirectory;

@Repository
public interface GoldDirectoryRepo extends JpaRepository<GoldDirectory, Long>{

	List<GoldDirectory> findByloanPlanName(String loanPlanName);

	List<GoldDirectory> findBycustomerCode(String customerCode);
	

}
