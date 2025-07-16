package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.microfinance.model.PolicyRenewal;

@EnableJpaRepositories
public interface PolicyRenewalRepo extends JpaRepository<PolicyRenewal, Long> {

}
