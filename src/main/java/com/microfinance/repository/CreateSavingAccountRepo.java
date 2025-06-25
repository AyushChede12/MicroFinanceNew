package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.microfinance.model.CreateSavingsAccount;

public interface CreateSavingAccountRepo extends JpaRepository<CreateSavingsAccount, Long> {

}
