package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.GoldDirectory;

@Repository
public interface GoldDirectoryRepo extends JpaRepository<GoldDirectory, Long>{
	

}
