package com.microfinance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.microfinance.model.AddnewinvestmentPM;





public interface AddInvestmentRepo extends JpaRepository<AddnewinvestmentPM, Integer> {

	
	List<AddnewinvestmentPM> findByBranchName(String branchName);

	

	AddnewinvestmentPM findDetailsById(Long id);
    
	@Query("select coalesce(max(id), 0) from AddnewinvestmentPM")
	long getMaxId();


	

}
