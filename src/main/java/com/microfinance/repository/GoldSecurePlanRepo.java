package com.microfinance.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.SecuredGoldPlan;

@Repository
public interface GoldSecurePlanRepo extends JpaRepository<SecuredGoldPlan, Long> {

	List<SecuredGoldPlan> findByloanPlanName(String loanPlanName);

}
