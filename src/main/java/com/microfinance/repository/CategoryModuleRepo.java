package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.CategoryModule;

@Repository
public interface CategoryModuleRepo extends JpaRepository<CategoryModule, Long>{

}
