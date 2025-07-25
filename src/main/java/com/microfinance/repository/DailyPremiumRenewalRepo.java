package com.microfinance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.microfinance.model.DailyPremiumRenewalPM;

<<<<<<< HEAD
=======
@Repository
>>>>>>> 0607492b3dcd14065e4e05e7d15756646671b865
public interface DailyPremiumRenewalRepo extends JpaRepository<DailyPremiumRenewalPM, Long> {

	List<DailyPremiumRenewalPM> findByIsApprovedFalse();

	List<DailyPremiumRenewalPM> findByPolicyCode(String policyCode);
	List<DailyPremiumRenewalPM> findByIsApprovedTrue();

	//Optional<DailyPremiumRenewalPM> findByPolicyCode(String policyCode);

}
