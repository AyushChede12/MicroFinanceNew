package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.ApplyForGold;

@Repository
public interface ApplyForGoldRepo extends JpaRepository<ApplyForGold,Long>{

	//List<addCustomer> findByMemberCode(String memberCode);

	

	

}
