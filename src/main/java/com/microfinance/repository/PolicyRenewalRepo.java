package com.microfinance.repository;


import java.util.Optional;
import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.microfinance.model.PolicyRenewal;

@Repository
public interface PolicyRenewalRepo extends JpaRepository<PolicyRenewal, Long> {

<<<<<<< HEAD
	Optional<PolicyRenewal> findByPolicyCode(String policyCode);

=======
	List<PolicyRenewal> findByPolicyCode(String policyCode);
 
	
>>>>>>> 0607492b3dcd14065e4e05e7d15756646671b865
	


	List<PolicyRenewal> findByIsApprovedFalse();




	List<PolicyRenewal> findByIsApprovedTrue();



 

}
