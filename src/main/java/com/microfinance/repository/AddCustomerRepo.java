package com.microfinance.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.microfinance.model.addCustomer;

@Repository
public interface AddCustomerRepo extends JpaRepository<addCustomer, Long> {

	@Transactional
	List<addCustomer> findByMemberCode(String memberCode);

	@Transactional
	List<addCustomer> findByMemberCodeIgnoreCase(String memberCode);
	
	@Transactional
	List<addCustomer> findByIsApprovedFalseAndMemberCode(String memberCode);

	@Transactional
	List<addCustomer> findByIsApprovedFalse();
	
	@Transactional
	List<addCustomer> findByBranchNameAndIsApprovedFalse(String branchName);

	
	

	
   
	
	//Optional<addCustomer> findByMemberCodeFinancialConsultant(String memberCode);
	
    //@Query(SELECT * FROM addCustomer WHERE  memberCode = :memberCode;)
	//List<addCustomer> findByCustomerCode(String memberCode);

	

}
