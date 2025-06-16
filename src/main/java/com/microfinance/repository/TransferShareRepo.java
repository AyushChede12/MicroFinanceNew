package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.microfinance.model.TransferShare;

public interface TransferShareRepo extends JpaRepository<TransferShare, Integer> {

}
