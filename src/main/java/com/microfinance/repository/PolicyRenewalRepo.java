package com.microfinance.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.microfinance.model.FlexibleRenewal;
import com.microfinance.model.PolicyRenewal;

@EnableJpaRepositories
public interface PolicyRenewalRepo extends JpaRepository<PolicyRenewal, Long> {

	Optional<PolicyRenewal> findByPolicyCode(String policyCode);

	

}
