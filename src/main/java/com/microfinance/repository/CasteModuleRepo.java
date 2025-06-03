package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.CasteModule;

@Repository
public interface CasteModuleRepo extends JpaRepository<CasteModule, Long>{

}
