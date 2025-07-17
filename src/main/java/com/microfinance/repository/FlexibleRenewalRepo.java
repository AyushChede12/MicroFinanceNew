package com.microfinance.repository;

<<<<<<< HEAD
import java.util.List;
=======
import java.util.Optional;
>>>>>>> 58c28f82682d515b778e5c7dbe7c79c77273657a

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.microfinance.model.FlexibleRenewal;

@EnableJpaRepositories
public interface FlexibleRenewalRepo extends JpaRepository<FlexibleRenewal, Long>{

<<<<<<< HEAD
	List<FlexibleRenewal> findByIsApprovedFalse();


=======
	Optional<FlexibleRenewal> findByPolicyCode(String policyCode);
>>>>>>> 58c28f82682d515b778e5c7dbe7c79c77273657a

}
