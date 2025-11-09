package com.microfinance.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.CompanyImageUploads;

@Repository
public interface CompanyImageUploadsRepo extends JpaRepository<CompanyImageUploads, Long> {

	List<CompanyImageUploads> findByCompanyId(Long companyId);

}
