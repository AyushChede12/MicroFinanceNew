package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.microfinance.model.DailyPremiumRenewalPM;

@EnableJpaRepositories
public interface DailyPremiumRenewalRepo extends JpaRepository<DailyPremiumRenewalPM, Long> {

}
