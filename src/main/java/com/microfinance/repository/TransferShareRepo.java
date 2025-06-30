package com.microfinance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.microfinance.model.TransferShare;

public interface TransferShareRepo extends JpaRepository<TransferShare, Long> {

	List<TransferShare> findByFindByCode(String findByCode);

	

}
