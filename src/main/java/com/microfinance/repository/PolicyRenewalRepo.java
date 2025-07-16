package com.microfinance.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.PolicyRenewal;

@Repository
public interface PolicyRenewalRepo extends JpaRepository<PolicyRenewal, Long> {

	List<PolicyRenewal> findByIsApprovedFalse();



}
