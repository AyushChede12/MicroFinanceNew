package com.microfinance.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;


import com.microfinance.model.AddnewinvestmentPM;




public interface AddInvestmentRepo extends JpaRepository<AddnewinvestmentPM, Long> {

	//@Query("SELECT b.id FROM AddnewinvestmentPM b WHERE b.branchName = :branchName")
	List<AddnewinvestmentPM> findByBranchName(String branchName);

	//List<AddnewinvestmentPM> findDetailsById(String id);

	AddnewinvestmentPM findDetailsById(Long id);

	

}
