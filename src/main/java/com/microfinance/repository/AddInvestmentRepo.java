package com.microfinance.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.microfinance.model.AddnewinvestmentPM;




public interface AddInvestmentRepo extends JpaRepository<AddnewinvestmentPM, Long> {

	//@Query("SELECT b.id FROM AddnewinvestmentPM b WHERE b.branchName = :branchName")
	List<AddnewinvestmentPM> findByBranchName(String branchName);

	//List<AddnewinvestmentPM> findDetailsById(String id);

	AddnewinvestmentPM findDetailsById(Long id);
    
	@Query("select coalesce(max(id), 0) from AddnewinvestmentPM")
	long getMaxId();

	

}
