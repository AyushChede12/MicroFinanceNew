package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.microfinance.model.FullMaturity;

@Repository
public interface FullMaturityRepo extends JpaRepository<FullMaturity, Long> {

}
