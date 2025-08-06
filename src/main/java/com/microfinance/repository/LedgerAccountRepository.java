package com.microfinance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.microfinance.model.LedgerAccountMaster;

@Repository
public interface LedgerAccountRepository extends JpaRepository<LedgerAccountMaster, Long> {

	@Query("SELECT COUNT(l) > 0 FROM LedgerAccountMaster l " +
		       "WHERE LOWER(REPLACE(l.accountTitle, ' ', '')) = LOWER(REPLACE(:title, ' ', '')) " +
		       "AND LOWER(l.branchName) = LOWER(:branch)")
		boolean existsByAccountTitleIgnoreCaseAndBranchName(@Param("title") String accountTitle,
		                                             @Param("branch") String branchName);
	List<LedgerAccountMaster> findByBranchName(String branchName);
	
	boolean existsByAccountTitle(String ledgerAccount);
	
	Optional<LedgerAccountMaster> findByAccountTitleAndBranchName(String accountTitle, String branchName);
	
	List<LedgerAccountMaster> findByBranchNameIgnoreCaseAndGroupNameIn(String branchName, List<String> groupName);
	
	 @Query("SELECT l FROM LedgerAccountMaster l " +
	           "WHERE LOWER(REPLACE(l.accountTitle, ' ', '')) = LOWER(REPLACE(:title, ' ', '')) " +
	           "AND LOWER(l.branchName) = LOWER(:branch)")
	    Optional<LedgerAccountMaster> findByAccountTitleAndBranchNameIgnoreCaseAndTrimmed(
	            @Param("title") String accountTitle,
	            @Param("branch") String branchName);
	



}
