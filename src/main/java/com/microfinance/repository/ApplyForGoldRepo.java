package com.microfinance.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.SecuredGoldPlan;
import com.microfinance.model.addCustomer;
@Repository
public interface ApplyForGoldRepo extends JpaRepository<addCustomer, Long>{

	List<addCustomer> findByMemberCode(String memberCode);

	

	

}
