package com.microfinance.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.microfinance.model.addCustomer;

public interface ApplyForGoldRepo extends JpaRepository<addCustomer, Long>{

	List<addCustomer> findByMemberCode(String memberCode);

	

}
