package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.microfinance.model.MaturitySchemeMaster;

public interface MaturitySchemeMasterRepo extends JpaRepository<MaturitySchemeMaster, Integer> {

}
