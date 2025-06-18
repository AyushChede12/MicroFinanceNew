package com.microfinance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.microfinance.model.addCustomer;
import com.microfinance.model.addFinancialConsultant;

@Repository
public interface FinancialConsultantRepo extends JpaRepository<addFinancialConsultant, Long> {

	Optional<addCustomer> findByMemberCode(String memberCode);

	

}
