package com.microfinance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.microfinance.model.DailyPremiumRenewalPM;

@EnableJpaRepositories
public interface DailyPremiumRenewalRepo extends JpaRepository<DailyPremiumRenewalPM, Long> {

	List<DailyPremiumRenewalPM> findByIsApprovedFalse();

	List<DailyPremiumRenewalPM> findByIsApprovedTrue();

	Optional<DailyPremiumRenewalPM> findByPolicyCode(String policyCode);

}
