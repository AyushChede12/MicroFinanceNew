package com.microfinance.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.microfinance.model.SavingSchemeCatalog;
import com.microfinance.model.addCustomer;

@Repository
public interface AddCustomerRepo extends JpaRepository<addCustomer, Long> {

	@Transactional
	List<addCustomer> findByMemberCode(String memberCode);

	@Transactional
	List<addCustomer> findByMemberCodeIgnoreCase(String memberCode);
	
	
   
	
	//Optional<addCustomer> findByMemberCodeFinancialConsultant(String memberCode);
	
    //@Query(SELECT * FROM addCustomer WHERE  memberCode = :memberCode;)
	//List<addCustomer> findByCustomerCode(String memberCode);

	

}
