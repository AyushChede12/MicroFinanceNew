package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.microfinance.model.CreateSavingsAccount;

public interface CreateSavingAccountRepo extends JpaRepository<CreateSavingsAccount, Long> {
	@Query("select coalesce(max(id), 0) from CreateSavingsAccount")
	long getMaxId();
}
