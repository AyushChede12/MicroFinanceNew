package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.microfinance.model.ApplyForGold;

@Repository
public interface ApplyForGoldRepo extends JpaRepository<ApplyForGold,Long>{

	@Transactional
	@Query("select coalesce(max(id), 0) from ApplyForGold")
	long getMaxId();

	//List<addCustomer> findByMemberCode(String memberCode);

	

	

}
