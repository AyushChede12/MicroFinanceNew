package com.microfinance.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.microfinance.model.FlexibleRenewal;

@EnableJpaRepositories
public interface FlexibleRenewalRepo extends JpaRepository<FlexibleRenewal, Long>{

	Optional<FlexibleRenewal> findByPolicyCode(String policyCode);

}
